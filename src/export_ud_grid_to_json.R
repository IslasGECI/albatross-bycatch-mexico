# ==========================================
# Título: Exporta el número de celdas y el lado de la rejilla de uso
#
# Contexto (Por qué):
# El texto del artículo describe la rejilla que cuenta los individuos por
# celda, pero sus dimensiones no provienen de ningún artefacto. Guardarlas
# en un JSON evita escribirlas a mano en el manuscrito.
#
# Descripción (Qué / Cómo):
# Lee el GeoPackage con el conteo de individuos por celda, mide el área de
# una celda y deriva su lado, porque las celdas son cuadradas. Divide la
# extensión de la rejilla entre ese lado para obtener el número de columnas
# y de renglones. Exporta las tres medidas como JSON.
#
# Entradas:
# data/processed/ud_in_grid.gpkg
#
# Salida:
# data/processed/ud_grid.json
#
# Dependencias:
# sf
# jsonlite
#
# Notas:
# - La rejilla es regular: todas las celdas comparten la misma área
# - El script de valores redondea el lado de la celda para el texto
# ==========================================


# ==== CONFIGURACIÓN ====
library(sf) # Proporciona st_read, st_area y st_bbox para medir la rejilla
library(jsonlite) # Proporciona write_json para exportar las medidas

# Ruta del GeoPackage con el conteo de individuos por celda de la rejilla
input_gpkg_path <- "data/processed/ud_in_grid.gpkg"
# Ruta del archivo JSON que almacenará las medidas de la rejilla
output_json_path <- "data/processed/ud_grid.json"


# ==== ENTRADAS ====
# Carga el GeoPackage con una fila por celda de la rejilla del KDE
ud_in_grid_sf <- st_read(input_gpkg_path, quiet = TRUE)


# ==== PROCESAMIENTO / ANÁLISIS ====
# Mide el área de una celda; la rejilla es regular y todas las celdas
# comparten la misma área
cell_area_m2 <- st_area(ud_in_grid_sf[1, ])

# Deriva el lado de la celda de su área, porque las celdas son cuadradas
cell_size_m <- sqrt(as.numeric(cell_area_m2))

# Mide la extensión total que ocupa la rejilla
ud_bbox <- st_bbox(ud_in_grid_sf)

# Mide el ancho de la rejilla para contar las columnas
grid_width_m <- ud_bbox["xmax"] - ud_bbox["xmin"]

# Cuenta las columnas dividiendo el ancho entre el lado de la celda
n_grid_columns <- round(grid_width_m / cell_size_m) |>
  as.integer()

# Mide el alto de la rejilla para contar los renglones
grid_height_m <- ud_bbox["ymax"] - ud_bbox["ymin"]

# Cuenta los renglones dividiendo el alto entre el lado de la celda
n_grid_rows <- round(grid_height_m / cell_size_m) |>
  as.integer()

# Combina las medidas de la rejilla en una lista plana para el JSON
ud_grid_list <- list(
  n_columns = n_grid_columns,
  n_rows = n_grid_rows,
  cell_size_m = cell_size_m
)


# ==== SALIDA ====
# Exporta las medidas de la rejilla para que el script de valores las lea
write_json(
  ud_grid_list,
  output_json_path,
  pretty = TRUE,
  auto_unbox = TRUE
)
