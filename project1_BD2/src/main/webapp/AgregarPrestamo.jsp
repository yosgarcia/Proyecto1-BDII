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
    <link rel="stylesheet" type="text/css" href="styles.css">
    <title>Agregar Libro</title>
</head>
<body>
    <div align="center" class="login-container" >
            <h1>Agregar Prestamo</h1>
        <form action="procesar_eliminar_libro.jsp" method="post">
            Fecha de prestamo: <input class="inpt" type="date" name="fechaPrestamo" required><br>
            Fecha de devolución: <input class="inpt" type="date" name="fechaDevolucion" required><br>
            Cliente que alquila (ID):  <input class="inpt" type="text" name="idCliente" required><br>
            Libro que alquila (ID): <input class="inpt" type="text" name="idLibro" required><br>
            <input class="btn" type="submit" value="Agregar Prestamo">
        </form>
    </div>
</body>
</html>
