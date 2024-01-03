<%@ page import="java.sql.*"%>
<%@ page import="com.mysql.cj.jdbc.Driver" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
        <title>Crear empleado</title>
    </head>
    <body>
        <% 
            String driver = "com.mysql.cj.jdbc.Driver";
            String username = "root";
            String password = "";
            String port = "3306";
            String hostname = "localhost";
            String database = "pruebahlf";
            String url = "jdbc:mysql://" + hostname + ":" + port + "/" + database;
            Connection conn;
            Statement statement;
        %>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <!-- action="" indicar a donde van a ser enviados los datos
                    via post van a ser enviados los datos 
                    required, hace obligatorio el campo-->
                    <form action="crear.jsp" method="post">
                        <div class="mb-3">
                            <label for="nombre" class="form-label">Nombre</label>
                            <input type="text" class="form-control" id="nombre" name="nombre" aria-describedby="Nombre" required="required">
                        </div>
                        <div class="mb-3">
                            <label for="direccion" class="form-label">Dirección</label>
                            <input type="text" class="form-control" id="direccion" name="direccion" aria-describedby="Direccion" required="required">
                        </div>
                        <div class="mb-3">
                            <label for="telefono" class="form-label">Teléfono</label>
                            <input type="text" class="form-control" id="telefono" name="telefono" aria-describedby="Telefono" required="required">
                        </div>                        
                        <button type="submit" class="btn btn-primary" name="guardar">Guardar
                            <i class="bi bi-cloud-download-fill"></i>
                        </button>
                    </form>
                </div>
            </div>
        </div>
        <%
            if(request.getParameter("guardar") != null){
                String nombre = request.getParameter("nombre");
                String direccion = request.getParameter("direccion");
                String telefono = request.getParameter("telefono");
                try {
                    Class.forName(driver);
                    conn = DriverManager.getConnection(url, username, password);
                    statement = conn.createStatement();
                    statement.executeUpdate("INSERT INTO empleados (nombre, direccion, telefono) values('"+nombre+"','"+direccion+"','"+telefono+"');");
                    // forma para redireccionar a la pagina index.jsp, el tipo de direccionamiento es forward
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } catch(SQLException e){
                    out.print(e);
                }

            }
        %> 
    </body>
</html>
