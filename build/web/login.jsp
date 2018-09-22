<%-- 
    Document   : login.jsp
    Created on : 21-sep-2018, 10:05:42
    Author     : oriol
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <h1>Registre d'Imatges</h1>
        <h2>Introdueix les dades per iniciar sessio</h2>
        <form method="post" action="loginServlet" name="log">
            Usuari:<br>
            <input type="text" name="user">
            <br>
            Password: <br>
            <input type="password" name="pass">
            <br>
            <input type="submit" value="submit">
        </form>
    </body>
</html>
