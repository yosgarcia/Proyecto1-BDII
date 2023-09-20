/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.project1_bd2.Servlets;

import com.mycompany.project1_bd2.DBConnection;
import com.mycompany.project1_bd2.Repositorios.LibroRepositorio;
import com.mycompany.project1_bd2.entidades.Cliente;
import com.mycompany.project1_bd2.entidades.Libro;
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
public class ConsultarLibrosServlet extends HttpServlet {

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
            List<Libro> libros = LibroRepositorio.mostrarTodosLibros(dbConecction.getConnection());
            if (!libros.isEmpty()) {
                out.println("<html>");
                out.println("<body>");
                out.println("<h1>Información de Todos los Libros:</h1>");
                out.println("<ul>");

                for (Libro libro : libros) {
                    out.println("<li>ID: " + libro.getId() + ", Titulo: " + libro.getTitulo()+
                                ", Editorial: " + libro.getEditorial().getId() + ", Genero: " + libro.getGenero().getId() +
                                ", Autor: " + libro.getAutor().getId() + ", Anno publicacion: " + libro.getAnnoPublicacion() +
                            ", ISBN: " + libro.getIsbn()+ ", Inventario: " + libro.getInventario()+ "</li>");
                }
                
                out.println("</ul>");
                out.println("</body>");
                out.println("</html>");
                dbConecction.closeConnection();
            } else {
                dbConecction.closeConnection();
                out.println("No hay libros en la base de datos.");
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
