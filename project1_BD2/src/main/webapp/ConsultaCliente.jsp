<%@page import="com.mycompany.project1_bd2.entidades.Cliente"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
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
        <button action="ConsultarLibros" onclick="mostrarTodosClientes()">Mostrar Todos</button>
        <div class="border"></div>
        <div class="border"></div>
        <div class="border"></div>
        <div class="border"></div>
    </div>
</div>
<div class="contentBox">
    <div id="fourth" class="buttonBox">
        <button onclick="location.href='menu.jsp'">Menu</button>
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
            ID del Cliente: <input class="inpt" type="text" name="clienteId" placeholder="Ingrese el ID del cliente" required><br>
            <input class="btn" type="submit" value="Mostrar">
        </form>
        <h3>${nombri}</h3>
        <p>${apellidi}</p>
        <p>${idi}</p>
        <p>${correu}</p>
        <p>${telefonu}</p>
    </div>
</div>

<!-- Ventana modal para mostrar todos los clientes -->
<div id="modalTodosClientes" class="modal">
    <div class="modal-content">
        <span class="close" onclick="cerrarModalTodosClientes()">&times;</span>
        <h2>Mostrar Todos los Clientes</h2>
        <form action="ConsultaClientes" method="post">
            <input class="btn" type="submit" value="Mostrar">
        </form>
        <!-- Contenido de la ventana modal para mostrar todos los clientes -->
        <table style="align-content: center" border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>NOMBRE</th>
                    <th>APELLIDO</th>
                    <th>CORREO</th>
                    <th>TELEFONO</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listado}" var="cliente">
                    <tr>
                             <td>${cliente.getId()}</td>
                             <td>${cliente.getNombre()}</td>
                             <td>${cliente.getApellido()}</td>
                             <td>${cliente.getCorreo()}</td>
                             <td>${cliente.getTelefono()}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
</div>

<script>
    var changes = '${listo}';
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
    
    if (changes === "uno") {
        mostrarClientesPorID();
    }
    if (changes === "dos") {
        mostrarTodosClientes();
    }
</script>

</body>
</html>

