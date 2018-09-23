<%-- 
    Document   : registrarImagen
    Created on : 23-sep-2018, 16:54:11
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
        <title>Registrar Imatge</title>
    </head>
    <body>
        <h1>Registrar imatge</h1>
        <p>Introdueix les dades que es demanen a continuacio</p>
        <form method="post" action="registrarImagenServlet">
            Titol:<input type="text" name="titol">
            <br>
            <textarea>Escriu una breu descripcio...</textarea>
            <br>
            Paraules clau:<input type="text" name="clau">
            <br>
            Autor:<input type="text" name="autor">
            <br>
            Data de creacio:<input type="text" name="cracio">
        </form>
    </body>
</html>
