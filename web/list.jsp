<%-- 
    Document   : list.jsp
    Created on : 23-sep-2018, 16:54:40
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
        <title>Llistar imatges</title>
    </head>
    <body>
        <div>
            <h1 id="headerLlistar">Llistar imatges</h1>
        </div>
    </body>
</html>
