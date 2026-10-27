# ==========================================
# Título: Crea el umbral de población que define la componente de alimentación
#
# Contexto (Por qué):
# El artículo reporta el umbral como porcentaje de la población, pero ese
# porcentaje lo deriva track2KBA::findSite a partir de la representatividad y
# nunca queda escrito en un artefacto. El guion de valores no puede recalcular
# la regla, así que este guion la evalúa una vez y la guarda.
#
# Descripción (Qué / Cómo):
# Lee la evaluación de representatividad de la muestra analizada y extrae su
# porcentaje. Convierte el porcentaje a fracción y aplica los niveles de
# track2KBA::findSite para elegir el umbral. Convierte el umbral a porcentaje
# de la población y lo escribe como un JSON plano.
#
# Entradas:
# data/processed/representative_assessment_all.rds
#
# Salida:
# data/processed/foraging_component_threshold.json
#
# Dependencias:
# tidyverse
# jsonlite
#
# Notas:
# - La regla replica los niveles de track2KBA::findSite
# - findSite elige 0.5, 0.2, 0.125 o 0.1 según la representatividad
# - El guion se retira cuando bycatch registre el umbral (ver TODO.md)
# ==========================================


# ==== CONFIGURACIÓN ====
library(tidyverse) # Proporciona case_when para aplicar los niveles sin condicionales
library(jsonlite) # Proporciona write_json para exportar el umbral como JSON

# Ruta del archivo RDS con la evaluación de representatividad de la muestra
input_representative_assessment_path <- "data/processed/representative_assessment_all.rds"
# Ruta del archivo JSON que almacenará el umbral de población
output_json_path <- "data/processed/foraging_component_threshold.json"
# Factor de conversión entre porcentaje y fracción
percent_per_fraction <- 100
# Corte de representatividad por debajo del cual la muestra es no representativa
unrepresentative_cut <- 0.7
# Corte de representatividad por debajo del cual el umbral es bajo
low_representativeness_cut <- 0.8
# Corte de representatividad por debajo del cual el umbral es intermedio
high_representativeness_cut <- 0.9
# Umbral de población para una muestra no representativa
threshold_unrepresentative <- 0.5
# Umbral de población para una muestra poco representativa
threshold_low <- 0.2
# Umbral de población para una muestra con representatividad intermedia
threshold_middle <- 0.125
# Umbral de población para una muestra con representatividad alta
threshold_high <- 0.1


# ==== ENTRADAS ====
# Carga la evaluación de representatividad para tomar el porcentaje de la muestra
representative_assessment_object <- readRDS(input_representative_assessment_path)


# ==== PROCESAMIENTO / ANÁLISIS ====
# Extrae el porcentaje de representatividad de la muestra analizada
representativeness_percent <- representative_assessment_object$assessment_summary$out
# Convierte el porcentaje a fracción, porque findSite espera fracciones
representativeness_fraction <- ifelse(
  representativeness_percent > 1,
  representativeness_percent / percent_per_fraction,
  representativeness_percent
)
# Aplica los niveles de track2KBA::findSite para derivar el umbral de población
threshold_fraction <- case_when(
  representativeness_fraction <= unrepresentative_cut ~ threshold_unrepresentative,
  representativeness_fraction < low_representativeness_cut ~ threshold_low,
  representativeness_fraction < high_representativeness_cut ~ threshold_middle,
  TRUE ~ threshold_high
)
# Convierte el umbral a porcentaje de la población para el texto del artículo
threshold_population_percent <- threshold_fraction * percent_per_fraction
# Reúne el umbral en una lista plana para que el guion de valores la extraiga
threshold_list <- list(threshold_population_percent = threshold_population_percent)


# ==== SALIDA ====
# Exporta el umbral como JSON para que el guion de valores lo extraiga
write_json(
  threshold_list,
  output_json_path,
  pretty = TRUE,
  auto_unbox = TRUE
)
