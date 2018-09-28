<%-- 
    Document   : menu
    Created on : 23-sep-2018, 16:48:31
    Author     : oriol
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("user") == null){
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu</title>
    </head>
    <body>
        <div>
            <h1>Menu</h1>
            <br>
            <a href="registrarImagen.jsp">Registrar Imatge</a>
            <br>
            <a href="modificarImagen.jsp">Modificar Imatge</a>
            <br>
            <a href="list.jsp">Llistar imatges</a>
            <br>
            <a href="buscarImagen.jsp">Busar imatge</a>
        </div>
    </body>
</html>
