<%-- 
    Document   : EliminarLibro
    Created on : 17 sep. 2023, 21:47:44
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
    <title>Eliminar Cliente</title>
</head>
<body>
    <div align="center" class="login-container" >
            <h1>Eliminar Libro</h1>
        <form action="BorrarLibro" method="post">
            ID de Libro: <input class="inpt" type="text" name="idLibro" required><br>
            <input class="btn" type="submit" value="Eliminar Libro">
        </form>
    </div>
</body>
</html>

