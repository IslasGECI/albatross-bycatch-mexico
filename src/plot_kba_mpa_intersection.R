# ==========================================
# Título: Grafica el componente de forrajeo, los discos de 60 km y las AMP de México
#
# Contexto (Por qué):
# El componente de forrajeo delimita la zona de alimentación relevante del
# albatros de Laysan y, junto con los discos de 60 km alrededor de las
# colonias, forma el área núcleo. Las Áreas Marinas Protegidas (AMP) definen
# las zonas marinas bajo protección legal.
#
# Descripción (Qué / Cómo):
# Lee el área núcleo, las AMP, la ZEE y la costa. Separa el componente de
# forrajeo y los discos de 60 km con la columna layer. Construye un mapa con
# ggplot2: el terreno en gris, la ZEE en azul, el relleno translúcido de las
# AMP, el componente de forrajeo relleno en púrpura, los perímetros de los
# discos en el mismo púrpura y, encima de todo, el contorno de las AMP. Usa
# el bounding box de zoom in como extensión.
#
# Entradas:
# data/processed/core_area.gpkg (capa: "core_area")
# data/processed/mexico_mpa.gpkg
# data/external/Exclusive_economic_zone_Mexico.shp
#
# Salida:
# reports/figures/gps_albatross_50_percent_potential_kba_ars_all_with_mpa.png
#
# Dependencias:
# rnaturalearth
# rnaturalearthdata
# sf
# tidyverse
#
# Notas:
# - La capa core_area trae el componente, los discos, el área núcleo y el área dentro de AMP
# - El componente y los discos se extraen por la columna layer
# - Los discos se dibujan solo con su perímetro, en el mismo púrpura del componente
# - El área núcleo está en LAEA y se transforma a WGS 84 (EPSG:4326)
# ==========================================


# ==== CONFIGURACIÓN ====
library(rnaturalearth) # Proporciona ne_countries() para descargar límites políticos mundiales
library(rnaturalearthdata) # Proporciona los datos cartográficos base de Natural Earth
library(sf) # Proporciona st_read para importar geometrías y st_transform para reproyectar
library(tidyverse) # Proporciona ggplot2 para graficar y dplyr para filtrar

# Rutas de los archivos de entrada con datos geoespaciales
input_core_area_path <- "data/processed/core_area.gpkg"
input_mpa_path <- "data/processed/mexico_mpa.gpkg"
input_eez_shapefile_path <- "data/external/Exclusive_economic_zone_Mexico.shp"

# Ruta del archivo PNG que almacenará el mapa del área núcleo y las AMP
output_figure_path <- "reports/figures/gps_albatross_50_percent_potential_kba_ars_all_with_mpa.png"

# Escala de la línea de costa mundial para el fondo del mapa
coastline_scale <- "medium"
# Sistema de referencia espacial para la reproyección de las capas de entrada
target_crs <- 4326

# Colores para las capas del mapa
coast_fill_color <- "gray90" # Color de relleno para el continente
coast_line_color <- "gray50" # Color del contorno de la línea de costa
eez_line_color <- "#1E3A8A" # Color del contorno de la ZEE
mpa_fill_color <- "#86EFAC" # Color de relleno verde claro para las AMP
mpa_fill_alpha <- 0.3 # Transparencia del relleno de las AMP para ver capas subyacentes
mpa_line_color <- "#166534" # Color del contorno verde oscuro de las AMP
foraging_component_fill_color <- "#8B5CF6" # Color de relleno púrpura del componente de forrajeo
disk_line_color <- "#8B5CF6" # Color del perímetro de los discos, igual al del componente
disk_line_width <- 0.4 # Grosor del perímetro de los discos, igual al de otros contornos

# Dimensiones y resolución de la figura de salida
fig_width <- 8 # Ancho en pulgadas consistente con otros mapas del proyecto
fig_height <- 6 # Alto en pulgadas que mantiene proporción cartográfica
fig_dpi <- 300 # Resolución adecuada para reportes o publicaciones


# ==== ENTRADAS ====
# Importa el área núcleo con sus cuatro capas: componente, discos, área núcleo
# y área dentro de AMP
core_area_sf <- st_read(input_core_area_path, quiet = TRUE)
# Importa las Áreas Marinas Protegidas de México como contexto de las
# zonas marinas protegidas existentes
mexico_mpa_sf <- st_read(input_mpa_path, quiet = TRUE)
# Importa el shapefile de la ZEE de México para contexto geográfico de
# la jurisdicción marítima mexicana
mexico_eez_sf <- st_read(input_eez_shapefile_path, quiet = TRUE)
# Descarga los límites políticos mundiales desde Natural Earth para usar
# como fondo de costa en el mapa
world_coastline_sf <- ne_countries(scale = coastline_scale, returnclass = "sf")
# ==== PROCESAMIENTO / ANÁLISIS ====
# Desactiva la validación S2 para evitar errores por geometrías inválidas
# en los polígonos del área núcleo durante el filtrado
sf_use_s2(FALSE)
# Transforma el área núcleo de LAEA a coordenadas geográficas WGS84 para que
# coincida con el sistema de referencia de las AMP y la ZEE
core_area_wgs84_sf <- core_area_sf |>
  st_transform(target_crs)
# Conserva solo el componente de forrajeo para dibujarlo como relleno púrpura
foraging_component_sf <- core_area_wgs84_sf |>
  filter(layer == "foraging_component")
# Conserva solo los discos de 60 km para dibujar su perímetro púrpura
colony_radius_disks_sf <- core_area_wgs84_sf |>
  filter(layer == "colony_radius")
# Transforma la ZEE de NSIDC EASE-Grid Global a coordenadas geográficas WGS84
# para que coincida con el sistema de referencia de las demás capas
mexico_eez_wgs84_sf <- mexico_eez_sf |>
  st_transform(target_crs)
# Define los límites del mapa centrados en el Pacífico de la península de Baja
# California para mostrar el área núcleo y las AMP de las tres colonias
bbox_lon_min <- -125
bbox_lon_max <- -105
bbox_lat_min <- 15
bbox_lat_max <- 35
# Construye el mapa temático con las capas ordenadas de abajo hacia arriba
plot_foraging_component_and_mpa <- ggplot() +
  # Capa base de costa mundial como referencia geográfica regional para
  # ubicar visualmente la extensión del mapa
  geom_sf(
    data = world_coastline_sf,
    fill = coast_fill_color,
    color = coast_line_color,
    linewidth = 0.2
  ) +
  # Capa de la ZEE de México solo con contorno (sin relleno) para definir el
  # contexto marítimo de jurisdicción mexicana sin obstruir las capas internas
  geom_sf(
    data = mexico_eez_wgs84_sf,
    fill = NA,
    color = eez_line_color,
    linewidth = 0.3
  ) +
  # Capa del relleno translúcido de las AMP, debajo del área núcleo para que
  # el púrpura quede opaco sobre el verde
  geom_sf(
    data = mexico_mpa_sf,
    fill = mpa_fill_color,
    alpha = mpa_fill_alpha,
    color = NA
  ) +
  # Capa del componente de forrajeo con relleno púrpura opaco, sin contorno
  # para que su forma la defina el propio relleno
  geom_sf(
    data = foraging_component_sf,
    fill = foraging_component_fill_color,
    color = NA
  ) +
  # Capa del perímetro de los discos de 60 km, sin relleno y en el mismo
  # púrpura del componente
  geom_sf(
    data = colony_radius_disks_sf,
    fill = NA,
    color = disk_line_color,
    linewidth = disk_line_width
  ) +
  # Capa del contorno de las AMP dibujada al final para que quede encima del
  # área núcleo y conserve visible el límite de la protección
  geom_sf(
    data = mexico_mpa_sf,
    fill = NA,
    color = mpa_line_color,
    linewidth = 0.3
  ) +
  # Limita la extensión del mapa al bounding box de zoom in centrado en
  # la ZEE de México donde se ubican las AMP del Pacífico mexicano
  coord_sf(
    xlim = c(bbox_lon_min, bbox_lon_max),
    ylim = c(bbox_lat_min, bbox_lat_max),
    expand = FALSE
  ) +
  # Estilo limpio que enfatiza las capas espaciales sin distracciones
  theme_minimal() +
  # Etiquetas de los ejes en inglés para integrarse al reporte del primer
  # artículo, sin título ni subtítulo porque el pie de figura los aporta
  labs(
    x = "Longitude",
    y = "Latitude"
  )


# ==== SALIDA ====
# Exporta el mapa como PNG con resolución de publicación para incluirlo
# en el reporte del primer artículo del proyecto
ggsave(
  filename = output_figure_path,
  plot = plot_foraging_component_and_mpa,
  width = fig_width,
  height = fig_height,
  dpi = fig_dpi
)
