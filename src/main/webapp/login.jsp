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
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <form>
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
                if (email.equals("admin@gmail.com") && pass.equals("admin")){
                    sesion.setAttribute("logueado", "1");
                    sesion.setAttribute("email", email);
                    response.sendRedirect("index.jsp");
                }
                else {
                    %>
                    <div class="container mt-4">
                        <%out.print("Email o contraseña erroneos");%>
                    </div><%
                }
            }
        %>
    </body>    
</html>
