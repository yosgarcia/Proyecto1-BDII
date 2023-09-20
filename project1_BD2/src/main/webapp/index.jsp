
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="styles.css">
        <title>Iniciar sesión</title>
        
    </head>
    <body>
        <div align="center" class="login-container" >
            <h1>Iniciar sesión</h1>
        <form action="login" method="post">
            Usuario: <input class="inpt" type="text" name="usuario" required><br>
            Contraseña: <input class="inpt" type="password" name="contrasena" required><br>
            <input class="btn" type="submit" value="Iniciar sesión">
        </form>
        </div>
        
        <div id="modalNoPermitido" class="modal">
            <div class="modal-content">
                <h2>¡AVISO!</h2>
                <!-- Contenido de la ventana modal para mostrar todos los clientes -->
                <p>Ingresa un usuario y contraseña validos.</p>
                <button class="btncito" onclick="cerrarModalNoPermitido()"> Cerrar </button>
            </div>
        </div>

        <script>
            var changes = '${permitido}';

            function mostrarModalNoPermitido() {
                var modal = document.getElementById("modalNoPermitido");
                modal.style.display = "block";
            }

            function cerrarModalNoPermitido() {
                var modal = document.getElementById("modalNoPermitido");
                modal.style.display = "none";
            }

            if (changes === "no") {
                mostrarModalNoPermitido();
            }
        </script>
        
    </body>
</html>
