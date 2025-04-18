/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.project1_bd2.Servlets;

import com.mycompany.project1_bd2.DBConnection;
import com.mycompany.project1_bd2.Repositorios.PrestamoRepositorio;
import com.mycompany.project1_bd2.entidades.Prestamo;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author yaira
 */
public class ConsultaPrestamosServlets extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            DBConnection dbConecction = new DBConnection();
            List<Prestamo> prestamos = PrestamoRepositorio.mostrarTodosPrestamos(dbConecction.getConnection());
            
            if (!prestamos.isEmpty()) {
                out.println("<html>");
                out.println("<body>");
                out.println("<h1>Información de Todos los Prestamos:</h1>");
                out.println("<ul>");

                for (Prestamo prestamo : prestamos) {
                    out.println("<li>ID: " + prestamo.getId() + ", fecha Prestamo: " + prestamo.getFechaPrestamo()+
                                ", fecha devolucion: " + prestamo.getFechaDevolucion()+ ", Cliente: " + prestamo.getCliente()+
                                ", Libro: " + prestamo.getLibro()+ "</li>");
                }

                out.println("</ul>");
                out.println("</body>");
                out.println("</html>");
                dbConecction.closeConnection();
            } else {
                dbConecction.closeConnection();
                out.println("No hay Libros en la base de datos.");
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
