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
        <title>Login</title>
    </head>
    <body>
        <%
            // Datos de conexion a la bd
            String driver = "com.mysql.cj.jdbc.Driver";
            String username = "root";
            String password = "";
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
                    <!-- para métodos de seguridad se pone en post. si se pasa por url se va a ver el password-->
                    <form method="post" action="login.jsp">
                        <div class="mb-3">
                            <label for="email1" class="form-label">Correo electrónico</label>
                            <input type="email" class="form-control" name="email" id="email" aria-describedby="email">
                        </div>
                        <div class="mb-3">
                            <label for="password1" class="form-label">Contraseña</label>
                            <input type="password" class="form-control" name="pass" id="password">
                        </div>
                        <button type="submit" name="btnLogin" class="btn btn-primary">Iniciar Sesión</button>
                    </form>
                </div>
            </div>
        </div>
        <% 
            if(request.getParameter("btnLogin") != null) {
                String email = request.getParameter("email");
                String pass = request.getParameter("pass");
                // HttpSession propiedad de jsp - se intenta traer todas las sesiones guardadas
                HttpSession sesion = request.getSession();
                try {
                    Class.forName(driver);
                    // credenciales para ingresar a la base de datos
                    conn = DriverManager.getConnection(url, username, password);
                    statement = conn.createStatement();
                    // mostrar datos empleado. ResultSet sirve para jalar los registros
                    rs = statement.executeQuery("SELECT * FROM usuarios WHERE email = '"+ email +"' AND password = '"+ pass +"';");
                    // realizamos while para imprimir por pantalla los datos guardados en la bd
                    // rs.next() genera que automaticamente pase a la siguiente casilla para acceder a los datos
                    while (rs.next()){
                        session.setAttribute("logueado", "1");
                        session.setAttribute("email", rs.getString("email"));
                        session.setAttribute("id", rs.getString("id"));
                        // para redireccionar al ser logueado
                        response.sendRedirect("index.jsp");
                    }
                    %>
                    <div class="container mt-4">
                        <%out.print("<div class=\"alert alert-danger\" role=\"alert\">Email o contraseña erroneos </div>");%>
                    </div><% 
                } catch (SQLException e) {
                    out.print("Error mysql " + e); // Manejo de errores
                }                    
            }        
        %>
    </body>    
</html>