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
    <link rel="stylesheet" type="text/css" href="styles.css">
    <title>Eliminar Cliente</title>
</head>
<body>
    <div align="center" class="login-container" >
            <h1>Eliminar Libro</h1>
        <form action="procesar_eliminar_libro.jsp" method="post">
            ID de Libro: <input class="inpt" type="text" name="idLibro"><br>
            <input class="btn" type="submit" value="Eliminar Libro">
        </form>
    </div>
</body>
</html>

