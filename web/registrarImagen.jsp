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
        <p>Introdueix les dades que es demanen a continuació</p>
        <form method="post" action="registrarImagen" enctype="multipart/form-data">

            Imatge:<input type="file" name="file" id="file" accept="image/*" />
            <br/>
            Títol:<input type="text" name="titol"/>
            <br/>
            <textarea cols='30' rows='10'>Escriu una breu descripció...</textarea>
            <br/>
            Paraules clau:<input type="text" name="clau"/>
            <br/>
            Autor:<input type="text" name="autor"/>
            <br/>
            Data de creació:<input type="text" name="creacio"/>
            <br/>
            <input type="submit" name="submit"/>
        </form>
    </body>
</html>
