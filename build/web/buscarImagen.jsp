<%-- 
    Document   : buscarImagen
    Created on : 23-sep-2018, 16:56:19
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
        <title>Buscar Imatge</title>
    </head>
    <body>
        <h1>Buscar Imatge</h1>
    </body>
</html>
