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
            %>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">                
                    <table class="table">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">Id</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">Dirección</th>
                                <th scope="col">Teléfono</th>
                            </tr>
                        </thead>
                        <tbody>
                        <% 
                            try {
                                Class.forName(driver);
                                // credenciales para ingresar a la base de datos
                                conn = DriverManager.getConnection(url, username, password);
                                statement = conn.createStatement();
                                // mostrar datos empleado
                                rs = statement.executeQuery("SELECT * FROM empleados");
                                // realizamos do-while para imprimir por pantalla los datos guardados en la bd
                                // rs.next() genera que automaticamente pase a la siguiente casilla para acceder a los datos
                                while (rs.next()){
                                %> 
                                    <tr>
                                        <th scope="row"><%= rs.getString(1) %></th>
                                        <td><%= rs.getString(2) %></td>
                                        <td><%= rs.getString(3) %></td>
                                        <td><%= rs.getString(4) %></td>
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
