package com.mycompany.project1_bd2;

import oracle.sql.DATE;

public class BitacoraLibro {
    private int id;
    private DATE fecha;
    private Usuario usuario;
    private String descripcion;

    public BitacoraLibro(int id, DATE fecha, Usuario usuario, String descripcion) {
        this.id = id;
        this.fecha = fecha;
        this.usuario = usuario;
        this.descripcion = descripcion;
    }

    public int getId() {
        return id;
    }

    public DATE getFecha() {
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

    public void setFecha(DATE fecha) {
        this.fecha = fecha;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
    
    
    
}
