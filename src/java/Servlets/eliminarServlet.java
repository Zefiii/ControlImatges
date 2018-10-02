/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import java.io.File;
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
@WebServlet(name = "eliminarServlet", urlPatterns = {"/eliminarServlet"})
public class eliminarServlet extends HttpServlet {

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
        String eliminar = request.getParameter("id_imatge");
        
         //final String path = "C:\\Users\\oriol\\OneDrive\\Documentos\\NetBeansProjects\\ControlImatges\\web\\ImatgesAD";
        final String path = "C:\\Users\\Oriol\\Documents\\GitHub\\ControlImatges\\web\\ImatgesAD";
        //final String path = "/Users/Jordi/NetBeansProjects/ControlImatges/web/ImatgesAD";
                
        HttpSession session = request.getSession();
        String user = (String) session.getAttribute("user");
        
        try (PrintWriter out = response.getWriter()) {

            conn = DriverManager.getConnection("jdbc:sqlite:C:\\Users\\Oriol\\Desktop\\basedades.db");
            //conn = DriverManager.getConnection("jdbc:sqlite:/Users/Jordi/Desktop/loquesea.db");
            
            System.out.print(eliminar);
            PreparedStatement statement =  conn.prepareStatement("delete from imagenes where id_imagen = ?");
            statement.setString(1, eliminar);
            statement.executeUpdate();
            String fich = path + eliminar + ".png";
            System.out.print(fich);
            File fichero = new File(fich);
            if(fichero.delete()) {
                System.out.print("Fitxer eliminat del sistema");
            }
            else System.out.print("No s'ha eliminat");
            System.out.print("S'ha esborrat correctament");
            response.sendRedirect("menu.jsp");

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
