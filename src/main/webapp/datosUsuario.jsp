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
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <form>
                        <div class="mb-3">
                            <label for="exampleInputEmail1" class="form-label">Usuario</label>
                            <input type="email" class="form-control" nambe="usuario" id="email" aria-describedby="email" placeholder="Ingrese usuario">
                        </div>
                        <div class="mb-3">
                            <label for="password1" class="form-label">Contraseña</label>
                            <input type="password" class="form-control" name="pass" id="password" placeholder="Ingrese contraseña actual">
                        </div>
                        <div class="mb-3">
                            <label for="password1" class="form-label">Nueva Contraseña</label>
                            <input type="password" class="form-control" name="newPass" id="newPassword" placeholder="Ingrese contraseña nueva">
                        </div>
                        <button type="submit" name="guardar" class="btn btn-primary">Guardar</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
