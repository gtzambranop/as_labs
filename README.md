# Laboratorios Arquitectura de Software

## Ejecución docker-compose

1. Verificar host de la base de datos:

  - Crear contenedor de la base de datos para obtener host:

    ```bash
    docker run --name sql -e MYSQL_ROOT_PASSWORD=secret -d mysql:5.7
    ```
  - Ejecutar el siguiente comando para obtener la dirección host
    ```bash
    docker inspect --format='{{range .NetworkSettings.Networks}}{{println .IPAddress}}{{end}}' sql
    ```

2. Crear imagen

    ```bash
    docker-compose build
    ```

3. Crear contenedores

    Puede tardar ya que la aplicación espera a que la base de datos se inicialice.

    ```bash
    docker-compose up
    ```

## Generar peticiones con bash

En la carpeta requests, hay 2 archivos con peticiones a la aplicación, uno para categorías y otro para productos, para usarlas siga estos pasos

1. Dele permisos a los script
    ```bash
    sudo chmod +x *.sh
    ```
2. Ejecute usando

    ```bash
    ./categories.sh [OPTION]
    ./products.sh [OPTION]
    ```
    El campo [OPTIONS] puede ser:
    - POST
    - GET
    - GET [id]
    - PUT [id]
    - DELETE [id]
