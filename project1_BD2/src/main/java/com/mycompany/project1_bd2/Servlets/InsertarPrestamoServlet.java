/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.project1_bd2.Servlets;

import com.mycompany.project1_bd2.DBConnection;
import com.mycompany.project1_bd2.Repositorios.BitacoraLibroRepositorio;
import com.mycompany.project1_bd2.Repositorios.ClienteRepositorio;
import com.mycompany.project1_bd2.Repositorios.LibroRepositorio;
import com.mycompany.project1_bd2.Repositorios.PrestamoRepositorio;
import com.mycompany.project1_bd2.entidades.Cliente;
import com.mycompany.project1_bd2.entidades.Libro;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author yaira
 */
public class InsertarPrestamoServlet extends HttpServlet {

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
            java.util.Date prestamoDate = formatoFecha.parse(request.getParameter("fechaPrestamo"));
            java.sql.Date fechaPrestamoSQL = new java.sql.Date(prestamoDate.getTime());
            java.util.Date devolucionDate = formatoFecha.parse(request.getParameter("fechaDevolucion"));
            java.sql.Date fechaDevolucionSQL = new java.sql.Date(devolucionDate.getTime());
            int libroId = Integer.parseInt(request.getParameter("libroId"));
            int clienteId = Integer.parseInt(request.getParameter("clienteId"));
            
                        
            DBConnection dBConnection = new DBConnection();
            
            Libro libro = LibroRepositorio.mostrarLibroPorId(dBConnection.getConnection(), libroId);
            Cliente cliente = ClienteRepositorio.obtenerPorId(dBConnection.getConnection(), clienteId);
            
            if(libro != null && cliente != null){
                int id = PrestamoRepositorio.insertarPrestamo(dBConnection.getConnection(), fechaPrestamoSQL, fechaDevolucionSQL, libroId, clienteId);
                if(id != -1){
                    out.println("Cliente insertado exitosamente con ID: " + id);
                    BitacoraLibroRepositorio.modificarUsuarioBitacora(dBConnection.getConnection(), DBConnection.getUsuario());
                } else{
                    out.println("Error al insertar el prestamo en la base de datos");
                }
            } else{
                out.println("libro o cliente no existe");
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
