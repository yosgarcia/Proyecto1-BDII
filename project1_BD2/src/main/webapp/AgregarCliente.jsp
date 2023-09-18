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
    <title>Agregar Cliente</title>
</head>
<body>
    <h1>Agregar Cliente</h1>
    <form action="procesar_eliminar_libro.jsp" method="post">
        <label for="NombreClienteAgregar">Nombre:</label>
        <input type="text" id="NombreClienteAgregar" name="NombreClienteAgregar" required><br><br>
        
        <label for="ApellidoClienteAgregar">Apellido:</label>
        <input type="text" id="ApellidoClienteAgregar" name="ApellidoClienteAgregar" required><br><br>
        
        <label for="CorreoClienteAgregar">Correo: </label>
        <input type="text" id="CorreoClienteAgregar" name="CorreoClienteAgregar" required><br><br>
        
        <label for="telefonoCliente">Número de teléfono:</label>
        <input type="text" id="telefonoCliente" name="telefonoCliente" required><br><br>
        
        <input type="submit" value="Agregar Cliente">
    </form>
</body>
</html>

