<%-- 
    Document   : buscarImatge
    Created on : 02/10/2018, 16:33:57
    Author     : jrubiralta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Buscar imatges</title>
    </head>
    <body>
        <div>
            <h1 id="headerBuscar">Buscar imatges</h1>
            <form method="post" action="buscarServlet" id="formulariBuscar">
                <label for="buscar">Buscar: </label>
                <input type="text" name="buscar" id="buscar" placeholder="Buscar...">
                <input type="submit" id="botoBuscar" value="Buscar">
            </form> 
        </div> 
    </body>
</html>
