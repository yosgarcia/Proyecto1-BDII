<%-- 
    Document   : ConsultaPrestamo
    Created on : 18 sep. 2023, 14:50:47
    Author     : leomo
--%>

<%@page import="com.mycompany.project1_bd2.Repositorios.EditorialRepositorio"%>
<%@page import="com.mycompany.project1_bd2.entidades.Editorial"%>
<%@page import="com.mycompany.project1_bd2.Repositorios.GeneroRepositorio"%>
<%@page import="com.mycompany.project1_bd2.entidades.Genero"%>
<%@page import="com.mycompany.project1_bd2.Repositorios.PrestamoRepositorio"%>
<%@page import="com.mycompany.project1_bd2.entidades.Prestamo"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.project1_bd2.DBConnection"%>
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
<%
 DBConnection dbConecction = new DBConnection();
 List<Editorial> clientes = EditorialRepositorio.mostrarOrigenYNumPrestamos(dbConecction.getConnection());
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="consulta.css">
        <title>Ventana Modal de Prestamo</title>
    </head>
    <body>
    <h1>Sistema de Consulta de Prestamos</h1>
    <h2>Selecciona el tipo de consulta</h2>
    <table style="align-content: center" border="1">
            <thead>
                <tr>
                    <th>ORIGEN</th>
                    <th>NUM_PRESTAMOS</th>
                    
                </tr>
            </thead>
            <tbody>
                <%for(Editorial cliente : clientes){
                 ;%>
                <tr>
                   <td><%= cliente.getOrigen() %></td>
                   <td><%= cliente.getPrestamos() %></td>
                </tr>
               <%}%>  
            </tbody>
        </table>

<script>
    function mostrarPrestamosPorID() {
        var modal = document.getElementById("modalPrestamoPorID");
        modal.style.display = "block";
    }

    function mostrarTodosPrestamos() {
        var modal = document.getElementById("modalTodosPrestamos");
        modal.style.display = "block";
    }

    function cerrarModalPrestamosPorId() {
        var modal = document.getElementById("modalPrestamoPorID");
        modal.style.display = "none";
    }

    function cerrarModalTodosPrestamos() {
        var modal = document.getElementById("modalTodosPrestamos");
        modal.style.display = "none";
    }
    
    var changes = '${listo}';
    if (changes === "uno") {
        mostrarPrestamosPorID();
    }
</script>
    </body>
</html>

