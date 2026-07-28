#!/bin/bash

APP=/home/aixcorp/documentacion/oracle-kb
WEB=/var/www/oracle-kb

echo "Entrando a Oracle KB..."

cd $APP || exit 1


source /home/aixcorp/documentacion/venv/bin/activate


echo "Generando sitio MkDocs..."

mkdocs build


echo "Publicando..."

sudo rsync -av --delete \
$APP/site/ \
$WEB/


sudo chown -R www-data:www-data $WEB


echo "Oracle KB actualizado correctamente"
