/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.project1_bd2.Servlets;

import com.mycompany.project1_bd2.DBConnection;
import com.mycompany.project1_bd2.Repositorios.AutorRepositorio;
import com.mycompany.project1_bd2.Repositorios.EditorialRepositorio;
import com.mycompany.project1_bd2.Repositorios.GeneroRepositorio;
import com.mycompany.project1_bd2.Repositorios.LibroRepositorio;
import com.mycompany.project1_bd2.entidades.Autor;
import com.mycompany.project1_bd2.entidades.Editorial;
import com.mycompany.project1_bd2.entidades.Genero;
import com.mycompany.project1_bd2.entidades.Libro;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.RequestDispatcher; 
import jakarta.servlet.ServletException; 
import jakarta.servlet.http.HttpServlet; 
import jakarta.servlet.http.HttpServletRequest; 
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author yaira
 */
public class ConsultarLibroIdServlet extends HttpServlet {

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
        int libroId = Integer.parseInt(request.getParameter("libroId"));
        try ( PrintWriter out = response.getWriter()) {
            DBConnection dbConecction = new DBConnection();
            Libro libroABuscar = LibroRepositorio.mostrarLibroPorId(dbConecction.getConnection(), libroId);
            if (libroABuscar != null){
                Editorial editorial = EditorialRepositorio.mostrarEditorialPorId(dbConecction.getConnection(), libroABuscar.getEditorial().getId());
                Autor autor = AutorRepositorio.obtenerPorId(dbConecction.getConnection(), libroABuscar.getAutor().getId());
                Genero genero = GeneroRepositorio.mostrarGeneroPorId(dbConecction.getConnection(), libroABuscar.getGenero().getId());
                
                request.setAttribute("idi", "ID: " + libroABuscar.getId());
                request.setAttribute("titulu", libroABuscar.getTitulo());
                request.setAttribute("editoriali", "Editorial: " + editorial.getNombre());
                request.setAttribute("generu", "Genero:" + genero.getNombre());
                request.setAttribute("autori", "Autor: " + autor.getNombre());
                request.setAttribute("annu", libroABuscar.getAnnoPublicacion());
                request.setAttribute("isbni", "ISBN: " + libroABuscar.getIsbn());
                request.setAttribute("inventariu",libroABuscar.getInventario()+" unidades");
                request.setAttribute("listo", "uno");
                
                
                dbConecction.closeConnection();
                RequestDispatcher rd = request.getRequestDispatcher("ConsultaLibro.jsp");
                rd.forward(request, response);
            } else {
                dbConecction.closeConnection();
                out.println("no existe");
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
