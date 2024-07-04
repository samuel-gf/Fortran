#!/bin/bash

# Establecer la columna predeterminada
default_column=60

# Leer el parámetro de columna de la línea de comandos, si se proporciona
column=${1:-$default_column}

# Procesar la entrada estándar línea por línea
while IFS= read -r line
do
  # Buscar el índice del primer signo de exclamación
  exclamation_index=$(echo "$line" | grep -b -o '!' | cut -d: -f1 | head -n1)

  # Si no hay signo de exclamación, imprimir la línea tal cual
  if [ -z "$exclamation_index" ]; then
    echo "$line"
    continue
  fi

  # Verificar si hay caracteres antes del signo de exclamación
  before_exclamation="${line:0:$exclamation_index}"

  if [[ "$before_exclamation" =~ [^[:space:]] ]]; then
    # Hay caracteres antes del signo de exclamación
    # Obtener la parte de la línea después del signo de exclamación
    after_exclamation="${line:$exclamation_index}"

    # Generar la nueva línea con la exclamación y lo que sigue movido a la columna especificada
    new_line=$(printf "%-$(($column - 1))s%s" "$before_exclamation" "$after_exclamation")
    echo "$new_line"
  else
    # No hay caracteres antes del signo de exclamación, imprimir la línea tal cual
    echo "$line"
  fi
done

