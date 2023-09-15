package com.mycompany.project1_bd2;

import oracle.sql.DATE;


public class Prestamo {
    private int id;
    private DATE fechaPrestamo;
    private DATE fechaDevolucion;
    private Libro libro;
    private Cliente cliente;

    public Prestamo(int id, DATE fechaPrestamo, DATE fechaDevolucion, Libro libro, Cliente cliente) {
        this.id = id;
        this.fechaPrestamo = fechaPrestamo;
        this.fechaDevolucion = fechaDevolucion;
        this.libro = libro;
        this.cliente = cliente;
    }

    public int getId() {
        return id;
    }

    public DATE getFechaPrestamo() {
        return fechaPrestamo;
    }

    public DATE getFechaDevolucion() {
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

    public void setFechaPrestamo(DATE fechaPrestamo) {
        this.fechaPrestamo = fechaPrestamo;
    }

    public void setFechaDevolucion(DATE fechaDevolucion) {
        this.fechaDevolucion = fechaDevolucion;
    }

    public void setLibro(Libro libro) {
        this.libro = libro;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }
    
    
}

