# Gestión de Variables de Entorno MxM

Este script Bash gestiona las variables de entorno de MxM en el entorno de desarrollo. Se encarga de eliminar las variables de entorno existentes en el repositorio local (en CODE_BASE) y copiar las variables de entorno desde la carpeta de desarrollo (en ENV_BASE) al repositorio local si no existen.

## Instrucciones de Uso

1. **Configuración de Rutas:**
   - Abre el script `variablesEntornoUpdate.sh` y configura las siguientes variables:
     ```bash
     CODE_BASE="$HOME/Code/MxM"       # Ruta base del código de MxM
     ENV_BASE="$HOME/Documents/ENV/desarrollo"   # Ruta base de las variables de entorno descargadas
     ```
   Asegúrate de reemplazar `"$HOME/Code/MxM"` y `"$HOME/Documents/ENV/desarrollo"` con las rutas correctas a tus directorios.

2. **Permisos de Ejecución:**
   - Si el script no tiene permisos de ejecución, otórgaselos con el siguiente comando:
     ```bash
     chmod +x variablesEntornoUpdate.sh
     ```

3. **Ejecución del Script:**
   - Ejecuta el script usando Bash:
     ```bash
     ./variablesEntornoUpdate.sh
     ```

## Funcionamiento

El script verifica la existencia de archivos `.env` en las rutas especificadas en `ENV_BASE` y los copia a las rutas especificadas en `CODE_BASE`. Si un archivo `.env` ya existe en `CODE_BASE`, lo elimina antes de copiar el nuevo archivo desde `ENV_BASE`.

Este script es útil para mantener actualizadas las variables de entorno en tu repositorio local de desarrollo, asegurando que siempre estén sincronizadas con las últimas configuraciones del entorno.

## Notas
- Asegúrate de revisar y ajustar las rutas y nombres de archivos según la estructura real de tu proyecto MxM.
- Si tienes alguna duda o problema con el script, revisa las salidas en la consola para obtener información detallada sobre los archivos procesados y las acciones realizadas.
