#!/bin/bash
#
# Este script gestiona las variables de entorno de MxM en el entorno de desarrollo.
# Se encarga de eliminar las variables de entorno existentes en el repositorio local
# (en CODE_BASE) y copiar las variables de entorno desde la carpeta de desarrollo
# (en ENV_BASE) al repositorio local si no existen.
#
# Instrucciones de uso:
# 1. Configura las rutas a tu código fuente de MxM en CODE_BASE y las variables
#    de entorno descargadas en ENV_BASE.
# 2. Da permisos de ejecución al script si no los tiene:
#      chmod +x variablesEntornoUpdate.sh
# 3. Ejecuta el script utilizando Bash:
#      ./variablesEntornoUpdate.sh
#

# Definición de las rutas base
CODE_BASE="$HOME/Code/MxM"        # Corregido para expandir ~ correctamente
ENV_BASE="$HOME/Documents/ENV/desarrollo"   # Corregido para expandir ~ correctamente

# Variables de entorno descargadas
backendDev=(
    "$ENV_BASE/backend/.env"
    "$ENV_BASE/certificados/dicmxmapprd1.pfx"
    "$ENV_BASE/certificados/keycloak.key"
    "$ENV_BASE/cronjob/.env"
    "$ENV_BASE/files/.env"
    "$ENV_BASE/notification/.env"
    "$ENV_BASE/statistics/.env"
)

frontedDev=(
    "$ENV_BASE/frontend/.env"
)

keycloakDev=(
    "$ENV_BASE/keycloak/conf/keycloak.conf"
)

# Variables de entorno repo
backendRepo=(
    "$CODE_BASE/backend/backend/.env"
    "$CODE_BASE/backend/backend/certificados/dicmxmapprd1.pfx"
    "$CODE_BASE/backend/backend/certificados/keycloak.key"
    "$CODE_BASE/backend/cronjob/.env"
    "$CODE_BASE/backend/files/.env"
    "$CODE_BASE/backend/notification/.env"
    "$CODE_BASE/backend/statistics/.env"
)

frontendRepo=(
    "$CODE_BASE/frontend/.env"
)

keycloakRepo=(
    "$CODE_BASE/keycloak/conf/keycloak.conf"
)

# Función para verificar y eliminar o copiar archivos .env
check_and_update_env() {
    local dev_files=("${!1}")  # Arreglo de archivos de Dev pasado como referencia
    local repo_files=("${!2}")  # Arreglo de archivos de Repo pasado como referencia

    # Eliminar o copiar archivos .env según corresponda
    for (( i=0; i<${#dev_files[@]}; i++ )); do
        dev_file="${dev_files[$i]}"
        repo_file="${repo_files[$i]}"
        
        # Expande la ruta del archivo
        dev_file_expanded=$(eval echo "$dev_file")
        repo_file_expanded=$(eval echo "$repo_file")

        # Extraer el directorio de destino
        repo_dir=$(dirname "$repo_file_expanded")

        # Verificar si el directorio de destino existe, si no, crearlo
        if [ ! -d "$repo_dir" ]; then
            echo "Creando directorio: $repo_dir"
            mkdir -p "$repo_dir"
        fi

        # Verificar si el archivo de destino existe
        if [ -f "$repo_file_expanded" ]; then
            echo "Eliminando $repo_file_expanded"
            rm "$repo_file_expanded"
        fi

        # Copiar el archivo de desarrollo al repositorio
        echo "Copiando $dev_file_expanded a $repo_file_expanded"
        cp "$dev_file_expanded" "$repo_file_expanded"
    done
}

# Llamadas a la función para cada arreglo
echo "Procesando backendRepo..."
check_and_update_env backendDev[@] backendRepo[@]

echo "Procesando frontedRepo..."
check_and_update_env frontedDev[@] frontendRepo[@]

echo "Procesando keycloakRepo..."
check_and_update_env keycloakDev[@] keycloakRepo[@]
