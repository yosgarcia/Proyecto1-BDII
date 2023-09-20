/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.project1_bd2.Servlets;

import com.mycompany.project1_bd2.DBConnection;
import com.mycompany.project1_bd2.Repositorios.ClienteRepositorio;
import com.mycompany.project1_bd2.Repositorios.LibroRepositorio;
import com.mycompany.project1_bd2.Repositorios.PrestamoRepositorio;
import com.mycompany.project1_bd2.entidades.Cliente;
import com.mycompany.project1_bd2.entidades.Libro;
import com.mycompany.project1_bd2.entidades.Prestamo;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;

/**
 *
 * @author yaira
 */
public class ActualizarPrestamoServlet extends HttpServlet {

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
            int prestamoId = Integer.parseInt(request.getParameter("idPrestamo"));
            
            java.sql.Date fechaPrestamoSQL;
            java.sql.Date fechaDevolucionSQL;
            try{
                java.util.Date prestamoDate = formatoFecha.parse(request.getParameter("fechaPrestamo"));
                fechaPrestamoSQL = new java.sql.Date(prestamoDate.getTime());
            } catch (NullPointerException e){
                fechaPrestamoSQL = null;
            }
            try{
                java.util.Date devolucionDate = formatoFecha.parse(request.getParameter("fechaDevolucion"));
                fechaDevolucionSQL = new java.sql.Date(devolucionDate.getTime());
            } catch (NullPointerException e){
                fechaDevolucionSQL = null;
            }
            
            
            Integer libroId = Integer.parseInt(request.getParameter("idCliente"));
            Integer clienteId = Integer.parseInt(request.getParameter("idLibro"));
            
                        
            DBConnection dBConnection = new DBConnection();
            Prestamo prestamo = PrestamoRepositorio.mostrarPrestamoPorId(dBConnection.getConnection(), prestamoId);
            //Libro libro = LibroRepositorio.mostrarLibroPorId(dBConnection.getConnection(), libroId);
            //Cliente cliente = ClienteRepositorio.obtenerPorId(dBConnection.getConnection(), clienteId);
            Libro libro;
            Cliente cliente;
            
            // hacer bien validaciones
            if (libroId == 0) {
                libro = LibroRepositorio.mostrarLibroPorId(dBConnection.getConnection(), prestamo.getLibro().getId());
            } else {
                libro = LibroRepositorio.mostrarLibroPorId(dBConnection.getConnection(), libroId);
            }
            if (clienteId == 0) {
                cliente = ClienteRepositorio.obtenerPorId(dBConnection.getConnection(), prestamo.getCliente().getId());
            } else {
                cliente = ClienteRepositorio.obtenerPorId(dBConnection.getConnection(), clienteId);
            }
            if(prestamo != null){
                if (cliente != null && libro != null) {
                    if(fechaPrestamoSQL == null){
                        fechaPrestamoSQL = prestamo.getFechaPrestamo();
                    }
                    if(fechaDevolucionSQL == null){
                        fechaDevolucionSQL = prestamo.getFechaDevolucion();
                    }
                    if(libroId == 0){
                        libroId = prestamo.getLibro().getId();
                    }
                    if(clienteId == 0){
                        clienteId = prestamo.getCliente().getId();
                    }
                    PrestamoRepositorio.modificarPrestamo(dBConnection.getConnection(), prestamoId, fechaPrestamoSQL, fechaDevolucionSQL, libroId, clienteId);
                    request.setAttribute("accion", "mostrar");
                    request.setAttribute("mensaje", "Se ha actualizado el prestamo con el ID: " + prestamoId);
                    RequestDispatcher rd =request.getRequestDispatcher("menu.jsp");
                    rd.forward(request, response);
                } else {
                    request.setAttribute("accion", "mostrar");
                    request.setAttribute("mensaje", "El cliente o libro dados no existen");
                    RequestDispatcher rd =request.getRequestDispatcher("menu.jsp");
                    rd.forward(request, response);
                }
                
                
                
            } else{
                request.setAttribute("accion", "mostrar");
                    request.setAttribute("mensaje", "No se ha encontrado el prestamo con el ID: " + prestamoId);
                    RequestDispatcher rd =request.getRequestDispatcher("menu.jsp");
                    rd.forward(request, response);
            }
            
            
          
                        
            dBConnection.closeConnection();
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
