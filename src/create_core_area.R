# ==========================================
# Título: Crea el área núcleo y el área de cada capa
#
# Contexto (Por qué):
# El artículo reporta el área de la componente de alimentación, la del disco de
# 60 km de radio, la de su unión como área núcleo y la de la parte protegida.
# Esas áreas son medidas geométricas y el guion de valores no las calcula, así
# que viven en un artefacto propio que el guion de valores solo extrae.
#
# Descripción (Qué / Cómo):
# Lee el sitio potencial, la rejilla de uso, las áreas marinas protegidas y la
# configuración de las tres colonias. Proyecta las capas al CRS de la rejilla y
# valida las geometrías. Construye un disco de 60 km alrededor de cada colonia y
# lo une con el sitio potencial como área núcleo. Intersecta el área núcleo con
# las áreas marinas protegidas y calcula el área de cada capa en km².
#
# Entradas:
# data/processed/kba_potential_site_all.gpkg
# data/processed/ud_in_grid.gpkg (capa: "ud_in_grid")
# data/processed/mexico_mpa.gpkg
# config_trips_guadalupe.json
# config_trips_clarion.json
# config_trips_san_benedicto.json
#
# Salida:
# data/processed/core_area.gpkg
#
# Dependencias:
# sf
# tidyverse
# jsonlite
#
# Notas:
# - La rejilla define el CRS de trabajo, un área equivalente en metros
# - El radio de cada disco se toma de inner_buff en la configuración
# - Las geometrías se validan antes de unir e intersectar
# - Cada fila guarda su geometría y su área en km²
# ==========================================


# ==== CONFIGURACIÓN ====
library(sf) # Proporciona st_read, st_transform, st_buffer y st_area para la geometría
library(tidyverse) # Proporciona map, map_dbl y tibble para leer y ordenar los datos
library(jsonlite) # Proporciona read_json para importar la configuración de las colonias

# Ruta del GeoPackage con el sitio potencial disuelto como componente de alimentación
input_potential_site_path <- "data/processed/kba_potential_site_all.gpkg"
# Ruta del GeoPackage con la rejilla de uso, que define el CRS de trabajo
input_ud_in_grid_path <- "data/processed/ud_in_grid.gpkg"
# Ruta del GeoPackage con las áreas marinas protegidas de México
input_mpa_path <- "data/processed/mexico_mpa.gpkg"
# Rutas de la configuración de las tres colonias, con su centro y su radio
colony_config_paths <- c(
  "config_trips_guadalupe.json",
  "config_trips_clarion.json",
  "config_trips_san_benedicto.json"
)
# Ruta del GeoPackage que almacenará el área de cada capa
output_gpkg_path <- "data/processed/core_area.gpkg"
# Etiquetas de las cuatro capas que se exportan como filas del GeoPackage
layer_labels <- c("foraging_component", "colony_radius", "core_area", "inside_mpa")
# CRS geográfico de los centros de colonia, tal como vienen en la configuración
geographic_crs <- st_crs(4326)
# Factor de conversión de kilómetros a metros para el radio de los discos
m_per_km <- 1000
# Factor de conversión de metros cuadrados a kilómetros cuadrados para las áreas
m2_per_km2 <- 1e6


# ==== ENTRADAS ====
# Importa la rejilla de uso para tomar de ella el CRS de trabajo en metros
ud_in_grid_sf <- st_read(input_ud_in_grid_path, quiet = TRUE)
# Importa el sitio potencial disuelto como componente de alimentación
foraging_component_sf <- st_read(input_potential_site_path, quiet = TRUE)
# Importa las AMP de México
mexico_mpa_sf <- st_read(input_mpa_path, quiet = TRUE)
# Importa la configuración de cada colonia para tomar su centro y su radio
colony_configs <- map(colony_config_paths, read_json)


# ==== PROCESAMIENTO / ANÁLISIS ====
# Desactiva la validación esférica para operar con geometrías proyectadas
sf_use_s2(FALSE)
# Extrae el CRS de la rejilla como CRS de trabajo del análisis
working_crs <- st_crs(ud_in_grid_sf)
# Proyecta el sitio potencial al CRS de trabajo de la rejilla
foraging_component_sf <- foraging_component_sf |>
  st_transform(working_crs)
# Proyecta las AMP al CRS de trabajo de la rejilla
mexico_mpa_sf <- mexico_mpa_sf |>
  st_transform(working_crs)
# Valida la geometría del sitio potencial antes de unirla con los discos
foraging_component_sf <- st_make_valid(foraging_component_sf)
# Valida las geometrías de las AMP antes de intersectarlas con el área núcleo
mexico_mpa_sf <- st_make_valid(mexico_mpa_sf)
# Convierte el radio de 60 km de cada colonia a metros para el buffer
radius_m <- map_dbl(colony_configs, "inner_buff") * m_per_km
# Construye los centros de las colonias en coordenadas geográficas
colony_centers_sf <- tibble(
  lon = map_dbl(colony_configs, "lon_colony"),
  lat = map_dbl(colony_configs, "lat_colony")
) |>
  # Convierte las columnas de centro en geometrías de punto
  st_as_sf(coords = c("lon", "lat"), crs = geographic_crs) |>
  # Proyecta los centros al CRS de trabajo para medir el radio en metros
  st_transform(working_crs)
# Construye un disco de 60 km alrededor de cada colonia y los une en una capa
colony_radius_sf <- colony_centers_sf |>
  st_buffer(dist = radius_m) |>
  st_union()
# Une la componente de alimentación con los discos para formar el área núcleo
core_area_sf <- c(
  st_geometry(foraging_component_sf),
  st_geometry(colony_radius_sf)
) |>
  st_union() |>
  st_make_valid()
# Intersecta el área núcleo con las AMP para obtener la parte protegida
inside_mpa_sf <- st_intersection(core_area_sf, mexico_mpa_sf) |>
  st_make_valid()
# Calcula el área de la componente de alimentación en km²
foraging_component_area_km2 <- sum(as.numeric(st_area(foraging_component_sf))) / m2_per_km2
# Calcula el área de los discos de 60 km en km²
colony_radius_area_km2 <- sum(as.numeric(st_area(colony_radius_sf))) / m2_per_km2
# Calcula el área del área núcleo en km²
core_area_km2 <- sum(as.numeric(st_area(core_area_sf))) / m2_per_km2
# Calcula el área del área núcleo dentro de las AMP en km²
inside_mpa_area_km2 <- sum(as.numeric(st_area(inside_mpa_sf))) / m2_per_km2
# Reúne las cuatro geometrías en una sola capa con su etiqueta y su área
core_area_layers_sf <- st_sf(
  layer = layer_labels,
  area_km2 = c(
    foraging_component_area_km2,
    colony_radius_area_km2,
    core_area_km2,
    inside_mpa_area_km2
  ),
  geometry = c(
    st_geometry(foraging_component_sf),
    st_geometry(colony_radius_sf),
    st_geometry(core_area_sf),
    st_geometry(inside_mpa_sf)
  )
)


# ==== SALIDA ====
# Exporta el área de cada capa como GeoPackage para que el guion de valores la extraiga
st_write(
  obj = core_area_layers_sf,
  dsn = output_gpkg_path,
  driver = "GPKG",
  delete_dsn = TRUE,
  quiet = TRUE
)
