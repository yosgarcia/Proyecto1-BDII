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
    <h1>Sistema de Consulta de Prestamos</h1>
    <h2>Selecciona el tipo de consulta</h2>
    <div class="contentBox">
        <div id="fourth" class="buttonBox">
            <button onclick="mostrarPrestamosPorID()">Mostrar por ID</button>
            <div class="border"></div>
            <div class="border"></div>
            <div class="border"></div>
            <div class="border"></div>
        </div>

        <div id="fourth" class="buttonBox">
            <button onclick="mostrarTodosPrestamos()">Mostrar Todos</button>
            <div class="border"></div>
            <div class="border"></div>
            <div class="border"></div>
            <div class="border"></div>
        </div>
    </div>


<!-- Ventana modal para mostrar clientes por ID -->
<div id="modalPrestamoPorID" class="modal">
    <div class="modal-content">
        <span class="close" onclick="cerrarModalPrestamosPorId()">&times;</span>
        <h2>Mostrar Prestamos por ID</h2>
        <form action="ConsultaClienteIdServlet" method="post">
            ID del Prestamo: <input class="inpt" type="text" id="prestamoId" placeholder="Ingrese el ID del prestamo"><br>
            <div id="ninth" class="buttonBox">
                <subbott style="position: absolute;top: 50%" type="submit">Mostrar</subbott>
            </div>
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

