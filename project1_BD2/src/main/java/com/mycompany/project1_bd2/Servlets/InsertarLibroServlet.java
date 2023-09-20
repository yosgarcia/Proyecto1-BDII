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
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author yaira
 */
public class InsertarLibroServlet extends HttpServlet {

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
            
            String titulo = request.getParameter("nombreLibro");
            int editorialId = Integer.parseInt(request.getParameter("Editorial"));
            int generoId = Integer.parseInt(request.getParameter("Genero"));
            int autorId = Integer.parseInt(request.getParameter("Autor"));
            System.out.println(request.getParameter("publicacionLibro"));
            SimpleDateFormat formatoFecha = new SimpleDateFormat("dd/MM/yyyy");
            var publicacionFecha = new Date(formatoFecha.format(request.getParameter("publicacionLibro")));
            System.out.println("aqui obtengo fecha");
            String isbn = request.getParameter("ISBN");
            int inventario = Integer.parseInt(request.getParameter("inventarioLibro"));
            
            DBConnection dBConnection = new DBConnection();
            Genero genero = GeneroRepositorio.mostrarGeneroPorId(dBConnection.getConnection(), generoId);
            Autor autor = AutorRepositorio.obtenerPorId(dBConnection.getConnection(), autorId);
            Editorial editorial = EditorialRepositorio.mostrarEditorialPorId(dBConnection.getConnection(), editorialId);
            
            if(genero != null && autor != null && editorial != null){
                int id = LibroRepositorio.insertarLibro(dBConnection.getConnection(), titulo, editorialId, generoId, autorId, publicacionFecha, isbn, inventario);
                if(id != -1){
                    request.setAttribute("accion", "mostrar");
                    request.setAttribute("mensaje", "Se ha agregado un libro con el ID: " + id);
                    RequestDispatcher rd =request.getRequestDispatcher("menu.jsp");
                    rd.forward(request, response);
                    
                } else{
                    request.setAttribute("accion", "mostrar");
                    request.setAttribute("mensaje", "Error al agregar el libro");
                    RequestDispatcher rd =request.getRequestDispatcher("menu.jsp");
                    rd.forward(request, response);
                }
            } else{
                request.setAttribute("accion", "mostrar");
                request.setAttribute("mensaje", "No existe el autor, genero o editorial dados");
                RequestDispatcher rd =request.getRequestDispatcher("menu.jsp");
                rd.forward(request, response);
            }
            
            
        } catch (Exception e){
            System.out.println("aqui obtengo fecha");
            System.err.println("Error al parsear la fecha: " + e.getMessage());
            RequestDispatcher rd =request.getRequestDispatcher("menu.jsp");
            rd.forward(request, response);
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
