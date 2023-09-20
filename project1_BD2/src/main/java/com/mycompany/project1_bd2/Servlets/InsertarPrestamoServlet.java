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
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Date;

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
        SimpleDateFormat formatoFechaSalida = new SimpleDateFormat("dd/MM/yyyy");
        SimpleDateFormat formatoFechaEntrada = new SimpleDateFormat("yyyy-MM-dd");
        try ( PrintWriter out = response.getWriter()){
            
            Date prestamoFechaEntrada = formatoFechaEntrada.parse(request.getParameter("fechaPrestamo"));
            String fechaPrestamoFormateada = formatoFechaSalida.format(prestamoFechaEntrada);
            Date fechaPrestamo = new Date(fechaPrestamoFormateada);
            
            Date devolucionFechaEntrada = formatoFechaEntrada.parse(request.getParameter("fechaDevolucion"));
            String fechaDevolucionFormateada = formatoFechaSalida.format(devolucionFechaEntrada);
            Date fechaDevolucion = new Date(fechaDevolucionFormateada);
            int libroId = Integer.parseInt(request.getParameter("idLibro"));
            int clienteId = Integer.parseInt(request.getParameter("idCliente"));
            
                        
            DBConnection dBConnection = new DBConnection();
            
            Libro libro = LibroRepositorio.mostrarLibroPorId(dBConnection.getConnection(), libroId);
            Cliente cliente = ClienteRepositorio.obtenerPorId(dBConnection.getConnection(), clienteId);
            
            if(libro != null && cliente != null){
                int id = PrestamoRepositorio.insertarPrestamo(dBConnection.getConnection(), fechaPrestamo, fechaDevolucion, libroId, clienteId);
                if(id != -1){
                    request.setAttribute("accion", "mostrar");
                    request.setAttribute("mensaje", "Se ha insertado un prestamo con el ID: " + id);
                    RequestDispatcher rd =request.getRequestDispatcher("menu.jsp");
                    rd.forward(request, response);
                    
                } else{
                    request.setAttribute("accion", "mostrar");
                    request.setAttribute("mensaje", "Error al insertar el prestamo");
                    RequestDispatcher rd =request.getRequestDispatcher("menu.jsp");
                    rd.forward(request, response);
                    
                }
            } else{
                request.setAttribute("accion", "mostrar");
                request.setAttribute("mensaje", "No existe el libro o cliente dados");
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
