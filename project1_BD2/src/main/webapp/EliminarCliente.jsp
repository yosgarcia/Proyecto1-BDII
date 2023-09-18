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
    <title>Eliminar Cliente</title>
</head>
<body>
    <h1>Eliminar Cliente</h1>
    
    <form action="procesar_eliminar_cliente.jsp" method="post">
        <label for="idCliente">ID de cliente:</label>
        <input type="text" id="idCliente" name="idCliente" required><br><br>
        
        <label for="nombreCliente">Nombre de cliente:</label>
        <input type="text" id="nombreCliente" name="nombreCliente" required><br><br>
        
        <label for="apellidoCliente">Apellido del cliente:</label>
        <input type="text" id="apellidoCliente" name="apellidoCliente" required><br><br>
        
        <label for="telefonoCliente">Número de teléfono:</label>
        <input type="text" id="telefonoCliente" name="telefonoCliente" required><br><br>
        
        <input type="submit" value="Eliminar Cliente">
    </form>
</body>
</html>
