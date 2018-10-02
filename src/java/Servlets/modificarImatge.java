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
@WebServlet(name = "modificarImatge", urlPatterns = {"/modificarImatge"})
public class modificarImatge extends HttpServlet {

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
        
        /* Creem les variables per poder guardar la imatge*/
        //final String path = "C:\\Users\\oriol\\OneDrive\\Documentos\\NetBeansProjects\\ControlImatges\\web\\ImatgesAD";
        //final String path = "C:\\Users\\Oriol\\Documents\\GitHub\\ControlImatges\\web\\ImatgesAD";
        final String path = "/Users/Jordi/NetBeansProjects/ControlImatges/web/ImatgesAD";
                
        try {
            Class.forName("org.sqlite.JDBC");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(loginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        final PrintWriter writer = response.getWriter();
        
        Connection conn = null;
        
        String titol = request.getParameter("titol_mod");
        String descripcio = request.getParameter("descripcio_mod");
        String clau = request.getParameter("clau_mod");
        String autor = request.getParameter("autor_mod");
        String id_imagen = (String) request.getSession().getAttribute("id_imatge");
        
        System.out.print(titol);
        System.out.print(descripcio);
        System.out.print(clau);
        System.out.print(autor);
        
        HttpSession session = request.getSession();
        String user = (String) session.getAttribute("user");
        
        try{
           
           /* System.out.println("New file " + fileName + " created at " + path );*/
           //conn = DriverManager.getConnection("jdbc:sqlite:C:\\Users\\Oriol\\Desktop\\basedades.db");
           conn = DriverManager.getConnection("jdbc:sqlite:/Users/Jordi/Desktop/loquesea.db");
            
           PreparedStatement statement = conn.prepareStatement("update imagenes set titulo = ?, descripcion = ?, palabras_clave = ?, autor = ? where id_imagen = ?;");
           statement.setString(1, titol);
           statement.setString(2, descripcio);
           statement.setString(3, clau);
           statement.setString(4, autor);
           statement.setString(5, id_imagen);

           statement.executeUpdate();
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
