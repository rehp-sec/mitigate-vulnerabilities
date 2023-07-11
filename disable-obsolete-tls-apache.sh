#!/bin/bash


# Buscar el archivo de configuración
config_file=$(find / -name "ssl.conf" 2>/dev/null)

# Verificar si se encontró el archivo
if [ -z "$config_file" ]; then
  echo "No se pudo encontrar el archivo de configuración."
  exit 1
fi

# Editar el archivo de configuración
sed -i 's/^\(SSLProtocol .*\)$/SSLProtocol all -SSLv3 -TLSv1 -TLSv1.1/' "$config_file"

# Reiniciar el servicio de Apache2
service apache2 restart
