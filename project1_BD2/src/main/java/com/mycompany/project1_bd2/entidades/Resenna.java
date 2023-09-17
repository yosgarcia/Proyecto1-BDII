package com.mycompany.project1_bd2.entidades;

import com.mycompany.project1_bd2.entidades.Libro;
import com.mycompany.project1_bd2.entidades.Cliente;


public class Resenna {
    
    private int id;
    private String descripcion;
    private int calificacion;
    private Libro libro;
    private Cliente cliente;

    public Resenna(int id, String descripcion, int calificacion, Libro libro, Cliente cliente) {
        this.id = id;
        this.descripcion = descripcion;
        this.calificacion = calificacion;
        this.libro = libro;
        this.cliente = cliente;
    }

    public int getId() {
        return id;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public int getCalificacion() {
        return calificacion;
    }

    public Libro getLibro() {
        return libro;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public void setCalificacion(int calificacion) {
        this.calificacion = calificacion;
    }

    public void setLibro(Libro libro) {
        this.libro = libro;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }
    
    
}
