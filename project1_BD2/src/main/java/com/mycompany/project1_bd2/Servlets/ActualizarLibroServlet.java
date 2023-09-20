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
            int libroId = Integer.parseInt(request.getParameter("libroId"));
            String titulo = request.getParameter("titulo");
            Integer editorialId = Integer.parseInt(request.getParameter("editorialId"));
            Integer autorId = Integer.parseInt(request.getParameter("autorId"));
            Integer generoId = Integer.parseInt(request.getParameter("generoId"));
            
            java.sql.Date fechaPublicacionSQL;
            try{
                java.util.Date publicacionFecha = formatoFecha.parse(request.getParameter("fechaPublicacion"));
                fechaPublicacionSQL = new java.sql.Date(publicacionFecha.getTime());
            } catch (NullPointerException e){
                fechaPublicacionSQL = null;
            }
            String isbn = request.getParameter("isbn");
            Integer inventario = Integer.parseInt(request.getParameter("inventario"));
            
            DBConnection dbConnection = new DBConnection();
            Libro libroActualizar = LibroRepositorio.mostrarLibroPorId(dbConnection.getConnection(), libroId);
            
            
            if (libroActualizar != null){
                   //FALTA
            // Validar que haga que solo se actualicen datos que se ingresen
                Editorial editorial = EditorialRepositorio.mostrarEditorialPorId(dbConnection.getConnection(), editorialId);
                Genero genero = GeneroRepositorio.mostrarGeneroPorId(dbConnection.getConnection(), generoId);
                Autor autor = AutorRepositorio.obtenerPorId(dbConnection.getConnection(), autorId);
                
                if(editorial != null && genero != null && autor != null){
                    
                    LibroRepositorio.modificarLibro(dbConnection.getConnection(), libroId, titulo, editorialId, generoId,
                            autorId, fechaPublicacionSQL, isbn, inventario);
                    BitacoraLibroRepositorio.modificarUsuarioBitacora(dbConnection.getConnection(), DBConnection.getUsuario());
                    
                } else{
                    out.println("Editorial, genero o autor no existen");
                }
                
            } else{
                out.println("Libro a actualizar no existe");
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
