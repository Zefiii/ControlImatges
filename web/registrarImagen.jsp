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
            <form method="post" action="registrarImagen" id="registrarImatge" enctype="multipart/form-data">
                <label for="file">Imatge:<br></label>
                <input type="file" name="file" id="file" >
                <br>
                <label for="titol"><br>Títol:<br></label>
                <input type="text" name="titol" id="titol">
                <br>
                <textarea cols='30' rows='10' name="textArea" id="textArea" placeholder="Escriu una breu descripció..."></textarea>
                <br>
                <label for="clau"><br>Paraules clau:<br></label>
                <input type="text" name="clau" id="clau">
                <br>
                <label for="autor"><br>Autor:<br></label>
                <input type="text" name="autor" id="autor">
                <br>
                <label for="creacio"><br>Data de creació:<br></label>
                <input type="text" name="creacio" id="creacio" placeholder="DD/MM/AAAA">
                <br>
                <input type="submit" name="registrar" id="registrar" value="Registrar">
                <input type="reset" name="netejar" id="netejarQuestionari" value="Esborrar dades">
            </form>
        </div>
    </body>
</html>
