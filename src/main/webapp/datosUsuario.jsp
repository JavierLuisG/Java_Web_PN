<%@ page import="java.sql.*"%>
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
        <title>Datos personales</title>
    </head>
    <body>
        <%
            String driver = "com.mysql.cj.jdbc.Driver";
            String username = "root";
            String password = "123456";
            String port = "3306";
            String hostname = "localhost";
            String database = "pruebahlf";
            String url = "jdbc:mysql://" + hostname + ":" + port + "/" + database;
            // verificar si el usuario está logueado
            HttpSession sesion = request.getSession();
            if(sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals("0")){
                response.sendRedirect("login.jsp");
            }
            Connection conn;
            Statement statement;                        
        %>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <!-- action para mandar hacia nosotros mismos y el method post para que los datos sean ocultos en el navegador -->
                    <form action="datosUsuario.jsp" method="post">
                        <!-- tomar el valor de la sesion del usuario por medio de value=""-->
                        <div class="mb-3">
                            <label for="exampleInputEmail" class="form-label">Usuario</label>
                            <input type="email" class="form-control" value="<%= sesion.getAttribute("email")%>" name="usuario" id="email" aria-describedby="email" placeholder="Ingrese usuario">
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Contraseña</label>
                            <input type="password" class="form-control" name="pass" id="password" placeholder="Ingrese contraseña actual">
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Nueva Contraseña</label>
                            <input type="password" class="form-control" name="newPass" id="newPassword" placeholder="Ingrese contraseña nueva">
                        </div>
                        <button type="submit" name="guardar" class="btn btn-primary">Guardar</button>
                        <!-- boton para cancelar los datos ingresados -->
                        <a href="index.jsp" class="btn btn-danger">Cancelar</a>
                    </form>
                </div>
            </div>
        </div>
    </body>
    <%
        if(request.getParameter("guardar") != null){
            String id = session.getAttribute("id").toString();
            String usuario = request.getParameter("usuario");
            String pass1 = request.getParameter("pass");
            String pass2 = request.getParameter("newPass");
            if(pass1.equals(pass2)){
                try{
                    Class.forName(driver);
                    conn = DriverManager.getConnection(url, username, password);
                    statement = conn.createStatement();
                    statement.executeUpdate("UPDATE usuarios SET email = '"+ usuario +"', password = '"+ pass2 +"' WHERE id = '"+ id +"';");
                    session.setAttribute("usuario", usuario);
                    response.sendRedirect("index.jsp");
                } catch(Exception ex){
                    out.print("Error, no se pudo actualizar la información: " + ex);
                }
            } else {
               %>
            <div class="container mt-4">
                <%out.print("<div class=\"alert alert-warning\" role=\"alert\">Las contraseñas <a href=\"#\" class=\"alert-link\">no coinciden</a></div>");%>
            </div><%
            }
        }
    %> 
</html>
