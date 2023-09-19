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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
                datos = "Informacion del Cliente: \nID del cliente" + clienteABuscar.getId() + "\nNombre: " + clienteABuscar.getNombre() + "\n"
                        + "Apellido: "+ clienteABuscar.getApellido() + "Correo: "+ clienteABuscar.getCorreo() + "Teléfono: "+ clienteABuscar.getTelefono();
                out.println("<html>");
                out.println("<body>");
                out.println("<h1>Información del Cliente:</h1>");
                out.println("<p>ID del Cliente: " + clienteABuscar.getId() + "</p>");
                out.println("<p>Nombre: " + clienteABuscar.getNombre() + "</p>");
                out.println("<p>Apellido: " + clienteABuscar.getApellido() + "</p>");
                out.println("<p>Correo: " + clienteABuscar.getCorreo() + "</p>");
                out.println("<p>Teléfono: " + clienteABuscar.getTelefono() + "</p>");
                out.println("</body>");
                out.println("</html>");
                dbConecction.closeConnection();
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
        System.out.println(datos);
        request.setAttribute("info", datos);
        
        RequestDispatcher rd =request.getRequestDispatcher("newjsp.jsp");
        rd.forward(request, response);
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
