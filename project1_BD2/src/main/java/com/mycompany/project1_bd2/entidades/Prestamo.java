package com.mycompany.project1_bd2.entidades;

import java.sql.Date;


public class Prestamo {
    private int id;
    private Date fechaPrestamo;
    private Date fechaDevolucion;
    private Libro libro;
    private Cliente cliente;

    public Prestamo(int id, Date fechaPrestamo, Date fechaDevolucion, Libro libro, Cliente cliente) {
        this.id = id;
        this.fechaPrestamo = fechaPrestamo;
        this.fechaDevolucion = fechaDevolucion;
        this.libro = libro;
        this.cliente = cliente;
    }

    

    public int getId() {
        return id;
    }

    public Date getFechaPrestamo() {
        return fechaPrestamo;
    }

    public Date getFechaDevolucion() {
        return fechaDevolucion;
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

    public void setFechaPrestamo(Date fechaPrestamo) {
        this.fechaPrestamo = fechaPrestamo;
    }

    public void setFechaDevolucion(Date fechaDevolucion) {
        this.fechaDevolucion = fechaDevolucion;
    }

    public void setLibro(Libro libro) {
        this.libro = libro;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }
    
    
}

