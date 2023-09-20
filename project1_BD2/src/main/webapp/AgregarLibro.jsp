<%-- 
    Document   : AgregarLibro
    Created on : 18 sep. 2023, 15:11:04
    Author     : leomo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="styles.css">
    <title>Agregar Libro</title>
</head>
<body>
    <div align="center" class="login-container" >
            <h1>Agregar Libro</h1>
        <form action="InsertarLibro" method="post">
            Nombre del Libro: <input class="inpt" type="text" name="nombreLibro" required><br>
            Fecha de Publicacion: <input class="inpt" type="date" name="publicacionLibro" required><br>
            ISBN: <input class="inpt" type="text" name="ISBN" required><br>
            Editorial: <input class="inpt" type="text" name="Editorial" required><br>
            Genero: <input class="inpt" type="text" name="Genero" required><br>
            Autor: <input class="inpt" type="text" name="Autor" required><br>
            Inventario: <input class="inpt" type="number" name="inventarioLibro" required><br>
            <input class="btn" type="submit" value="Agregar Libro">
        </form>
    </div>
</body>
</html>


