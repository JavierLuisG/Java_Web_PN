<%-- 
    Document   : index
    Created on : 17/12/2023, 11:29:37 p. m.
    Author     : juanc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
              rel="stylesheet" 
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
              crossorigin="anonymous">
        <title>Saludo!!!</title>
    </head>
    <body>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">                
                    <form>
                        <!--Mensaje y imput para agregar el texto -->
                        <div class="form-group">
                            <label for="exampleInputEmail1">Escribe tu nombre</label>
                            <input type="text" class="form-control" name="nombreDelHumano" placeholder="Nombre">
                            <small id="emailHelp" class="form-text text-muted">Primera en mayúscula.</small>
                        </div>
                        <!--Mensaje y imput para agregar el texto -->
                        <div class="form-group">
                            <label>Escribe tu edad</label>
                            <input type="text" class="form-control" name="edadDelHumano" placeholder="Nombre">
                            <small id="emailHelp" class="form-text text-muted">Solo el número.</small>
                        </div>
                        <button type="submit" class="btn btn-primary">Enviar</button>
                    </form>
                </div>
            </div>
            <!--aqui va el mensaje que ha sido agregado en el imput -->
            <div class="row">
                <div class="col-sm">
                    <div class="alert alert-primary" role="alert">
                        <!-- codigo java -->
                        <%
                            String nombre = request.getParameter("nombreDelHumano");
                            String edad = request.getParameter("edadDelHumano");
                            String saludarHumano = "Hola " + nombre + " a tus " + edad + " años ya estas viejo";
                            out.print(saludarHumano);
                        %>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
