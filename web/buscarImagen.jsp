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
        <div>
            <h1 id="headerBuscar">Buscar Imatge</h1>
            <form method="post" action="buscarServlet" id="buscador">
                <label for="buscar">Buscar:</label>
                <input type="text" name="buscar" id="buscar">         
                <input type="submit" value="Buscar" name="botoBuscar" id="botoBuscar">
            </form>
        </div>
    </body>
</html>
