<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cerrar sesion</title>
    </head>
    <body>
        <% 
            HttpSession sesion = request.getSession();
            // todo lo que estaba en la sesion lo va a borrar
            sesion.invalidate();
            // para redireccionar
            response.sendRedirect("login.jsp");
        %>
    </body>
</html>
