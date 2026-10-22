#!/usr/bin/env bash
# ==========================================
# Título: Ejecutor local de las verificaciones
# Contexto (Por qué): Las verificaciones viven en src/ y Make las orquesta
#   dentro del contenedor. Este script es la entrada desde el host para que
#   el hook de pre-push no repita el nombre del contenedor ni la lista de
#   verificaciones.
# Descripción (Qué / Cómo): Ejecuta `make check` dentro del contenedor ya
#   iniciado. No valida nada por sí mismo: delega en Make, que es el nivel
#   que conoce las verificaciones.
# Entradas: Ninguna
# Salida: La salida de `make check`; código de salida de Make
# Dependencias: docker
# Notas:
#   - Corre fuera del contenedor: pertenece a .pipelines/
#   - Supone que el contenedor ${PWD##*/}_ci ya está iniciado
#   - Uso: .pipelines/check.sh
# ==========================================

# Nombre del contenedor que queda corriendo en este equipo
CONTAINER_NAME="${PWD##*/}_ci"

docker exec "${CONTAINER_NAME}" make check
