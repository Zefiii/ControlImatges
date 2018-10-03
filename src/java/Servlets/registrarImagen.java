/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpSession;


/**
 *
 * @author oriol
 */
@WebServlet(name = "registrarImagen", urlPatterns = {"/registrarImagen"})
@MultipartConfig 
public class registrarImagen extends HttpServlet {
     private final static Logger LOGGER = Logger.getLogger(registrarImagen.class.getCanonicalName());
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
        final String path = "C:\\Users\\oriol\\OneDrive\\Documentos\\NetBeansProjects\\ControlImatges\\web\\ImatgesAD";
        //final String path = "C:\\Users\\Oriol\\Documents\\GitHub\\ControlImatges\\web\\ImatgesAD";
        //final String path = "/Users/Jordi/NetBeansProjects/ControlImatges/web/ImatgesAD";
        
        final Part filePart = request.getPart("file");
        
        try {
            Class.forName("org.sqlite.JDBC");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(loginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        OutputStream ou = null;
        InputStream filecontent = null;
        final PrintWriter writer = response.getWriter();
        
        Connection conn = null;
        
        String titol = request.getParameter("titol");
        String descripcio = request.getParameter("textArea");
        String clau = request.getParameter("clau");
        String autor = request.getParameter("autor");
        String creacio = request.getParameter("creacio");
        String[] data = creacio.split("-");
        String any = data[0];
        String mes = data[1];
        String dia = data[2];

        String id = titol + dia + mes + any;
        
        System.out.println(id);
        LOGGER.log(Level.SEVERE, id);
        HttpSession session = request.getSession();
        String user = (String) session.getAttribute("user");
        final String fileName = id + ".png";
        
        try{
           ou = new FileOutputStream(new File(path + File.separator + fileName));
           filecontent = filePart.getInputStream();
           int read = 0;
           final byte[] bytes = new byte[1024];
           
           while((read = filecontent.read(bytes)) != -1){
               ou.write(bytes, 0, read);
           }
          
           
           /* System.out.println("New file " + fileName + " created at " + path );*/
           //conn = DriverManager.getConnection("jdbc:sqlite:C:\\Users\\Oriol\\Desktop\\basedades.db");
           //conn = DriverManager.getConnection("jdbc:sqlite:/Users/Jordi/Desktop/loquesea.db");
           conn = DriverManager.getConnection("jdbc:sqlite:C:\\Users\\oriol\\OneDrive\\Escritorio\\loquesea.db");
            
           PreparedStatement statement = conn.prepareStatement("insert into imagenes values (?, ?, ?, ?, ?, ? , ?);");
           statement.setString(1, id);
           statement.setString(2, user);
           statement.setString(3, titol);
           statement.setString(4, descripcio);
           statement.setString(5, clau);
           statement.setString(6, autor);
           statement.setString(7, creacio);
           statement.executeUpdate();
           response.sendRedirect("menu.jsp");

        }
        catch (FileNotFoundException fne) {
        writer.println("You either did not specify a file to upload or are "
                + "trying to upload a file to a protected or nonexistent "
                + "location.");
        writer.println("<br/> ERROR: " + fne.getMessage());

        LOGGER.log(Level.SEVERE, "Problems during file upload. Error: {0}",
                new Object[]{fne.getMessage()});
        } catch (SQLException ex) {
             Logger.getLogger(registrarImagen.class.getName()).log(Level.SEVERE, null, ex);
         }
        finally {
            if (ou != null) {
                ou.close();
            }
            if (filecontent != null) {
                filecontent.close();
            }
            if (writer != null) {
                writer.close();
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
