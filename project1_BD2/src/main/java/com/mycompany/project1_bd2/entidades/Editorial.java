package com.mycompany.project1_bd2.entidades;


public class Editorial {
    private int id;
    
    private String nombre;
    
    private String origen;
    
    private int prestamos;

    public Editorial(int id, String nombre, String origen) {
        this.id = id;
        this.nombre = nombre;
        this.origen = origen;
    }
    
    public Editorial(String origen, int prestamos){
        this.origen = origen;
        this.prestamos = prestamos;
    }

    public int getId() {
        return id;
    }

    public int getPrestamos() {
        return prestamos;
    }

    public void setPrestamos(int prestamos) {
        this.prestamos = prestamos;
    }
    
    
    
    public String getNombre() {
        return nombre;
    }

    public String getOrigen() {
        return origen;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setOrigen(String origen) {
        this.origen = origen;
    }
    
    
}
