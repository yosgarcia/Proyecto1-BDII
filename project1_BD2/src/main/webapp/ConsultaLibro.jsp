<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="consulta.css">
        <title>Ventana Modal de Libros</title>
    </head>
    <body>
        <h1>Ventana Modal de Libros</h1>

<!-- Botones para mostrar las opciones -->
<div class="bn-container">
    <button onclick="mostrarLibrosPorID()">Mostrar Libros por ID</button>
    <button onclick="mostrarTodosLibros()">Mostrar Todos los Libros</button>
</div>


<!-- Ventana modal para mostrar clientes por ID -->
<div id="modalLibroPorID" class="modal">
    <div class="modal-content">
        <span class="close" onclick="cerrarModalLibrosPorID()">&times;</span>
        <h2>Mostrar Libros por ID</h2>
        <form>
            <label for="LibroId">ID del Libro:</label>
            <input type="text" id="LibroId" placeholder="Ingrese el ID del Libro">
            <button type="submit">Mostrar</button>
        </form>
    </div>
</div>

<!-- Ventana modal para mostrar todos los clientes -->
<div id="modalTodosLibros" class="modal">
    <div class="modal-content">
        <span class="close" onclick="cerrarModalTodosLibros()">&times;</span>
        <h2>Mostrar Todos los Libros</h2>
        <!-- Contenido de la ventana modal para mostrar todos los clientes -->
        <p>Mostrar todos los libros.</p>
    </div>
</div>

<script>
    function mostrarLibrosPorID() {
        var modal = document.getElementById("modalLibroPorID");
        modal.style.display = "block";
    }

    function mostrarTodosLibros() {
        var modal = document.getElementById("modalTodosLibros");
        modal.style.display = "block";
    }

    function cerrarModalLibrosPorId() {
        var modal = document.getElementById("modalLibroPorID");
        modal.style.display = "none";
    }

    function cerrarModalTodosLibros() {
        var modal = document.getElementById("modalTodosLibros");
        modal.style.display = "none";
    }
</script>
    </body>
</html>
