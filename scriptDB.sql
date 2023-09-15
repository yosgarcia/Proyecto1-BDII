-- Creacion de secuencias
CREATE SEQUENCE seq_clientes START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_empleado START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_autor START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_libro START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_editorial START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_genero START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_prestamos START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_resena START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_bitacora START WITH 1 INCREMENT BY 1;

CREATE TABLE Clientes_p1 (
    id NUMBER DEFAULT seq_clientes.NEXTVAL NOT NULL,
    nombre VARCHAR2(25 char) NOT NULL,
    apellido VARCHAR2(25 char) NOT NULL,
    correo VARCHAR2(35 char) NOT NULL,
    telefono VARCHAR2(15) NOT NULL,
    CONSTRAINT clientes_pk PRIMARY KEY (id)
);

CREATE TABLE Empleado_p1 (
    id NUMBER DEFAULT seq_empleado.NEXTVAL NOT NULL,
    nombre VARCHAR2(25 char) NOT NULL,
    apellido VARCHAR2(25 char) NOT NULL,
    CONSTRAINT empleado_pk PRIMARY KEY (id)
);

CREATE TABLE Usuario_p1 (
    username VARCHAR2(50 char) NOT NULL,
    contrasenna VARCHAR2(25 char) NOT NULL, 
    empleado_id NUMBER NOT NULL,
    CONSTRAINT usuario_pk PRIMARY KEY (username),
    CONSTRAINT empleado_fk FOREIGN KEY (empleado_id) REFERENCES Empleado_p1(id)
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
    CONSTRAINT libro_editorial_fk FOREIGN KEY (editorial_id) REFERENCES Editorial_p1(id),
    CONSTRAINT libro_genero_fk FOREIGN KEY (genero_id) REFERENCES Genero_p1(id),
    CONSTRAINT libro_autor_fk FOREIGN KEY (autor_id) REFERENCES Autor_p1(id)
);


CREATE TABLE Prestamos_p1 (
    id NUMBER DEFAULT seq_prestamos.NEXTVAL NOT NULL,
    fecha_prestamo DATE NOT NULL,
    fecha_devolucion DATE NOT NULL,
    libro_id NUMBER NOT NULL,
    cliente_id NUMBER NOT NULL,
    CONSTRAINT prestamo_pk PRIMARY KEY (ID),
    CONSTRAINT prestamo_libro_fk FOREIGN KEY (libro_id) REFERENCES Libro_p1(id),
    CONSTRAINT prestamo_cliente_fk FOREIGN KEY (cliente_id) REFERENCES Clientes_p1(id)
);

CREATE TABLE Resena_p1 (
    id NUMBER DEFAULT seq_resena.NEXTVAL NOT NULL,
    descripcion VARCHAR2(200 char) NOT NULL,
    calificacion NUMBER NOT NULL,
    libro_id NUMBER NOT NULL,
    cliente_id NUMBER NOT NULL,
    CONSTRAINT resena_pk PRIMARY KEY (ID),
    CONSTRAINT resena_libro_fk FOREIGN KEY (libro_id) REFERENCES Libro_p1(id),
    CONSTRAINT resena_cliente_fk FOREIGN KEY (cliente_id) REFERENCES Clientes_p1(id)
);

CREATE TABLE Bitacora_libro_p1 (
    id NUMBER DEFAULT seq_bitacora.NEXTVAL NOT NULL,
    fecha DATETIME NOT NULL,
    usuario VARCHAR2(50 char) NOT NULL,
    descripcion VARCHAR2(250 char),
    CONSTRAINT bitacora_pk PRIMARY KEY (id),
    CONSTRAINT bitacora_usuario_fk FOREIGN KEY (usuario) REFERENCES Usuario_p1(username)
);


--INSERTS TABLA CLIENTE 
INSERT INTO Clientes_p1 (nombre, apellido, correo, telefono) VALUES ('Juan', 'Pérez', 'jjuanperez@ejemplo.com', '88563245');
INSERT INTO Clientes_p1 (nombre, apellido, correo, telefono) VALUES ('Lola', 'Hernandez', 'lolahernandez@ejemplo.com', '85648953');
INSERT INTO Clientes_p1 (nombre, apellido, correo, telefono) VALUES ('Yosward', 'Garcia', 'yoswigarcia@ejemplo.com', '88468995');
INSERT INTO Clientes_p1 (nombre, apellido, correo, telefono) VALUES ('Yurgen', 'Cambronero', 'yurgencitoelcabro@ejemplo.com', '87777953');
INSERT INTO Clientes_p1 (nombre, apellido, correo, telefono) VALUES ('Carlos', 'González', 'carlosgonzalez@ejemplo.com', '74691238');
INSERT INTO Clientes_p1 (nombre, apellido, correo, telefono) VALUES ('Ana', 'Martínez', 'anamartinez@ejemplo.com', '76582349');
INSERT INTO Clientes_p1 (nombre, apellido, correo, telefono) VALUES ('Pedro', 'Rodríguez', 'pedrorodriguez@ejemplo.com', '68743219');
INSERT INTO Clientes_p1 (nombre, apellido, correo, telefono) VALUES ('María', 'López', 'marialopez@ejemplo.com', '78654321');
INSERT INTO Clientes_p1 (nombre, apellido, correo, telefono) VALUES ('Diego', 'Sánchez', 'diegosanchez@ejemplo.com', '64758932');
INSERT INTO Clientes_p1 (nombre, apellido, correo, telefono) VALUES ('Laura', 'Ramírez', 'lauraramirez@ejemplo.com', '79865432');
INSERT INTO Clientes_p1 (nombre, apellido, correo, telefono) VALUES ('Javier', 'Pérez', 'javierperez@ejemplo.com', '68743125');
INSERT INTO Clientes_p1 (nombre, apellido, correo, telefono) VALUES ('Valentina', 'Gutiérrez', 'valentinagutierrez@ejemplo.com', '78564321');
INSERT INTO Clientes_p1 (nombre, apellido, correo, telefono) VALUES ('Santiago', 'Hernández', 'santiagohernandez@ejemplo.com', '74561289');
INSERT INTO Clientes_p1 (nombre, apellido, correo, telefono) VALUES ('Isabella', 'González', 'isabellagonzalez@ejemplo.com', '86423579');
INSERT INTO Clientes_p1 (nombre, apellido, correo, telefono) VALUES ('Leo', 'Mora', 'leoelpelos@ejemplo.com', '63547891');
INSERT INTO Clientes_p1 (nombre, apellido, correo, telefono) VALUES ('Lucía', 'Rodríguez', 'luciarodriguez@ejemplo.com', '78693245');
INSERT INTO Clientes_p1 (nombre, apellido, correo, telefono) VALUES ('Matías', 'López', 'matiaslopez@ejemplo.com', '67459823');
INSERT INTO Clientes_p1 (nombre, apellido, correo, telefono) VALUES ('Mariana', 'Sánchez', 'marianasanchez@ejemplo.com', '76584932');
INSERT INTO Clientes_p1 (nombre, apellido, correo, telefono) VALUES ('Emilio', 'Ramírez', 'emilioramirez@ejemplo.com', '87654321');
INSERT INTO Clientes_p1 (nombre, apellido, correo, telefono) VALUES ('Valeria', 'Pérez', 'valeriaperez@ejemplo.com', '68743215');
INSERT INTO Clientes_p1 (nombre, apellido, correo, telefono) VALUES ('Felipe', 'Gutiérrez', 'felipegutierrez@ejemplo.com', '74563129');
INSERT INTO Clientes_p1 (nombre, apellido, correo, telefono) VALUES ('Catalina', 'Hernández', 'catalinahernandez@ejemplo.com', '86451279');
INSERT INTO Clientes_p1 (nombre, apellido, correo, telefono) VALUES ('Facundo', 'González', 'facundogonzalez@ejemplo.com', '63547892');
INSERT INTO Clientes_p1 (nombre, apellido, correo, telefono) VALUES ('Antonella', 'Martínez', 'antonellamartinez@ejemplo.com', '76549832');
INSERT INTO Clientes_p1 (nombre, apellido, correo, telefono) VALUES ('Lucas', 'Rodríguez', 'lucasrodriguez@ejemplo.com', '78643921');
INSERT INTO Clientes_p1 (nombre, apellido, correo, telefono) VALUES ('Isidora', 'López', 'isidoralopez@ejemplo.com', '67459832');
INSERT INTO Clientes_p1 (nombre, apellido, correo, telefono) VALUES ('Benjamín', 'Sánchez', 'benjaminsanchez@ejemplo.com', '74563128');
INSERT INTO Clientes_p1 (nombre, apellido, correo, telefono) VALUES ('Renata', 'Ramírez', 'renataramirez@ejemplo.com', '87654931');
INSERT INTO Clientes_p1 (nombre, apellido, correo, telefono) VALUES ('Emiliano', 'Pérez', 'emilianoperez@ejemplo.com', '68743216');
INSERT INTO Clientes_p1 (nombre, apellido, correo, telefono) VALUES ('Valentino', 'Gutiérrez', 'valentinogutierrez@ejemplo.com', '74563127');
INSERT INTO Clientes_p1 (nombre, apellido, correo, telefono) VALUES ('Carmen', 'Hernández', 'carmenhernandez@ejemplo.com', '86451278');

select * from Clientes_p1;

--INSERTS TABLA AUTOR

INSERT INTO Autor_p1 (nombre, apellido, nacionalidad) VALUES ('J.K', 'Rowling', 'Británica');
INSERT INTO Autor_p1 (nombre, apellido, nacionalidad) VALUES ('Gabriel', 'García Márquez', 'Colombiana');
INSERT INTO Autor_p1 (nombre, apellido, nacionalidad) VALUES ('Mario', 'Vargas Llosa', 'Peruana');
INSERT INTO Autor_p1 (nombre, apellido, nacionalidad) VALUES ('Pablo', 'Neruda', 'Chilena');
INSERT INTO Autor_p1 (nombre, apellido, nacionalidad) VALUES ('Isabel', 'Allende', 'Chilena');
INSERT INTO Autor_p1 (nombre, apellido, nacionalidad) VALUES ('Gustavo', 'Adolfo Bécquer', 'Española');
INSERT INTO Autor_p1 (nombre, apellido, nacionalidad) VALUES ('Octavio', 'Paz', 'Mexicana');
INSERT INTO Autor_p1 (nombre, apellido, nacionalidad) VALUES ('Federico', 'García Lorca', 'Española');
INSERT INTO Autor_p1 (nombre, apellido, nacionalidad) VALUES ('Jorge', 'Borges', 'Argentina');
INSERT INTO Autor_p1 (nombre, apellido, nacionalidad) VALUES ('José', 'Saramago', 'Portuguesa');
INSERT INTO Autor_p1 (nombre, apellido, nacionalidad) VALUES ('Virginia', 'Woolf', 'Británica');
INSERT INTO Autor_p1 (nombre, apellido, nacionalidad) VALUES ('Alejandro', 'Dumas', 'Francesa');
INSERT INTO Autor_p1 (nombre, apellido, nacionalidad) VALUES ('León', 'Tolstói', 'Rusa');
INSERT INTO Autor_p1 (nombre, apellido, nacionalidad) VALUES ('George', 'Orwell', 'Británica');
INSERT INTO Autor_p1 (nombre, apellido, nacionalidad) VALUES ('Jane', 'Austen', 'Británica');
INSERT INTO Autor_p1 (nombre, apellido, nacionalidad) VALUES ('Haruki', 'Murakami', 'Japonesa');
INSERT INTO Autor_p1 (nombre, apellido, nacionalidad) VALUES ('Agatha', 'Christie', 'Británica');
INSERT INTO Autor_p1 (nombre, apellido, nacionalidad) VALUES ('Mark', 'Twain', 'Estadounidense');
INSERT INTO Autor_p1 (nombre, apellido, nacionalidad) VALUES ('Charles', 'Dickens', 'Británica');
INSERT INTO Autor_p1 (nombre, apellido, nacionalidad) VALUES ('Hermann', 'Hesse', 'Alemana');
INSERT INTO Autor_p1 (nombre, apellido, nacionalidad) VALUES ('Gabriela', 'Mistral', 'Chilena');
INSERT INTO Autor_p1 (nombre, apellido, nacionalidad) VALUES ('Albert', 'Camus', 'Francesa');
INSERT INTO Autor_p1 (nombre, apellido, nacionalidad) VALUES ('J.R.R', 'Tolkien', 'Británica');
INSERT INTO Autor_p1 (nombre, apellido, nacionalidad) VALUES ('Hans', 'Christian Andersen', 'Danesa');
INSERT INTO Autor_p1 (nombre, apellido, nacionalidad) VALUES ('Leo', 'Tolstoy', 'Rusa');
INSERT INTO Autor_p1 (nombre, apellido, nacionalidad) VALUES ('Anton', 'Chekhov', 'Rusa');
INSERT INTO Autor_p1 (nombre, apellido, nacionalidad) VALUES ('Jules', 'Verne', 'Francesa');
INSERT INTO Autor_p1 (nombre, apellido, nacionalidad) VALUES ('Rabindranath', 'Tagore', 'India');
INSERT INTO Autor_p1 (nombre, apellido, nacionalidad) VALUES ('Honoré', 'de Balzac', 'Francesa');
INSERT INTO Autor_p1 (nombre, apellido, nacionalidad) VALUES ('Edgar', 'Allan Poe', 'Estadounidense');
select * from Autor_p1;

--Inserts tabla editorial
INSERT INTO Editorial_p1 (nombre, origen) VALUES ('Editorial ABC', 'España');
INSERT INTO Editorial_p1 (nombre, origen) VALUES ('Penguin Random House', 'Estados Unidos');
INSERT INTO Editorial_p1 (nombre, origen) VALUES ('HarperCollins Publishers', 'Estados Unidos');
INSERT INTO Editorial_p1 (nombre, origen) VALUES ('Hachette Livre', 'Francia');
INSERT INTO Editorial_p1 (nombre, origen) VALUES ('Simon and Schuster', 'Estados Unidos');
INSERT INTO Editorial_p1 (nombre, origen) VALUES ('Macmillan Publishers', 'Estados Unidos');
INSERT INTO Editorial_p1 (nombre, origen) VALUES ('Scholastic Corporation', 'Estados Unidos');
INSERT INTO Editorial_p1 (nombre, origen) VALUES ('Springer Nature', 'Alemania');
INSERT INTO Editorial_p1 (nombre, origen) VALUES ('Pearson PLC', 'Reino Unido');
INSERT INTO Editorial_p1 (nombre, origen) VALUES ('Wiley', 'Estados Unidos');
INSERT INTO Editorial_p1 (nombre, origen) VALUES ('Oxford University Press', 'Reino Unido');
INSERT INTO Editorial_p1 (nombre, origen) VALUES ('Cambridge University Press', 'Reino Unido');
INSERT INTO Editorial_p1 (nombre, origen) VALUES ('Elsevier', 'Países Bajos');
INSERT INTO Editorial_p1 (nombre, origen) VALUES ('Houghton Mifflin Harcourt', 'Estados Unidos');
INSERT INTO Editorial_p1 (nombre, origen) VALUES ('Random House', 'Estados Unidos');
INSERT INTO Editorial_p1 (nombre, origen) VALUES ('Penguin Books', 'Reino Unido');
INSERT INTO Editorial_p1 (nombre, origen) VALUES ('Harvard University Press', 'Estados Unidos');
INSERT INTO Editorial_p1 (nombre, origen) VALUES ('Yale University Press', 'Estados Unidos');
INSERT INTO Editorial_p1 (nombre, origen) VALUES ('MIT Press', 'Estados Unidos');
INSERT INTO Editorial_p1 (nombre, origen) VALUES ('Taylor and Francis', 'Reino Unido');
INSERT INTO Editorial_p1 (nombre, origen) VALUES ('McGraw-Hill', 'Estados Unidos');
INSERT INTO Editorial_p1 (nombre, origen) VALUES ('W.W. Norton and Company', 'Estados Unidos');
INSERT INTO Editorial_p1 (nombre, origen) VALUES ('Harvard Business Review Press', 'Estados Unidos');
INSERT INTO Editorial_p1 (nombre, origen) VALUES ('Bloomsbury Publishing', 'Reino Unido');
INSERT INTO Editorial_p1 (nombre, origen) VALUES ('Harvard University Press', 'Estados Unidos');
INSERT INTO Editorial_p1 (nombre, origen) VALUES ('Columbia University Press', 'Estados Unidos');
INSERT INTO Editorial_p1 (nombre, origen) VALUES ('Princeton University Press', 'Estados Unidos');
INSERT INTO Editorial_p1 (nombre, origen) VALUES ('University of Chicago Press', 'Estados Unidos');
INSERT INTO Editorial_p1 (nombre, origen) VALUES ('Johns Hopkins University Press', 'Estados Unidos');
INSERT INTO Editorial_p1 (nombre, origen) VALUES ('Stanford University Press', 'Estados Unidos');

select * from Editorial_p1;

--Inserts TABLA GENERO
INSERT INTO Genero_p1 (nombre) VALUES ('Ficción');
INSERT INTO Genero_p1 (nombre) VALUES ('Realismo');
INSERT INTO Genero_p1 (nombre) VALUES ('Ciencia Ficción');
INSERT INTO Genero_p1 (nombre) VALUES ('Fantasía');
INSERT INTO Genero_p1 (nombre) VALUES ('Misterio');
INSERT INTO Genero_p1 (nombre) VALUES ('Terror');
INSERT INTO Genero_p1 (nombre) VALUES ('Aventura');
INSERT INTO Genero_p1 (nombre) VALUES ('Romance');
INSERT INTO Genero_p1 (nombre) VALUES ('Drama');
INSERT INTO Genero_p1 (nombre) VALUES ('Poesía');
INSERT INTO Genero_p1 (nombre) VALUES ('Biografía');
INSERT INTO Genero_p1 (nombre) VALUES ('Autobiografía');
INSERT INTO Genero_p1 (nombre) VALUES ('Historia');
INSERT INTO Genero_p1 (nombre) VALUES ('Ciencia');
INSERT INTO Genero_p1 (nombre) VALUES ('Economía');
INSERT INTO Genero_p1 (nombre) VALUES ('Política');
INSERT INTO Genero_p1 (nombre) VALUES ('Religión');
INSERT INTO Genero_p1 (nombre) VALUES ('Autoayuda');
INSERT INTO Genero_p1 (nombre) VALUES ('Aventuras Gráficas');
INSERT INTO Genero_p1 (nombre) VALUES ('Cómics');
INSERT INTO Genero_p1 (nombre) VALUES ('Novela Gráfica');
INSERT INTO Genero_p1 (nombre) VALUES ('Historieta');
INSERT INTO Genero_p1 (nombre) VALUES ('Ensayo');
INSERT INTO Genero_p1 (nombre) VALUES ('Filosofía');
INSERT INTO Genero_p1 (nombre) VALUES ('Viajes');
INSERT INTO Genero_p1 (nombre) VALUES ('Crimen');
INSERT INTO Genero_p1 (nombre) VALUES ('Humor');
INSERT INTO Genero_p1 (nombre) VALUES ('Ciencia y Naturaleza');
INSERT INTO Genero_p1 (nombre) VALUES ('Tecnología');
INSERT INTO Genero_p1 (nombre) VALUES ('Cocina');

select * from Genero_P1;

--Inserts tabla libro 

INSERT INTO Libro_p1 (titulo, editorial_id, genero_id, autor_id, anno_publicacion, isbn, inventario) VALUES ('Harry Potter y la Piedra Filosofal', 1, 4, 1, TO_DATE('1997-06-26', 'YYYY-MM-DD'), '978-0590353427', 50);

INSERT INTO Libro_p1 (titulo, editorial_id, genero_id, autor_id, anno_publicacion, isbn, inventario) VALUES ('100 años de soledad', 2, 1, 2, TO_DATE('1982-05-30', 'YYYY-MM-DD'), '978-9871234567', 45);

INSERT INTO Libro_p1 (titulo, editorial_id, genero_id, autor_id, anno_publicacion, isbn, inventario) VALUES ('La ciudad y los perros', 3, 1, 3, TO_DATE('1962-04-10', 'YYYY-MM-DD'), '978-1234567890', 55);

INSERT INTO Libro_p1 (titulo, editorial_id, genero_id, autor_id, anno_publicacion, isbn, inventario) VALUES ('Canto General', 4, 1, 4, TO_DATE('1950-05-30', 'YYYY-MM-DD'), '978-0307389732', 60);

INSERT INTO Libro_p1 (titulo, editorial_id, genero_id, autor_id, anno_publicacion, isbn, inventario) VALUES ('La casa de los espiritus', 5, 9, 5, TO_DATE('1982-08-14', 'YYYY-MM-DD'), '978-0143039969', 70);

INSERT INTO Libro_p1 (titulo, editorial_id, genero_id, autor_id, anno_publicacion, isbn, inventario) VALUES ('Rimas', 6, 9, 6, TO_DATE('1871-07-03', 'YYYY-MM-DD'), '978-8437600772', 40);

INSERT INTO Libro_p1 (titulo, editorial_id, genero_id, autor_id, anno_publicacion, isbn, inventario) VALUES ('Cronica de una muerte anunciada', 7, 1, 2, TO_DATE('1981-09-21', 'YYYY-MM-DD'), '978-0385541382', 55);

INSERT INTO Libro_p1 (titulo, editorial_id, genero_id, autor_id, anno_publicacion, isbn, inventario) VALUES ('Yerma', 8, 1, 8, TO_DATE('1934-06-30', 'YYYY-MM-DD'), '978-9871138124', 48);

INSERT INTO Libro_p1 (titulo, editorial_id, genero_id, autor_id, anno_publicacion, isbn, inventario) VALUES ('Ficciones', 9, 1, 9, TO_DATE('1945-08-01', 'YYYY-MM-DD'), '978-0156007757', 42);

INSERT INTO Libro_p1 (titulo, editorial_id, genero_id, autor_id, anno_publicacion, isbn, inventario) VALUES ('Los 3 mosqueteros', 10, 8, 12, TO_DATE('1844-05-14', 'YYYY-MM-DD'), '978-0156628709', 37);

INSERT INTO Libro_p1 (titulo, editorial_id, genero_id, autor_id, anno_publicacion, isbn, inventario) VALUES ('1984', 11, 1, 14, TO_DATE('1947-08-28', 'YYYY-MM-DD'), '978-0140449266', 65);

INSERT INTO Libro_p1 (titulo, editorial_id, genero_id, autor_id, anno_publicacion, isbn, inventario) VALUES ('Biblioteca de Babel', 12, 1, 9, TO_DATE('1941-01-01', 'YYYY-MM-DD'), '978-0199232765', 48);

INSERT INTO Libro_p1 (titulo, editorial_id, genero_id, autor_id, anno_publicacion, isbn, inventario) VALUES ('Del amor y otros demonios', 13, 3, 2, TO_DATE('1994-06-08', 'YYYY-MM-DD'), '978-0451524935', 38);

INSERT INTO Libro_p1 (titulo, editorial_id, genero_id, autor_id, anno_publicacion, isbn, inventario) VALUES ('Orgullo y prejuicio', 14, 1, 15, TO_DATE('1813-10-15', 'YYYY-MM-DD'), '978-0553213690', 42);

INSERT INTO Libro_p1 (titulo, editorial_id, genero_id, autor_id, anno_publicacion, isbn, inventario) VALUES ('Muerte en el Nilo', 15, 1, 17, TO_DATE('1937-08-04', 'YYYY-MM-DD'), '978-0375704024', 50);

INSERT INTO Libro_p1 (titulo, editorial_id, genero_id, autor_id, anno_publicacion, isbn, inventario) VALUES ('Las Manzanas', 16, 5, 17, TO_DATE('1969-01-01', 'YYYY-MM-DD'), '978-0062073501', 35);

INSERT INTO Libro_p1 (titulo, editorial_id, genero_id, autor_id, anno_publicacion, isbn, inventario) VALUES ('Las aventuras de Tom Sawyer', 17, 1, 18, TO_DATE('1876-12-01', 'YYYY-MM-DD'), '978-0486260035', 48);

INSERT INTO Libro_p1 (titulo, editorial_id, genero_id, autor_id, anno_publicacion, isbn, inventario) VALUES ('Historia de dos ciudades', 18, 1, 19, TO_DATE('1859-08-01', 'YYYY-MM-DD'), '978-0141439563', 42);

INSERT INTO Libro_p1 (titulo, editorial_id, genero_id, autor_id, anno_publicacion, isbn, inventario) VALUES ('Desolación', 19, 1, 21, TO_DATE('1922-01-01', 'YYYY-MM-DD'), '978-0142437186', 60);

INSERT INTO Libro_p1 (titulo, editorial_id, genero_id, autor_id, anno_publicacion, isbn, inventario) VALUES ('Tala', 20, 1, 21, TO_DATE('1938-01-01', 'YYYY-MM-DD'), '978-0553383805', 40);

INSERT INTO Libro_p1 (titulo, editorial_id, genero_id, autor_id, anno_publicacion, isbn, inventario) VALUES ('Guerra y Paz', 21, 1, 25, TO_DATE('1869-01-01', 'YYYY-MM-DD'), '978-0565953805', 30);

INSERT INTO Libro_p1 (titulo, editorial_id, genero_id, autor_id, anno_publicacion, isbn, inventario) VALUES ('El gato negro', 22, 1, 30, TO_DATE('1938-01-01', 'YYYY-MM-DD'), '978-0523873805', 40);

INSERT INTO Libro_p1 (titulo, editorial_id, genero_id, autor_id, anno_publicacion, isbn, inventario) VALUES ('El cuervo', 23, 1, 30, TO_DATE('1845-01-01', 'YYYY-MM-DD'), '978-0523873805', 40);

INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (primero, segundo, tercero, cuarto);

INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES (uno, dos, tres, cuatro);

INSERT INTO Bitacora_libro_p1 (fecha, usuario, descripcion) VALUES (uno, dos, tres);

select * from Autor_p1;
select apellido from Autor_p1;
CREATE OR REPLACE PACKAGE paquete_modificaciones_p1 AS 
    FUNCTION insertar_cliente (p_nombre clientes_p1.nombre%TYPE, p_apellido clientes_p1.apellido%TYPE, p_correo clientes_p1.correo%TYPE,
                            p_telefono clientes_p1.telefono%TYPE) RETURN NUMBER;
    FUNCTION insertar_autor (p_nombre autor_p1.nombre%TYPE, p_apellido autor_p1.apellido%TYPE,
                            p_nacionalidad autor_p1.nacionalidad%TYPE) RETURN NUMBER;
    FUNCTION insertar_editorial(p_nombre editorial_p1.nombre%TYPE, p_origen editorial_p1.origen%TYPE) RETURN NUMBER;
    FUNCTION insertar_genero(p_nombre genero_p1.nombre%TYPE) RETURN NUMBER;
    
    FUNCTION insertar_libro (p_titulo libro_p1.titulo%TYPE, p_editorial libro_p1.editorial_id%TYPE,
                            p_genero libro_p1.genero_id%TYPE, p_autor libro_p1.autor_id%TYPE,
                            p_anno libro_p1.anno_publicacion%TYPE, p_isbn libro_p1.isbn%TYPE,
                            p_inventario libro_p1.inventario%TYPE) RETURN NUMBER;
    FUNCTION insertar_prestamo(p_fecha_prestamo prestamos_p1.fecha_prestamo%TYPE, 
                                p_fecha_devolucion prestamos_p1.fecha_devolucion%TYPE,
                                p_libro prestamos_p1.libro_id%TYPE, p_cliente prestamos_p1.cliente_id%TYPE) RETURN NUMBER;
    
    FUNCTION insertar_resena(p_descripcion resena_p1.descripccion%TYPE, p_calificacion resena_p1.calificacion%TYPE,
                                p_libro resena_p1.libro_id%TYPE, p_cliente resena_p1.cliente_id%TYPE) RETURN NUMBER;
    
    FUNCTION insertar_empleado(p_nombre empleado_p1.nombre%TYPE,
                                p_apellido empleado_p1.apellido%TYPE) RETURN NUMBER;
    
    FUNCTION insertar_usuario(p_usuario usuario_p1.username%TYPE,
                                p_contrasenna usuario_p1.contrasenna%TYPE,
                                p_empleado usuario_p1.empleado_id%TYPE) RETURN VARCHAR2;
    
    PROCEDURE modificar_cliente(p_id clientes_p1.id%TYPE, p_nombre clientes_p1.nombre%TYPE, p_apellido clientes_p1.apellido%TYPE,
                                p_correo clientes_p1.correo%TYPE, p_telefono clientes_p1.telefono%TYPE);
    
    PROCEDURE modificar_autor(p_id autor_p1.id%TYPE, p_nombre autor_p1.nombre%TYPE,
                                p_apellido autor_p1.apellido%TYPE, p_nacionalidad autor_p1.nacionalidad%TYPE);

    PROCEDURE modificar_editorial(p_id editorial_p1.id%TYPE, p_nombre editorial_p1.nombre%TYPE,
                                    p_origen editorial_p1.origen%TYPE);

    PROCEDURE modificar_genero(p_id genero_p1.id%TYPE, p_nombre genero_p1.nombre%TYPE);

    PROCEDURE modificar_libro(p_id libro_p1.id%TYPE, p_titulo libro_p1.titutlo%TYPE, p_editorial libro_p1.editorial_id%TYPE,
                                p_genero libro_p1.genero_id%TYPE, p_autor libro_p1.autor_id%TYPE,
                                p_anno_publicacion libro_p1.anno_publicacion%TYPE, p_isbn libro_p1.isbn%TYPE,
                                p_inventario libro_p1.inventario%TYPE);

    PROCEDURE modificar_prestamos(p_id prestamos_p1.id%TYPE, p_fecha_prestamo prestamos_p1.fecha_prestamo%TYPE,
                                    p_fecha_devolucion prestamos_p1.fecha_devolucion%TYPE, p_libro prestamos_p1.libro_id%TYPE,
                                    p_cliente prestamos_p1.cliente_id%TYPE);

    PROCEDURE modificar_resena(p_id resena_p1.id%TYPE, p_descripcion resena_p1.descripcion%TYPE,
                                p_calificacion resena_p1.calificacion%TYPE, p_libro resena_p1.libro_id%TYPE,
                                p_cliente resena_p1.cliente_id%TYPE);
    
    PROCEDURE modificar_usuario(p_usuario usuario_p1.username%TYPE, p_contrasenna usuario_p1.contrasenna%TYPE,
                                    p_empleado usuario_p1.empleado_id%TYPE);
									
    PROCEDURE modificar_empleado(p_id empleado_p1.id%TYPE, p_nombre empleado_p1.nombre%TYPE,
                                    p_apellido empleado_p1.apellido%TYPE);
    
    PROCEDURE borrar_cliente(p_id clientes_p1.id%TYPE);
    
    PROCEDURE borrar_autor(p_id autor_p1.id%TYPE);
    
    PROCEDURE borrar_editorial(p_id editorial_p1.id%TYPE); 
    
    PROCEDURE borrar_genero(p_id genero_p1.id%TYPE);
    
    PROCEDURE borrar_libro(p_id libro_p1.id%TYPE);
    
    PROCEDURE borrar_resena(p_id resena_p1.id%TYPE);
    
    PROCEDURE borrar_prestamos(p_id prestamos_p1.id%TYPE);
    
    PROCEDURE borrar_empleado(p_id empleado_p1.id%TYPE);
    
    PROCEDURE borrar_usuario(p_usuario usuario_p1.username%TYPE);
    
    PROCEDURE borrar_bitacora_libro(p_id bitacora_libro_p1.id%TYPE);
    
END paquete_modificaciones_p1;

    
CREATE OR REPLACE PACKAGE BODY paquete_modificciones_p1 AS 
    FUNCTION insertar_cliente(p_nombre cliente_p1.nombre%TYPE, p_apellido cliente_p1.apellido%TYPE, p_correo cliente_p1.correo%TYPE,
                            p_telefono cliente_p1.telefono%TYPE)
    RETURN NUMBER IS 
    n_cliente cliente_p1.id%TYPE;
    BEGIN
        SELECT seq_clientes.NEXTVAL INTO n_cliente FROM dual;
        INSERT INTO cliente_p1 VALUES (nombre_cliente, correo_cliente, telefono_cliente);
        RETURN (n_cliente);
    END nuevo_cliente;
    
    
    FUNCTION insertar_autor(p_nombre autor_p1.nombre%TYPE, p_apellido autor_p1.apellido%TYPE,
                            p_nacionalidad autor_p1.nacionalidad%TYPE) 
    RETURN NUMBER IS
    n_autor autor_p1.id%TYPE;
    BEGIN
        SELECT seq_autor.NEXTVAL INTO n_autor FROM dual;
        INSERT INTO autor_p1 VALUES (nombre_autor, apellido_autor, nacionalidad_autor);
        RETURN (n_autor);
    END nuevo_autor;
    
    
    FUNCTION insertar_editorial(p_nombre editorial_p1.nombre%TYPE, p_origen editorial_p1.origen%TYPE)
    RETURN NUMBER IS
    n_editorial editorial_p1.id%TYPE;
    BEGIN
        SELECT seq_editorial.NEXTVAL INTO n_editorial FROM dual;
        INSERT INTO editorial_p1 VALUES (p_nombre, p_origen);
        RETURN n_editorial;
    END;
    
    
    FUNCTION insertar_genero(p_nombre genero_p1.nombre%TYPE)
    RETURN NUMBER IS
    n_genero genero_p1.id%TYPE;
    BEGIN
        SELECT seq_genero.NEXTVAL INTO n_genero FROM dual;
        INSERT INTO genero_p1 VALUES (p_nombre);
        RETURN n_genero;
    END;
    
    
    FUNCTION insertar_libro (p_titulo libro_p1.titulo%TYPE, p_editorial libro_p1.editorial_id%TYPE,
                            p_genero libro_p1.genero_id%TYPE, p_autor libro_p1.autor_id%TYPE,
                            p_anno libro_p1.anno_publicacion%TYPE, p_isbn libro_p1.isbn%TYPE,
                            p_inventario libro_p1.inventario%TYPE)
    RETURN NUMBER IS
    n_libro libro_p1.id%TYPE;
    BEGIN
        SELECT seq_libro.NEXTVAL INTO n_libro FROM dual;
        INSERT INTO libro_p1 VALUES (p_titulo, p_editorial, p_genero, p_autor,
                                    p_anno, p_isbn, p_inventario);
        RETURN n_libro;
    END;
    
    FUNCTION insertar_prestamo(p_fecha_prestamo prestamos_p1.fecha_prestamo%TYPE, 
                                p_fecha_devolucion prestamos_p1.fecha_devolucion%TYPE,
                                p_libro prestamos_p1.libro_id%TYPE, p_cliente prestamos_p1.cliente_id%TYPE)
    RETURN NUMBER IS
    n_prestamos prestamos_p1.id%TYPE;
    BEGIN
        SELECT seq_prestamos.NEXTVAL INTO n_prestamos FROM dual;
        INSERT INTO prestamos_p1 VALUES (p_fecha_prestamo, p_fecha_devolucion, p_libro, p_ccliente);
        RETURN n_prestamos;
    END;
    
    
    FUNCTION insertar_resena(p_descripcion resena_p1.descripccion%TYPE, p_calificacion resena_p1.calificacion%TYPE,
                                p_libro resena_p1.libro_id%TYPE, p_cliente resena_p1.cliente_id%TYPE)
    RETURN NUMBER IS
    n_resena resena_p1.id%TYPE;
    BEGIN
        SELECT seq_resena.NEXTVAL INTO n_resena FROM dual;
        INSERT INTO resena_p1 VALUES (p_descripcion, p_calificacion, p_libro, p_cliente);
        RETURN n_resena;
    END;
    
    
    FUNCTION insertar_empleado(p_nombre empleado_p1.nombre%TYPE,
                                p_apellido empleado_p1.apellido%TYPE)
    RETURN NUMBER IS
    n_empleado empleado_p1.id%TYPE;
    BEGIN
        SELECT seq_empleado.NEXTVAL INTO n_empleado FROM dual;
        INSERT INTO empleado_p1 VALUES (p_nombre, p_apellido);
        RETURN n_empleado;
    END;
	
    
    FUNCTION insertar_usuario(p_usuario usuario_p1.username%TYPE,
                                p_contrasenna usuario_p1.contrasenna%TYPE,
                                p_empleado usuario_p1.empleado_id%TYPE)
    RETURN VARCHAR2 IS
    n_usuario usuario_p1.username%TYPE;
    BEGIN
        SELECT username INTO n_usuario FROM dual;
        INSERT INTO usuario_p1 VALUES (p_usuario, p_contrasenna, p_empleado);
        RETURN n_usuario;
    END;
    
    
    
    PROCEDURE modificar_cliente(p_id clientes_p1.id%TYPE, p_nombre clientes_p1.nombre%TYPE, p_apellido clientes_p1.apellido%TYPE,
                                p_correo clientes_p1.correo%TYPE, p_telefono clientes_p1.telefono%TYPE) IS
    BEGIN
        UPDATE clientes_p1
        SET nombre = p_nombre, apellido = p_apellido, correo = p_correo, telefono = p_telefono
        WHERE id = p_id;
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);       
    END;
    
    
    PROCEDURE modificar_autor(p_id autor_p1.id%TYPE, p_nombre autor_p1.nombre%TYPE,
                                p_apellido autor_p1.apellido%TYPE, p_nacionalidad autor_p1.nacionalidad%TYPE) IS
    BEGIN
        UPDATE autor_p1
        SET nombre = p_nombre, apellido = p_apellido, nacionalidad = p_nacionalidad
        WHERE id = p_id;
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
    END;
    
    
    PROCEDURE modificar_editorial(p_id editorial_p1.id%TYPE, p_nombre editorial_p1.nombre%TYPE,
                                    p_origen editorial_p1.origen%TYPE) IS
    BEGIN
        UPDATE editorial_p1
        SET nombre = p_nombre, p_origen = origen
        WHERE id = p_id;
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
    END;
    
    
    
    PROCEDURE modificar_genero(p_id genero_p1.id%TYPE, p_nombre genero_p1.nombre%TYPE) IS
    BEGIN
        UPDATE genero_p1
        SET nombre = p_nombre
        WHERE id = p_id;
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
    END;
    
    
    PROCEDURE modificar_libro(p_id libro_p1.id%TYPE, p_titulo libro_p1.titutlo%TYPE, p_editorial libro_p1.editorial_id%TYPE,
                                p_genero libro_p1.genero_id%TYPE, p_autor libro_p1.autor_id%TYPE,
                                p_anno_publicacion libro_p1.anno_publicacion%TYPE, p_isbn libro_p1.isbn%TYPE,
                                p_inventario libro_p1.inventario%TYPE) IS
    BEGIN
        UPDATE libro_p1
        SET titulo = p_titulo, editorial_id = p_editorial, genero_id = p_genero, autor_id = p_autor,
            anno_publicacion = p_anno_publicacion, isbn = p_isbn, inventario = p_inventario
        WHERE id = p_id;
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
    END;
    
    
    PROCEDURE modificar_prestamos(p_id prestamos_p1.id%TYPE, p_fecha_prestamo prestamos_p1.fecha_prestamo%TYPE,
                                    p_fecha_devolucion prestamos_p1.fecha_devolucion%TYPE, p_libro prestamos_p1.libro_id%TYPE,
                                    p_cliente prestamos_p1.cliente_id%TYPE) IS
    BEGIN
        UPDATE prestamos_p1
        SET fecha_prestamo = p_fecha_prestamo, fecha_devolucion = p_fecha_devolucion, 
            libro_id = p_libro, cliente_id = p_cliente
        WHERE id = p_id;
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
    END;
    
    
    PROCEDURE modificar_resena(p_id resena_p1.id%TYPE, p_descripcion resena_p1.descripcion%TYPE,
                                p_calificacion resena_p1.calificacion%TYPE, p_libro resena_p1.libro_id%TYPE,
                                p_cliente resena_p1.cliente_id%TYPE) IS
    BEGIN
        UPDATE resena_p1
        SET descripcion = p_descripcion, calificacion = p_calificacion, libro_id = p_libro,
            cliente_id = p_cliente
        WHERE id = p_id;
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
    END;
    
    
    PROCEDURE modificar_empleado(p_id empleado_p1.id%TYPE, p_nombre empleado_p1.nombre%TYPE,
                                    p_apellido empleado_p1.apellido%TYPE) AS
    BEGIN
        UPDATE empleado_p1
        SET nombre = p_nombre, apellido = p_apellido
        WHERE id = p_id;
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
    END;
	
    
    PROCEDURE modificar_usuario(p_usuario usuario_p1.username%TYPE, p_contrasenna usuario_p1.contrasenna%TYPE,
                                    p_empleado usuario_p1.empleado_id%TYPE) AS
    BEGIN
        UPDATE usuario_p1
        SET username = p_usuario, contrasenna = p_contrasenna, empleado_id = p_empleado
        WHERE username = p_usuario;
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
    END;
    
    
    -- PROCEDIMIENTO PARA BORRAR CLIENTE
    PROCEDURE borrar_cliente(p_id cliente_p1.id%TYPE) IS
    c_cont NUMBER;
    BEGIN
        SELECT COUNT(*) INTO c_cont
        FROM cliente_p1 c
        WHERE c.id = p_id;
        
        IF c_cont = 1 THEN
            -- Si el cliente existe en la BD
            DELETE FROM cliente_p1
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
    PROCEDURE borrar_autor(p_id autor_p1.id%TYPE) IS
    a_cont NUMBER;
    BEGIN
        SELECT COUNT(*) INTO a_cont
        FROM autor_p1 a
        WHERE a.id = p_id;
        
        IF a_cont = 1 THEN
            -- Si el autor existe en la BD
            DELETE FROM autor_p1
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
    PROCEDURE borrar_editorial(p_id editorial_p1.id%TYPE) IS
    e_cont NUMBER;
    BEGIN
        SELECT COUNT(*) INTO e_cont
        FROM editorial_p1 e
        WHERE e.id = p_id;
        
        IF e_cont = 1 THEN
            -- Si la editorial existe en la BD
            DELETE FROM editorial_p1
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
    PROCEDURE borrar_genero(p_id genero_p1.id%TYPE) IS
    g_cont NUMBER;
    BEGIN
        SELECT COUNT(*) INTO g_cont
        FROM genero_p1 g
        WHERE g.id = p_id;
        
        IF g_cont = 1 THEN
            -- Si el genero existe en la BD
            DELETE FROM genero_p1
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
    PROCEDURE borrar_libro(p_id libro_p1.id%TYPE) IS
        l_cont NUMBER;
    BEGIN
        SELECT COUNT(*) INTO l_cont
        FROM libro_p1 l
        WHERE l.id = p_id;
        
        IF l_cont = 1 THEN
            -- Si el libro existe en la BD
            DELETE FROM libro_p1
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
    PROCEDURE borrar_resena(p_id resena_p1.id%TYPE) IS
        r_cont NUMBER;
    BEGIN
        SELECT COUNT(*) INTO r_cont
        FROM resena_p1 r
        WHERE r.id = p_id;
        
        IF r_cont = 1 THEN
            -- Si ka reseña existe en la BD
            DELETE FROM resena_p1
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
    PROCEDURE borrar_prestamos(p_id prestamos_p1.id%TYPE) IS
        p_cont NUMBER;
    BEGIN
        SELECT COUNT(*) INTO p_cont
        FROM prestamos_p1 p
        WHERE p.id = p_id;
        
        IF p_cont = 1 THEN
            -- Si el prestamo existe en la BD
            DELETE FROM prestamos_p1
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
    


    PROCEDURE borrar_empleado(p_id empleado_p1.id%TYPE) IS
        p_cont NUMBER;
    BEGIN
        SELECT COUNT(*) INTO p_cont
        FROM empleado_p1 p
        WHERE p.id = p_id;
        
        IF p_cont = 1 THEN
            -- Si el empleado existe en la BD
            DELETE FROM empleado_p1
            WHERE id = p_id;
            IF SQL%ROWCOUNT = 1 THEN
                COMMIT;
                DBMS_OUTPUT.PUT_LINE('Empleado con ID ' || p_id || ' eliminado exitosamente');
            ELSE
                ROLLBACK;
                DBMS_OUTPUT.PUT_LINE('No se pudo eliminar empleado con ID: ' || p_id);
            END IF;
        ELSE
            DBMS_OUTPUT.PUT_LINE('Empleado con ID ' || p_id || ' no existe.');
        END IF;
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Error al eliminar empleado: ' || SQLERRM);
    END;
    
    
    
    PROCEDURE borrar_usuario(p_usuario usuario_p1.username%TYPE) IS
        p_cont NUMBER;
    BEGIN
        SELECT COUNT(*) INTO p_cont
        FROM usuario_p1 u
        WHERE u.username = p_usuario;
        
        IF p_cont = 1 THEN
            -- Si el usuario existe en la BD
            DELETE FROM usuario_p1
            WHERE username = p_usuario;
            IF SQL%ROWCOUNT = 1 THEN
                COMMIT;
                DBMS_OUTPUT.PUT_LINE('Usuario con ID ' || p_id || ' eliminado exitosamente');
            ELSE
                ROLLBACK;
                DBMS_OUTPUT.PUT_LINE('No se pudo eliminar usuario con ID: ' || p_id);
            END IF;
        ELSE
            DBMS_OUTPUT.PUT_LINE('Usuario con ID ' || p_id || ' no existe.');
        END IF;
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Error al eliminar usuario: ' || SQLERRM);
    END;
    
    
    PROCEDURE borrar_bitacora_libro(p_id bitacora_libro_p1.id%TYPE) IS
        p_cont NUMBER;
    BEGIN
        SELECT COUNT(*) INTO p_cont
        FROM bitacora_libro_p1 b
        WHERE b.id = p_id;
        
        IF p_cont = 1 THEN
            -- Si la bitacora existe en la BD
            DELETE FROM bitacora_libro_p1
            WHERE b.id = p_id;
            IF SQL%ROWCOUNT = 1 THEN
                COMMIT;
                DBMS_OUTPUT.PUT_LINE('Bitacora con ID ' || p_id || ' eliminado exitosamente');
            ELSE
                ROLLBACK;
                DBMS_OUTPUT.PUT_LINE('No se pudo eliminar bitacora con ID: ' || p_id);
            END IF;
        ELSE
            DBMS_OUTPUT.PUT_LINE('Bitacora con ID ' || p_id || ' no existe.');
        END IF;
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Error al eliminar bitacora: ' || SQLERRM);
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
    
    PROCEDURE mostrar_ultimas_nbitacoras(p_num NUMBER);

    PROCEDURE mostrar_bitacoras;
 
    PROCEDURE mostrar_usuario_nombre(p_usuario usuario_p1.username%TYPE);
 
    PROCEDURE mostrar_usuarios;
 
    PROCEDURE mostrar_empleados_id (p_id empleados_p1.id%TYPE);
 
    PROCEDURE mostrar_todos_empleados;
    
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
    
    
    PROCEDURE mostrar_todos_empleados AS
    BEGIN
        SELECT * FROM empleados_p1;
    END;
    
    PROCEDURE mostrar_empleados_id (p_id empleados_p1.id%TYPE)AS
    BEGIN
        SELECT *
        FROM empleados_p1 p
        WHERE p.id = p_id;
    END;
    
    PROCEDURE mostrar_usuarios AS
    BEGIN 
        SELECT * FROM usuario_p1;
    END;
    
    
    PROCEDURE mostrar_usuario_nombre(p_usuario usuario_p1.username%TYPE) AS
    BEGIN
        SELECT * 
        FROM usuario_p1 u
        WHERE u.username = p_usuario;
    END;
    
    PROCEDURE mostrar_bitacoras AS
    BEGIN
        SELECT * FROM bitacora_libro_p1;
    END;
    
    PROCEDURE mostrar_ultimas_nbitacoras(p_num NUMBER) AS
    BEGIN
        SELECT *
        FROM bitacora_libro_p1 p
        ORDER BY p.fecha DESC
        FETCH FIRST p_num ROWS ONLY;
    END;

    PROCEDURE mostrar_genero_popular AS
    BEGIN
        SELECT c.id, c.nombre, c.apellido, g.nombre from clientes_p1 c
        LEFT JOIN prestamos_p1 p ON c.id = p.cliente_id
        LEFT JOIN libro_p1 l ON p.libro_id = l.id
        LEFT JOIN genero_p1 g ON l.genero_id = g.id
        ORDER BY g.nombre, c.id;
    END;

    PROCEDURE mostrar_editorial_popular AS
    BEGIN
        SELECT c.id, c.nombre, c.apellido, e.nombre from clientes_p1 c
        RIGHT JOIN prestamos_p1 p ON c.id = p.cliente_id
        RIGHT JOIN libro_p1 l ON p.libro_id = l.id
        RIGHT JOIN editorial_p1 e ON l.editorial_id = e.id
        ORDER BY g.nombre, c.id;
    END;
    
END paquete_consultas_p1;

CREATE OR REPLACE TRIGGER cambio_libros
    AFTER INSERT OR UPDATE OR DELETE
    ON Libro_p1 FOR EACH ROW
DECLARE
    usuario VARCHAR2(50 char);
BEGIN
    usuario := SELECT USER FROM DUAL;
    IF INSERTING THEN
        INSERT INTO Bitacora_libro_p1 (id, fecha, usuario, descripcion)
        VALUES (:NEW.id, SYSDATE, usuario, 'Se insertó el libro: ' || :NEW.titulo);

    ELSIF UPDATING THEN
        DECLARE
            accion VARCHAR2(250 char);
        BEGIN
            accion := 'Se modificó el libro: ' || :NEW.titulo;

            IF :NEW.inventario != :OLD.inventario THEN
                accion := accion || '. Inventario antes: ' || :OLD.inventario || ', Inventario actuak: ' || :NEW.inventario;
            END IF;

            IF :NEW.isbn != :OLD.isbn THEN
                accion := accion || '. ISBN anterior: ' || :OLD.isbn || ', ISBN actual: ' || :NEW.isbn;
            END IF;

            INSERT INTO Bitacora_libro_p1 (id, fecha, usuario, descripcion)
            VALUES (:NEW.id, SYSDATE, usuario, accion);
        END;

    ELSIF DELETING THEN
        INSERT INTO Bitacora_libro_p1 (id, fecha, usuario, descripcion)
        VALUES (:NEW.id, SYSDATE, usuario, 'Se eliminó el libro: ' || :OLD.titulo);

    ELSE
        DBMS_OUTPUT.PUT_LINE('Este codigo no es accesible.');
    END IF;
END;
/

ALTER SEQUENCE seq_clientes RESTART;
ALTER SEQUENCE seq_autor RESTART;
ALTER SEQUENCE seq_editorial RESTART;
ALTER SEQUENCE seq_libro RESTART;
ALTER SEQUENCE seq_genero RESTART;
ALTER SEQUENCE seq_prestamos RESTART;
ALTER SEQUENCE seq_resena RESTART;
ALTER SEQUENCE seq_empleado RESTART;
ALTER SEQUENCE seq_bitacora RESTART;
drop table prestamos_p1;
drop table resena_p1;
drop table libro_p1;
drop table genero_p1;
drop table editorial_p1;
drop table autor_p1;
drop table clientes_p1;
drop table usuario_p1;
drop table empleados_p1;
drop table bitacora_libro_p1;

