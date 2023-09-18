<%-- 
    Document   : EliminarLibro
    Created on : 17 sep. 2023, 21:47:44
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
    <h1>Eliminar Libro</h1>
    <form action="procesar_eliminar_libro.jsp" method="post">
        <label for="idLibro">ID de Libro:</label>
        <input type="text" id="idCliente" name="idCliente" required><br><br>
        
        <label for="nombreLibro">Nombre de Libro:</label>
        <input type="text" id="nombreCliente" name="nombreCliente" required><br><br>
        
        <label for="ISBN">ISBN:</label>
        <input type="text" id="apellidoCliente" name="apellidoCliente" required><br><br>
        
        <label for="telefonoCliente">Número de teléfono:</label>
        <input type="text" id="telefonoCliente" name="telefonoCliente" required><br><br>
        
        <input type="submit" value="Eliminar Cliente">
    </form>
</body>
</html>

