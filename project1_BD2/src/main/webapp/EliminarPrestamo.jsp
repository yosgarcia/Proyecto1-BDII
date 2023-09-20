<%-- 
    Document   : EliminarPrestamo
    Created on : 17 sep. 2023, 22:01:32
    Author     : leomo
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
        <link rel="stylesheet" type="text/css" href="styles.css">
        <title>JSP Page</title>
    </head>
    <body>
        <div align="center" class="login-container" >
            <h1>Eliminar Prestamo</h1>
        <form action="BorrarPrestamo" method="post">
            ID del Prestamo: <input class="inpt" type="text" name="idPrestamo" required><br>
            <input class="btn" type="submit" value="Eliminar Prestamo">
        </form>
    </div>
    </body>
</html>
