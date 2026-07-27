#!/bin/bash

set -e

echo "Activando entorno virtual..."

source .venv/bin/activate

echo "Instalando dependencias..."

pip install -r requirements.txt

echo "Listo."