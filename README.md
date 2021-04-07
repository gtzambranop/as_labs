# Laboratorios Arquitectura de Software

## Lab 1

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
    Esa dirección debe ser colocada en el archivo `docker-compose.yml` en `DB_HOST`.

2. Crear imagen

    ```bash
    docker-compose build
    ```

3. Crear contenedores

    Puede tardar ya que la aplicación espera a que la base de datos se inicialice.

    ```bash
    docker-compose up
    ```
### Generar peticiones con bash

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

## Lab 2

## Ejecución supermarket app

1. Ubicarse en la carpeta `supermarket/`.
2. Verificar host de la base de datos:

  - Crear contenedor de la base de datos para obtener host:

    ```bash
    docker run --name sql -e MYSQL_ROOT_PASSWORD=secret -d mysql:5.7
    ```
  - Ejecutar el siguiente comando para obtener la dirección host
    ```bash
    docker inspect --format='{{range .NetworkSettings.Networks}}{{println .IPAddress}}{{end}}' sql
    ```
    Esa dirección debe ser colocada en el archivo `docker-compose.yml` en `DB_HOST`.
2. Crear imagen

    ```bash
    docker-compose build
    ```

3. Crear contenedores

    Puede tardar ya que la aplicación espera a que la base de datos se inicialice.

    ```bash
    docker-compose up
    ```
## Ejecutar contenedor supermarket_api

1. Obtener IP del computador
    ```bash
    hostname -i
    ```
2. Ese IP debe ser colocado en `supermarket_api/src/supermarket/categories/server.js`, en la constante `url`
3. Ubicarse en la carpeta `supermarket_api/`.
4. Generar la imagen de la api
    ```bash
    docker build -t supermarket_api .
    ```
5. Generar un contenedor de la imagen creada:
    ```bash
    docker run -p 5000:5000 supermarket_api
    ```