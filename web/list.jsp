<%-- 
    Document   : list.jsp
    Created on : 23-sep-2018, 16:54:40
    Author     : oriol
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.File"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="javax.servlet.ServletException"%>
<%@ page import="javax.servlet.RequestDispatcher"%>
<%@ page import="javax.servlet.annotation.WebServlet"%>
<%@ page import="java.io.PrintWriter"%>

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
            <p>
            <% 

            final PrintWriter document = response.getWriter();
            Connection conn = null;

            String user = (String) session.getAttribute("user");

            try{

                //conn = DriverManager.getConnection("jdbc:sqlite:C:\\Users\\Oriol\\Desktop\\basedades.db");
                conn = DriverManager.getConnection("jdbc:sqlite:/Users/Jordi/Desktop/loquesea.db");

                PreparedStatement statement =  conn.prepareStatement("select * from imagenes"); 

                String id_imatge;
                String titol;
                String descripcio;
                String clau;
                String autor;
                String creacio;
                String path;
                String id_usuari;

                ResultSet rs = statement.executeQuery();
                if (rs.next()) {
                    document.write("<h1>Llista d'imatges</h1>");
                    titol = rs.getString("titulo");
                    id_imatge = rs.getString("id_imagen");
                    descripcio = rs.getString("descripcion");
                    clau = rs.getString("palabras_clave");
                    autor = rs.getString("autor");
                    creacio = rs.getString("creacion");
                    path = "ImatgesAD/" + id_imatge + ".png";
                    id_usuari = rs.getString("id_usuario");


                    document.write("<h2>" + titol +"</h2>");
                    document.write("<img src=\"" + path + "\">");
                    document.write("<p>Descripció: " + descripcio +"</p>");
                    document.write("<p>Autor: " + autor +"</p>");
                    document.write("<p>Data de creació: " + creacio +"</p>");

                    if (user.equals(id_usuari)) {
                        request.getSession().setAttribute("id_imatge", id_imatge);
                        document.write("<a href=\"modificarImagen.jsp\">Modificar imatge<br></a>");
                        document.write("<a href=\"eliminarServlet\" style=\"color:red\">Eliminar imatge</a>");
                    }
                }
                else {
                    document.println("No s'ha trobat cap imatge amb aquests paràmetres");
                }
                while(rs.next()){
                    titol = rs.getString("titulo");
                    id_imatge = rs.getString("id_imagen");
                    descripcio = rs.getString("descripcion");
                    clau = rs.getString("palabras_clave");
                    autor = rs.getString("autor");
                    creacio = rs.getString("creacion");
                    path = "ImatgesAD/" + id_imatge + ".png";
                    id_usuari = rs.getString("id_usuario");


                    document.write("<h2>" + titol +"</h2>");
                    document.write("<img src=\"" + path + "\">");
                    document.write("<p>Descripció: " + descripcio +"</p>");
                    document.write("<p>Autor: " + autor +"</p>");
                    document.write("<p>Data de creació: " + creacio +"</p>");

                    if (user.equals(id_usuari)) {
                        request.getSession().setAttribute("id_imatge", id_imatge);
                        document.write("<a href=\"modificarImagen.jsp\">Modificar imatge<br></a>");
                        document.write("<a href=\"eliminarServlet\" style=\"color:red\">Eliminar imatge</a>");
                    }
                }
            }
            catch(SQLException e)
            {
              System.err.println(e.getMessage());
            }   
            finally{
               try
              {
                if(conn != null)
                  conn.close();
              }
              catch(SQLException e)
              {
                // connection close failed.
                System.err.println(e.getMessage());
              }
            }

            %>
        </p>
        </div>
    </body>
</html>
