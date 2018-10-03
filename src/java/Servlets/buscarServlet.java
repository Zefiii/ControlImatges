/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author jrubiralta
 */
@WebServlet(name = "buscarServlet", urlPatterns = {"/buscarServlet"})
public class buscarServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        try {
            Class.forName("org.sqlite.JDBC");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(loginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        final PrintWriter document = response.getWriter();
        Connection conn = null;
        String buscar = request.getParameter("buscar");
        
        HttpSession session = request.getSession();
        String user = (String) session.getAttribute("user");
        
        try (PrintWriter out = response.getWriter()) {

            //conn = DriverManager.getConnection("jdbc:sqlite:C:\\Users\\Oriol\\Desktop\\basedades.db");
            //conn = DriverManager.getConnection("jdbc:sqlite:/Users/Jordi/Desktop/loquesea.db");
            conn = DriverManager.getConnection("jdbc:sqlite:C:\\Users\\oriol\\OneDrive\\Escritorio\\loquesea.db");
            PreparedStatement statement =  conn.prepareStatement("select * from imagenes where titulo = ? or id_usuario = ? or palabras_clave = ? or autor = ?");
            statement.setString(1, buscar);
            statement.setString(2, buscar);
            statement.setString(3, buscar);
            statement.setString(4, buscar); 
            
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
                document.write("<h1>Resultats</h1>");
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
                    document.write("<form action=\"modificarImagen.jsp\" method=\"post\">"
                                + "<input type=\"hidden\" value=\"" + id_imatge + "\" name=\"id_imatge\" id=\"id_imatge\">"
                                + "<input type=\"submit\" value=\"Modificar\">"
                                        + "</form>");
                    document.write("<form action=\"eliminarServlet\" method=\"post\">"
                                + "<input type=\"hidden\" value=\"" + id_imatge + "\" name=\"id_imatge\" id=\"id_imatge\">"
                                + "<input type=\"submit\" value=\"Eliminar\">"
                                        + "</form>");
                }
            }
            else {
                document.println("No s'ha trobat cap imatge amb aquests paràmetres");
            }
            while(rs.next()){
                document.write("<h1>Resultats</h1>");
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
                   document.write("<form action=\"modificarImagen.jsp\" method=\"post\">"
                                + "<input type=\"hidden\" value=\"" + id_imatge + "\" name=\"id_imatge\" id=\"id_imatge\">"
                                + "<input type=\"submit\" value=\"Modificar\">"
                                        + "</form>");
                    document.write("<form action=\"eliminarServlet\" method=\"post\">"
                                + "<input type=\"hidden\" value=\"" + id_imatge + "\" name=\"id_imatge\" id=\"id_imatge\">"
                                + "<input type=\"submit\" value=\"Eliminar\">"
                                        + "</form>");
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
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
