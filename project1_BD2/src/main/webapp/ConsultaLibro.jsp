<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="consulta.css">
        <title>Ventana Modal de Libros</title>
    </head>
    <body>
        
    <h1>Sistema de Consulta de Libros</h1>
    <h2>Selecciona el tipo de consulta</h2>
    <div class="contentBox">
        <div id="fourth" class="buttonBox">
            <button onclick="mostrarLibrosPorID()">Mostrar por ID</button>
            <div class="border"></div>
            <div class="border"></div>
            <div class="border"></div>
            <div class="border"></div>
        </div>

        <div id="fourth" class="buttonBox">
            <button onclick="mostrarTodosLibros()">Mostrar Todos</button>
            <div class="border"></div>
            <div class="border"></div>
            <div class="border"></div>
            <div class="border"></div>
        </div>
    </div>

<!-- Ventana modal para mostrar clientes por ID -->
<div id="modalLibroPorID" class="modal">
    <div class="modal-content">
        <span class="close" onclick="cerrarModalLibrosPorId()">&times;</span>
        <h2>Mostrar Libros por ID</h2>
        <form action="ConsultaClienteIdServlet" method="post">
            ID del Libro: <input class="inpt" type="text" id="libroId" placeholder="Ingrese el ID del libro"><br>
            <div id="ninth" class="buttonBox">
                <input class="btn" type="submit" value="Mostrar">
            </div>
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
