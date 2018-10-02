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
<%@ page import="import java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.util.logging.Level"%>
<%@ page import="java.util.logging.Logger"%>
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
        <div>
            <p>
                <% String path = "C:\\Users\\oriol\\OneDrive\\Documentos\\NetBeansProjects\\ControlImatges\\web\\ImatgesAD";
                 Connection conn = null;
                 String[] arr_res = null;
                try{
                    Class.forName("org.sqlite.JDBC");
                }
                 
                conn = DriverManager.getConnection("jdbc:sqlite:C:\\Users\\oriol\\OneDrive\\Escritorio\\loquesea.db");

                File f = new File( path );

                if ( f.isDirectory( )) {

                    List<String> res   = new ArrayList();
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
                        PreparedStatement statement = conn.prepareStatement("select * from imagenes where id_imagen = ?");
                        statement.setString(1, arr_res[i]);
                        ResultSet rs = statement.executeQuery();
                        if(rs.next()){
                           // out.println("<h3>Titol: "+ rs.getString("titulo")+ "</h3>");
                            out.println("<img src=\"ImatgesAD\\" + arr_res[i] + "\">");
                           // out.println("<p>Descripcion: " + rs.getString("descripcion") + "</p>");
                        }
                    }
                }
                %>
            </p>
        </div>
    </body>
</html>
