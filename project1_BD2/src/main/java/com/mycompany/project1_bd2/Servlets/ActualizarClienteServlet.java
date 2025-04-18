/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.project1_bd2.Servlets;

import com.mycompany.project1_bd2.DBConnection;
import com.mycompany.project1_bd2.Repositorios.ClienteRepositorio;
import com.mycompany.project1_bd2.entidades.Cliente;
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
public class ActualizarClienteServlet extends HttpServlet {

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
        int id = Integer.parseInt(request.getParameter("idCliente"));
        String nombre = request.getParameter("nombreCliente");
        String apellido = request.getParameter("apellidoCliente");
        String correo = request.getParameter("correoCliente");
        String telefono = request.getParameter("telefonoCliente");
        
        try ( PrintWriter out = response.getWriter()) {
            DBConnection dbConnection = new DBConnection();
            Cliente clienteModificar = ClienteRepositorio.obtenerPorId(dbConnection.getConnection(), id);
            if (clienteModificar != null){
                if (nombre.isEmpty()) {
                    nombre = clienteModificar.getNombre();
                }
                if (apellido.isEmpty()) {
                    apellido = clienteModificar.getApellido();
                }
                if (correo.isEmpty()) {
                    correo = clienteModificar.getCorreo();
                }
                if (telefono.isEmpty()) {
                    telefono = clienteModificar.getTelefono();
                }
                ClienteRepositorio.modificarCliente(dbConnection.getConnection(),id, nombre, apellido, correo, telefono);
                request.setAttribute("accion", "mostrar");
                request.setAttribute("mensaje", "Se ha actualizado el cliente con el ID: " + id);
                RequestDispatcher rd =request.getRequestDispatcher("menu.jsp");
                rd.forward(request, response);
            } else { 
                request.setAttribute("accion", "mostrar");
                request.setAttribute("mensaje", "No se ha encontrado el cliente con el ID: " + id);
                RequestDispatcher rd =request.getRequestDispatcher("menu.jsp");
                rd.forward(request, response);
            }
            
            dbConnection.closeConnection();
            
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
