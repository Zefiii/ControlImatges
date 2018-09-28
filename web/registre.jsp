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
        <div>
            <h1>Registre</h1>
            <h2>Introdueix les dades</h2>
            <form id="regist" method="post" action="registreServlet">
                <label for="user">Username:<br></label>
                <input type="text" name="user" id="user">
                <label for="pass1"><br>Password:<br></label>
                <input type="password" name="pass1" id="pass1">
                <label for="pass2"><br>Repeat password:<br></label>
                <input type="password" name="pass2" id="pass2">
                <br>
                <input type="submit" value="Registrar-se">
            </form>
        </div>
    </body>
</html>
