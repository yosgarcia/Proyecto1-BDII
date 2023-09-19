<%-- 
    Document   : AgregarCliente
    Created on : 18 sep. 2023, 15:06:54
    Author     : leomo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="styles.css">
    <title>Agregar Cliente</title>
</head>
<body>
    <div align="center" class="login-container" >
            <h1>Agregar Cliente</h1>
        <form action="procesar_eliminar_libro.jsp" method="post">
            Nombre: <input class="inpt" type="text" name="nombreCliente" required><br>
            Apellido: <input class="inpt" type="text" name="apellidoCliente" required><br>
            Correo: <input class="inpt" type="email" name="correoCliente" required><br>
            Número de teléfono: <input class="inpt" type="tel" name="telefonoCliente" required><br>
            <input class="btn" type="submit" value="Agregar Cliente">
        </form>
    </div>
</body>
</html>

