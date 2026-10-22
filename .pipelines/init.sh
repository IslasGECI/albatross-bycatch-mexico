#!/usr/bin/env bash
# ==========================================
# Título: Instalador de los hooks de git
# Contexto (Por qué): El hook de pre-push vive en .githooks/ y git solo lo
#   ejecuta si core.hooksPath apunta ahí. Instalarlo a mano es fácil de
#   olvidar, así que este script lo deja configurado.
# Descripción (Qué / Cómo): Configura core.hooksPath en .githooks y muestra
#   el valor resultante. No configura la identidad de git: es configuración
#   personal y vive fuera del repositorio.
# Entradas: Ninguna
# Salida: La ruta configurada de core.hooksPath en stdout
# Dependencias: git
# Notas:
#   - Corre fuera del contenedor: pertenece a .pipelines/
#   - Uso: .pipelines/init.sh
# ==========================================

git config core.hooksPath .githooks
git config --get core.hooksPath
