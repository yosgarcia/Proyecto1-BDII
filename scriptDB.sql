
-- Creacion de secuencias
CREATE SEQUENCE seq_clientes START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_autor START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_libro START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_editorial START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_genero START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_prestamos START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_resena START WITH 1 INCREMENT BY 1;

CREATE TABLE Clientes (
    id NUMBER DEFAULT seq_clientes.NEXTVAL NOT NULL,
    nombre VARCHAR2(25 char) NOT NULL,
    correo VARCHAR2(25 char) NOT NULL,
    telefono VARCHAR2(15) NOT NULL,
    CONSTRAINT clientes_pk PRIMARY KEY (id)
);

CREATE TABLE Autor (
    id NUMBER DEFAULT seq_autor.NEXTVAL NOT NULL,
    nombre VARCHAR2(25 char) NOT NULL,
    apellido VARCHAR2(25 char) NOT NULL,
    nacionalidad VARCHAR2(50 char) NOT NULL,
    CONSTRAINT autor_pk PRIMARY KEY (id)
);

CREATE TABLE Editorial (
    id NUMBER DEFAULT seq_editorial.NEXTVAL NOT NULL,
    nombre VARCHAR2(50 char) NOT NULL,
    origen VARCHAR2(20 char) NOT NULL,
    CONSTRAINT editorial_pk PRIMARY KEY (id)
);

CREATE TABLE Genero (
    id NUMBER DEFAULT seq_genero.NEXTVAL NOT NULL,
    nombre VARCHAR2(25 char) NOT NULL,
    CONSTRAINT genero_pk PRIMARY KEY (id)
);

CREATE TABLE Libro (
    id NUMBER DEFAULT seq_libro.NEXTVAL NOT NULL,
    titulo VARCHAR2(55 char) NOT NULL,
    editorial_id NUMBER NOT NULL,
    genero_id NUMBER NOT NULL,
    autor_id NUMBER NOT NULL,
    año_publicacion DATE NOT NULL,
    isbn VARCHAR2(20 char) NOT NULL,
    inventario NUMBER NOT NULL,
    CONSTRAINT libro_pk PRIMARY KEY (id),
    CONSTRAINT libro_editorial_fk FOREIGN KEY (editorial_id) REFERENCES Editorial(id),
    CONSTRAINT libro_genero_fk FOREIGN KEY (genero_id) REFERENCES Genero(id),
    CONSTRAINT libro_autor_fk FOREIGN KEY (autor_id) REFERENCES Autor(id)
);


CREATE TABLE Prestamos (
    id NUMBER DEFAULT seq_prestamos.NEXTVAL NOT NULL,
    fecha_prestamo DATE NOT NULL,
    fecha_devolucion DATE NOT NULL,
    libro_id NUMBER NOT NULL,
    cliente_id NUMBER NOT NULL,
    CONSTRAINT prestamo_pk PRIMARY KEY (ID),
    CONSTRAINT prestamo_libro_fk FOREIGN KEY (libro_id) REFERENCES Libro(id),
    CONSTRAINT prestamo_cliente_fk FOREIGN KEY (cliente_id) REFERENCES Cliente(id)
);

CREATE TABLE Resena (
    id NUMBER DEFAULT seq_resena.NEXTVAL NOT NULL,
    descripcion VARCHAR2(200 char) NOT NULL,
    calificacion NUMBER NOT NULL,
    libro_id NUMBER NOT NULL,
    cliente_id NUMBER NOT NULL,
    CONSTRAINT resena_pk PRIMARY KEY,
    CONSTRAINT resena_libro_fk FOREIGN KEY (libro_id) REFERENCES Libro(id),
    CONSTRAINT resena_cliente_fk FOREIGN KEY (cliente_id) REFERENCES Clientes(id)
);

-- cliente 

CREATE OR REPLACE PACKAGE paquete_modificaciones AS 
    FUNCTION insertar_cliente (nombre_cliente cliente.nombre%TYPE, correo_cliente cliente.correo%TYPE,
                            telefono_cliente cliente.telefono%TYPE) RETURN NUMBER;
    FUNCTION insertar_autor (nombre_autor autor.nombre%TYPE, apellido_autor autor.apellido%TYPE,
                            nacionalidad_autor autor.nacionalidad%TYPE) RETURN NUMBER;
    FUNCTION insertar_editorial(p_nombre editorial.nombre%TYPE, p_origen editorial.origen%TYPE) RETURN NUMBER;
    FUNCTION insertar_genero(p_nombre genero.nombre%TYPE) RETURN NUMBER;
END paquete_modificaciones;

    
CREATE OR REPLACE PACKAGE BODY paquete_modificciones AS 
    FUNCTION insertar_cliente(nombre_cliente cliente.nombre%TYPE, correo_cliente cliente.correo%TYPE,
                            telefono_cliente cliente.telefono%TYPE)
    RETURN NUMBER IS 
    n_cliente cliente.id%TYPE;
    BEGIN
        SELECT seq_clientes.NEXTVAL INTO n_cliente FROM dual;
        INSERT INTO clientes VALUES (nombre_cliente, correo_cliente, telefono_cliente);
        RETURN (n_cliente);
    END nuevo_cliente;
    
    
    FUNCTION insertar_autor(nombre_autor autor.nombre%TYPE, apellido_autor autor.apellido%TYPE,
                            nacionalidad_autor autor.nacionalidad%TYPE) 
    RETURN NUMBER IS
    n_autor autor.id%TYPE;
    BEGIN
        SELECT seq_autor.NEXTVAL INTO n_autor FROM dual;
        INSERT INTO autor VALUES (nombre_autor, apellido_autor, nacionalidad_autor);
        RETURN (n_autor);
    END nuevo_autor;
    
    
    FUNCTION insertar_editorial(p_nombre editorial.nombre%TYPE, p_origen editorial.origen%TYPE)
    RETURN NUMBER IS
    n_editorial editorial.id%TYPE;
    BEGIN
        SELECT seq_editorial.NEXTVAL INTO n_editorial FROM dual;
        INSERT INTO Editorial VALUES (p_nombre, p_origen);
        RETURN n_editorial;
    END;
    
    
    FUNCTION insertar_genero(p_nombre genero.nombre%TYPE)
    RETURN NUMBER IS
    n_genero genero.id%TYPE;
    BEGIN
        SELECT seq_genero.NEXTVAL INTO n_genero FROM dual;
        INSERT INTO genero VALUES (p_nombre);
        RETURN n_genero;
    END;
    
END paquete_modificaciones;


drop table prestamos;
drop table clientes;
drop table autores;
drop table resena;
drop table genero;
drop table libro;
drop table editorial;