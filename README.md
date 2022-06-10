# Examen final de Sistemas Infórmaticos : Despliegue de aplicación en Docker

1. [Introducción](#intro)
2. [Configuración del archivo docker-compose.yml](#conf)
3. [Pasos para el despliegue de la aplicación](#apli)
4. [Preparación y subida de la imagen](#img)
5. [Conclusiones](#con)
6. [Annexos](#anex)

<div id= 'intro'>

## Introducción
  
> Esta práctica se basara en el despliegue de nuestro proyecto en docker, mediante el docker compose, haciendo uso de : mysql, phpmyadmin y tomcat.
  Finalmente crearemos una imagen a partir del despliegue y lo subiremos a DockerHub.
  
</div>

<div id= 'conf'>

## Configuración del archivo docker-compose

El archivo docker compose es un archivo YML donde definiremos los servicios, redes y volúmenes. Lo colocaremos en dentro del directorio junto con todo lo necesario para armar el ambiente. Nuestro docker compose tendra lo necesario para ejecutar el mysql, tomcat y phpmyadmin. Es el siguiente:

  ```
  version: '3.3'
services:
 db:
   image: mysql:8.0
   volumes:
     - db_vol:/var/lib/mysql
     - ./mysql-dump:/docker-entrypoint-initdb.d
   environment:
     MYSQL_ROOT_PASSWORD: root
     MYSQL_DATABASE: proyecto
     MYSQL_USER: userPrueba
     MYSQL_PASSWORD: 12345
   ports:
     - 3307:3306
 phpmyadmin:
  depends_on:
    - db
  image: phpmyadmin/phpmyadmin
  ports:
    - '8081:80'
  environment:
    PMA_HOST: db
    MYSQL_ROOT_PASSWORD: root
 web:
  build:
    context: .       
  depends_on:
    - db
  image: tomcat:10.0
  volumes:
          - ./target/Gestion_Proyectos.war:/usr/local/tomcat/webapps/Gestion_Proyectos.war
  ports:
    - '8080:8080'
  environment:
    MYSQL_ROOT_PASSWORD: root
    MYSQL_DATABASE: proyecto
    MYSQL_USER: userPrueba
    MYSQL_PASSWORD: 12345
volumes:
  db_vol: 
  ```
  
</div>

<div id= 'apli'>

## Pasos para el despliegue de la aplicación

Una vez hemos creado el docker-compose.yml, en el mismo directorio deberemos tener todos los archivos necesarios. 
  
  - El archivo del proyecto en un .war (el nuestro esta en la carpeta target)
  
  - El archivo de la base de datos .sql (el nuestro esta en la carpeta BBDD)

Con todo esto, vamos a la terminal y nos situamos en el directorio donde se encuentra todo, y ejecutamos el siguiente comando:
  
```
  sudo docker-compose up -d
  ```
![compose](https://user-images.githubusercontent.com/91748294/173106349-04941085-4447-4941-b9f0-cf1d588381e3.png)

Ahora podremos ir a las páginas. Si vamos al localhost:8080 veremos como se despliega la página principal y como podemos registarnos y loguearnos.
  
![index](https://user-images.githubusercontent.com/91748294/173106412-3d248665-45f5-4385-896a-7a1cd90e4b15.png)
  
![registro](https://user-images.githubusercontent.com/91748294/173106450-948f10e3-dab7-4200-ace3-0b1f8397507f.png)

![inicio](https://user-images.githubusercontent.com/91748294/173106495-8c896143-4c8b-4e8b-8901-73646b9d80ad.png)

![home](https://user-images.githubusercontent.com/91748294/173106540-4fabeffc-f44a-4eed-9fda-ff48f2d4e8c3.png)

 También si vamos a localhost:8081 podremos loguearnos en el phpmyadmin (con el usuario y contraseña que definimos en el docker-compose) y mirar la base de datos.
  
![userphp](https://user-images.githubusercontent.com/91748294/173107046-ff6ff248-0e54-4882-a98b-07300c2db1b5.png)

![basesphp](https://user-images.githubusercontent.com/91748294/173107131-e479b107-67e7-48d7-8c48-f3635bf8ef5b.png)
  
</div>

<div id= 'img'>

## Preparación y subida de la imagen
  
Ahora con nuestro proyecto desplegado procederemos a crear una imagen y contenedor, para luego subirlo en el DockerHub.
  
Empezaremos por crear el Dockerfile

```
FROM tomcat:latest

LABEL maintainer="melissarodriguez"

ADD ./target/Gestion_Proyectos.war /usr/local/tomcat/webapps/

EXPOSE 8080

CMD ["catalina.sh", "run"]
  ```
Y ejecutamos el comando para monstar la imagen:

  ```
  docker build -t mely1h1r/gestionproyectos-melissa-rodriguez-hernandez . 
 
  ```

![build](https://user-images.githubusercontent.com/91748294/173107228-7cd71352-1736-4661-afbf-f061db807805.png)
  
Ahora procederemos a subirlo al dockerHub
  
  ```
docker push mely1h1r/gestionproyectos-melissa-rodriguez-hernandez
  ```
 
![push](https://user-images.githubusercontent.com/91748294/173107314-8dcd1f5f-9cb8-4e17-a182-c297c3040f1a.png)
  
Si todo ha salido bien nos saldría algo así, con esto ya podriamos bajarnos el contenedor en cualquier ordenador y ejecutarlo:
  
![dockerhub](https://user-images.githubusercontent.com/91748294/173107335-ffc8d653-b1ef-41c8-a41d-19b3842ec028.png)

(Link en el annexo)
  
</div>

<div id= 'con'>

## Conclusiones

Hemos utilizado como bases los archivos de otro proyecto que ya funcionaba y hemos sustitudo el .war y el .sql por los nuestros.

La parte mas complicada ha sido el funcionamiento de la base de datos, ha dado muchos problemas por los puertos y credenciales.
  
</div>

<div id= 'anex'>

## Annexo
  
[Link del contendor en DockerHub](https://hub.docker.com/r/mely1h1r/gestionproyectos-melissa-rodriguez-hernandez)

[Código fuente de todo el proyecto](https://github.com/MelissaRodriguezHernandez/Proyecto_Final)
  
</div>

