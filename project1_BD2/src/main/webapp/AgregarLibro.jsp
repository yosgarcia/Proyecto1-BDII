<%-- 
    Document   : AgregarLibro
    Created on : 18 sep. 2023, 15:11:04
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
        <label for="nombreLibro">Nombre de Libro:</label>
        <input type="text" id="nombreLibro" name="nombreLibro" required><br><br>
        
        <label for="ISBN">ISBN:</label>
        <input type="text" id="ISBN" name="ISBN" required><br><br>
        
        <label for="editorialLibro">Editorial:</label>
        <input type="text" id="Editorial" name="Editorial" required><br><br>
        
        <label for="generoLibro">Genero:</label>
        <input type="text" id="Genero" name="Genero" required><br><br>
        
        <label for="autorLibro">Autor:</label>
        <input type="text" id="Autor" name="Autor" required><br><br>
        <input type="submit" value="Agregar Libro">
    </form>
</body>
</html>


