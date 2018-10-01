<%-- 
    Document   : modificarImagen
    Created on : 23-sep-2018, 16:55:29
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
        <title>Modificar imatge</title>
    </head>
    <body>
        <div>
            <h1 id="headerModificar">Modificar imatge</h1>
            <form method="post" action="modificarServlet" id="modificar">
                
            </form>
        </div>
    </body>
</html>
