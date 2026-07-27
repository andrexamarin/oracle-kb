#!/bin/bash

source /home/aixcorp/documentacion/venv/bin/activate

cd /home/aixcorp/documentacion/mi-documentacion || exit 1

mkdocs serve -a 127.0.0.1:8002