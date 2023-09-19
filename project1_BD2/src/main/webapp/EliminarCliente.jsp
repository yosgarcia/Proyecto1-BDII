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

   <div id="mensajeEliminado" class="modal"> 
     <div class="modal-content"> 
         <span class="close" onclick="cerrarModalTodosClientes()">&times;</span> 
         <h2>Mostrar Todos los Clientes</h2> 
         <!-- Contenido de la ventana modal para mostrar todos los clientes --> 
         <p>Aquí puedes mostrar todos los clientes de la base de datos.</p> 
     </div> 
 </div> 
  
 <script> 
     function mensajeEliminado() { 
         var modal = document.getElementById("mensajeEliminado"); 
         modal.style.display = "block"; 
     } 
  
     function mensajeNoEliminado() { 
         var modal = document.getElementById("mensajeNoEliminado"); 
         modal.style.display = "block"; 
     } 
  
     function cerrarModalMensajeEliminado() { 
         var modal = document.getElementById("modalClientesPorID"); 
         modal.style.display = "none"; 
     } 
  
     function cerrarModalMensajeNoEliminado() { 
         var modal = document.getElementById("mensajeNoEliminado"); 
         modal.style.display = "none"; 
     } 
 </script>
    
</body>
</html>
