# ==========================================
# Título: Crea las fechas extremas, los conteos, la representatividad y el rango por celda
#
# Contexto (Por qué):
# El manuscrito del primer artículo necesita las fechas de inicio y fin del
# rastreo GPS, el número total de individuos y el número de viajes completos
# para cada colonia. Centralizar estos valores en un archivo JSON evita
# discrepancias entre el texto del artículo y los datos fuente.
#
# Descripción (Qué / Cómo):
# Lee los archivos CSV con registros GPS de las colonias Guadalupe, Clarion
# y San Benedicto. Extrae las fechas extremas, deriva el año y cuenta los
# individuos rastreados y los viajes completos por temporada. Lee las
# superficies KDE, la evaluación de representatividad y la rejilla de uso
# para contar analizados, representatividad y rango por celda ocupada.
# Combina los valores en un JSON plano en data/processed/methods.json.
#
# Entradas:
# data/raw/gps-albatros-guadalupe.csv
# data/raw/gps-albatros-clarion.csv
# data/raw/gps-albatros-san-benedicto.csv
# data/processed/trips_summary_guadalupe.csv
# data/processed/trips_summary_clarion.csv
# data/processed/trips_summary_san_benedicto.csv
# data/processed/individual_kde_all.rds
# data/processed/representative_assessment_all.rds
# data/processed/ud_in_grid.gpkg (capa: "ud_in_grid")
#
# Salida:
# data/processed/methods.json
#
# Dependencias:
# tidyverse
# jsonlite
# sf
#
# Notas:
# - Las fechas deben estar en formato ISO 8601 (YYYY-MM-DD) para que el
#   ordenamiento lexicográfico coincida con el orden cronológico
# - El conteo de individuos rastreados suma las temporadas de las tres colonias
# - El conteo de individuos analizados y la representatividad provienen del
#   objeto KDE y de su evaluación
# - Solo se cuentan viajes con el valor "complete trip" en la columna complete
# ==========================================


# ==== CONFIGURACIÓN ====
library(tidyverse) # Proporciona read_csv para importar datos y n_distinct para conteos
library(jsonlite) # Proporciona write_json para exportar el resultado como JSON
library(sf) # Proporciona st_read para importar la rejilla de uso

# Ruta del archivo CSV con los registros GPS de la colonia Guadalupe
input_guadalupe_csv_path <- "data/raw/gps-albatros-guadalupe.csv"
# Ruta del archivo CSV con los registros GPS de la colonia Clarion
input_clarion_csv_path <- "data/raw/gps-albatros-clarion.csv"
# Ruta del archivo CSV con los registros GPS de la colonia San Benedicto
input_san_benedicto_csv_path <- "data/raw/gps-albatros-san-benedicto.csv"
# Ruta del archivo CSV con el resumen de viajes de la colonia Guadalupe
input_guadalupe_trips_path <- "data/processed/trips_summary_guadalupe.csv"
# Ruta del archivo CSV con el resumen de viajes de la colonia Clarion
input_clarion_trips_path <- "data/processed/trips_summary_clarion.csv"
# Ruta del archivo CSV con el resumen de viajes de la colonia San Benedicto
input_san_benedicto_trips_path <- "data/processed/trips_summary_san_benedicto.csv"
# Ruta del archivo RDS con las superficies KDE de los individuos analizados
input_kernel_density_estimation_path <- "data/processed/individual_kde_all.rds"
# Ruta del archivo RDS con la evaluación de representatividad de la muestra
input_representative_assessment_path <- "data/processed/representative_assessment_all.rds"
# Ruta del GeoPackage con la rejilla de individuos por celda
input_ud_in_grid_path <- "data/processed/ud_in_grid.gpkg"
# Ruta del archivo JSON que almacenará los metadatos del rastreo por colonia
output_json_path <- "data/processed/methods.json"


# ==== ENTRADAS ====
# Carga los registros GPS de la colonia Guadalupe y lee la columna date
# como texto para preservar el formato ISO 8601 sin conversión a Date
guadalupe_data <- read_csv(
  input_guadalupe_csv_path,
  col_types = cols(date = col_character()),
  show_col_types = FALSE
)
# Carga los registros GPS de la colonia Clarion con la columna date como
# texto para mantener el formato original de las fechas
clarion_data <- read_csv(
  input_clarion_csv_path,
  col_types = cols(date = col_character()),
  show_col_types = FALSE
)
# Carga los registros GPS de la colonia San Benedicto con la columna date
# como texto para mantener el formato original de las fechas
san_benedicto_data <- read_csv(
  input_san_benedicto_csv_path,
  col_types = cols(date = col_character()),
  show_col_types = FALSE
)
# Carga el resumen de viajes de Guadalupe para identificar los viajes completos
guadalupe_trips <- read_csv(
  input_guadalupe_trips_path,
  show_col_types = FALSE
)
# Carga el resumen de viajes de Clarion para identificar los viajes completos
clarion_trips <- read_csv(
  input_clarion_trips_path,
  show_col_types = FALSE
)
# Carga el resumen de viajes de San Benedicto para identificar los viajes completos
san_benedicto_trips <- read_csv(
  input_san_benedicto_trips_path,
  show_col_types = FALSE
)
# Carga el objeto con las superficies KDE para contar los individuos que
# entraron al análisis y quedaron representados en el artículo
kernel_density_estimation_object <- readRDS(input_kernel_density_estimation_path)
# Carga la evaluación de representatividad para extraer el porcentaje que
# alcanza la muestra analizada
representative_assessment_object <- readRDS(input_representative_assessment_path)
# Importa la rejilla de uso para conocer el rango de individuos por celda
ud_in_grid_sf <- st_read(input_ud_in_grid_path, quiet = TRUE)


# ==== PROCESAMIENTO / ANÁLISIS ====
# Extrae las fechas no vacías de la colonia Guadalupe para calcular los
# extremos temporales del rastreo GPS en esa colonia
guadalupe_dates <- guadalupe_data |>
  filter(!is.na(date)) |>
  pull(date)
# Extrae las fechas no vacías de la colonia Clarion para calcular los
# extremos temporales del rastreo GPS en esa colonia
clarion_dates <- clarion_data |>
  filter(!is.na(date)) |>
  pull(date)
# Extrae las fechas no vacías de la colonia San Benedicto para calcular
# los extremos temporales del rastreo GPS en esa colonia
san_benedicto_dates <- san_benedicto_data |>
  filter(!is.na(date)) |>
  pull(date)

# Calcula la fecha más antigua del rastreo en la colonia Guadalupe usando
# el mínimo lexicográfico sobre el formato ISO 8601 de la columna date
guadalupe_min_date <- min(guadalupe_dates)
# Calcula la fecha más reciente del rastreo en la colonia Guadalupe usando
# el máximo lexicográfico sobre el formato ISO 8601 de la columna date
guadalupe_max_date <- max(guadalupe_dates)
# Calcula la fecha más antigua del rastreo en la colonia Clarion
clarion_min_date <- min(clarion_dates)
# Calcula la fecha más reciente del rastreo en la colonia Clarion
clarion_max_date <- max(clarion_dates)
# Calcula la fecha más antigua del rastreo en la colonia San Benedicto
san_benedicto_min_date <- min(san_benedicto_dates)
# Calcula la fecha más reciente del rastreo en la colonia San Benedicto
san_benedicto_max_date <- max(san_benedicto_dates)

# Extrae el año de la fecha más antigua en Guadalupe para usarlo en el
# texto del artículo donde solo interesa el año, no la fecha completa
guadalupe_min_year <- str_sub(guadalupe_min_date, 1, 4)
# Extrae el año de la fecha más reciente en Guadalupe
guadalupe_max_year <- str_sub(guadalupe_max_date, 1, 4)
# Extrae el año de la fecha más antigua en Clarion
clarion_min_year <- str_sub(clarion_min_date, 1, 4)
# Extrae el año de la fecha más reciente en Clarion
clarion_max_year <- str_sub(clarion_max_date, 1, 4)
# Extrae el año de la fecha más antigua en San Benedicto
san_benedicto_min_year <- str_sub(san_benedicto_min_date, 1, 4)
# Extrae el año de la fecha más reciente en San Benedicto
san_benedicto_max_year <- str_sub(san_benedicto_max_date, 1, 4)

# Cuenta los individuos analizados a partir de los nombres del objeto KDE,
# porque cada nombre corresponde a un individuo con superficie calculada
n_analyzed_individuals <- kernel_density_estimation_object$KDE_surface |>
  names() |>
  length()

# Extrae el porcentaje de representatividad de la muestra analizada y lo
# redondea a un decimal para el texto del artículo
representativeness_percent <- representative_assessment_object$assessment_summary$out |>
  round(digits = 1)

# Conserva los individuos por celda de las celdas ocupadas, porque las celdas
# vacías no cuentan para el rango que reporta la figura
n_individuals_per_cell <- ud_in_grid_sf |>
  filter(N_IND > 0) |>
  pull(N_IND)
# Calcula el mínimo de individuos por celda ocupada para el rango de la figura
n_individuals_per_cell_min <- min(n_individuals_per_cell)
# Calcula el máximo de individuos por celda ocupada para el rango de la figura
n_individuals_per_cell_max <- max(n_individuals_per_cell)

# Cuenta los viajes completos de Guadalupe filtrando la columna complete
guadalupe_n_trips <- guadalupe_trips |>
  filter(complete == "complete trip") |>
  nrow()
# Cuenta los viajes completos de Clarion filtrando la columna complete
clarion_n_trips <- clarion_trips |>
  filter(complete == "complete trip") |>
  nrow()
# Cuenta los viajes completos de San Benedicto filtrando la columna complete
san_benedicto_n_trips <- san_benedicto_trips |>
  filter(complete == "complete trip") |>
  nrow()

# ==== PROCESAMIENTO DE TEMPORADAS ====
# Prepara los registros de Guadalupe para agruparlos por temporada de
# rastreo: octubre-septiembre en lugar de año calendario
guadalupe_with_season <- guadalupe_data |>
  filter(!is.na(date), !is.na(name)) |>
  mutate(
    # Extrae el año numérico de los primeros cuatro caracteres de la fecha
    year = as.numeric(str_sub(date, 1, 4)),
    # Extrae el mes numérico de los caracteres 6 y 7 de la fecha ISO
    month = as.numeric(str_sub(date, 6, 7)),
    # Asigna cada registro a la temporada Oct-Sep: los meses antes de
    # octubre pertenecen a la temporada que inició el año anterior
    season_year = if_else(month >= 10, year, year - 1)
  )
# Calcula el rango de temporadas con datos en la colonia Guadalupe para
# construir la secuencia completa de temporadas consecutivas
guadalupe_season_range <- guadalupe_with_season |>
  summarise(
    min_season = min(season_year),
    max_season = max(season_year)
  )
# Crea una secuencia completa de temporadas desde la primera hasta la
# última para incluir temporadas sin rastreo en la tabla del artículo
guadalupe_season_complete <- tibble(
  season_year = seq(
    guadalupe_season_range$min_season,
    guadalupe_season_range$max_season
  )
)
# Agrupa los registros por temporada y calcula las fechas extremas y el
# número de individuos únicos rastreados en cada temporada con datos
guadalupe_season_stats <- guadalupe_with_season |>
  group_by(season_year) |>
  summarise(
    start = min(date),
    end = max(date),
    n = n_distinct(name),
    .groups = "drop"
  )
# Asigna a cada viaje completo de Guadalupe su temporada según la salida
guadalupe_trips_with_season <- guadalupe_trips |>
  filter(complete == "complete trip") |>
  mutate(
    # Extrae el año numérico de los primeros cuatro caracteres de la salida
    year = as.numeric(str_sub(departure, 1, 4)),
    # Extrae el mes numérico de los caracteres 6 y 7 de la salida ISO
    month = as.numeric(str_sub(departure, 6, 7)),
    # Aplica la misma regla de temporada Oct-Sep que a los registros GPS
    season_year = if_else(month >= 10, year, year - 1)
  )
# Cuenta los viajes completos de Guadalupe en cada temporada
guadalupe_trips_stats <- guadalupe_trips_with_season |>
  group_by(season_year) |>
  summarise(
    trips = n(),
    .groups = "drop"
  )
# Combina la secuencia completa con las estadísticas calculadas para
# rellenar las temporadas sin datos con valores de ausencia
guadalupe_seasons_full <- guadalupe_season_complete |>
  left_join(guadalupe_season_stats, by = "season_year") |>
  left_join(guadalupe_trips_stats, by = "season_year") |>
  mutate(
    # Usa "--" para la fecha de inicio en temporadas sin rastreo GPS
    start = if_else(is.na(start), "--", start),
    # Usa "--" para la fecha de término en temporadas sin rastreo GPS
    end = if_else(is.na(end), "--", end),
    # Usa cero para el conteo de individuos en temporadas sin rastreo
    n = if_else(is.na(n), 0L, n),
    # Usa cero para el conteo de viajes completos en temporadas sin viajes
    trips = if_else(is.na(trips), 0L, trips),
    # Crea la etiqueta de temporada con formato AAAA/AA para la tabla
    season = paste0(season_year, "/", str_sub(as.character(season_year + 1), 3, 4))
  ) |>
  # Ordena las temporadas de la más antigua a la más reciente antes de
  # descartar la columna season_year que solo sirve para el ordenamiento
  arrange(season_year) |>
  # Conserva solo las columnas que aparecerán en la tabla del artículo
  select(season, start, end, n_tagged = n, n_trips = trips)


# Prepara los registros de Clarion para el agrupamiento por temporada
# octubre-septiembre siguiendo el mismo procedimiento que Guadalupe
clarion_with_season <- clarion_data |>
  filter(!is.na(date), !is.na(name)) |>
  mutate(
    year = as.numeric(str_sub(date, 1, 4)),
    month = as.numeric(str_sub(date, 6, 7)),
    season_year = if_else(month >= 10, year, year - 1)
  )
# Calcula el rango de temporadas con datos en la colonia Clarion
clarion_season_range <- clarion_with_season |>
  summarise(
    min_season = min(season_year),
    max_season = max(season_year)
  )
# Crea la secuencia completa de temporadas consecutivas para Clarion
clarion_season_complete <- tibble(
  season_year = seq(
    clarion_season_range$min_season,
    clarion_season_range$max_season
  )
)
# Agrupa los registros de Clarion por temporada y calcula fechas y conteos
clarion_season_stats <- clarion_with_season |>
  group_by(season_year) |>
  summarise(
    start = min(date),
    end = max(date),
    n = n_distinct(name),
    .groups = "drop"
  )
# Asigna a cada viaje completo de Clarion su temporada según la salida
clarion_trips_with_season <- clarion_trips |>
  filter(complete == "complete trip") |>
  mutate(
    year = as.numeric(str_sub(departure, 1, 4)),
    month = as.numeric(str_sub(departure, 6, 7)),
    season_year = if_else(month >= 10, year, year - 1)
  )
# Cuenta los viajes completos de Clarion en cada temporada
clarion_trips_stats <- clarion_trips_with_season |>
  group_by(season_year) |>
  summarise(
    trips = n(),
    .groups = "drop"
  )
# Combina la secuencia completa con las estadísticas para incluir
# temporadas sin datos de Clarion en la tabla del artículo
clarion_seasons_full <- clarion_season_complete |>
  left_join(clarion_season_stats, by = "season_year") |>
  left_join(clarion_trips_stats, by = "season_year") |>
  mutate(
    start = if_else(is.na(start), "--", start),
    end = if_else(is.na(end), "--", end),
    n = if_else(is.na(n), 0L, n),
    trips = if_else(is.na(trips), 0L, trips),
    season = paste0(season_year, "/", str_sub(as.character(season_year + 1), 3, 4))
  ) |>
  arrange(season_year) |>
  select(season, start, end, n_tagged = n, n_trips = trips)


# Prepara los registros de San Benedicto para el agrupamiento por
# temporada octubre-septiembre siguiendo el mismo procedimiento
san_benedicto_with_season <- san_benedicto_data |>
  filter(!is.na(date), !is.na(name)) |>
  mutate(
    year = as.numeric(str_sub(date, 1, 4)),
    month = as.numeric(str_sub(date, 6, 7)),
    season_year = if_else(month >= 10, year, year - 1)
  )
# Calcula el rango de temporadas con datos en San Benedicto
san_benedicto_season_range <- san_benedicto_with_season |>
  summarise(
    min_season = min(season_year),
    max_season = max(season_year)
  )
# Crea la secuencia completa de temporadas consecutivas para San Benedicto
san_benedicto_season_complete <- tibble(
  season_year = seq(
    san_benedicto_season_range$min_season,
    san_benedicto_season_range$max_season
  )
)
# Agrupa los registros de San Benedicto por temporada y calcula fechas y conteos
san_benedicto_season_stats <- san_benedicto_with_season |>
  group_by(season_year) |>
  summarise(
    start = min(date),
    end = max(date),
    n = n_distinct(name),
    .groups = "drop"
  )
# Asigna a cada viaje completo de San Benedicto su temporada según la salida
san_benedicto_trips_with_season <- san_benedicto_trips |>
  filter(complete == "complete trip") |>
  mutate(
    year = as.numeric(str_sub(departure, 1, 4)),
    month = as.numeric(str_sub(departure, 6, 7)),
    season_year = if_else(month >= 10, year, year - 1)
  )
# Cuenta los viajes completos de San Benedicto en cada temporada
san_benedicto_trips_stats <- san_benedicto_trips_with_season |>
  group_by(season_year) |>
  summarise(
    trips = n(),
    .groups = "drop"
  )
# Combina la secuencia completa con las estadísticas para incluir
# temporadas sin datos de San Benedicto en la tabla del artículo
san_benedicto_seasons_full <- san_benedicto_season_complete |>
  left_join(san_benedicto_season_stats, by = "season_year") |>
  left_join(san_benedicto_trips_stats, by = "season_year") |>
  mutate(
    start = if_else(is.na(start), "--", start),
    end = if_else(is.na(end), "--", end),
    n = if_else(is.na(n), 0L, n),
    trips = if_else(is.na(trips), 0L, trips),
    season = paste0(season_year, "/", str_sub(as.character(season_year + 1), 3, 4))
  ) |>
  arrange(season_year) |>
  select(season, start, end, n_tagged = n, n_trips = trips)


# ==== ENSAMBLE DE LA SALIDA ====
# Suma los individuos rastreados de Guadalupe en todas sus temporadas
guadalupe_n_tagged <- sum(guadalupe_seasons_full$n_tagged)
# Suma los individuos rastreados de Clarion en todas sus temporadas
clarion_n_tagged <- sum(clarion_seasons_full$n_tagged)
# Suma los individuos rastreados de San Benedicto en todas sus temporadas
san_benedicto_n_tagged <- sum(san_benedicto_seasons_full$n_tagged)
# Suma los totales por colonia para obtener el total de individuos rastreados
n_tagged_individuals <- guadalupe_n_tagged + clarion_n_tagged + san_benedicto_n_tagged
# Suma los viajes completos de las tres colonias para el total de la tabla
n_trips_total <- guadalupe_n_trips + clarion_n_trips + san_benedicto_n_trips

# Combina las temporadas de las tres colonias para quedarse con las que tienen
# datos de rastreo y evitar contar dos veces las temporadas compartidas
seasons_with_data <- bind_rows(
  guadalupe_seasons_full,
  clarion_seasons_full,
  san_benedicto_seasons_full
) |>
  filter(n_tagged > 0) |>
  distinct(season) |>
  arrange(season)

# Cuenta las temporadas con datos de rastreo, que no siempre son consecutivas
n_tracking_seasons <- nrow(seasons_with_data)

# Calcula la extensión en años entre el primer y el último año de rastreo,
# sumando uno para incluir ambos extremos del intervalo
n_tracking_span_years <- max(as.numeric(c(
  guadalupe_max_year,
  clarion_max_year,
  san_benedicto_max_year
))) - min(as.numeric(c(
  guadalupe_min_year,
  clarion_min_year,
  san_benedicto_min_year
))) + 1

# Une la primera y la última temporada con datos para usarlas como rango
# de temporadas en el texto del artículo
tracking_season_span <- paste0(
  seasons_with_data$season[1],
  "–",
  seasons_with_data$season[nrow(seasons_with_data)]
)

# Combina los valores planos con las tablas de temporadas en una lista
# única que el motor de mustache usa para resolver todas las variables
methods_list <- list(
  n_tagged_individuals = n_tagged_individuals,
  n_analyzed_individuals = n_analyzed_individuals,
  representativeness_percent = representativeness_percent,
  n_individuals_per_cell_min = n_individuals_per_cell_min,
  n_individuals_per_cell_max = n_individuals_per_cell_max,
  n_tracking_seasons = n_tracking_seasons,
  n_tracking_span_years = n_tracking_span_years,
  tracking_season_span = tracking_season_span,
  n_trips_total = n_trips_total,
  guadalupe_n_tagged = guadalupe_n_tagged,
  guadalupe_n_trips = guadalupe_n_trips,
  guadalupe_min_date = guadalupe_min_date,
  guadalupe_max_date = guadalupe_max_date,
  guadalupe_min_year = guadalupe_min_year,
  guadalupe_max_year = guadalupe_max_year,
  guadalupe_seasons = guadalupe_seasons_full,
  clarion_n_tagged = clarion_n_tagged,
  clarion_n_trips = clarion_n_trips,
  clarion_min_date = clarion_min_date,
  clarion_max_date = clarion_max_date,
  clarion_min_year = clarion_min_year,
  clarion_max_year = clarion_max_year,
  clarion_seasons = clarion_seasons_full,
  san_benedicto_n_tagged = san_benedicto_n_tagged,
  san_benedicto_n_trips = san_benedicto_n_trips,
  san_benedicto_min_date = san_benedicto_min_date,
  san_benedicto_max_date = san_benedicto_max_date,
  san_benedicto_min_year = san_benedicto_min_year,
  san_benedicto_max_year = san_benedicto_max_year,
  san_benedicto_seasons = san_benedicto_seasons_full
)


# ==== SALIDA ====
# Exporta la lista completa como JSON para que el motor de mustache
# resuelva las variables en el texto del primer artículo, usando el
# formato renglón para conservar la estructura tabular de temporadas
write_json(
  methods_list,
  output_json_path,
  pretty = TRUE,
  auto_unbox = TRUE,
  dataframe = "rows"
)
