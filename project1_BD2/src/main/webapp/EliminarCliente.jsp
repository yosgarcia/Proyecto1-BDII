<%-- 
    Document   : EliminarCliente
    Created on : 17 sep. 2023, 21:58:23
    Author     : leomo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="consulta.css">
    <title>Eliminar Cliente</title>
</head>
<body>
    <h1>Eliminar Cliente</h1>
    <div align="center" class="contenedor">
        <h2>Eliminar Cliente por ID</h2>
        <!-- Formulario para ingresar el ID del cliente a eliminar -->
        <form class="formulario" action="eliminar_cliente.php" method="post">
            <label for="clienteId">ID del Cliente:</label>
            <input type="text" id="clienteId" name="clienteId" placeholder="Ingrese el ID del cliente">
            <input type="submit" value="Eliminar">
        </form>
    </div>
    
</body>
</html>
