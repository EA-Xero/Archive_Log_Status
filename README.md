# 📂 Log Archive Tool

Una herramienta ligera y robusta escrita en **Bash** para automatizar la creación de respaldos comprimidos de directorios de logs o cualquier carpeta del sistema.

## ✨ Características

* **Modo Estricto:** Utiliza `set -euo pipefail` para garantizar que el script se detenga ante cualquier error inesperado, evitando ejecuciones parciales peligrosas.
* **Validación Exhaustiva:** Verifica la existencia de rutas, permisos de lectura/ejecución y asegura que el destino sea efectivamente un directorio.
* **Nomenclatura Inteligente:** Genera archivos `.tar.gz` automáticamente con una marca de tiempo precisa (`YYYY_MM_DD-HH_MM_SS`).
* **Seguridad de Sistema:** Excluye automáticamente directorios virtuales del kernel como `/proc`, `/sys`, `/dev` y `/run`.
* **Modo Interactivo:** Permite realizar múltiples archivados en una sola sesión.

## 🚀 Uso

1.  **Dar permisos de ejecución:**
    ```bash
    chmod +x archive_tool.sh
    ```

2.  **Ejecutar el script:**
    ```bash
    ./archive_tool.sh
    ```

3.  **Instrucciones:**
    * Cuando el script lo solicite, introduce las rutas de los directorios separadas por espacios.
    * Ejemplo: `/var/log/nginx /var/log/mysql`

## 🛠️ Detalles Técnicos

### Seguridad y Manejo de Errores
El script implementa un `trap` para errores globales:
```bash
trap 'echo "Script failed"; exit 1' ERR

## Informacion
Este script fue creado para el desafio en [DevOps Roadmap](https://roadmap.sh/projects/log-archive-tool)
