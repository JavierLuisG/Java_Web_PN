<%-- 
    Document   : index
    Created on : 17/12/2023, 11:29:37 p. m.
    Author     : JavierLuis
--%>

<%@ page import="java.sql.*"%>
<%@ page import="com.mysql.cj.jdbc.Driver" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
              rel="stylesheet" 
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
              crossorigin="anonymous">
        <!-- instalacion de bootstrap icons-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
        <title>Lista de empleados</title>
    </head>
    <body>
        <%  
            // Datos de conexion a la bd
            String driver = "com.mysql.cj.jdbc.Driver";
            String username = "root";
            String password = "123456";
            String port = "3306";
            String hostname = "localhost";
            String database = "pruebahlf";
            String url = "jdbc:mysql://" + hostname + ":" + port + "/" + database + "?autoReconnect=true&useSSL=false";
            // conexion a Mysql
            Connection conn;
            Statement statement;
            ResultSet rs;                       

            // 
            HttpSession sesion = request.getSession();
            if (sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals("0")){
                response.sendRedirect("login.jsp");
            }
        %>    
        <%!  
            String extractUsername(String email) {
                // Verificar que el correo electrónico contiene el carácter '@'
                if (email.contains("@")) {
                    // Obtener la posición del carácter '@'
                    int atIndex = email.indexOf("@");

                    // Extraer el nombre de usuario desde el inicio hasta antes del '@'
                    String us = email.substring(0, atIndex);

                    return us;
                } else {
                    // En caso de que no haya carácter '@', devolver el correo electrónico completo
                    return email;
                }
            }           
        %>
        <div class="container mt-2">
            <nav class="navbar bg-body-tertiary">
                <div class="container-fluid">
                    <a class="navbar-brand">Habla Luisa Fernanda</a>
                    <form class="form-inline" action="logout.jsp">
                        <i class="bi bi-person-circle"></i>
                        <%= extractUsername((String) session.getAttribute("email"))%>
                        <button  class="btn btn-outline-success" class="p-3 mb-2 bg-success text-white" type="submit">Cerrar Sesión</button>
                    </form>
                </div>
            </nav>
            <div class="row mt-3">
                <div class="col-sm">                
                    <table class="table">
                        <thead class="thead-dark">
                            <tr>
                                <!-- colspan: va a absorver 4 columnas -->
                                <th scope="col" colspan="4" class="text-center">Empleados</th>
                                <th scope="col">
                                    <!-- icono de Add person y <a href=""> para redirigir a la pagina indicada-->
                                    <a href="crear.jsp"><i class="bi bi-person-plus-fill"></i></a>
                                </th>
                            </tr>
                            <tr>
                                <th scope="col">Id</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">Dirección</th>
                                <th scope="col">Teléfono</th>
                                <!-- acciones (editar y borrar) -->
                                <th scope="col">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% 
                                try {
                                    Class.forName(driver);
                                    // credenciales para ingresar a la base de datos
                                    conn = DriverManager.getConnection(url, username, password);
                                    statement = conn.createStatement();
                                    // mostrar datos empleado. ResultSet sirve para jalar los registros
                                    rs = statement.executeQuery("SELECT * FROM empleados");
                                    // realizamos while para imprimir por pantalla los datos guardados en la bd
                                    // rs.next() genera que automaticamente pase a la siguiente casilla para acceder a los datos
                                    while (rs.next()){
                            %> 
                            <tr>
                                <th scope="row"><%= rs.getString(1) %></th>
                                <td><%= rs.getString(2) %></td>
                                <td><%= rs.getString(3) %></td>
                                <td><%= rs.getString(4) %></td>
                                <td>
                                    <!-- icono de pencil para editar -->
                                    <!-- href para indicar a donde va, 
                                    luego del ? para pasar esos valores -->
                                    <a href="editar.jsp?id=<%= rs.getString(1)%>&nombre=<%= rs.getString(2)%>&direccion=<%= rs.getString(3)%>&telefono=<%= rs.getString(4)%>">
                                        <i class="bi bi-pen-fill"></i>
                                    </a>
                                    <!-- icono de basura para eliminar -->
                                    <!-- m-2 indica un margin de 2 pix -->
                                    <a href="borrar.jsp?id=<%= rs.getString(1) %>" class="m-2">
                                        <i class="bi bi-trash-fill"></i>
                                    </a>
                                </td>
                            </tr>        
                            <%
                                }
                            } catch (SQLException e) {
                                out.print("Error mysql " + e); // Manejo de errores
                            }
                            %>                                                    
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
