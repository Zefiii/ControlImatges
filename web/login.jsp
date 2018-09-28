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
        <div>
            <h1 id="headerRegistreImatge">Registre d'Imatges</h1>
            <h2 id="headerDades">Introdueix les dades per iniciar sessió</h2>
            <form method="post" action="loginServlet" id="log">
                <label for="user">Usuari:</label>
                <br>
                <input type="text" name="user" id="user">
                <br>
                <label for="pass">Password:</label>
                <br>
                <input type="password" name="pass" id="pass">
                <br>
                <input type="submit" value="Entrar" id="entrar">
                <br><br>
                <a href="registre.jsp" id="registrar">Encara no t'has registrat?</a>
            </form>
        </div>
    </body>
</html>
