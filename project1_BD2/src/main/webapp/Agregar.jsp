<%-- 
    Document   : Consultas
    Created on : 17 sep. 2023, 20:33:31
    Author     : leomo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="menu.css">
        <title>Agregar</title>
    </head>
    <body>
        <h1> Sistema para agregar</h1>
        <h2> Seleccione que desea agregar</h2>
        <div class="contentBox">
            <div id="fifth" class="buttonBox">
                <button onclick="location.href='AgregarLibro.jsp'">Agregar Libro</button>
            </div>
            <div id="fifth" class="buttonBox">
                <button onclick="location.href='AgregarCliente.jsp'">Agregar Cliente</button>
            </div>
            <div id="fifth" class="buttonBox">
                <button onclick="location.href='AgregarPrestamo.jsp'">Agregar Prestamo</button>
            </div>
        </div>
    </body>
</html>
