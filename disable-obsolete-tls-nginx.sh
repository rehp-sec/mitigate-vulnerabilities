#!/bin/bash

# Buscar el archivo de configuración
config_file=$(find / -name "nginx.conf" 2>/dev/null)

# Verificar si se encontró el archivo
if [ -z "$config_file" ]; then
  echo "No se pudo encontrar el archivo de configuración."
  exit 1
fi

# Editar el archivo de configuración
sed -i 's/^\(\s*ssl_protocols .*\)$/        ssl_protocols TLSv1.2 TLSv1.3;/' "$config_file"

# Reiniciar el servicio de Nginx
service nginx restart
