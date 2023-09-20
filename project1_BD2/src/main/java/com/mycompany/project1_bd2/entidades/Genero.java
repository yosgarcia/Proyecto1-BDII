package com.mycompany.project1_bd2.entidades;


public class Genero {
    private int id;
    
    private String nombre;
    private int numPrestamos;

    public Genero(int id, String nombre) {
        this.id = id;
        this.nombre = nombre;
    }
    
    public Genero(String nombre, int prestamos){
        this.nombre = nombre;
        this.numPrestamos = prestamos;
    }

    public int getId() {
        return id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNumPrestamos(int numPrestamos) {
        this.numPrestamos = numPrestamos;
    }

    public int getNumPrestamos() {
        return numPrestamos;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    
}
