<%-- 
    Document   : EliminarCliente
    Created on : 17 sep. 2023, 21:58:23
    Author     : leomo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="styles.css">
    <title>Eliminar Cliente</title>
</head>
<body>
    <div align="center" class="login-container" >
            <h1>Eliminar Cliente</h1>
        <form action="BorrarClienteServlet" method="post">
            ID del Cliente: <input class="inpt" type="text" name="clienteId" required><br>
            <input class="btn" type="submit" value="Eliminar Cliente">
        </form>
    </div>

   <div id="modalMensajeEliminado" class="modal"> 
     <div class="modal-content"> 
         <span class="close" onclick="cerrarModalMensajeEliminado()">&times;</span> 
         <h2>Confirmacion de accion</h2> 
         <!-- Contenido de la ventana modal para mostrar todos los clientes --> 
         <p>Se elimino el cliente con el ID: ${cliente}.</p> 
     </div> 
 </div> 

 <div id="modalMensajeNoEliminado" class="modal"> 
     <div class="modal-content"> 
         <span class="close" onclick="cerrarModalMensajeEliminado()">&times;</span> 
         <h2>Confirmacion de accion</h2> 
         <!-- Contenido de la ventana modal para mostrar todos los clientes --> 
         <p>No se encontro el cliente con el ID: ${cliente}.</p> 
     </div> 
 </div> 
  
 <script> 
     function mensajeEliminado() { 
         var modal = document.getElementById("modalMensajeEliminado"); 
         modal.style.display = "block"; 
     } 
  
     function mensajeNoEliminado() { 
         var modal = document.getElementById("modalMensajeNoEliminado"); 
         modal.style.display = "block"; 
     } 
  
     function cerrarModalMensajeNoEliminado() { 
         var modal = document.getElementById("modalMensajeEliminado"); 
         modal.style.display = "none"; 
     } 
  
     function cerrarModalMensajeNoEliminado() { 
         var modal = document.getElementById("modalMensajeNoEliminado"); 
         modal.style.display = "none"; 
     } 
 </script>
    
</body>
</html>
