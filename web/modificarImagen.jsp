<%-- 
    Document   : modificarImagen
    Created on : 23-sep-2018, 16:55:29
    Author     : oriol
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="javax.servlet.ServletException"%>
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
              <%
                String name = (String) request.getSession().getAttribute("id_imatge");
                Connection conn = null;
                try{
                Class.forName("org.sqlite.JDBC");
                }
                    catch (ClassNotFoundException ex) {
                    System.err.println("Data Base error");
                }
                try{ 
                    conn = DriverManager.getConnection("jdbc:sqlite:C:\\Users\\Oriol\\Desktop\\basedades.db");
                }
                catch(SQLException e)
                {
                    System.err.println(e.getMessage());
                }
                PreparedStatement statement;
                statement = conn.prepareStatement("select * from imagenes where id_imagen = ?");
                statement.setString(1, name);
                ResultSet rs= statement.executeQuery();
                Boolean next = false;
                if(rs.next()){
                  next = true;
                }
            %>
            <h1 id="headerModificar">Modificar imatge</h1>
            <form method="post"  id="modificar">
                <label for="file">Imatge:<br></label>
                <% out.print("<input type =\"file\" name=\"file\" id=\"file\" value=\"" + rs.getString("titulo")+ "\" >"); %>
                
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
                <input type="date" name="creacio" id="creacio">
                <br>
                <input type="submit" name="registrar" id="registrar" value="Registrar">
                <input type="reset" name="netejar" id="netejarQuestionari" value="Esborrar dades">
            </form>
            
            
       
        </div>
    </body>
</html>
