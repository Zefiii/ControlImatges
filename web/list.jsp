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
            <h1 id="headerLlistar">Llista d'imatges</h1>
        </div>
       
        <p>
            <% String path = "C:\\Users\\Oriol\\Documents\\GitHub\\ControlImatges\\web\\ImatgesAD";
            Connection conn = null;
            String[] arr_res = null;
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

            File f = new File( path );

            if ( f.isDirectory( )) {

                List<String> res   = new ArrayList<String>();
                File[] arr_content = f.listFiles();

                int size = arr_content.length;

                for ( int i = 0; i < size; i ++ ) {

                    if ( arr_content[ i ].isFile( ))
                    res.add( arr_content[ i ].getName());
                }


                arr_res = res.toArray( new String[ 0 ] );

            } else
                System.err.println( "¡ Path NO válido !" );
            if(arr_res != null){
                for (int i = 0; i < arr_res.length; ++i){
                    out.print("<p>");
                    out.println("<img src=\"ImatgesAD\\" + arr_res[i] + "\">");
                    PreparedStatement statement;
                    try {
                        statement = conn.prepareStatement("select * from imagenes where id_imagen = ?");
                        String nom = arr_res[i].replace(".png", "");
                        statement.setString(1, nom);
                         ResultSet rs = statement.executeQuery();
                         if(rs.next()){
                             System.err.println("Tenim un resultat com a minim");
                            out.println("<p>Titol: "+ rs.getString("titulo")+ "</p>");
                            out.println("<p>Descripcion: " + rs.getString("descripcion") + "</p>");
                            out.println("<p>Autor: " + rs.getString("autor") + "</p>");
                        }
                    } catch (SQLException ex) {
                       System.err.println("Error amb la consulta");
                    }

                    out.print("<p>");
                }
            }
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
    </body>
</html>
