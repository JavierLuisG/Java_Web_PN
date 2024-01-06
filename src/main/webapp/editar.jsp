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
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
        <title>Editar empleado</title>
    </head>
    <body>
        <%
            // datos para coneccion a la base de datos
            String driver = "com.mysql.cj.jdbc.Driver";
            String username = "root";
            String password = "";
            String port = "3306";
            String hostname = "localhost";
            String database = "pruebahlf";
            String url = "jdbc:mysql://" + hostname + ":" + port + "/" + database;
            Connection conn; 
            Statement statement;            
            // datos traidos de la base de datos
            String id = request.getParameter("id");
            String nombre = request.getParameter("nombre");
            String direccion = request.getParameter("direccion");
            String telefono = request.getParameter("telefono");
        %>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <form action="editar.jsp" method="get">
                        <div class="mb-3">
                            <!-- tomar el valor de la sesion del usuario por medio de value=""-->
                            <label for="nombre" class="form-label">Nombre</label>
                            <input type="text" class="form-control" id="nombre" value="<%= nombre%>" name="nombre" aria-describedby="Nombre" required="required">
                        </div>
                        <div class="mb-3">
                            <label for="direccion" class="form-label">Dirección</label>
                            <input type="text" class="form-control" id="direccion" value="<%= direccion%>" name="direccion" aria-describedby="Direccion" required="required">
                        </div>
                        <div class="mb-3">
                            <label for="telefono" class="form-label">Teléfono</label>
                            <input type="text" class="form-control" id="telefono" value="<%= telefono%>" name="telefono" aria-describedby="telefono" required="required">
                        </div>
                        <a href="index.jsp" class="btn btn-danger">Cancelar
                            <i class="bi bi-ban-fill"></i>
                        </a>
                        <button type="submit" name="guardar" class="btn btn-primary">Guardar cambios
                            <i class="bi bi-cloud-download-fill"></i>
                        </button>
                        <input type="hidden" name="id" value="<%= id%>">
                    </form>
                </div>
            </div>
        </div>
        <%
            if (request.getParameter("guardar") != null){
                try{
                    Class.forName(driver);
                    conn = DriverManager.getConnection(url, username, password);
                    statement = conn.createStatement();
                    statement.executeUpdate("UPDATE empleados "
                    + "SET nombre='"+ nombre +"', direccion='"+ direccion +"', telefono='"+ telefono +"' "
                    + "WHERE id = '"+ id +"';");
                } catch(SQLException e){
                    out.print(e);
                }
            }
        %>
    </body>
</html>