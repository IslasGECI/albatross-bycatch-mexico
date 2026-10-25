#!/usr/bin/env bash
# ==========================================
# Título: Prepara el manuscrito sin anotaciones para el DOCX
# Contexto (Por qué): El PDF conserva las anotaciones [[ ]] como
#   recordatorios de edición, pero el DOCX debe presentarse sin ellas.
#   Además, el PDF numera las tablas con LaTeX, mientras que el DOCX no
#   tiene contador, así que las referencias a tablas hay que resolverlas
#   antes de convertir el archivo.
# Descripción (Qué / Cómo): Lee reports/first_paper.md y escribe
#   reports/first_paper_no_annotations.md. Numera las tablas por orden de
#   aparición, sustituye cada \ref{table-...} por el número que le
#   corresponde y descarta las etiquetas \label{table-...}. Con awk
#   descarta las líneas que son solo una anotación y, en el resto, quita
#   cada anotación junto con un espacio adyacente. Verifica que no queden
#   anotaciones ni referencias sin resolver y que solo se hayan eliminado
#   las líneas de anotación.
# Entradas:
# reports/first_paper.md
# Salida:
# reports/first_paper_no_annotations.md
# Dependencias:
# awk
# grep
# wc
# Notas:
#   - Cada tabla empieza su leyenda con "Table: " y lleva \label{table-...}
#   - Cada referencia en el texto se escribe \ref{table-...}
#   - Una leyenda puede ocupar varias líneas y termina en una línea vacía
#   - Solo reconoce anotaciones de una línea
#   - No divide ni une párrafos
#   - Falla si sobra una anotación, si una referencia no tiene etiqueta o si
#     se eliminó una línea de más
# ==========================================

# ==== CONFIGURACIÓN ====
# Ruta del manuscrito renderizado que contiene las anotaciones de edición
input_markdown_path="reports/first_paper.md"
# Ruta del manuscrito intermedio que alimentará al DOCX
output_markdown_path="reports/first_paper_no_annotations.md"

# ==== ENTRADAS ====
# Verifica que el manuscrito renderizado exista antes de intentar limpiarlo
if [[ ! -f "$input_markdown_path" ]]; then
    echo "❌ Error: no existe $input_markdown_path" >&2
    exit 1
fi

# ==== PROCESAMIENTO / ANÁLISIS ====
# Cuenta las anotaciones que ocupan una línea completa, porque cada una de
# esas líneas debe desaparecer del archivo de salida
whole_line_annotations=$(awk '/^[[:space:]]*\[\[[^]]*\]\][[:space:]]*$/ { total++ } END { print total + 0 }' "$input_markdown_path")
# Cuenta las líneas de entrada con NR para no depender del salto final
input_lines=$(awk 'END { print NR }' "$input_markdown_path")
# Numera las tablas por orden de aparición, resuelve cada referencia con el
# número de su tabla, descarta las etiquetas y limpia las anotaciones
awk '
    { lines[NR] = $0 }
    END {
        table_number = 0
        in_caption = 0
        for (i = 1; i <= NR; i++) {
            if (lines[i] ~ /^Table: /) {
                table_number++
                in_caption = 1
            } else if (lines[i] ~ /^[[:space:]]*$/) {
                in_caption = 0
            }
            if (!in_caption) continue
            rest = lines[i]
            while (match(rest, /\\label\{table-[A-Za-z0-9-]+\}/)) {
                number_of[substr(rest, RSTART + 7, RLENGTH - 8)] = table_number
                rest = substr(rest, RSTART + RLENGTH)
            }
        }
        for (i = 1; i <= NR; i++) {
            if (lines[i] ~ /^[[:space:]]*\[\[[^]]*\]\][[:space:]]*$/) continue
            line = lines[i]
            if (line ~ /^Table: /) {
                caption_number++
                line = "Table: Table " caption_number ": " substr(line, 8)
            }
            gsub(/\\label\{table-[A-Za-z0-9-]+\}/, "", line)
            while (match(line, /\\ref\{table-[A-Za-z0-9-]+\}/)) {
                label = substr(line, RSTART + 5, RLENGTH - 6)
                if (!(label in number_of)) {
                    print "referencia sin etiqueta: " label > "/dev/stderr"
                    exit 1
                }
                line = substr(line, 1, RSTART - 1) number_of[label] substr(line, RSTART + RLENGTH)
            }
            gsub(/[[:space:]]*\[\[[^]]*\]\][[:space:]]*/, " ", line)
            gsub(/^[[:space:]]+|[[:space:]]+$/, "", line)
            print line
        }
    }
' "$input_markdown_path" > "$output_markdown_path"
# Detiene el proceso si el resolvedor de referencias no pudo continuar
if [[ $? -ne 0 ]]; then
    echo "❌ Error: no se pudieron resolver las referencias a tablas" >&2
    exit 1
fi
# Cuenta las líneas de salida para compararlas con las de entrada
output_lines=$(awk 'END { print NR }' "$output_markdown_path")
# Cuenta las anotaciones que sobrevivieron en la salida, que deben ser cero
remaining_annotations=$(grep -o '\[\[' "$output_markdown_path" | wc -l)
# Cuenta las referencias y etiquetas que sobrevivieron, que deben ser cero
remaining_references=$(grep -o '\\ref{\|\\label{' "$output_markdown_path" | wc -l)
# Calcula cuántas líneas se eliminaron en total
removed_lines=$((input_lines - output_lines))

# ==== SALIDA ====
# Falla si alguna anotación sobrevivió al proceso de limpieza
if [[ "$remaining_annotations" -ne 0 ]]; then
    echo "❌ Error: quedan $remaining_annotations anotaciones en $output_markdown_path" >&2
    exit 1
fi
# Falla si alguna referencia o etiqueta sobrevivió, porque el DOCX la
# mostraría como texto
if [[ "$remaining_references" -ne 0 ]]; then
    echo "❌ Error: quedan $remaining_references referencias en $output_markdown_path" >&2
    exit 1
fi
# Falla si se eliminó una cantidad de líneas distinta a las anotaciones
# completas, lo que indicaría que se borró una línea de más o de menos
if [[ "$removed_lines" -ne "$whole_line_annotations" ]]; then
    echo "❌ Error: se eliminaron $removed_lines líneas y se esperaban $whole_line_annotations" >&2
    exit 1
fi
