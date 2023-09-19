package com.mycompany.project1_bd2.entidades;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class BitacoraLibro {
    private int id;
    private String fecha;
    private Usuario usuario;
    private String descripcion;

    public BitacoraLibro(int id, String fecha, Usuario usuario, String descripcion) {
        this.id = id;
        this.fecha = fecha;
        this.usuario = usuario;
        this.descripcion = descripcion;
    }

    public int getId() {
        return id;
    }

    public String getFecha() {
        return fecha;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
    
    
    
}
