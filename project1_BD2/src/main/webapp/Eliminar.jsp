<%-- 
    Document   : Eliminar
    Created on : 17 sep. 2023, 20:42:54
    Author     : leomo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="menu.css">
        <title>Eliminar</title>
    </head>
    <body>
        <h1> Sistema para eliminar</h1>
        <h2> Seleccione que desea eliminar</h2>
        <div class="contentBox">
            <div id="fifth" class="buttonBox">
                <button onclick="location.href='EliminarLibro.jsp'">Eliminar Libro</button>
            </div>
            <div id="fifth" class="buttonBox">
                <button onclick="location.href='EliminarCliente.jsp'">Eliminar Cliente</button>
            </div>
            <div id="fifth" class="buttonBox">
                <button onclick="location.href='EliminarPrestamo.jsp'">Eliminar Prestamo</button>
            </div>
        </div>
    </body>
</html>
