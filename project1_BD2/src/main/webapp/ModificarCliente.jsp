<%-- 
    Document   : ModificarCliente
    Created on : 19 sep. 2023, 21:34:37
    Author     : yurgencm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="styles.css">
        <title>Modificar Cliente</title>
    </head>
    <body>
        <div align="center" class="login-container" >
            <h1>Modificar Cliente</h1>
        <form action="ActualizarClienteServlet" method="post">
            ID: <input class="inpt" type="number" name="idCliente" required><br>
            Nombre: <input class="inpt" type="text" name="nombreCliente"><br>
            Apellido: <input class="inpt" type="text" name="apellidoCliente"><br>
            Correo: <input class="inpt" type="email" name="correoCliente"><br>
            Número de teléfono: <input class="inpt" type="tel" name="telefonoCliente"><br>
            <input class="btn" type="submit" value="Modificar Cliente">
        </form>
    </div>
    </body>
</html>
