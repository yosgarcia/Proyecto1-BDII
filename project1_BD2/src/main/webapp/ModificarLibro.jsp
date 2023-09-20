<%-- 
    Document   : ModificarLibro
    Created on : 19 sep. 2023, 21:34:48
    Author     : yurgencm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="styles.css">
        <title>Modificar Libro</title>
    </head>
    <body>
        <div align="center" class="login-container" >
            <h1>Modificar Libro</h1>
        <form action="procesar_eliminar_libro.jsp" method="post">
            ID: <input class="inpt" type="number" name="idLibro" required><br>
            Nombre del Libro: <input class="inpt" type="text" name="nombreLibro"><br>
            ISBN: <input class="inpt" type="text" name="ISBN"><br>
            Editorial: <input class="inpt" type="text" name="Editorial"><br>
            Genero: <input class="inpt" type="text" name="Genero"><br>
            Autor: <input class="inpt" type="text" name="Autor"><br>
            <input class="btn" type="submit" value="Modificar Libro">
        </form>
    </div>
    </body>
</html>
