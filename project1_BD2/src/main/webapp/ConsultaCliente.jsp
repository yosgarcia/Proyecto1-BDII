<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="consulta.css">
    <title>Ventana Modal de Clientes</title>
</head>
<body>

<h1>Ventana Modal de Clientes</h1>

<!-- Botones para mostrar las opciones -->
<div class="btn-container">
    <button onclick="mostrarClientesPorID()">Mostrar Clientes por ID</button>
    <button onclick="mostrarTodosClientes()">Mostrar Todos los Clientes</button>
</div>

<!-- Ventana modal para mostrar clientes por ID -->
<div id="modalClientesPorID" class="modal">
    <div class="modal-content">
        <span class="close" onclick="cerrarModalClientesPorID()">&times;</span>
        <h2>Mostrar Clientes por ID</h2>
        <form>
            <label for="clienteId">ID del Cliente:</label>
            <input type="text" id="clienteId" placeholder="Ingrese el ID del cliente">
            <button type="submit">Mostrar</button>
        </form>
    </div>
</div>

<!-- Ventana modal para mostrar todos los clientes -->
<div id="modalTodosClientes" class="modal">
    <div class="modal-content">
        <span class="close" onclick="cerrarModalTodosClientes()">&times;</span>
        <h2>Mostrar Todos los Clientes</h2>
        <!-- Contenido de la ventana modal para mostrar todos los clientes -->
        <p>Aquí puedes mostrar todos los clientes de la base de datos.</p>
    </div>
</div>

<script>
    function mostrarClientesPorID() {
        var modal = document.getElementById("modalClientesPorID");
        modal.style.display = "block";
    }

    function mostrarTodosClientes() {
        var modal = document.getElementById("modalTodosClientes");
        modal.style.display = "block";
    }

    function cerrarModalClientesPorID() {
        var modal = document.getElementById("modalClientesPorID");
        modal.style.display = "none";
    }

    function cerrarModalTodosClientes() {
        var modal = document.getElementById("modalTodosClientes");
        modal.style.display = "none";
    }
</script>

</body>
</html>

