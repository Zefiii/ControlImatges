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
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author oriol
 */
@WebServlet(name = "loginServlet", urlPatterns = {"/loginServlet"})
public class loginServlet extends HttpServlet {

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
        String user = request.getParameter("user");
        String pass = request.getParameter("pass");
        Connection conn = null;
        try (PrintWriter out = response.getWriter()) {
            //conn = DriverManager.getConnection("jdbc:sqlite:C:\\Users\\oriol\\OneDrive\\Escritorio\\loquesea.db");
            conn = DriverManager.getConnection("jdbc:sqlite:C:\\Users\\oriol\\OneDrive\\Escritorio\\loquesea.db");
            PreparedStatement statement =  conn.prepareStatement("select * from usuarios where id_usuario = ?");
            statement.setString(1, user);
            ResultSet rs = statement.executeQuery();
            while(rs.next()){
                if(rs.getString("password").equals(pass)){
                    //aixo en principi dona sessions, mes tard intento que
                    //faci el control. Jo m'encarregare d'aixo de moment
                    HttpSession session = request.getSession();
                    session.setAttribute("user", rs.getString("id_usuario"));
                    session.setMaxInactiveInterval(5*60);
                    Cookie userName = new Cookie("user", rs.getString("id_usuario"));
                    response.sendRedirect("menu.jsp" );
                }  
                else{
                    //aixo hauria de donar un missatge de error pero no ho fa
                    RequestDispatcher rd = getServletContext().getRequestDispatcher("/login.jsp");
                    PrintWriter ou;
                    ou = response.getWriter();
                    ou.println("<font color = red> Usuario o contraseya incorrectes.</font>");
                    rd.forward(request, response);
                }
            }
            /*Aqui li he de donar la cookie, s'afageix a la resposta i es crea 
            mitjancant Cookie. */
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
