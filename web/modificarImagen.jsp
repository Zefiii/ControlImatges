<%-- 
    Document   : modificarImagen
    Created on : 23-sep-2018, 16:55:29
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
        <title>Modificar imatge</title>
    </head>
    <body>
        <div>
            <%
                final PrintWriter document = response.getWriter();
                Connection conn = null;
                String id_modificar = request.getParameter("id_imatge");
                Class.forName("org.sqlite.JDBC");
                String user = (String) session.getAttribute("user");

                try{
                    //conn = DriverManager.getConnection("jdbc:sqlite:C:\\Users\\Oriol\\Desktop\\basedades.db");
                    //conn = DriverManager.getConnection("jdbc:sqlite:/Users/Jordi/Desktop/loquesea.db");
                    conn = DriverManager.getConnection("jdbc:sqlite:C:\\Users\\oriol\\OneDrive\\Escritorio\\loquesea.db");
                    System.out.print(id_modificar);
                    PreparedStatement statement =  conn.prepareStatement("select * from imagenes where id_imagen = ?");
                    statement.setString(1, id_modificar);
                    
                    String titol;
                    String descripcio;
                    String clau;
                    String autor;
                    String path;
                    
                    ResultSet rs = statement.executeQuery();

                    if (rs.next()) {
                        document.write("<h1>Modificar element</h1>");
                        titol = rs.getString("titulo");
                        descripcio = rs.getString("descripcion");
                        clau = rs.getString("palabras_clave");
                        autor = rs.getString("autor");
                        path = "ImatgesAD/" + id_modificar + ".png";
                        
                        out.println("<br><img src=\"" + path + "\"><br><br>");
                        
                        out.println("<form method=\"post\" action=\"modificarImatge\" id=\"modificarImatge\">");
                        out.println("<label for=\"titol_mod\">Títol: </label>");
                        out.println("<input type=\"text\" name=\"titol_mod\" id=\"titol_mod\" value=\""+titol+ "\"><br>");
                                                
                        out.println("<label for=\"descripcio_mod\">Descripció: </label><br>");
                        out.println("<textarea cols='30' rows='10' name=\"descripcio_mod\" id=\"descripcio_mod\">" + descripcio + "</textarea><br>");
                       
                        
                        out.println("<label for=\"autor_mod\">Autor: </label>");
                        out.println("<input type=\"text\" name=\"autor_mod\" id=\"autor_mod\" value=\"" + autor + "\"><br>");

                        out.println("<label for=\"clau_mod\">Paraules Clau: </label>");
                        out.println("<input type=\"text\" name=\"clau_mod\" id=\"clau_mod\" value=\"" + clau + "\"><br>"
                                + "<input type=\"hidden\" value=\"" + id_modificar + "\" name=\"id_imatge\" id=\"id_imatge\">");
                        
                        
                        
                        out.println("<input type=\"submit\" id=\"modificar\" value=\"Modificar\">");
                        out.println("</form>");
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
                
        </div>
    </body>
</html>
