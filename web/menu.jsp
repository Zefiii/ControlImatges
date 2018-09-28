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
            <h1 id="headerMenu">Menu</h1>
            <br>
            <a href="registrarImagen.jsp" id="refToRegistre">Registrar Imatge</a>
            <br>
            <a href="modificarImagen.jsp" id="refToModificar">Modificar Imatge</a>
            <br>
            <a href="list.jsp" id="refToLlista">Llistar imatges</a>
            <br>
            <a href="buscarImagen.jsp" id="refToBuscar">Busar imatge</a>
        </div>
    </body>
</html>
