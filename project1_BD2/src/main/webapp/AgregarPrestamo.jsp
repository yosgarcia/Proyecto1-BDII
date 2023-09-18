<%-- 
    Document   : AgregarPrestamo
    Created on : 18 sep. 2023, 15:11:13
    Author     : leomo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Agregar Libro</title>
</head>
<body>
    <h1>Agregar Libro</h1>
    <form action="procesar_eliminar_libro.jsp" method="post">        
        <label for="AgregarPrestamo">Agregar Prestamo:</label>
        <input type="text" id="nombreLibro" name="nombreLibro" required><br><br>
        
        <label for="FechaInicioPrestamo">Fecha de Prestamo:</label>
        <input type="text" id="fechainicioprestamo" name="fechainicioprestamo" required><br><br>
        
        <label for="FechaFinalPrestamo">Fecha de devolucion:</label>
        <input type="text" id="fechafinalprestamo" name="fechafinalprestamo" required><br><br>
        
        <label for="idCliente">Cliente que alquila (ID):</label>
        <input type="text" id="idcliente" name="idcliente" required><br><br>
        
        <label for="idLibro">Libro:</label>
        <input type="text" id="Autor" name="Autor" required><br><br>
        <input type="submit" value="Agregar Libro">
    </form>
</body>
</html>
