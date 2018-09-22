<%-- 
    Document   : registre
    Created on : 21-sep-2018, 10:14:00
    Author     : oriol
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registre</title>
    </head>
    <body>
        <h1>Registre</h1>
        <h2>Introdueix les dades</h2>
        <form name="regist" method="post" action="registreServlet">
            Username:<br>
            <input type="text" name="user">
            <br>
            Password:<br>
            <input type="password" name="pass1">
            <br>
            Repeat password:<br>
            <input type="password" name="pass2">
            <br>
            <input type="submit" value="submit">
        </form>
    </body>
</html>
