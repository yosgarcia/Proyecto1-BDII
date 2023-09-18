<%-- 
    Document   : ConsultaPrestamo
    Created on : 18 sep. 2023, 14:50:47
    Author     : leomo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="consulta.css">
        <title>Ventana Modal de Prestamo</title>
    </head>
    <body>
        <h1>Ventana Modal de Prestamo</h1>

<!-- Botones para mostrar las opciones -->
<div class="bn-container">
    <button onclick="mostrarPrestamosPorID()">Mostrar Prestamo por ID</button>
    <button onclick="mostrarTodosPrestamos()">Mostrar Todos los Prestamos</button>
</div>


<!-- Ventana modal para mostrar clientes por ID -->
<div id="modalPrestamoPorID" class="modal">
    <div class="modal-content">
        <span class="close" onclick="cerrarModalPrestamosPorID()">&times;</span>
        <h2>Mostrar Prestamos por ID</h2>
        <form>
            <label for="PrestamoId">ID del Prestamo:</label>
            <input type="text" id="PrestamoId" placeholder="Ingrese el ID del Prestamo">
            <button type="submit">Mostrar</button>
        </form>
    </div>
</div>

<!-- Ventana modal para mostrar todos los clientes -->
<div id="modalTodosPrestamos" class="modal">
    <div class="modal-content">
        <span class="close" onclick="cerrarModalTodosPrestamos()">&times;</span>
        <h2>Mostrar Todos los Prestamos</h2>
        <!-- Contenido de la ventana modal para mostrar todos los clientes -->
        <p>Mostrar todos los Prestamos existentes.</p>
    </div>
</div>

<script>
    function mostrarPrestamosPorID() {
        var modal = document.getElementById("modalPrestamoPorID");
        modal.style.display = "block";
    }

    function mostrarTodosPrestamos() {
        var modal = document.getElementById("modalTodosPrestamos");
        modal.style.display = "block";
    }

    function cerrarModalPrestamosPorId() {
        var modal = document.getElementById("modalPrestamoPorID");
        modal.style.display = "none";
    }

    function cerrarModalTodosPrestamos() {
        var modal = document.getElementById("modalTodosPrestamos");
        modal.style.display = "none";
    }
</script>
    </body>
</html>

