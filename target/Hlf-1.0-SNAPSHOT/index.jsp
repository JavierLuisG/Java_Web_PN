<%-- 
    Document   : index
    Created on : 17/12/2023, 11:29:37 p. m.
    Author     : JavierLuis
--%>

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
            // verificar si el usuario está logueado
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
                        <a href="datosUsuario.jsp">
                            <i class="bi bi-person-circle"></i>
                            <%= extractUsername((String) session.getAttribute("email"))%>
                        </a>
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
                            <!--Forma de llamar un servlet dentro de un jsp-->
                            <jsp:include page="SvEmpleados"/>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
