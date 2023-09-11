
-- Creacion de secuencias
CREATE SEQUENCE seq_clientes START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_autor START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_libro START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_editorial START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_genero START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_prestamos START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_resena START WITH 1 INCREMENT BY 1;

CREATE TABLE Clientes_p1 (
    id NUMBER DEFAULT seq_clientes.NEXTVAL NOT NULL,
    nombre VARCHAR2(25 char) NOT NULL,
    apellido VARCHAR2(25 char) NOT NULL,
    correo VARCHAR2(25 char) NOT NULL,
    telefono VARCHAR2(15) NOT NULL,
    CONSTRAINT clientes_pk PRIMARY KEY (id)
);

CREATE TABLE Autor_p1 (
    id NUMBER DEFAULT seq_autor.NEXTVAL NOT NULL,
    nombre VARCHAR2(25 char) NOT NULL,
    apellido VARCHAR2(25 char) NOT NULL,
    nacionalidad VARCHAR2(50 char) NOT NULL,
    CONSTRAINT autor_pk PRIMARY KEY (id)
);

CREATE TABLE Editorial_p1 (
    id NUMBER DEFAULT seq_editorial.NEXTVAL NOT NULL,
    nombre VARCHAR2(50 char) NOT NULL,
    origen VARCHAR2(20 char) NOT NULL,
    CONSTRAINT editorial_pk PRIMARY KEY (id)
);

CREATE TABLE Genero_p1 (
    id NUMBER DEFAULT seq_genero.NEXTVAL NOT NULL,
    nombre VARCHAR2(25 char) NOT NULL,
    CONSTRAINT genero_pk PRIMARY KEY (id)
);

CREATE TABLE Libro_p1 (
    id NUMBER DEFAULT seq_libro.NEXTVAL NOT NULL,
    titulo VARCHAR2(55 char) NOT NULL,
    editorial_id NUMBER NOT NULL,
    genero_id NUMBER NOT NULL,
    autor_id NUMBER NOT NULL,
    anno_publicacion DATE NOT NULL,
    isbn VARCHAR2(20 char) NOT NULL,
    inventario NUMBER NOT NULL,
    CONSTRAINT libro_pk PRIMARY KEY (id),
    CONSTRAINT libro_editorial_fk FOREIGN KEY (editorial_id) REFERENCES Editorial(id),
    CONSTRAINT libro_genero_fk FOREIGN KEY (genero_id) REFERENCES Genero(id),
    CONSTRAINT libro_autor_fk FOREIGN KEY (autor_id) REFERENCES Autor(id)
);


CREATE TABLE Prestamos_p1 (
    id NUMBER DEFAULT seq_prestamos.NEXTVAL NOT NULL,
    fecha_prestamo DATE NOT NULL,
    fecha_devolucion DATE NOT NULL,
    libro_id NUMBER NOT NULL,
    cliente_id NUMBER NOT NULL,
    CONSTRAINT prestamo_pk PRIMARY KEY (ID),
    CONSTRAINT prestamo_libro_fk FOREIGN KEY (libro_id) REFERENCES Libro(id),
    CONSTRAINT prestamo_cliente_fk FOREIGN KEY (cliente_id) REFERENCES Cliente(id)
);

CREATE TABLE Resena_p1 (
    id NUMBER DEFAULT seq_resena.NEXTVAL NOT NULL,
    descripcion VARCHAR2(200 char) NOT NULL,
    calificacion NUMBER NOT NULL,
    libro_id NUMBER NOT NULL,
    cliente_id NUMBER NOT NULL,
    CONSTRAINT resena_pk PRIMARY KEY,
    CONSTRAINT resena_libro_fk FOREIGN KEY (libro_id) REFERENCES Libro(id),
    CONSTRAINT resena_cliente_fk FOREIGN KEY (cliente_id) REFERENCES Clientes(id)
);



CREATE OR REPLACE PACKAGE paquete_modificaciones_p1 AS 
    FUNCTION insertar_cliente (p_nombre cliente.nombre%TYPE, p_apellido cliente.apellido%TYPE, p_correo cliente.correo%TYPE,
                            p_telefono cliente.telefono%TYPE) RETURN NUMBER;
    FUNCTION insertar_autor (p_nombre autor.nombre%TYPE, p_apellido autor.apellido%TYPE,
                            p_nacionalidad autor.nacionalidad%TYPE) RETURN NUMBER;
    FUNCTION insertar_editorial(p_nombre editorial.nombre%TYPE, p_origen editorial.origen%TYPE) RETURN NUMBER;
    FUNCTION insertar_genero(p_nombre genero.nombre%TYPE) RETURN NUMBER;
    
    FUNCTION insertar_libro (p_titulo libro.titulo%TYPE, p_editorial libro.editorial_id%TYPE,
                            p_genero libro.genero_id%TYPE, p_autor libro.autor_id%TYPE,
                            p_anno libro.anno_publicacion%TYPE, p_isbn libro.isbn%TYPE,
                            p_inventario libro.inventario%TYPE) RETURN NUMBER;
    FUNCTION insertar_prestamo(p_fecha_prestamo prestamos.fecha_prestamo%TYPE, 
                                p_fecha_devolucion prestamos.fecha_devolucion%TYPE,
                                p_libro prestamos.libro_id%TYPE, p_cliente prestamos.cliente_id%TYPE) RETURN NUMBER;
    
    FUNCTION insertar_resena(p_descripcion resena.descripccion%TYPE, p_calificacion resena.calificacion%TYPE,
                                p_libro resena.libro_id%TYPE, p_cliente resena.cliente_id%TYPE) RETURN NUMBER;
    
    PROCEDURE modificar_cliente(p_id lientes.id%TYPE, p_nombre clientes.nombre%TYPE, p_apellido clientes.apellido%TYPE,
                                p_correo clientes.correo%TYPE, p_telefono clientes.telefono%TYPE);
    
    PROCEDURE modificar_autor(p_id autor.id%TYPE, p_nombre autor.nombre%TYPE,
                                p_apellido autor.apellido%TYPE, p_nacionalidad autor.nacionalidad%TYPE);

    PROCEDURE modificar_editorial(p_id editorial.id%TYPE, p_nombre editorial.nombre%TYPE,
                                    p_origen editorial.origen%TYPE);

    PROCEDURE modificar_genero(p_id genero.id%TYPE, p_nombre genero.nombre%TYPE);

    PROCEDURE modificar_libro(p_id libro.id%TYPE, p_titulo libro.titutlo%TYPE, p_editorial libro.editorial_id%TYPE,
                                p_genero libro.genero_id%TYPE, p_autor libro.autor_id%TYPE,
                                p_anno_publicacion libro.anno_publicacion%TYPE, p_isbn libro.isbn%TYPE,
                                p_inventario libro.inventario%TYPE);

    PROCEDURE modificar_prestamos(p_id prestamos.id%TYPE, p_fecha_prestamo prestamos.fecha_prestamo%TYPE,
                                    p_fecha_devolucion prestamos.fecha_devolucion%TYPE, p_libro prestamos.libro_id%TYPE,
                                    p_cliente prestamos.cliente_id%TYPE);

    PROCEDURE modificar_resena(p_id resena.id%TYPE, p_descripcion resena.descripcion%TYPE,
                                p_calificacion resena.calificacion%TYPE, p_libro resena.libro_id%TYPE,
                                p_cliente resena.cliente_id%TYPE);
    
    PROCEDURE borrar_cliente(p_id cliente.id%TYPE);
    
    PROCEDURE borrar_autor(p_id autor.id%TYPE);
    
    PROCEDURE borrar_editorial(p_id editorial.id%TYPE); 
    
    PROCEDURE borrar_genero(p_id genero.id%TYPE);
    
    PROCEDURE borrar_libro(p_id libro.id%TYPE);
    
    PROCEDURE borrar_resena(p_id resena.id%TYPE);
    
    PROCEDURE borrar_prestamos(p_id prestamos.id%TYPE);
    
END paquete_modificaciones_p1;

    
CREATE OR REPLACE PACKAGE BODY paquete_modificciones_p1 AS 
    FUNCTION insertar_cliente(p_nombre cliente.nombre%TYPE, p_apellido cliente.apellido%TYPE, p_correo cliente.correo%TYPE,
                            p_telefono cliente.telefono%TYPE)
    RETURN NUMBER IS 
    n_cliente cliente.id%TYPE;
    BEGIN
        SELECT seq_clientes.NEXTVAL INTO n_cliente FROM dual;
        INSERT INTO clientes VALUES (nombre_cliente, correo_cliente, telefono_cliente);
        RETURN (n_cliente);
    END nuevo_cliente;
    
    
    FUNCTION insertar_autor(p_nombre autor.nombre%TYPE, p_apellido autor.apellido%TYPE,
                            p_nacionalidad autor.nacionalidad%TYPE) 
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
    
    
    FUNCTION insertar_libro (p_titulo libro.titulo%TYPE, p_editorial libro.editorial_id%TYPE,
                            p_genero libro.genero_id%TYPE, p_autor libro.autor_id%TYPE,
                            p_anno libro.anno_publicacion%TYPE, p_isbn libro.isbn%TYPE,
                            p_inventario libro.inventario%TYPE)
    RETURN NUMBER IS
    n_libro libro.id%TYPE;
    BEGIN
        SELECT seq_libro.NEXTVAL INTO n_libro FROM dual;
        INSERT INTO libro VALUES (p_titulo, p_editorial, p_genero, p_autor,
                                    p_anno, p_isbn, p_inventario);
        RETURN n_libro;
    END;
    
    FUNCTION insertar_prestamo(p_fecha_prestamo prestamos.fecha_prestamo%TYPE, 
                                p_fecha_devolucion prestamos.fecha_devolucion%TYPE,
                                p_libro prestamos.libro_id%TYPE, p_cliente prestamos.cliente_id%TYPE)
    RETURN NUMBER IS
    n_prestamos prestamos.id%TYPE;
    BEGIN
        SELECT seq_prestamos.NEXTVAL INTO n_prestamos FROM dual;
        INSERT INTO prestamos VALUES (p_fecha_prestamo, p_fecha_devolucion, p_libro, p_ccliente);
        RETURN n_prestamos;
    END;
    
    
    FUNCTION insertar_resena(p_descripcion resena.descripccion%TYPE, p_calificacion resena.calificacion%TYPE,
                                p_libro resena.libro_id%TYPE, p_cliente resena.cliente_id%TYPE)
    RETURN NUMBER IS
    n_resena resena.id%TYPE;
    BEGIN
        SELECT seq_resena.NEXTVAL INTO n_resena FROM dual;
        INSERT INTO resena VALUES (p_descripcion, p_calificacion, p_libro, p_cliente);
        RETURN n_resena;
    END;
    
    
    PROCEDURE modificar_cliente(p_id clientes.id%TYPE, p_nombre clientes.nombre%TYPE, p_apellido clientes.apellido%TYPE,
                                p_correo clientes.correo%TYPE, p_telefono clientes.telefono%TYPE) IS
    BEGIN
        UPDATE clientes
        SET nombre = p_nombre, apellido = p_apellido, correo = p_correo, telefono = p_telefono
        WHERE id = p_id;
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);       
    END;
    
    PROCEDURE modificar_autor(p_id autor.id%TYPE, p_nombre autor.nombre%TYPE,
                                p_apellido autor.apellido%TYPE, p_nacionalidad autor.nacionalidad%TYPE) IS
    BEGIN
        UPDATE autor
        SET nombre = p_nombre, apellido = p_apellido, nacionalidad = p_nacionalidad
        WHERE id = p_id;
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
    END;
    
    
    PROCEDURE modificar_editorial(p_id editorial.id%TYPE, p_nombre editorial.nombre%TYPE,
                                    p_origen editorial.origen%TYPE) IS
    BEGIN
        UPDATE autor
        SET nombre = p_nombre, p_origen = origen
        WHERE id = p_id;
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
    END;
    
    PROCEDURE modificar_genero(p_id genero.id%TYPE, p_nombre genero.nombre%TYPE) IS
    BEGIN
        UPDATE genero
        SET nombre = p_nombre
        WHERE id = p_id;
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
    END;
    
    
    PROCEDURE modificar_libro(p_id libro.id%TYPE, p_titulo libro.titutlo%TYPE, p_editorial libro.editorial_id%TYPE,
                                p_genero libro.genero_id%TYPE, p_autor libro.autor_id%TYPE,
                                p_anno_publicacion libro.anno_publicacion%TYPE, p_isbn libro.isbn%TYPE,
                                p_inventario libro.inventario%TYPE) IS
    BEGIN
        UPDATE libro
        SET titulo = p_titulo, editorial_id = p_editorial, genero_id = p_genero, autor_id = p_autor,
            anno_publicacion = p_anno_publicacion, isbn = p_isbn, inventario = p_inventario
        WHERE id = p_id;
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
    END;
    
    
    PROCEDURE modificar_prestamos(p_id prestamos.id%TYPE, p_fecha_prestamo prestamos.fecha_prestamo%TYPE,
                                    p_fecha_devolucion prestamos.fecha_devolucion%TYPE, p_libro prestamos.libro_id%TYPE,
                                    p_cliente prestamos.cliente_id%TYPE) IS
    BEGIN
        UPDATE prestamos
        SET fecha_prestamo = p_fecha_prestamo, fecha_devolucion = p_fecha_devolucion, 
            libro_id = p_libro, cliente_id = p_cliente
        WHERE id = p_id;
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
    END;
    
    
    PROCEDURE modificar_resena(p_id resena.id%TYPE, p_descripcion resena.descripcion%TYPE,
                                p_calificacion resena.calificacion%TYPE, p_libro resena.libro_id%TYPE,
                                p_cliente resena.cliente_id%TYPE) IS
    BEGIN
        UPDATE resena
        SET descripcion = p_descripcion, calificacion = p_calificacion, libro_id = p_libro,
            cliente_id = p_cliente
        WHERE id = p_id;
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
    END;
    
    -- PROCEDIMIENTO PARA BORRAR CLIENTE
    PROCEDURE borrar_cliente(p_id cliente.id%TYPE) IS
    c_cont NUMBER;
    BEGIN
        SELECT COUNT(*) INTO c_cont
        FROM clientes c
        WHERE c.id = p_id;
        
        IF c_cont = 1 THEN
            -- Si el cliente existe en la BD
            DELETE FROM cliente
            WHERE id = p_id;
            IF SQL%ROWCOUNT = 1 THEN
                COMMIT;
                DBMS_OUTPUT.PUT_LINE('Cliente con ID ' || p_id || ' eliminado exitosamente');
            ELSE
                ROLLBACK;
                DBMS_OUTPUT.PUT_LINE('No se pudo eliminar cliente con ID: ' || p_id);
            END IF;
        ELSE
            DBMS_OUTPUT.PUT_LINE('Cliente con ID ' || p_id || ' no existe.');
        END IF;
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Error al eliminar cliente: ' || SQLERRM);
    END;
    
    -- PROCEDIMIENTO PARA BORRAR AUTOR
    PROCEDURE borrar_autor(p_id autor.id%TYPE) IS
    a_cont NUMBER;
    BEGIN
        SELECT COUNT(*) INTO a_cont
        FROM autor a
        WHERE a.id = p_id;
        
        IF a_cont = 1 THEN
            -- Si el autor existe en la BD
            DELETE FROM autor
            WHERE id = p_id;
            IF SQL%ROWCOUNT = 1 THEN
                COMMIT;
                DBMS_OUTPUT.PUT_LINE('Autor con ID ' || p_id || ' eliminado exitosamente');
            ELSE
                ROLLBACK;
                DBMS_OUTPUT.PUT_LINE('No se pudo eliminar autor con ID: ' || p_id);
            END IF;
        ELSE
            DBMS_OUTPUT.PUT_LINE('Autor con ID ' || p_id || ' no existe.');
        END IF;
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Error al eliminar autor: ' || SQLERRM);
    END;
    
    -- PROCEDIMIENTO PARA BORRAR UNA EDITORIAL
    PROCEDURE borrar_editorial(p_id editorial.id%TYPE) IS
    e_cont NUMBER;
    BEGIN
        SELECT COUNT(*) INTO e_cont
        FROM editorial e
        WHERE e.id = p_id;
        
        IF e_cont = 1 THEN
            -- Si la editorial existe en la BD
            DELETE FROM editorial
            WHERE id = p_id;
            IF SQL%ROWCOUNT = 1 THEN
                COMMIT;
                DBMS_OUTPUT.PUT_LINE('Editorial con ID ' || p_id || ' eliminado exitosamente');
            ELSE
                ROLLBACK;
                DBMS_OUTPUT.PUT_LINE('No se pudo eliminar editorial con ID: ' || p_id);
            END IF;
        ELSE
            DBMS_OUTPUT.PUT_LINE('Editorial con ID ' || p_id || ' no existe.');
        END IF;
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Error al eliminar editorial: ' || SQLERRM);
    END;
    
    
    -- PROCEDIMIENTO PARA BORRAR UN GENERO
    PROCEDURE borrar_genero(p_id genero.id%TYPE) IS
    g_cont NUMBER;
    BEGIN
        SELECT COUNT(*) INTO g_cont
        FROM genero g
        WHERE g.id = p_id;
        
        IF g_cont = 1 THEN
            -- Si el genero existe en la BD
            DELETE FROM genero
            WHERE id = p_id;
            IF SQL%ROWCOUNT = 1 THEN
                COMMIT;
                DBMS_OUTPUT.PUT_LINE('Genero con ID ' || p_id || ' eliminado exitosamente');
            ELSE
                ROLLBACK;
                DBMS_OUTPUT.PUT_LINE('No se pudo eliminar genero con ID: ' || p_id);
            END IF;
        ELSE
            DBMS_OUTPUT.PUT_LINE('Genero con ID ' || p_id || ' no existe.');
        END IF;
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Error al eliminar reseña: ' || SQLERRM);
    END;
    
    -- PROCEDIMIENTO PARA BORRAR UN LIBRO
    PROCEDURE borrar_libro(p_id libro.id%TYPE) IS
        l_cont NUMBER;
    BEGIN
        SELECT COUNT(*) INTO l_cont
        FROM libro l
        WHERE l.id = p_id;
        
        IF l_cont = 1 THEN
            -- Si el libro existe en la BD
            DELETE FROM libro
            WHERE id = p_id;
            IF SQL%ROWCOUNT = 1 THEN
                COMMIT;
                DBMS_OUTPUT.PUT_LINE('Libro con ID ' || p_id || ' eliminado exitosamente');
            ELSE
                ROLLBACK;
                DBMS_OUTPUT.PUT_LINE('No se pudo eliminar libro con ID: ' || p_id);
            END IF;
        ELSE
            DBMS_OUTPUT.PUT_LINE('Libro con ID ' || p_id || ' no existe.');
        END IF;
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Error al eliminar libro: ' || SQLERRM);
    END;
    
    -- PROCEDIMIENTO PARA BORRAR UNA RESEÑA
    PROCEDURE borrar_resena(p_id resena.id%TYPE) IS
        r_cont NUMBER;
    BEGIN
        SELECT COUNT(*) INTO r_cont
        FROM resena r
        WHERE r.id = p_id;
        
        IF r_cont = 1 THEN
            -- Si ka reseña existe en la BD
            DELETE FROM resena
            WHERE id = p_id;
            IF SQL%ROWCOUNT = 1 THEN
                COMMIT;
                DBMS_OUTPUT.PUT_LINE('Reseña con ID ' || p_id || ' eliminado exitosamente');
            ELSE
                ROLLBACK;
                DBMS_OUTPUT.PUT_LINE('No se pudo eliminar reseña con ID: ' || p_id);
            END IF;
        ELSE
            DBMS_OUTPUT.PUT_LINE('Reseña con ID ' || p_id || ' no existe.');
        END IF;
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Error al eliminar reseña: ' || SQLERRM);
    END;
    
    
    -- PROCEDIMIENTO PARA BORRAR UN PRESTAMO
    PROCEDURE borrar_prestamos(p_id prestamos.id%TYPE) IS
        p_cont NUMBER;
    BEGIN
        SELECT COUNT(*) INTO p_cont
        FROM prestamo p
        WHERE p.id = p_id;
        
        IF p_cont = 1 THEN
            -- Si el prestamo existe en la BD
            DELETE FROM prestamo
            WHERE id = p_id;
            IF SQL%ROWCOUNT = 1 THEN
                COMMIT;
                DBMS_OUTPUT.PUT_LINE('Prestamo con ID ' || p_id || ' eliminado exitosamente');
            ELSE
                ROLLBACK;
                DBMS_OUTPUT.PUT_LINE('No se pudo eliminar prestamo con ID: ' || p_id);
            END IF;
        ELSE
            DBMS_OUTPUT.PUT_LINE('Prestamo con ID ' || p_id || ' no existe.');
        END IF;
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Error al eliminar prestamo: ' || SQLERRM);
    END;
    
END paquete_modificaciones_p1;



CREATE OR REPLACE PACKAGE paquete_consultas_p1 AS
    PROCEDURE mostrar_todos_clientes;
    
    PROCEDURE mostrar_cliente_id (p_id clientes_p1.id%TYPE);
    
    PROCEDURE mostrar_todos_autores;
    
    PROCEDURE mostrar_autor_id (p_id autor_p1.id%TYPE);
    
    PROCEDURE mostrar_todos_editoriales;
    
    PROCEDURE mostrar_editorial_id (p_id editorial_p1.id%TYPE);
    
    PROCEDURE mostrar_todos_generos;
    
    PROCEDURE mostrar_genero_id (p_id genero_p1.id%TYPE);
    
    PROCEDURE mostrar_todos_libros;
    
    PROCEDURE mostrar_libro_id (p_id libro_p1.id%TYPE);
    
    PROCEDURE mostrar_todos_resena;
    
    PROCEDURE mostrar_resena_id (p_id resena_p1.id%TYPE);
    
    PROCEDURE mostrar_todos_prestamos;
    
    PROCEDURE mostrar_prestamos_id (p_id prestamos_p1.id%TYPE);
END paquete_consultas_p1;


CREATE OR REPLACE PACKAGE BODY paquete_consultas_p1 AS
    PROCEDURE mostrar_todos_clientes AS
    BEGIN
        SELECT * FROM clientes_p1;
    END;
    
    PROCEDURE mostrar_cliente_id (p_id clientes_p1.id%TYPE)AS
    BEGIN
        SELECT *
        FROM clientes_p1 c
        WHERE c.id = p_id;
    END;
    
    PROCEDURE mostrar_todos_autores AS
    BEGIN
        SELECT * FROM autor_p1;
    END;
    
    PROCEDURE mostrar_autor_id (p_id autor_p1.id%TYPE)AS
    BEGIN
        SELECT *
        FROM autor_p1 a
        WHERE a.id = p_id;
    END;
    
    
    PROCEDURE mostrar_todos_editoriales AS
    BEGIN
        SELECT * FROM editorial_p1;
    END;
    
    PROCEDURE mostrar_editorial_id (p_id editorial_p1.id%TYPE)AS
    BEGIN
        SELECT *
        FROM editorial_p1 e
        WHERE e.id = p_id;
    END;
    
    PROCEDURE mostrar_todos_generos AS
    BEGIN
        SELECT * FROM genero_p1;
    END;
    
    PROCEDURE mostrar_genero_id (p_id genero_p1.id%TYPE)AS
    BEGIN
        SELECT *
        FROM genero_p1 g
        WHERE g.id = p_id;
    END;
    
    PROCEDURE mostrar_todos_libros AS
    BEGIN
        SELECT * FROM libro_p1;
    END;
    
    PROCEDURE mostrar_libro_id (p_id libro_p1.id%TYPE)AS
    BEGIN
        SELECT *
        FROM libro_p1 l
        WHERE l.id = p_id;
    END;
    
    PROCEDURE mostrar_todos_resena AS
    BEGIN
        SELECT * FROM resena_p1;
    END;
    
    PROCEDURE mostrar_resena_id (p_id resena_p1.id%TYPE)AS
    BEGIN
        SELECT *
        FROM resena_p1 r
        WHERE r.id = p_id;
    END;
    
    PROCEDURE mostrar_todos_prestamos AS
    BEGIN
        SELECT * FROM prestamos_p1;
    END;
    
    PROCEDURE mostrar_prestamos_id (p_id prestamos_p1.id%TYPE)AS
    BEGIN
        SELECT *
        FROM prestamos_p1 p
        WHERE p.id = p_id;
    END;
    
END paquete_consultas_p1;

drop table prestamos_p1;
drop table resena_p1;
drop table libro_p1;
drop table genero_p1;
drop table editorial_p1;
drop table autor_p1;
drop table clientes_p1;

