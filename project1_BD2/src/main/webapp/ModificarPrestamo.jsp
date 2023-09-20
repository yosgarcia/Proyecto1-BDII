<%-- 
    Document   : ModificarPrestamo
    Created on : 19 sep. 2023, 21:34:59
    Author     : yurgencm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="styles.css">
        <title>Modificar Prestamo</title>
    </head>
    <body>
        <div align="center" class="login-container" >
            <h1>Modificar Prestamo</h1>
        <form action="ActualizarPrestamo" method="post">
            ID: <input class="inpt" type="number" name="idPrestamo" required><br>
            Fecha de prestamo: <input class="inpt" type="date" name="fechaPrestamo"><br>
            Fecha de devolución: <input class="inpt" type="date" name="fechaDevolucion"><br>
            Cliente que alquila (ID):  <input class="inpt" type="number" name="idCliente"><br>
            Libro que alquila (ID): <input class="inpt" type="number" name="idLibro"><br>
            <input class="btn" type="submit" value="Modificar Prestamo">
        </form>
    </div>
    </body>
</html>
