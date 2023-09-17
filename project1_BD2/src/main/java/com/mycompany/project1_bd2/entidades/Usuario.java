package com.mycompany.project1_bd2.entidades;

import com.mycompany.project1_bd2.entidades.Empleado;


public class Usuario {
    private String username;
    private String contrasenna;
    private Empleado empleado;

    public Usuario(String username, String contrasenna, Empleado empleado) {
        this.username = username;
        this.contrasenna = contrasenna;
        this.empleado = empleado;
    }

    public String getUsername() {
        return username;
    }

    public String getContrasenna() {
        return contrasenna;
    }

    public Empleado getEmpleado() {
        return empleado;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setContrasenna(String contrasenna) {
        this.contrasenna = contrasenna;
    }

    public void setEmpleado(Empleado empleado) {
        this.empleado = empleado;
    }
    
    
}
