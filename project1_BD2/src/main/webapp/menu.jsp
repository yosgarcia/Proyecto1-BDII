<%-- 
    Document   : menu
    Created on : 17 sep. 2023, 17:19:46
    Author     : yaira
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="menu.css">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Libreria</title>
</head>
<body>
    <h1>Bienvenido al Sistema de Registros de la Librería</h1>
    <h2>Menu Principal</h2>

    <div class="contentBox">
      <div id="sixth" class="buttonBox">
        <button onclick="location.href='Consultas.jsp'">Consultar</button>
        <div class="border"></div>
        <div class="border"></div>
        <div class="border"></div>
        <div class="border"></div>
      </div>
      <div id="sixth" class="buttonBox">
        <button onclick="location.href='Agregar.jsp'">Agregar</button>
        <div class="border"></div>
        <div class="border"></div>
        <div class="border"></div>
        <div class="border"></div>
      </div>
      <div id="sixth" class="buttonBox">
        <button onclick="location.href='Modificar.jsp'">Modificar</button>
        <div class="border"></div>
        <div class="border"></div>
        <div class="border"></div>
        <div class="border"></div>
      </div>
      <div id="sixth" class="buttonBox">
        <button onclick="location.href='Eliminar.jsp'">Eliminar</button>
        <div class="border"></div>
        <div class="border"></div>
        <div class="border"></div>
        <div class="border"></div>
      </div>
    </div>
    
    <div id="modalMensaje" class="modal">
        <div class="modal-content">
            <h2>¡AVISO!</h2>
            <!-- Contenido de la ventana modal para mostrar todos los clientes -->
            <p>${mensaje}</p>
            <button onclick="cerrarModalMensaje()" class="btn"> Cerrar </button>
        </div>
    </div>

    <script>
        var changes = '${accion}';

        function mostrarModalMensaje() {
            var modal = document.getElementById("modalMensaje");
            modal.style.display = "block";
        }

        function cerrarModalMensaje() {
            var modal = document.getElementById("modalMensaje");
            modal.style.display = "none";
        }
        
        if (changes === "mostrar") {
            mostrarModalMensaje();
        }
        mostrarModalMensaje();
    </script>
</body>
</html>
