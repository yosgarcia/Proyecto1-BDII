package com.mycompany.project1_bd2.entidades;

import java.sql.Date;
import oracle.sql.DATE;

public class Libro {
    private int id;
    private String titulo;
    private Editorial editorial;
    private Genero genero;
    private Autor autor;
    private Date annoPublicacion;
    private String isbn;
    private int inventario;

    public Libro(int id, String titulo, Editorial editorial, Genero genero, Autor autor, Date annoPublicacion, String isbn, int inventario) {
        this.id = id;
        this.titulo = titulo;
        this.editorial = editorial;
        this.genero = genero;
        this.autor = autor;
        this.annoPublicacion = annoPublicacion;
        this.isbn = isbn;
        this.inventario = inventario;
    }


    public int getId() {
        return id;
    }

    public String getTitulo() {
        return titulo;
    }

    public Editorial getEditorial() {
        return editorial;
    }

    public void setEditorial(Editorial editorial) {
        this.editorial = editorial;
    }

    public Genero getGenero() {
        return genero;
    }

    public Autor getAutor() {
        return autor;
    }

    public Date getAnnoPublicacion() {
        return annoPublicacion;
    }

    public String getIsbn() {
        return isbn;
    }

    public int getInventario() {
        return inventario;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public void setGenero(Genero genero) {
        this.genero = genero;
    }

    public void setAutor(Autor autor) {
        this.autor = autor;
    }

    public void setAnnoPublicacion(Date annoPublicacion) {
        this.annoPublicacion = annoPublicacion;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public void setInventario(int inventario) {
        this.inventario = inventario;
    }
    
    
    
}

