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
public class BorrarClienteServlet extends HttpServlet {

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
        int id = Integer.parseInt(request.getParameter("clienteId"));
        
        try ( PrintWriter out = response.getWriter()) {
            DBConnection dbConnection = new DBConnection();
            Cliente clienteBorrar = ClienteRepositorio.obtenerPorId(dbConnection.getConnection(), id);
            if (clienteBorrar != null){
                ClienteRepositorio.borrarCliente(dbConnection.getConnection(),id);

                request.setAttribute("accion", "mostrar");
                request.setAttribute("mensaje", "Se ha eliminado el cliente con el ID: " + id);
                RequestDispatcher rd =request.getRequestDispatcher("menu.jsp");
                rd.forward(request, response);
            } else {
                request.setAttribute("accion", "mostrar");
                request.setAttribute("mensaje", "No se ha encontrado el cliente con el ID: " + id);
                RequestDispatcher rd =request.getRequestDispatcher("menu.jsp");
                rd.forward(request, response);
            }
            
            dbConnection.closeConnection();
            
        } catch (Exception e){
            response.getWriter().println("Error al borrar cliente.");
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
