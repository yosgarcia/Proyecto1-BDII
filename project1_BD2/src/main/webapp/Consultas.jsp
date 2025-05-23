<%-- 
    Document   : Consultas
    Created on : 17 sep. 2023, 20:33:31
    Author     : leomo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <title>Consultar</title>
    </head>
    <body>
        <h1> Sistema de consultas</h1>
        <h2> Seleccione lo que desea consultar</h2>
        <div class="contentBox">
            <div id="fifth" class="buttonBox">
                <button onclick="location.href='ConsultaLibro.jsp'">Consultar Libro</button>
            </div>
            <div id="fifth" class="buttonBox">
                <button onclick="location.href='ConsultaCliente.jsp'">Consultar Cliente</button>
            </div>
            <div id="fifth" class="buttonBox">
                <button onclick="location.href='ConsultaPrestamo.jsp'">Consultar Prestamo</button>
            </div>
        </div>
        <br>
        <div class="contentBox">
            <div id="fifth" class="buttonBox">
                <button onclick="location.href='ConsultaJOIN1.jsp'">Consultar Prestamos por Genero</button>
            </div>
            <div id="fifth" class="buttonBox">
                <button onclick="location.href='ConsultaJOIN2.jsp'">Consultar Prestamos por Editorial</button>
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
