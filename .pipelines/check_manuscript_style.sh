#!/usr/bin/env bash
# ==========================================
# Título: Validador de estilo de manuscritos
# Contexto (Por qué): Los manuscritos (1?_*.md y 2?_*.md) deben cumplir
#   con restricciones de legibilidad: ≤25 palabras por oración
#   y puntuación adecuada.
# Descripción (Qué / Cómo): Valida que cada línea termine con
#   puntuación adecuada y que todas las oraciones sean ≤25 palabras.
#   Itera sobre archivos de manuscrito y reporta violaciones.
# Entradas: Patrón glob como argumento obligatorio (ej. "papers/first-paper/1?_*.md")
# Salidas: Mensajes de error a stdout; código de salida 0 si pasa, 1 si falla
# Dependencias: grep, egrep, wc, bash
# Notas:
#   - Requiere estar en el directorio raíz del proyecto
#   - Uso: check_manuscript_style.sh '<glob_pattern>'
#   - Usa expresiones regulares extendidas para coincidencia
#   - Ignora el contenido entre corchetes (citas, notas)
#     al medir oraciones, para no contar puntuación suelta
# ==========================================

# Validar que se proporcionó un patrón de archivos
if [[ $# -lt 1 ]]; then
    echo "❌ Error: No se proporcionó un patrón de archivos."
    echo "   Uso: $0 '<glob_pattern>'"
    echo "   Ejemplo: $0 'papers/first-paper/1?_*.md'"
    echo "   Ejemplo: $0 'papers/second-paper/2?_*.md'"
    exit 1
fi
PATTERN="$1"

# Rastrear si hay errores
HAS_ERRORS=0

# ==========================================
# VERIFICACIÓN 1: Las líneas terminan con puntuación adecuada
# ==========================================
check_line_endings() {
    local file="$1"

    echo "Checking line endings in: $file"

    # Encontrar líneas que NO terminan con puntuación válida
    # Excluir líneas que terminan con: : . ? ] o comienzan con "1. " o caracteres no-palabra
    local lines_without_period
    lines_without_period=$(egrep -v ":$" "$file" | \
                          egrep -v "\.$" | \
                          egrep -v "\?$" | \
                          egrep -v "\]$" | \
                          egrep -v "^1\. " | \
                          egrep -v "^\W" || true)

    if [[ -n "$lines_without_period" ]]; then
        echo "❌ Lines without proper punctuation:"
        echo "$lines_without_period"
        HAS_ERRORS=1
    fi
}

# ==========================================
# VERIFICACIÓN 2: Las oraciones tienen ≤25 palabras
# ==========================================
check_sentence_length() {
    local file="$1"

    echo "Checking sentence length in: $file"

    local max_words=25
    local line_count=0
    local violations=0

    # Procesar líneas que terminan con : . ? o comienzan con "1. " o caracteres no-palabra
    # Excluir el texto entre corchetes junto con el espacio previo (citas y notas),
    # para que la puntuación quede pegada a la palabra anterior y no cuente sola
    for pattern in ":$" "\.$" "\?$" "^1\. " "^\W"; do
        IFS=$'\n' read -d '' -r -a lines < <(egrep "$pattern" "$file" | egrep -v '^<!--' || true) || true

        for line in "${lines[@]}"; do
            ((line_count++))
            local word_count
            word_count=$(echo "$line" | sed -E 's/ ?\[[^]]*\]//g' | wc -w)

            if [[ $word_count -gt $max_words ]]; then
                echo "❌ Line $line_count exceeds $max_words words ($word_count words):"
                echo "   $line"
                ((violations++))
                HAS_ERRORS=1
            fi
        done
    done

    if [[ $violations -eq 0 ]]; then
        echo "✅ All sentences are ≤$max_words words"
    fi
}

# ==========================================
# ENTRADA PRINCIPAL
# ==========================================
main() {
    echo "============================================"
    echo "Manuscript Style Checker"
    echo "Pattern: $PATTERN"
    echo "============================================"
    echo ""

    local file_count=0

    for file in $PATTERN; do
        if [[ -f "$file" ]]; then
            ((file_count++))
            echo ""
            echo "─────────────────────────────────────────"
            check_line_endings "$file"
            echo ""
            check_sentence_length "$file"
            echo "─────────────────────────────────────────"
        fi
    done

    if [[ $file_count -eq 0 ]]; then
        echo "⚠️  No files matching pattern: $PATTERN"
        HAS_ERRORS=1
    fi

    echo ""
    if [[ $HAS_ERRORS -eq 0 ]]; then
        echo "✅ All checks passed!"
        return 0
    else
        echo "❌ Some checks failed"
        return 1
    fi
}

main "$@"
