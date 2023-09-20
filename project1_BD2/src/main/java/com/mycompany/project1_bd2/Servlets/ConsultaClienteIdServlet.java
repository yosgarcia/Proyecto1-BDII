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
public class ConsultaClienteIdServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    String datos;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int clienteId = Integer.parseInt(request.getParameter("clienteId"));
        try ( PrintWriter out = response.getWriter()) {
            DBConnection dbConecction = new DBConnection();
            Cliente clienteABuscar = ClienteRepositorio.obtenerPorId(dbConecction.getConnection(), clienteId);
            if (clienteABuscar != null){
                // Mostrar la información del cliente
                request.setAttribute("idi", "ID: " + clienteABuscar.getId());
                request.setAttribute("apellidi", clienteABuscar.getApellido());
                request.setAttribute("correu", clienteABuscar.getCorreo());
                request.setAttribute("telefonu", clienteABuscar.getTelefono());
                request.setAttribute("nombri", clienteABuscar.getNombre());
                request.setAttribute("listo", "uno");
        
                RequestDispatcher rd =request.getRequestDispatcher("ConsultaCliente.jsp");
                rd.forward(request, response);
                dbConecction.closeConnection();
                //response.sendRedirect("index.jsp");
            } else {
                dbConecction.closeConnection();
                response.sendRedirect("index.jsp");
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
