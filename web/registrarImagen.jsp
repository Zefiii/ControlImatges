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
        <div>
            <h1 id="headerRegistreImatge">Registrar imatge</h1>
            <p id="dades"><strong>Introdueix les dades que es demanen a continuació</strong></p>
            <form method="post" action="registrarImagenServlet" id="registrarImatge">
                <label for="file"> Imatge:</label>
                <input type="file" name="file" id="file" accept="image/*">
                <br>
                <label for="titol">Títol:</label>
                <input type="text" name="titol" id="titol">
                <br>
                <textarea cols='30' rows='10' name="textArea" id="descripcio" placeholder="Escriu una breu descripció..."></textarea>
                <br>
                <label for="clau">Paraules clau:</label>
                <input type="text" name="clau" id="clau">
                <br>
                <label for="autor">Autor:</label>
                <input type="text" name="autor" id="autor">
                <br>
                <label for="creacio">Data de creació:</label>
                <input type="text" name="creacio">
            </form>
        </div>
    </body>
</html>
