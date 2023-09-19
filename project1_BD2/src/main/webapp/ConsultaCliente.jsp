<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="consulta.css">
    <title>Ventana Modal de Clientes</title>
</head>
<body>

<h1>Sistema de Consulta de Clientes</h1>
<h2>Selecciona el tipo de consulta</h2>

<!-- Botones para mostrar las opciones -->
<div class="contentBox">
    <div id="fourth" class="buttonBox">
        <button onclick="mostrarClientesPorID()">Mostrar por ID</button>
        <div class="border"></div>
        <div class="border"></div>
        <div class="border"></div>
        <div class="border"></div>
    </div>
    
    <div id="fourth" class="buttonBox">
        <button onclick="mostrarTodosClientes()">Mostrar Todos</button>
        <div class="border"></div>
        <div class="border"></div>
        <div class="border"></div>
        <div class="border"></div>
    </div>
</div>

<!-- Ventana modal para mostrar clientes por ID -->
<div id="modalClientesPorID" class="modal">
    <div class="modal-content">
        <span class="close" onclick="cerrarModalClientesPorID()">&times;</span>
        <h2>Mostrar Clientes por ID</h2>
        <form action="ConsultaClienteIdServlet" method="post">
            ID del Cliente: <input class="inpt" type="text" name="clienteId" placeholder="Ingrese el ID del cliente"><br>
            <input type="submit" value="Iniciar sesión">
            <p>
                ${info}
            </p>
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

