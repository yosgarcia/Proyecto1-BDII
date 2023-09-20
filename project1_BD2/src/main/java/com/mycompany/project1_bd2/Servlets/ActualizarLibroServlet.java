/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.project1_bd2.Servlets;

import com.mycompany.project1_bd2.DBConnection;
import com.mycompany.project1_bd2.Repositorios.AutorRepositorio;
import com.mycompany.project1_bd2.Repositorios.BitacoraLibroRepositorio;
import com.mycompany.project1_bd2.Repositorios.EditorialRepositorio;
import com.mycompany.project1_bd2.Repositorios.GeneroRepositorio;
import com.mycompany.project1_bd2.Repositorios.LibroRepositorio;
import com.mycompany.project1_bd2.Repositorios.PrestamoRepositorio;
import com.mycompany.project1_bd2.entidades.Autor;
import com.mycompany.project1_bd2.entidades.Editorial;
import com.mycompany.project1_bd2.entidades.Genero;
import com.mycompany.project1_bd2.entidades.Libro;
import com.mycompany.project1_bd2.entidades.Prestamo;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import jakarta.servlet.RequestDispatcher; 
import jakarta.servlet.ServletException; 
import jakarta.servlet.http.HttpServlet; 
import jakarta.servlet.http.HttpServletRequest; 
import jakarta.servlet.http.HttpServletResponse;
import java.util.Date;

/**
 *
 * @author yaira
 */
public class ActualizarLibroServlet extends HttpServlet {

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
        SimpleDateFormat formatoFecha = new SimpleDateFormat("dd/MM/yyyy");
        try ( PrintWriter out = response.getWriter()){
            int libroId = Integer.parseInt(request.getParameter("idLibro"));
            String titulo = request.getParameter("nombreLibro");
            Integer editorialId = Integer.parseInt(request.getParameter("Editorial"));
            Integer autorId = Integer.parseInt(request.getParameter("Autor"));
            Integer generoId = Integer.parseInt(request.getParameter("Genero"));
            
            var fechaPublicacionString = request.getParameter("publicacionLibro");
            Date fechaPublicacion = null;
            if (fechaPublicacionString != null){
                fechaPublicacion = new Date(request.getParameter("publicacionLibro"));
            }
            
            
            String isbn = request.getParameter("ISBN");
            Integer inventario = Integer.parseInt(request.getParameter("inventarioLibro"));
            
            DBConnection dbConnection = new DBConnection();
            Libro libroActualizar = LibroRepositorio.mostrarLibroPorId(dbConnection.getConnection(), libroId);
            
            
            if (libroActualizar != null){
                   //FALTA
            // Validar que haga que solo se actualicen datos que se ingresen
                Editorial editorial;
                Genero genero;
                Autor autor;
                
                if (editorialId == 0) {
                    editorial = EditorialRepositorio.mostrarEditorialPorId(dbConnection.getConnection(), libroActualizar.getEditorial().getId());
                } else {
                    editorial = EditorialRepositorio.mostrarEditorialPorId(dbConnection.getConnection(), editorialId);
                }
                if (generoId == 0) {
                    genero = GeneroRepositorio.mostrarGeneroPorId(dbConnection.getConnection(), libroActualizar.getGenero().getId());
                } else {
                    genero = GeneroRepositorio.mostrarGeneroPorId(dbConnection.getConnection(), generoId);
                }
                if (autorId == 0) {
                    autor = AutorRepositorio.obtenerPorId(dbConnection.getConnection(), libroActualizar.getAutor().getId());
                } else {
                    autor = AutorRepositorio.obtenerPorId(dbConnection.getConnection(), autorId);
                }
                if(editorial != null && genero != null && autor != null){
                    
                    if (titulo.isEmpty()) {
                        titulo = libroActualizar.getTitulo();
                    }
                    if (isbn.isEmpty()) {
                        isbn = libroActualizar.getIsbn();
                    }
                    if (inventario == 0) {
                        inventario = libroActualizar.getInventario();
                    }
                    if (fechaPublicacion == null) {
                        fechaPublicacion = libroActualizar.getAnnoPublicacion();
                    }
                    LibroRepositorio.modificarLibro(dbConnection.getConnection(), libroId, titulo, editorialId, generoId,
                            autorId, fechaPublicacion, isbn, inventario);
                    BitacoraLibroRepositorio.modificarUsuarioBitacora(dbConnection.getConnection(), DBConnection.getUsuario());
                    request.setAttribute("accion", "mostrar");
                    request.setAttribute("mensaje", "Se ha actualizado el libro con el ID: " + libroId);
                    RequestDispatcher rd =request.getRequestDispatcher("menu.jsp");
                    rd.forward(request, response);
                } else{
                    request.setAttribute("accion", "mostrar");
                    request.setAttribute("mensaje", "Editorial, genero o autor dados no existen");
                    RequestDispatcher rd =request.getRequestDispatcher("menu.jsp");
                    rd.forward(request, response);
                }
                
            } else{
                request.setAttribute("accion", "mostrar");
                request.setAttribute("mensaje", "No se ha encontrado el libro con el ID: " + libroId);
                RequestDispatcher rd =request.getRequestDispatcher("menu.jsp");
                rd.forward(request, response);
            }
            
            dbConnection.closeConnection();
            
                                
            
        }catch (Exception e){
            System.err.println("Error al parsear la fecha: " + e.getMessage());
            
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
