![Estado del Proyecto](https://img.shields.io/badge/Proyecto%20en%20curso-Brightgreen)

## Proyecto Java Web: Desarrollo de una Aplicación Interactiva

### Descripción
Este proyecto es una aplicación Java Web que implementa un sistema de autenticación mediante login. 
Los usuarios pueden iniciar sesión utilizando su correo electrónico y contraseña, las cuales son validadas contra una base de datos MySQL. 
Además de la autenticación, la aplicación ofrece una interfaz interactiva para llevar a cabo operaciones CRUD (Cread, Read, Update, Delete) sobre los datos almacenados en la base de datos. 

### Características
- Autenticación de Usuarios por medio de correo y contraseña
- Interfaz de Usuario Intuitiva.
- Operaciones CRUD.
- Validación de Datos.
- Seguridad de Contraseñas.

### Tecnologías Utilizadas
- Java: Lenguaje de programación principal utilizado en el desarrollo del proyecto.
- JSP (JavaServer Pages): Para crear las páginas web dinámicas.
- Servlet: Para manejar las solicitudes y respuestas HTTP en el servidor.
- Apache Tomcat: Utilizado como servidor web para ejecutar la aplicación Java. 
- MySQL: Sistema de gestión de bases de datos relacional utilizado para almacenar datos.
- MySQL Workbench: Herramienta utilizada para el diseño y administración de la base de datos MySQL.
- Bootstrap: Framework de diseño web utilizado para mejorar la interfaz de usuario.
- MD5: Algoritmo de hash utilizado para calcular y almacenar hashes de contraseñas de manera segura en la base de datos.

### Instalación
Para ejecutar este proyecto, sigue estos pasos:
1. Asegúrate de tener Java instalado en tu máquina. Puedes descargar la última versión de [Java SE](https://www.oracle.com/co/java/technologies/downloads/#java17).
2. Descarga este proyecto clonándolo en un directorio existente o descárgalo como ZIP y descomprime el archivo ZIP si es necesario.
3. Abre tu IDE compatible con JDK 17 (NetBeans, IntelliJ IDEA, Eclipse, entre otros) y carga el proyecto.
4. Instala Apache Tomcat, un servidor web y servlet container que se utiliza para ejecutar aplicaciones Java web. Puedes descargar Tomcat desde [aquí](https://tomcat.apache.org/download-10.cgi).
5. Incorpora Bootstrap, un framework de diseño web, al proyecto para mejorar la interfaz de usuario y la experiencia del usuario. Puedes encontrar más información sobre cómo incorporar Bootstrap [aquí](https://getbootstrap.com/).
6. Descarga el conector MySQL JDBC desde [aquí](https://dev.mysql.com/downloads/connector/j/).
7. Instala y configura MySQL, un sistema de gestión de bases de datos relacional. Puedes descargar MySQL desde [aquí](https://dev.mysql.com/downloads/file/?id=526408).
8. Instala y configura MySQL Workbench, una herramienta de diseño de bases de datos y administración para MySQL. Puedes descargar MySQL Workbench desde [aquí](https://dev.mysql.com/downloads/workbench/).

### Uso
1. Ejecuta la aplicación desde tu IDE preferido. Asegúrate de tenerlo configurado para usar JDK 17.
2. Asegurate de ejecutar Tomcat.
3. Ejecuta MySQL Workbench donde podras gestionar la base de datos. Ejecuta los comandos que se encuentran en los archivos jsp.sql y usuario.sql.

### Créditos
Este proyecto fue desarrollado siguiendo el curso de Java Web por Programador Novato.
