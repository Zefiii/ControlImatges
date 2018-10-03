/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author oriol
 */
@WebServlet(name = "error", urlPatterns = {"/error"})
public class error extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            if((request.getAttribute("error").equals("loginError"))){
                out.println("<h1 fontcolor=\"red\">La contrasenya o l'usuari no estan bé</h1>");
                out.println("<a href=\"login.jsp\"> Login </a>");
            }
            else if((request.getAttribute("error").equals("modifError"))){
                out.println("<h1 fontcolor=\"red\">No s'ha modificat correctament</h1>");
                out.println("<a href=\"menu.jsp\"> Menu </a>");
            }
            else if((request.getAttribute("error").equals("elimError"))){
                out.println("<h1 fontcolor=\"red\">No s'ha eliminat correctament</h1>");
                out.println("<a href=\"menu.jsp\"> Menu </a>");
            }
            else if((request.getAttribute("error").equals("registError"))){
                out.println("<h1 fontcolor=\"red\">Ja existeix un usuari amb aquest nom</h1>");
                out.println("<a href=\"registre.jsp\"> Registre </a>");
            }
            else if((request.getAttribute("error").equals("passError"))){
                out.println("<h1 fontcolor=\"red\">Les contrasenyes no coincideixen</h1>");
                out.println("<a href=\"registre.jsp\"> Registre </a>");
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
