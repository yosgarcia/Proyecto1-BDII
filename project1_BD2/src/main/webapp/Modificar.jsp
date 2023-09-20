<%-- 
    Document   : Modificar
    Created on : 19 sep. 2023, 21:34:18
    Author     : yurgencm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%
    HttpSession sesionOk = request.getSession();
    if (sesionOk.getAttribute("usuario") == null) {
%>
    <jsp:forward page="index.jsp">
        <jsp:param name="error" value="Es obligatorio identificarse!"/>
    </jsp:forward>
<%
    } else {
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="menu.css">
        <title>Modificar</title>
    </head>
    <body>
        <h1> Sistema para modificar</h1>
        <h2> Seleccione que desea modificar</h2>
        <div class="contentBox">
            <div id="fifth" class="buttonBox">
                <button onclick="location.href='ModificarLibro.jsp'">Modificar Libro</button>
            </div>
            <div id="fifth" class="buttonBox">
                <button onclick="location.href='ModificarCliente.jsp'">Modificar Cliente</button>
            </div>
            <div id="fifth" class="buttonBox">
                <button onclick="location.href='ModificarPrestamo.jsp'">Modificar Prestamo</button>
            </div>
        </div>
        <br>
        <div class="contentBox">
            <div id="fifth" class="buttonBox">
                <button onclick="atras()">Atras</button>
            </div>
        </div>
        <script>
            function atras(){history.back();}
        </script>
    </body>
</html>
