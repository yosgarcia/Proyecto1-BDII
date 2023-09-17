package com.mycompany.project1_bd2.entidades;


public class Editorial {
    private int id;
    
    private String nombre;
    
    private String origen;

    public Editorial(int id, String nombre, String origen) {
        this.id = id;
        this.nombre = nombre;
        this.origen = origen;
    }

    public int getId() {
        return id;
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
