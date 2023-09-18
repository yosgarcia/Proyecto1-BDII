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
    fecha DATE NOT NULL,
    usuario VARCHAR2(50 char) NOT NULL,
    descripcion VARCHAR2(250 char),
    CONSTRAINT bitacora_pk PRIMARY KEY (id),
    CONSTRAINT bitacora_usuario_fk FOREIGN KEY (usuario) REFERENCES Usuario_p1(username)
);



--INSERTS TABLA CLIENTE 
INSERT INTO Clientes_p1 (nombre, apellido, correo, telefono) VALUES ('Juan', 'Perez', 'jjuanperez@ejemplo.com', '88563245');
INSERT INTO Clientes_p1 (nombre, apellido, correo, telefono) VALUES ('Lola', 'Hernandez', 'lolahernandez@ejemplo.com', '85648953');
INSERT INTO Clientes_p1 (nombre, apellido, correo, telefono) VALUES ('Yosward', 'Garcia', 'yoswigarcia@ejemplo.com', '88468995');
INSERT INTO Clientes_p1 (nombre, apellido, correo, telefono) VALUES ('Yurgen', 'Cambronero', 'yurgencitoelcabro@ejemplo.com', '87777953');
INSERT INTO Clientes_p1 (nombre, apellido, correo, telefono) VALUES ('Carlos', 'Gonzalez', 'carlosgonzalez@ejemplo.com', '74691238');
INSERT INTO Clientes_p1 (nombre, apellido, correo, telefono) VALUES ('Ana', 'Martinez', 'anamartinez@ejemplo.com', '76582349');
INSERT INTO Clientes_p1 (nombre, apellido, correo, telefono) VALUES ('Pedro', 'Rodriguez', 'pedrorodriguez@ejemplo.com', '68743219');
INSERT INTO Clientes_p1 (nombre, apellido, correo, telefono) VALUES ('María', 'Lopez', 'marialopez@ejemplo.com', '78654321');
INSERT INTO Clientes_p1 (nombre, apellido, correo, telefono) VALUES ('Diego', 'Sanchez', 'diegosanchez@ejemplo.com', '64758932');
INSERT INTO Clientes_p1 (nombre, apellido, correo, telefono) VALUES ('Laura', 'Ramirez', 'lauraramirez@ejemplo.com', '79865432');
INSERT INTO Clientes_p1 (nombre, apellido, correo, telefono) VALUES ('Javier', 'Perez', 'javierperez@ejemplo.com', '68743125');
INSERT INTO Clientes_p1 (nombre, apellido, correo, telefono) VALUES ('Valentina', 'Gutierrez', 'valentinagutierrez@ejemplo.com', '78564321');
INSERT INTO Clientes_p1 (nombre, apellido, correo, telefono) VALUES ('Santiago', 'Hernandez', 'santiagohernandez@ejemplo.com', '74561289');
INSERT INTO Clientes_p1 (nombre, apellido, correo, telefono) VALUES ('Isabella', 'Gonzalez', 'isabellagonzalez@ejemplo.com', '86423579');
INSERT INTO Clientes_p1 (nombre, apellido, correo, telefono) VALUES ('Leo', 'Mora', 'leoelpelos@ejemplo.com', '63547891');
INSERT INTO Clientes_p1 (nombre, apellido, correo, telefono) VALUES ('Lucia', 'Rodriguez', 'luciarodriguez@ejemplo.com', '78693245');
INSERT INTO Clientes_p1 (nombre, apellido, correo, telefono) VALUES ('Matias', 'Lopez', 'matiaslopez@ejemplo.com', '67459823');
INSERT INTO Clientes_p1 (nombre, apellido, correo, telefono) VALUES ('Mariana', 'Sanchez', 'marianasanchez@ejemplo.com', '76584932');
INSERT INTO Clientes_p1 (nombre, apellido, correo, telefono) VALUES ('Emilio', 'Ramirez', 'emilioramirez@ejemplo.com', '87654321');
INSERT INTO Clientes_p1 (nombre, apellido, correo, telefono) VALUES ('Valeria', 'Perez', 'valeriaperez@ejemplo.com', '68743215');
INSERT INTO Clientes_p1 (nombre, apellido, correo, telefono) VALUES ('Felipe', 'Gutierrez', 'felipegutierrez@ejemplo.com', '74563129');
INSERT INTO Clientes_p1 (nombre, apellido, correo, telefono) VALUES ('Catalina', 'Hernandez', 'catalinahernandez@ejemplo.com', '86451279');
INSERT INTO Clientes_p1 (nombre, apellido, correo, telefono) VALUES ('Facundo', 'Gonzalez', 'facundogonzalez@ejemplo.com', '63547892');
INSERT INTO Clientes_p1 (nombre, apellido, correo, telefono) VALUES ('Antonella', 'Martinez', 'antonellamartinez@ejemplo.com', '76549832');
INSERT INTO Clientes_p1 (nombre, apellido, correo, telefono) VALUES ('Lucas', 'Rodriguez', 'lucasrodriguez@ejemplo.com', '78643921');
INSERT INTO Clientes_p1 (nombre, apellido, correo, telefono) VALUES ('Isidora', 'Lopez', 'isidoralopez@ejemplo.com', '67459832');
INSERT INTO Clientes_p1 (nombre, apellido, correo, telefono) VALUES ('Benjamin', 'Sanchez', 'benjaminsanchez@ejemplo.com', '74563128');
INSERT INTO Clientes_p1 (nombre, apellido, correo, telefono) VALUES ('Renata', 'Ramirez', 'renataramirez@ejemplo.com', '87654931');
INSERT INTO Clientes_p1 (nombre, apellido, correo, telefono) VALUES ('Emiliano', 'Perez', 'emilianoperez@ejemplo.com', '68743216');
INSERT INTO Clientes_p1 (nombre, apellido, correo, telefono) VALUES ('Valentino', 'Gutierrez', 'valentinogutierrez@ejemplo.com', '74563127');
INSERT INTO Clientes_p1 (nombre, apellido, correo, telefono) VALUES ('Carmen', 'Hernandez', 'carmenhernandez@ejemplo.com', '86451278');
select * from  Clientes_p1;


--INSERTS TABLA AUTOR

INSERT INTO Autor_p1 (nombre, apellido, nacionalidad) VALUES ('J.K', 'Rowling', 'Britanica');
INSERT INTO Autor_p1 (nombre, apellido, nacionalidad) VALUES ('Gabriel', 'Garcia Marquez', 'Colombiana');
INSERT INTO Autor_p1 (nombre, apellido, nacionalidad) VALUES ('Mario', 'Vargas Llosa', 'Peruana');
INSERT INTO Autor_p1 (nombre, apellido, nacionalidad) VALUES ('Pablo', 'Neruda', 'Chilena');
INSERT INTO Autor_p1 (nombre, apellido, nacionalidad) VALUES ('Isabel', 'Allende', 'Chilena');
INSERT INTO Autor_p1 (nombre, apellido, nacionalidad) VALUES ('Gustavo', 'Adolfo Becquer', 'Espanola');
INSERT INTO Autor_p1 (nombre, apellido, nacionalidad) VALUES ('Octavio', 'Paz', 'Mexicana');
INSERT INTO Autor_p1 (nombre, apellido, nacionalidad) VALUES ('Federico', 'Garcia Lorca', 'Espanola');
INSERT INTO Autor_p1 (nombre, apellido, nacionalidad) VALUES ('Jorge', 'Borges', 'Argentina');
INSERT INTO Autor_p1 (nombre, apellido, nacionalidad) VALUES ('Jose', 'Saramago', 'Portuguesa');
INSERT INTO Autor_p1 (nombre, apellido, nacionalidad) VALUES ('Virginia', 'Woolf', 'Britanica');
INSERT INTO Autor_p1 (nombre, apellido, nacionalidad) VALUES ('Alejandro', 'Dumas', 'Francesa');
INSERT INTO Autor_p1 (nombre, apellido, nacionalidad) VALUES ('Leon', 'Tolstoi', 'Rusa');
INSERT INTO Autor_p1 (nombre, apellido, nacionalidad) VALUES ('George', 'Orwell', 'Britanica');
INSERT INTO Autor_p1 (nombre, apellido, nacionalidad) VALUES ('Jane', 'Austen', 'Britanica');
INSERT INTO Autor_p1 (nombre, apellido, nacionalidad) VALUES ('Haruki', 'Murakami', 'Japonesa');
INSERT INTO Autor_p1 (nombre, apellido, nacionalidad) VALUES ('Agatha', 'Christie', 'Britanica');
INSERT INTO Autor_p1 (nombre, apellido, nacionalidad) VALUES ('Mark', 'Twain', 'Estadounidense');
INSERT INTO Autor_p1 (nombre, apellido, nacionalidad) VALUES ('Charles', 'Dickens', 'Britanica');
INSERT INTO Autor_p1 (nombre, apellido, nacionalidad) VALUES ('Hermann', 'Hesse', 'Alemana');
INSERT INTO Autor_p1 (nombre, apellido, nacionalidad) VALUES ('Gabriela', 'Mistral', 'Chilena');
INSERT INTO Autor_p1 (nombre, apellido, nacionalidad) VALUES ('Albert', 'Camus', 'Francesa');
INSERT INTO Autor_p1 (nombre, apellido, nacionalidad) VALUES ('J.R.R', 'Tolkien', 'Britanica');
INSERT INTO Autor_p1 (nombre, apellido, nacionalidad) VALUES ('Hans', 'Christian Andersen', 'Danesa');
INSERT INTO Autor_p1 (nombre, apellido, nacionalidad) VALUES ('Leo', 'Tolstoy', 'Rusa');
INSERT INTO Autor_p1 (nombre, apellido, nacionalidad) VALUES ('Anton', 'Chekhov', 'Rusa');
INSERT INTO Autor_p1 (nombre, apellido, nacionalidad) VALUES ('Jules', 'Verne', 'Francesa');
INSERT INTO Autor_p1 (nombre, apellido, nacionalidad) VALUES ('Rabindranath', 'Tagore', 'India');
INSERT INTO Autor_p1 (nombre, apellido, nacionalidad) VALUES ('Honore', 'de Balzac', 'Francesa');
INSERT INTO Autor_p1 (nombre, apellido, nacionalidad) VALUES ('Edgar', 'Allan Poe', 'Estadounidense');
select * from Autor_p1;

--Inserts tabla editorial
INSERT INTO Editorial_p1 (nombre, origen) VALUES ('Editorial ABC', 'Espana');
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
INSERT INTO Editorial_p1 (nombre, origen) VALUES ('Elsevier', 'Paises Bajos');
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
INSERT INTO Genero_p1 (nombre) VALUES ('Ficcion');
INSERT INTO Genero_p1 (nombre) VALUES ('Realismo');
INSERT INTO Genero_p1 (nombre) VALUES ('Ciencia Ficcion');
INSERT INTO Genero_p1 (nombre) VALUES ('Fantasia');
INSERT INTO Genero_p1 (nombre) VALUES ('Misterio');
INSERT INTO Genero_p1 (nombre) VALUES ('Terror');
INSERT INTO Genero_p1 (nombre) VALUES ('Aventura');
INSERT INTO Genero_p1 (nombre) VALUES ('Romance');
INSERT INTO Genero_p1 (nombre) VALUES ('Drama');
INSERT INTO Genero_p1 (nombre) VALUES ('Poesia');
INSERT INTO Genero_p1 (nombre) VALUES ('Biografia');
INSERT INTO Genero_p1 (nombre) VALUES ('Autobiografia');
INSERT INTO Genero_p1 (nombre) VALUES ('Historia');
INSERT INTO Genero_p1 (nombre) VALUES ('Ciencia');
INSERT INTO Genero_p1 (nombre) VALUES ('Economia');
INSERT INTO Genero_p1 (nombre) VALUES ('Politica');
INSERT INTO Genero_p1 (nombre) VALUES ('Religion');
INSERT INTO Genero_p1 (nombre) VALUES ('Autoayuda');
INSERT INTO Genero_p1 (nombre) VALUES ('Aventuras Graficas');
INSERT INTO Genero_p1 (nombre) VALUES ('Comics');
INSERT INTO Genero_p1 (nombre) VALUES ('Novela Grafica');
INSERT INTO Genero_p1 (nombre) VALUES ('Historieta');
INSERT INTO Genero_p1 (nombre) VALUES ('Ensayo');
INSERT INTO Genero_p1 (nombre) VALUES ('Filosofia');
INSERT INTO Genero_p1 (nombre) VALUES ('Viajes');
INSERT INTO Genero_p1 (nombre) VALUES ('Crimen');
INSERT INTO Genero_p1 (nombre) VALUES ('Humor');
INSERT INTO Genero_p1 (nombre) VALUES ('Ciencia y Naturaleza');
INSERT INTO Genero_p1 (nombre) VALUES ('Tecnologia');
INSERT INTO Genero_p1 (nombre) VALUES ('Cocina');
select * from Genero_p1;


--Inserts tabla libro 

INSERT INTO Libro_p1 (titulo, editorial_id, genero_id, autor_id, anno_publicacion, isbn, inventario) VALUES ('Harry Potter y la Piedra Filosofal', 1, 4, 1, TO_DATE('1997-06-26', 'YYYY-MM-DD'), '978-0590353427', 50);
INSERT INTO Libro_p1 (titulo, editorial_id, genero_id, autor_id, anno_publicacion, isbn, inventario) VALUES ('100 anos de soledad', 2, 1, 2, TO_DATE('1967-05-30', 'YYYY-MM-DD'), '978-9871234567', 45);
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
INSERT INTO Libro_p1 (titulo, editorial_id, genero_id, autor_id, anno_publicacion, isbn, inventario) VALUES ('Desolacion', 19, 1, 21, TO_DATE('1922-01-01', 'YYYY-MM-DD'), '978-0142437186', 60);
INSERT INTO Libro_p1 (titulo, editorial_id, genero_id, autor_id, anno_publicacion, isbn, inventario) VALUES ('Tala', 20, 1, 21, TO_DATE('1938-01-01', 'YYYY-MM-DD'), '978-0553383805', 40);
INSERT INTO Libro_p1 (titulo, editorial_id, genero_id, autor_id, anno_publicacion, isbn, inventario) VALUES ('Guerra y Paz', 21, 1, 25, TO_DATE('1869-01-01', 'YYYY-MM-DD'), '978-0565953805', 30);
INSERT INTO Libro_p1 (titulo, editorial_id, genero_id, autor_id, anno_publicacion, isbn, inventario) VALUES ('El gato negro', 22, 1, 30, TO_DATE('1938-01-01', 'YYYY-MM-DD'), '978-0523873805', 40);
INSERT INTO Libro_p1 (titulo, editorial_id, genero_id, autor_id, anno_publicacion, isbn, inventario) VALUES ('El cuervo', 23, 1, 30, TO_DATE('1845-01-01', 'YYYY-MM-DD'), '978-0523873805', 40);
INSERT INTO Libro_p1 (titulo, editorial_id, genero_id, autor_id, anno_publicacion, isbn, inventario) VALUES ('Harry Potter y la camara secreta', 1, 4, 1, TO_DATE('1998-07-02', 'YYYY-MM-DD'), '978-0590353427', 50);
INSERT INTO Libro_p1 (titulo, editorial_id, genero_id, autor_id, anno_publicacion, isbn, inventario) VALUES ('Cronica de una muerte anunciada', 2, 1, 2, TO_DATE('1981-08-07', 'YYYY-MM-DD'), '978-9871234567', 40);
INSERT INTO Libro_p1 (titulo, editorial_id, genero_id, autor_id, anno_publicacion, isbn, inventario) VALUES ('Del amor y otros demonios', 2, 1, 2, TO_DATE('1994-02-03', 'YYYY-MM-DD'), '978-9871234567', 25);
INSERT INTO Libro_p1 (titulo, editorial_id, genero_id, autor_id, anno_publicacion, isbn, inventario) VALUES ('Doce cuentos peregrinos', 2, 1, 2, TO_DATE('1992-07-22', 'YYYY-MM-DD'), '978-9871234567', 45);
INSERT INTO Libro_p1 (titulo, editorial_id, genero_id, autor_id, anno_publicacion, isbn, inventario) VALUES ('Crimenes de la calle Morgue', 23, 1, 30, TO_DATE('1829-05-11', 'YYYY-MM-DD'), '978-0523873805', 40);
INSERT INTO Libro_p1 (titulo, editorial_id, genero_id, autor_id, anno_publicacion, isbn, inventario) VALUES ('Resurreccion', 21, 1, 25, TO_DATE('1899-03-15', 'YYYY-MM-DD'), '978-0565953805', 30);
INSERT INTO Libro_p1 (titulo, editorial_id, genero_id, autor_id, anno_publicacion, isbn, inventario) VALUES ('Cuentos de Eva Luna', 5, 9, 5, TO_DATE('1989-08-23', 'YYYY-MM-DD'), '978-0143039969', 10);
select * from Libro_p1;


INSERT INTO Empleado_p1 (nombre, apellido) VALUES ('Andrea', 'Aron');
INSERT INTO Empleado_p1 (nombre, apellido) VALUES ('Julio', 'Flores');
INSERT INTO Empleado_p1 (nombre, apellido) VALUES ('Santiago', 'Urdaneta');
INSERT INTO Empleado_p1 (nombre, apellido) VALUES ('Maria', 'Ferreira');
INSERT INTO Empleado_p1 (nombre, apellido) VALUES ('Julia', 'Hernandez');
INSERT INTO Empleado_p1 (nombre, apellido) VALUES ('Luis', 'Paz');
INSERT INTO Empleado_p1 (nombre, apellido) VALUES ('Fernanda', 'Duarte');
INSERT INTO Empleado_p1 (nombre, apellido) VALUES ('Sara', 'Garcia');
INSERT INTO Empleado_p1 (nombre, apellido) VALUES ('Andres', 'Gomez');
INSERT INTO Empleado_p1 (nombre, apellido) VALUES ('Hannah', 'Jimenez');
INSERT INTO Empleado_p1 (nombre, apellido) VALUES ('Pedro', 'Mora');
INSERT INTO Empleado_p1 (nombre, apellido) VALUES ('Elisa', 'Ruiz');
INSERT INTO Empleado_p1 (nombre, apellido) VALUES ('Anthony', 'Sanchez');
INSERT INTO Empleado_p1 (nombre, apellido) VALUES ('Luna', 'Gutierrez');
INSERT INTO Empleado_p1 (nombre, apellido) VALUES ('Miguel', 'Ferreira');
INSERT INTO Empleado_p1 (nombre, apellido) VALUES ('Pablo', 'Alonso');
INSERT INTO Empleado_p1 (nombre, apellido) VALUES ('Valeria', 'Torres');
INSERT INTO Empleado_p1 (nombre, apellido) VALUES ('Edgar', 'Ramirez');
INSERT INTO Empleado_p1 (nombre, apellido) VALUES ('Adriana', 'Halpert');
INSERT INTO Empleado_p1 (nombre, apellido) VALUES ('Michael', 'Scott');
INSERT INTO Empleado_p1 (nombre, apellido) VALUES ('Pamela', 'Nunes');
INSERT INTO Empleado_p1 (nombre, apellido) VALUES ('Cristobal', 'Reyes');
INSERT INTO Empleado_p1 (nombre, apellido) VALUES ('Erin', 'Kapoor');
INSERT INTO Empleado_p1 (nombre, apellido) VALUES ('Samuel', 'Pereira');
INSERT INTO Empleado_p1 (nombre, apellido) VALUES ('Camila', 'Vasquez');
INSERT INTO Empleado_p1 (nombre, apellido) VALUES ('Leonardo', 'Vera');
INSERT INTO Empleado_p1 (nombre, apellido) VALUES ('Alejandro', 'Vidal');
INSERT INTO Empleado_p1 (nombre, apellido) VALUES ('Oliver', 'Santos');
INSERT INTO Empleado_p1 (nombre, apellido) VALUES ('Juan', 'Aguilar');
INSERT INTO Empleado_p1 (nombre, apellido) VALUES ('Marco', 'Campos');
INSERT INTO Empleado_p1 (nombre, apellido) VALUES ('Cristina', 'Cambronero');

INSERT INTO Usuario_p1 (username, contrasenna, empleado_id) VALUES ('andrea_aron', 'con123', 1);
INSERT INTO Usuario_p1 (username, contrasenna, empleado_id) VALUES ('jflores', 'password456', 2);
INSERT INTO Usuario_p1 (username, contrasenna, empleado_id) VALUES ('san.urdaneta', 'securepass', 3);
INSERT INTO Usuario_p1 (username, contrasenna, empleado_id) VALUES ('ferreira_m', 'p4ssw0rd', 4);
INSERT INTO Usuario_p1 (username, contrasenna, empleado_id) VALUES ('j_hernandez', 'qwerty123', 5);
INSERT INTO Usuario_p1 (username, contrasenna, empleado_id) VALUES ('lpaz', 'mypass', 6);
INSERT INTO Usuario_p1 (username, contrasenna, empleado_id) VALUES ('ferduarte', 'duarte123', 7);
INSERT INTO Usuario_p1 (username, contrasenna, empleado_id) VALUES ('sarag', 'sara_pass', 8);
INSERT INTO Usuario_p1 (username, contrasenna, empleado_id) VALUES ('andres_gomez', 'andres2023', 9);
INSERT INTO Usuario_p1 (username, contrasenna, empleado_id) VALUES ('hannah_jim', 'hpassword', 10);
INSERT INTO Usuario_p1 (username, contrasenna, empleado_id) VALUES ('pmora', 'mora1234', 11);
INSERT INTO Usuario_p1 (username, contrasenna, empleado_id) VALUES ('eliruiz', 'elipass', 12);
INSERT INTO Usuario_p1 (username, contrasenna, empleado_id) VALUES ('thony_s', 'anthony_pass', 13);
INSERT INTO Usuario_p1 (username, contrasenna, empleado_id) VALUES ('lunaguti', 'luna123', 14);
INSERT INTO Usuario_p1 (username, contrasenna, empleado_id) VALUES ('mferreira', 'miguelpass', 15);
INSERT INTO Usuario_p1 (username, contrasenna, empleado_id) VALUES ('p.alonso', 'pablo2023', 16);
INSERT INTO Usuario_p1 (username, contrasenna, empleado_id) VALUES ('valtorres', 'valeria_pass', 17);
INSERT INTO Usuario_p1 (username, contrasenna, empleado_id) VALUES ('edgar_ramirez', 'edgar123', 18);
INSERT INTO Usuario_p1 (username, contrasenna, empleado_id) VALUES ('adrihalpert', 'adriana456', 19);
INSERT INTO Usuario_p1 (username, contrasenna, empleado_id) VALUES ('mscott', 'dundermifflin', 20);
INSERT INTO Usuario_p1 (username, contrasenna, empleado_id) VALUES ('pamela_nun', 'beasly_pass', 21);
INSERT INTO Usuario_p1 (username, contrasenna, empleado_id) VALUES ('crisreyes', 'king2023', 22);
INSERT INTO Usuario_p1 (username, contrasenna, empleado_id) VALUES ('ekapoor', 'eclipse123', 23);
INSERT INTO Usuario_p1 (username, contrasenna, empleado_id) VALUES ('samp', 'sam_pass', 24);
INSERT INTO Usuario_p1 (username, contrasenna, empleado_id) VALUES ('camivas', 'mila456', 25);
INSERT INTO Usuario_p1 (username, contrasenna, empleado_id) VALUES ('leovera', 'leopro_pass', 26);
INSERT INTO Usuario_p1 (username, contrasenna, empleado_id) VALUES ('alevidal', 'campale123', 27);
INSERT INTO Usuario_p1 (username, contrasenna, empleado_id) VALUES ('olisantos', 'oliver_pass', 28);
INSERT INTO Usuario_p1 (username, contrasenna, empleado_id) VALUES ('j_aguilar', 'juan2023', 29);
INSERT INTO Usuario_p1 (username, contrasenna, empleado_id) VALUES ('marcampos', 'marco_pass', 30);
INSERT INTO Usuario_p1 (username, contrasenna, empleado_id) VALUES ('cristcambro', 'cristina123', 31);

--Inserts tabla Prestamos
--Prestamos Enero
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-01-03', 'YYYY-MM-DD'), TO_DATE('2023-01-10', 'YYYY-MM-DD'), 3,7);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-01-05', 'YYYY-MM-DD'), TO_DATE('2023-01-12', 'YYYY-MM-DD'), 18,15);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-01-07', 'YYYY-MM-DD'), TO_DATE('2023-01-14', 'YYYY-MM-DD'), 14,2);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-01-09', 'YYYY-MM-DD'), TO_DATE('2023-01-16', 'YYYY-MM-DD'), 8,8);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-01-16', 'YYYY-MM-DD'), TO_DATE('2023-01-23', 'YYYY-MM-DD'), 19,7);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-01-17', 'YYYY-MM-DD'), TO_DATE('2023-01-24', 'YYYY-MM-DD'), 21,21);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-01-18', 'YYYY-MM-DD'), TO_DATE('2023-01-25', 'YYYY-MM-DD'), 12,30);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-01-20', 'YYYY-MM-DD'), TO_DATE('2023-01-27', 'YYYY-MM-DD'), 15,19);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-01-22', 'YYYY-MM-DD'), TO_DATE('2023-01-29', 'YYYY-MM-DD'), 2,4);
--Prestamos Febrero
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-02-01', 'YYYY-MM-DD'), TO_DATE('2023-02-08', 'YYYY-MM-DD'), 1,10);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-02-09', 'YYYY-MM-DD'), TO_DATE('2023-02-16', 'YYYY-MM-DD'), 5,1);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-02-11', 'YYYY-MM-DD'), TO_DATE('2023-02-18', 'YYYY-MM-DD'), 14,20);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-02-11', 'YYYY-MM-DD'), TO_DATE('2023-02-18', 'YYYY-MM-DD'), 15,8);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-02-13', 'YYYY-MM-DD'), TO_DATE('2023-02-20', 'YYYY-MM-DD'), 11,22);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-02-15', 'YYYY-MM-DD'), TO_DATE('2023-02-22', 'YYYY-MM-DD'), 4,9);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-02-16', 'YYYY-MM-DD'), TO_DATE('2023-02-23', 'YYYY-MM-DD'), 1,24);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-02-20', 'YYYY-MM-DD'), TO_DATE('2023-02-27', 'YYYY-MM-DD'), 6,6);

--Prestamos Marzo
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-03-02', 'YYYY-MM-DD'), TO_DATE('2023-03-09', 'YYYY-MM-DD'), 4,5);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-03-05', 'YYYY-MM-DD'), TO_DATE('2023-03-12', 'YYYY-MM-DD'), 24,25);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-03-07', 'YYYY-MM-DD'), TO_DATE('2023-03-14', 'YYYY-MM-DD'), 6,4);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-03-10', 'YYYY-MM-DD'), TO_DATE('2023-03-17', 'YYYY-MM-DD'), 9,1);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-03-11', 'YYYY-MM-DD'), TO_DATE('2023-03-18', 'YYYY-MM-DD'), 9,9);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-03-13', 'YYYY-MM-DD'), TO_DATE('2023-03-20', 'YYYY-MM-DD'), 22,5);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-03-14', 'YYYY-MM-DD'), TO_DATE('2023-03-21', 'YYYY-MM-DD'), 2,15);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-03-19', 'YYYY-MM-DD'), TO_DATE('2023-03-26', 'YYYY-MM-DD'), 6,8);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-03-22', 'YYYY-MM-DD'), TO_DATE('2023-03-29', 'YYYY-MM-DD'), 9,17);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-03-24', 'YYYY-MM-DD'), TO_DATE('2023-03-31', 'YYYY-MM-DD'), 8,25);

--Prestamos Abril
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-04-01', 'YYYY-MM-DD'), TO_DATE('2023-04-08', 'YYYY-MM-DD'), 12,12);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-04-05', 'YYYY-MM-DD'), TO_DATE('2023-04-12', 'YYYY-MM-DD'), 20,9);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-04-11', 'YYYY-MM-DD'), TO_DATE('2023-04-18', 'YYYY-MM-DD'), 11,1);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-04-11', 'YYYY-MM-DD'), TO_DATE('2023-04-18', 'YYYY-MM-DD'), 21,2);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-04-12', 'YYYY-MM-DD'), TO_DATE('2023-04-19', 'YYYY-MM-DD'), 11,12);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-04-14', 'YYYY-MM-DD'), TO_DATE('2023-04-21', 'YYYY-MM-DD'), 15,22);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-04-15', 'YYYY-MM-DD'), TO_DATE('2023-04-22', 'YYYY-MM-DD'), 29,4);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-04-22', 'YYYY-MM-DD'), TO_DATE('2023-04-29', 'YYYY-MM-DD'), 27,14);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-04-23', 'YYYY-MM-DD'), TO_DATE('2023-04-30', 'YYYY-MM-DD'), 19,14);
--Prestamos Mayo
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-05-07', 'YYYY-MM-DD'), TO_DATE('2023-05-14', 'YYYY-MM-DD'), 2,14);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-05-08', 'YYYY-MM-DD'), TO_DATE('2023-05-15', 'YYYY-MM-DD'), 9,21);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-05-10', 'YYYY-MM-DD'), TO_DATE('2023-05-17', 'YYYY-MM-DD'), 14,2);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-05-14', 'YYYY-MM-DD'), TO_DATE('2023-05-21', 'YYYY-MM-DD'), 5,20);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-05-17', 'YYYY-MM-DD'), TO_DATE('2023-05-24', 'YYYY-MM-DD'), 18,12);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-05-24', 'YYYY-MM-DD'), TO_DATE('2023-05-31', 'YYYY-MM-DD'), 14,30);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-05-31', 'YYYY-MM-DD'), TO_DATE('2023-06-06', 'YYYY-MM-DD'), 11,2);
--Prestamos Junio
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-06-06', 'YYYY-MM-DD'), TO_DATE('2023-06-13', 'YYYY-MM-DD'), 15,20);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-06-07', 'YYYY-MM-DD'), TO_DATE('2023-06-14', 'YYYY-MM-DD'), 17,17);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-06-10', 'YYYY-MM-DD'), TO_DATE('2023-06-17', 'YYYY-MM-DD'), 13,14);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-06-16', 'YYYY-MM-DD'), TO_DATE('2023-06-23', 'YYYY-MM-DD'), 5,11);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-06-19', 'YYYY-MM-DD'), TO_DATE('2023-06-26', 'YYYY-MM-DD'), 14,9);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-06-22', 'YYYY-MM-DD'), TO_DATE('2023-06-29', 'YYYY-MM-DD'), 30,20);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-06-26', 'YYYY-MM-DD'), TO_DATE('2023-07-03', 'YYYY-MM-DD'), 8,21);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-06-28', 'YYYY-MM-DD'), TO_DATE('2023-07-05', 'YYYY-MM-DD'), 10,25);


--Prestamos Julio
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-07-04', 'YYYY-MM-DD'), TO_DATE('2023-07-11', 'YYYY-MM-DD'), 4,7);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-07-05', 'YYYY-MM-DD'), TO_DATE('2023-07-12', 'YYYY-MM-DD'), 3,25);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-07-07', 'YYYY-MM-DD'), TO_DATE('2023-07-14', 'YYYY-MM-DD'), 18,1);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-07-07', 'YYYY-MM-DD'), TO_DATE('2023-07-14', 'YYYY-MM-DD'), 5,4);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-07-12', 'YYYY-MM-DD'), TO_DATE('2023-07-19', 'YYYY-MM-DD'), 6,24);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-07-15', 'YYYY-MM-DD'), TO_DATE('2023-07-22', 'YYYY-MM-DD'), 15,20);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-07-16', 'YYYY-MM-DD'), TO_DATE('2023-07-23', 'YYYY-MM-DD'), 19,20);
--Prestamos Agosto
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-08-01', 'YYYY-MM-DD'), TO_DATE('2023-08-08', 'YYYY-MM-DD'), 8,20);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-08-06', 'YYYY-MM-DD'), TO_DATE('2023-08-13', 'YYYY-MM-DD'), 5,1);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-08-08', 'YYYY-MM-DD'), TO_DATE('2023-08-15', 'YYYY-MM-DD'), 28,27);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-08-11', 'YYYY-MM-DD'), TO_DATE('2023-08-18', 'YYYY-MM-DD'), 19,5);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-08-15', 'YYYY-MM-DD'), TO_DATE('2023-08-22', 'YYYY-MM-DD'), 9,15);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-08-21', 'YYYY-MM-DD'), TO_DATE('2023-08-28', 'YYYY-MM-DD'), 30,22);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-08-23', 'YYYY-MM-DD'), TO_DATE('2023-08-30', 'YYYY-MM-DD'), 14,3);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-08-27', 'YYYY-MM-DD'), TO_DATE('2023-09-03', 'YYYY-MM-DD'), 1,2);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-08-31', 'YYYY-MM-DD'), TO_DATE('2023-09-07', 'YYYY-MM-DD'), 12,25);
--Prestamos Septiembre
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-09-04', 'YYYY-MM-DD'), TO_DATE('2023-09-11', 'YYYY-MM-DD'), 4,21);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-09-07', 'YYYY-MM-DD'), TO_DATE('2023-09-14', 'YYYY-MM-DD'), 1,21);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-09-13', 'YYYY-MM-DD'), TO_DATE('2023-09-20', 'YYYY-MM-DD'), 10,22);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-09-16', 'YYYY-MM-DD'), TO_DATE('2023-09-23', 'YYYY-MM-DD'), 1,3);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-09-16', 'YYYY-MM-DD'), TO_DATE('2023-09-23', 'YYYY-MM-DD'), 1,1);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-09-16', 'YYYY-MM-DD'), TO_DATE('2023-09-23', 'YYYY-MM-DD'), 17,15);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-09-16', 'YYYY-MM-DD'), TO_DATE('2023-09-23', 'YYYY-MM-DD'), 1,12);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-09-18', 'YYYY-MM-DD'), TO_DATE('2023-09-25', 'YYYY-MM-DD'), 11,14);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-09-20', 'YYYY-MM-DD'), TO_DATE('2023-09-27', 'YYYY-MM-DD'), 10,20);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-09-23', 'YYYY-MM-DD'), TO_DATE('2023-09-30', 'YYYY-MM-DD'), 26,11);
--Prestamos Octubre
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-10-02', 'YYYY-MM-DD'), TO_DATE('2023-10-09', 'YYYY-MM-DD'), 21,21);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-10-10', 'YYYY-MM-DD'), TO_DATE('2023-10-17', 'YYYY-MM-DD'), 5,25);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-10-11', 'YYYY-MM-DD'), TO_DATE('2023-10-18', 'YYYY-MM-DD'), 4,18);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-10-15', 'YYYY-MM-DD'), TO_DATE('2023-10-22', 'YYYY-MM-DD'), 1,8);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-10-18', 'YYYY-MM-DD'), TO_DATE('2023-10-25', 'YYYY-MM-DD'), 7,2);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-10-20', 'YYYY-MM-DD'), TO_DATE('2023-10-27', 'YYYY-MM-DD'), 2,27);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-10-21', 'YYYY-MM-DD'), TO_DATE('2023-10-28', 'YYYY-MM-DD'), 4,3);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-10-21', 'YYYY-MM-DD'), TO_DATE('2023-10-28', 'YYYY-MM-DD'), 9,28);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-10-24', 'YYYY-MM-DD'), TO_DATE('2023-10-31', 'YYYY-MM-DD'), 1,21);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-10-26', 'YYYY-MM-DD'), TO_DATE('2023-11-02', 'YYYY-MM-DD'), 3,3);

--Prestamos Noviembre
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-11-04', 'YYYY-MM-DD'), TO_DATE('2023-11-11', 'YYYY-MM-DD'), 11,11);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-11-06', 'YYYY-MM-DD'), TO_DATE('2023-11-13', 'YYYY-MM-DD'), 4,2);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-11-07', 'YYYY-MM-DD'), TO_DATE('2023-11-14', 'YYYY-MM-DD'), 19,12);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-11-14', 'YYYY-MM-DD'), TO_DATE('2023-11-21', 'YYYY-MM-DD'), 5,3);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-11-17', 'YYYY-MM-DD'), TO_DATE('2023-11-24', 'YYYY-MM-DD'), 8,9);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-11-20', 'YYYY-MM-DD'), TO_DATE('2023-11-27', 'YYYY-MM-DD'), 18,12);
 --Prestamos Diciembre
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-12-01', 'YYYY-MM-DD'), TO_DATE('2023-12-08', 'YYYY-MM-DD'), 8,2);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-12-07', 'YYYY-MM-DD'), TO_DATE('2023-12-14', 'YYYY-MM-DD'), 4,4);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-12-11', 'YYYY-MM-DD'), TO_DATE('2023-12-18', 'YYYY-MM-DD'), 6,6);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-12-13', 'YYYY-MM-DD'), TO_DATE('2023-12-20', 'YYYY-MM-DD'), 1,17);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-12-16', 'YYYY-MM-DD'), TO_DATE('2023-12-23', 'YYYY-MM-DD'), 28,30);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-12-17', 'YYYY-MM-DD'), TO_DATE('2023-12-24', 'YYYY-MM-DD'), 24,24);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-12-21', 'YYYY-MM-DD'), TO_DATE('2023-12-28', 'YYYY-MM-DD'), 2,2);
INSERT INTO Prestamos_p1 (fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (TO_DATE('2023-12-24', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 3,6);

--Resennas
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Pesimo', 1, 3, 7);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Muy buena', 7, 18, 15);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Puede mejorar', 3, 14, 2);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Masomenos', 5, 8, 8);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('INCREIBLE', 9, 19, 7);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Basura', 2, 21, 21);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Me encanto', 8, 12, 30);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Mediocre', 4, 15, 19);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('La mayor basura de la historia', 1, 2, 4);

INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Interesante', 6, 1, 10);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('LO MEJOR DEL MUNDO', 10, 5, 1);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Aburrido', 3, 14, 20);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Simple', 2, 15, 8);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Unico', 8, 11, 22);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Llamativo', 7, 4, 9);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Para pasar el rato', 5, 1, 24);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Espere mas...', 4, 6, 6);

INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Perdida de tiempo', 1, 4, 5);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Recomendado a full', 9, 24, 25);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Ni bien ni mal', 6, 6, 4);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Muy predecible', 2, 9, 1);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Lo volveria a leer mil veces', 10, 9, 9);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('No muy llamativo', 3, 22, 5);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('De 10', 8, 2, 15);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Muy bueno', 7, 6, 8);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Mas malo que bueno', 4, 9, 17);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Muy de una sola vez', 5, 8, 25);

INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Lo peor que he visto...', 1, 12, 12);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Para pasar el rato nada mas', 6, 20, 9);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('De mis favoritos, recomiendo leerlo', 9, 11, 1);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Hay muchos mejores que esto...', 2, 21, 2);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Nada mejor, sin duda una obra de arte', 10, 11, 12);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Nada llamativo', 3, 15, 22);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Magnifico en todo sentido', 8, 29, 4);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Bastante bueno!', 7, 27, 14);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('No es lo mejor pero bueno...', 4, 19, 14);

INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Algo entretiene, pero no mucho', 5, 2, 14);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('No me esperaba nada y aun asi me decepciono', 1, 9, 21);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Muy bueno y entretenido', 8, 14, 2);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Esto se considera libro?', 3, 5, 20);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Una maravilla, es sin duda maravilloso', 9, 18, 12);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Regular', 4, 14, 30);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Malo entre lo bueno y bueno entre lo malo', 6, 11, 2);

INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Ni fu ni fa', 2, 15, 20);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Lo ame!', 10, 17, 17);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Pfff hay muchos mejores', 3, 13, 14);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Me siento estafado', 2, 5, 11);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Un poco malo si...', 4, 14, 9);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Decepcionante', 1, 30, 20);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Precioso y unico', 9, 8, 21);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Simple y entretenido', 6, 10, 25);

INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Super bueno, recomendadisimo', 7, 4, 7);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Muy malo la verdad', 2, 3, 25);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Lo mejor que he leido en un buen tiempo', 10, 18, 1);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Bastante bueno, muy buen libro', 8, 5, 4);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Aburrido y predecible', 3, 6, 24);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('He leido libros malos pero este fue el colmo', 1, 15, 20);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Muy regular, en todo sentido', 5, 19, 20);

INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Me gusto bastante, pero pudo haber sido mejor', 7, 8, 20);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Una joya entre joyas', 9, 5, 1);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Muy olvidable', 3, 28, 27);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Entretenido pero de ahi no mas', 5, 19, 5);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Malo es piropo', 2, 9, 15);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Nada mal', 7, 30, 22);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Me gusto mucho', 8, 14, 3);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Este libro marco una nueva etapa en mi vida', 10, 1, 2);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Estresante', 3, 12, 25);

INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Ganas de lavarme los ojos con cloro despues de leer este libro', 1, 4, 21);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Bueno pero tampoco es para tanto', 6, 1, 21);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('No fue de mi gusto', 2, 10, 22);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('No estuvo mal pero tampoco lo volveria a leer', 6, 1, 3);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Una basura', 1, 1, 1);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('No le pongo menos calificacion para ser considerado', 3, 17, 15);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('No era lo que esperaba', 5, 1, 12);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Una vez esta bien, dos veces podria, ya tres como que no', 7, 11, 14);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('DE SER POR MI ME GRABARIA ESTE LIBRO EN LAS RETINAS DE LOS OJOS', 10, 10, 20);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Sin duda una buena eleccion', 8, 26, 11);

INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('No me arrepiento de nada :3', 9, 21, 21);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Hmm', 6, 5, 25);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Malo', 3, 4, 18);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Mal hecho', 4, 1, 8);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Para gustos colores...', 2, 7, 2);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Me arrepiento tanto de haber perdido mi tiempo asi', 1, 2, 27);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Malito', 2, 4, 3);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('En un basurero encuentro mejores', 2, 9, 28);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Bueno pero no taaan bueno', 6, 1, 21);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('A mi me gusto bastante', 7, 3, 3);

INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Se que cada quien tiene sus gustos pero para mi este fue magnifico', 8, 11, 11);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('Perdida de todo', 4, 4, 2);
INSERT INTO Resena_p1 (descripcion, calificacion, libro_id, cliente_id) VALUES ('No me convencio lo suficiente', 5, 19, 12);

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
    
    FUNCTION insertar_resena(p_descripcion resena_p1.descripcion%TYPE, p_calificacion resena_p1.calificacion%TYPE,
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

    PROCEDURE modificar_libro(p_id libro_p1.id%TYPE, p_titulo libro_p1.titulo%TYPE, p_editorial libro_p1.editorial_id%TYPE,
                                p_genero libro_p1.genero_id%TYPE, p_autor libro_p1.autor_id%TYPE,
                                p_anno_publicacion libro_p1.anno_publicacion%TYPE, p_isbn libro_p1.isbn%TYPE,
                                p_inventario libro_p1.inventario%TYPE);

    PROCEDURE modificar_prestamo(p_id prestamos_p1.id%TYPE, p_fecha_prestamo prestamos_p1.fecha_prestamo%TYPE,
                                    p_fecha_devolucion prestamos_p1.fecha_devolucion%TYPE, p_libro prestamos_p1.libro_id%TYPE,
                                    p_cliente prestamos_p1.cliente_id%TYPE);

    PROCEDURE modificar_resena(p_id resena_p1.id%TYPE, p_descripcion resena_p1.descripcion%TYPE,
                                p_calificacion resena_p1.calificacion%TYPE, p_libro resena_p1.libro_id%TYPE,
                                p_cliente resena_p1.cliente_id%TYPE);
    
    PROCEDURE modificar_usuario(p_usuario usuario_p1.username%TYPE, p_contrasenna usuario_p1.contrasenna%TYPE,
                                    p_empleado usuario_p1.empleado_id%TYPE);
									
    PROCEDURE modificar_empleado(p_id empleado_p1.id%TYPE, p_nombre empleado_p1.nombre%TYPE,
                                    p_apellido empleado_p1.apellido%TYPE);
    
    PROCEDURE modificar_usuario_bitacora (p_usuario Bitacora_libro_p1.usuario%TYPE);
    
    PROCEDURE borrar_cliente(p_id clientes_p1.id%TYPE);
    
    PROCEDURE borrar_autor(p_id autor_p1.id%TYPE);
    
    PROCEDURE borrar_editorial(p_id editorial_p1.id%TYPE); 
    
    PROCEDURE borrar_genero(p_id genero_p1.id%TYPE);
    
    PROCEDURE borrar_libro(p_id libro_p1.id%TYPE);
    
    PROCEDURE borrar_resena(p_id resena_p1.id%TYPE);
    
    PROCEDURE borrar_prestamo(p_id prestamos_p1.id%TYPE);
    
    PROCEDURE borrar_empleado(p_id empleado_p1.id%TYPE);
    
    PROCEDURE borrar_usuario(p_usuario usuario_p1.username%TYPE);
    
END paquete_modificaciones_p1;
/
    
CREATE OR REPLACE PACKAGE BODY paquete_modificaciones_p1 AS 
    FUNCTION insertar_cliente(p_nombre clientes_p1.nombre%TYPE, p_apellido clientes_p1.apellido%TYPE, p_correo clientes_p1.correo%TYPE,
                            p_telefono clientes_p1.telefono%TYPE)
    RETURN NUMBER IS 
    n_cliente clientes_p1.id%TYPE;
    BEGIN
        SELECT seq_clientes.NEXTVAL INTO n_cliente FROM dual;
        INSERT INTO clientes_p1 (nombre, apellido, correo, telefono) VALUES (p_nombre, p_apellido, p_correo, p_telefono);
        RETURN n_cliente;
    END;
    
    
    FUNCTION insertar_autor(p_nombre autor_p1.nombre%TYPE, p_apellido autor_p1.apellido%TYPE,
                            p_nacionalidad autor_p1.nacionalidad%TYPE) 
    RETURN NUMBER IS
    n_autor autor_p1.id%TYPE;
    BEGIN
        SELECT seq_autor.NEXTVAL INTO n_autor FROM dual;
        INSERT INTO autor_p1 (nombre, apellido, nacionalidad) VALUES (p_nombre, p_apellido, p_nacionalidad);
        RETURN n_autor;
    END;
    
    
    FUNCTION insertar_editorial(p_nombre editorial_p1.nombre%TYPE, p_origen editorial_p1.origen%TYPE)
    RETURN NUMBER IS
    n_editorial editorial_p1.id%TYPE;
    BEGIN
        SELECT seq_editorial.NEXTVAL INTO n_editorial FROM dual;
        INSERT INTO editorial_p1(nombre, origen) VALUES (p_nombre, p_origen);
        RETURN n_editorial;
    END;
    
    
    FUNCTION insertar_genero(p_nombre genero_p1.nombre%TYPE)
    RETURN NUMBER IS
    n_genero genero_p1.id%TYPE;
    BEGIN
        SELECT seq_genero.NEXTVAL INTO n_genero FROM dual;
        INSERT INTO genero_p1(nombre) VALUES (p_nombre);
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
        INSERT INTO libro_p1(titulo, editorial_id, genero_id, autor_id,anno_publicacion, isbn, inventario) VALUES (p_titulo, p_editorial, p_genero, p_autor,
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
        INSERT INTO prestamos_p1(fecha_prestamo, fecha_devolucion, libro_id, cliente_id) VALUES (p_fecha_prestamo, p_fecha_devolucion, p_libro, p_cliente);
        RETURN n_prestamos;
    END;
    
    
    FUNCTION insertar_resena(p_descripcion resena_p1.descripcion%TYPE, p_calificacion resena_p1.calificacion%TYPE,
                                p_libro resena_p1.libro_id%TYPE, p_cliente resena_p1.cliente_id%TYPE)
    RETURN NUMBER IS
    n_resena resena_p1.id%TYPE;
    BEGIN
        SELECT seq_resena.NEXTVAL INTO n_resena FROM dual;
        INSERT INTO resena_p1(descripcion, calificacion, libro_id, cliente_id) VALUES (p_descripcion, p_calificacion, p_libro, p_cliente);
        RETURN n_resena;
    END;
    
    
    FUNCTION insertar_empleado(p_nombre empleado_p1.nombre%TYPE,
                                p_apellido empleado_p1.apellido%TYPE)
    RETURN NUMBER IS
    n_empleado empleado_p1.id%TYPE;
    BEGIN
        SELECT seq_empleado.NEXTVAL INTO n_empleado FROM dual;
        INSERT INTO empleado_p1(nombre, apellido) VALUES (p_nombre, p_apellido);
        RETURN n_empleado;
    END;
	
    
    FUNCTION insertar_usuario(p_usuario usuario_p1.username%TYPE,
                                p_contrasenna usuario_p1.contrasenna%TYPE,
                                p_empleado usuario_p1.empleado_id%TYPE)
    RETURN VARCHAR2 IS
    n_usuario usuario_p1.username%TYPE;
    BEGIN
        SELECT p_usuario INTO n_usuario FROM dual;
        INSERT INTO usuario_p1(username, contrasenna, empleado_id) VALUES (p_usuario, p_contrasenna, p_empleado);
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
        SET nombre = p_nombre, origen = p_origen
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
    
    
    PROCEDURE modificar_libro(p_id libro_p1.id%TYPE, p_titulo libro_p1.titulo%TYPE, p_editorial libro_p1.editorial_id%TYPE,
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
    
    
    PROCEDURE modificar_prestamo(p_id prestamos_p1.id%TYPE, p_fecha_prestamo prestamos_p1.fecha_prestamo%TYPE,
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
    
    PROCEDURE modificar_usuario_bitacora (p_usuario Bitacora_libro_p1.usuario%TYPE) AS
        v_ultimo_id NUMBER;
    BEGIN
        SELECT MAX(id) INTO v_ultimo_id FROM Bitacora_libro_p1;
        
        UPDATE  Bitacora_libro_p1
        SET usuario = p_usuario
        WHERE id = v_ultimo_id;
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
    END;
    
    -- PROCEDIMIENTO PARA BORRAR CLIENTE
    PROCEDURE borrar_cliente(p_id clientes_p1.id%TYPE) IS
    c_cont NUMBER;
    BEGIN
        SELECT COUNT(*) INTO c_cont
        FROM clientes_p1 c
        WHERE c.id = p_id;
        
        IF c_cont = 1 THEN
            -- Si el cliente existe en la BD
            DELETE FROM clientes_p1
            WHERE id = p_id;
            COMMIT;
            DBMS_OUTPUT.PUT_LINE('Cliente con ID ' || p_id || ' eliminado exitosamente.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Cliente con ID ' || p_id || ' no existe.');
        END IF;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
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
            COMMIT;
            DBMS_OUTPUT.PUT_LINE('Autor con ID ' || p_id || ' eliminado exitosamente');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Autor con ID ' || p_id || ' no existe.');
        END IF;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
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
            DBMS_OUTPUT.PUT_LINE('Editorial con ID ' || p_id || ' eliminado exitosamente');
            COMMIT;
        ELSE
            DBMS_OUTPUT.PUT_LINE('Editorial con ID ' || p_id || ' no existe.');
        END IF;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
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
            DBMS_OUTPUT.PUT_LINE('Genero con ID ' || p_id || ' eliminado exitosamente');
            COMMIT;
        ELSE
            DBMS_OUTPUT.PUT_LINE('Genero con ID ' || p_id || ' no existe.');
        END IF;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
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
            COMMIT;
            DBMS_OUTPUT.PUT_LINE('Libro con ID ' || p_id || ' eliminado.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Libro con ID ' || p_id || ' no existe.');
        END IF;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                DBMS_OUTPUT.PUT_LINE('Error al eliminar libro: ' || SQLERRM);
    END;
    
    
    -- PROCEDIMIENTO PARA BORRAR UNA RESENNA
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
            DBMS_OUTPUT.PUT_LINE('Resenna con ID ' || p_id || ' eliminado exitosamente');
            COMMIT;
        ELSE
            DBMS_OUTPUT.PUT_LINE('Reseña con ID ' || p_id || ' no existe.');
        END IF;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                DBMS_OUTPUT.PUT_LINE('Error al eliminar reseña: ' || SQLERRM);
    END;
    
    
    -- PROCEDIMIENTO PARA BORRAR UN PRESTAMO
    PROCEDURE borrar_prestamo(p_id prestamos_p1.id%TYPE) IS
        p_cont NUMBER;
    BEGIN
        SELECT COUNT(*) INTO p_cont
        FROM prestamos_p1 p
        WHERE p.id = p_id;
        
        IF p_cont = 1 THEN
            -- Si el prestamo existe en la BD
            DELETE FROM prestamos_p1
            WHERE id = p_id;
            DBMS_OUTPUT.PUT_LINE('Prestamo con ID ' || p_id || ' eliminado exitosamente');
            COMMIT;
        ELSE
            DBMS_OUTPUT.PUT_LINE('Prestamo con ID ' || p_id || ' no existe.');
        END IF;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
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
            DBMS_OUTPUT.PUT_LINE('Empleado con ID ' || p_id || ' eliminado exitosamente');
            COMMIT;
        ELSE
            DBMS_OUTPUT.PUT_LINE('Empleado con ID ' || p_id || ' no existe.');
        END IF;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
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
            DBMS_OUTPUT.PUT_LINE('Usuario ' || p_usuario || ' eliminado exitosamente');
            COMMIT;
        ELSE
            DBMS_OUTPUT.PUT_LINE('Usuario ' || p_usuario || ' no existe.');
        END IF;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                DBMS_OUTPUT.PUT_LINE('Error al eliminar usuario: ' || SQLERRM);
    END;
    
END paquete_modificaciones_p1;
/


CREATE OR REPLACE PACKAGE paquete_consultas_p1 AS
    PROCEDURE mostrar_todos_clientes (p_cursor OUT SYS_REFCURSOR);
    
    PROCEDURE mostrar_cliente_id (p_id clientes_p1.id%TYPE, p_cursor OUT SYS_REFCURSOR);
    
    PROCEDURE mostrar_todos_autores (p_cursor OUT SYS_REFCURSOR);
    
    PROCEDURE mostrar_autor_id (p_id autor_p1.id%TYPE, p_cursor OUT SYS_REFCURSOR);
    
    PROCEDURE mostrar_todos_editoriales (p_cursor OUT SYS_REFCURSOR);
    
    PROCEDURE mostrar_editorial_id (p_id editorial_p1.id%TYPE, p_cursor OUT SYS_REFCURSOR);
    
    PROCEDURE mostrar_todos_generos(p_cursor OUT SYS_REFCURSOR);
    
    PROCEDURE mostrar_genero_id (p_id genero_p1.id%TYPE, p_cursor OUT SYS_REFCURSOR);
    
    PROCEDURE mostrar_todos_libros(p_cursor OUT SYS_REFCURSOR);
    
    PROCEDURE mostrar_libro_id (p_id libro_p1.id%TYPE, p_cursor OUT SYS_REFCURSOR);
    
    PROCEDURE mostrar_todos_resena(p_cursor OUT SYS_REFCURSOR);
    
    PROCEDURE mostrar_resena_id (p_id resena_p1.id%TYPE, p_cursor OUT SYS_REFCURSOR);
    
    PROCEDURE mostrar_todos_prestamos(p_cursor OUT SYS_REFCURSOR);
    
    PROCEDURE mostrar_prestamos_id (p_id prestamos_p1.id%TYPE, p_cursor OUT SYS_REFCURSOR);
    
    PROCEDURE mostrar_ultimas_nbitacoras(p_num NUMBER, p_cursor OUT SYS_REFCURSOR);

    PROCEDURE mostrar_bitacoras(p_cursor OUT SYS_REFCURSOR);
 
    PROCEDURE mostrar_usuario_nombre(p_usuario usuario_p1.username%TYPE, p_cursor OUT SYS_REFCURSOR);
    
    PROCEDURE mostrar_usuario_contrasena(p_usuario usuario_p1.username%TYPE, p_contrasena usuario_p1.contrasenna%TYPE, p_cursor OUT SYS_REFCURSOR);
 
    PROCEDURE mostrar_usuarios(p_cursor OUT SYS_REFCURSOR);
 
    PROCEDURE mostrar_empleados_id (p_id empleado_p1.id%TYPE, p_cursor OUT SYS_REFCURSOR);
 
    PROCEDURE mostrar_todos_empleados(p_cursor OUT SYS_REFCURSOR);
    
    PROCEDURE mostrar_genero_popular(p_cursor OUT SYS_REFCURSOR);
    
    PROCEDURE mostrar_origen_popular(p_cursor OUT SYS_REFCURSOR);
    
END paquete_consultas_p1;
/

CREATE OR REPLACE PACKAGE BODY paquete_consultas_p1 AS
    PROCEDURE mostrar_todos_clientes (p_cursor OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN p_cursor FOR
            SELECT * FROM clientes_p1;
    END;
    
    PROCEDURE mostrar_cliente_id (p_id clientes_p1.id%TYPE, p_cursor OUT SYS_REFCURSOR)AS
    BEGIN
        OPEN p_cursor FOR
            SELECT *
            FROM clientes_p1 c
            WHERE c.id = p_id;
    END;
    
    PROCEDURE mostrar_todos_autores (p_cursor OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN p_cursor FOR
            SELECT * FROM autor_p1;
    END;
    
    PROCEDURE mostrar_autor_id (p_id autor_p1.id%TYPE, p_cursor OUT SYS_REFCURSOR)AS
    BEGIN
        OPEN p_cursor FOR
            SELECT *
            FROM autor_p1 a
            WHERE a.id = p_id;
    END;
    
    
    PROCEDURE mostrar_todos_editoriales (p_cursor OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN p_cursor FOR
            SELECT * FROM editorial_p1;
    END;
    
    PROCEDURE mostrar_editorial_id (p_id editorial_p1.id%TYPE, p_cursor OUT SYS_REFCURSOR)AS
    BEGIN
        OPEN p_cursor FOR                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
            SELECT *
            FROM editorial_p1 e
            WHERE e.id = p_id;
    END;
    
    PROCEDURE mostrar_todos_generos(p_cursor OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN p_cursor FOR
            SELECT * FROM genero_p1;
    END;
    
    PROCEDURE mostrar_genero_id (p_id genero_p1.id%TYPE, p_cursor OUT SYS_REFCURSOR)AS
    BEGIN
        OPEN p_cursor FOR
            SELECT *
            FROM genero_p1 g
            WHERE g.id = p_id;
    END;
    
    PROCEDURE mostrar_todos_libros(p_cursor OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN p_cursor FOR
            SELECT * FROM libro_p1;
    END;
    
    PROCEDURE mostrar_libro_id (p_id libro_p1.id%TYPE, p_cursor OUT SYS_REFCURSOR)AS
    BEGIN
        OPEN p_cursor FOR
            SELECT *
            FROM libro_p1 l
            WHERE l.id = p_id;
    END;
    
    PROCEDURE mostrar_todos_resena(p_cursor OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN p_cursor FOR
            SELECT * FROM resena_p1;
    END;
    
    PROCEDURE mostrar_resena_id (p_id resena_p1.id%TYPE, p_cursor OUT SYS_REFCURSOR)AS
    BEGIN
        OPEN p_cursor FOR
            SELECT *
            FROM resena_p1 r
            WHERE r.id = p_id;
    END;
    
    PROCEDURE mostrar_todos_prestamos(p_cursor OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN p_cursor FOR
            SELECT * FROM prestamos_p1;
    END;
    
    PROCEDURE mostrar_prestamos_id (p_id prestamos_p1.id%TYPE, p_cursor OUT SYS_REFCURSOR)AS
    BEGIN
        OPEN p_cursor FOR
            SELECT *
            FROM prestamos_p1 p
            WHERE p.id = p_id;
    END;
    
    
    PROCEDURE mostrar_todos_empleados(p_cursor OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN p_cursor FOR
            SELECT * FROM empleado_p1;
    END;
    
    PROCEDURE mostrar_empleados_id (p_id empleado_p1.id%TYPE, p_cursor OUT SYS_REFCURSOR)AS
    BEGIN
        OPEN p_cursor FOR
            SELECT *
            FROM empleado_p1 p
            WHERE p.id = p_id;
    END;
    
    PROCEDURE mostrar_usuarios(p_cursor OUT SYS_REFCURSOR) AS
    BEGIN 
        OPEN p_cursor FOR
            SELECT * FROM usuario_p1;
    END;
    
    PROCEDURE mostrar_usuario_contrasena(p_usuario usuario_p1.username%TYPE, p_contrasena usuario_p1.contrasenna%TYPE,
                                            p_cursor OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN p_cursor FOR
            SELECT *
            FROM usuario_p1
            WHERE username = p_usuario AND contrasenna = p_contrasena;
    END;
    
    PROCEDURE mostrar_usuario_nombre(p_usuario usuario_p1.username%TYPE, p_cursor OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN p_cursor FOR
            SELECT * 
            FROM usuario_p1 u
            WHERE u.username = p_usuario;
    END;
    
    PROCEDURE mostrar_bitacoras(p_cursor OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN p_cursor FOR
            SELECT * FROM bitacora_libro_p1;
    END;
    
    PROCEDURE mostrar_ultimas_nbitacoras(p_num NUMBER, p_cursor OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN p_cursor FOR
            SELECT *
            FROM bitacora_libro_p1 p
            ORDER BY p.fecha DESC
            FETCH FIRST p_num ROWS ONLY;
    END;

    PROCEDURE mostrar_genero_popular(p_cursor OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN p_cursor FOR
            SELECT g.nombre AS genero, COUNT(*) AS total_prestamos
            FROM Prestamos_p1 p
            INNER JOIN Libro_p1 l ON p.libro_id = l.id
            INNER JOIN Genero_p1 g ON l.genero_id = g.id
            GROUP BY g.nombre;
    END;

    PROCEDURE mostrar_origen_popular(p_cursor OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN p_cursor FOR
            SELECT e.origen AS origen_editorial, COUNT(*) AS total_prestamos
            FROM Prestamos_p1 p
            INNER JOIN Libro_p1 l ON p.libro_id = l.id
            INNER JOIN Editorial_p1 e ON l.editorial_id = e.id
            GROUP BY e.origen;
    END;
    
END paquete_consultas_p1;
/
CREATE OR REPLACE TRIGGER cambio_libros
    AFTER INSERT OR UPDATE OR DELETE
    ON Libro_p1 FOR EACH ROW
DECLARE
    t_usuario VARCHAR2(50 char);
BEGIN
    SELECT USER INTO t_usuario FROM DUAL;
    IF INSERTING THEN
        INSERT INTO bitacora_libro_p1 (fecha, usuario, descripcion)
        VALUES (SYSDATE, t_usuario, 'Se inserto el libro: ' || :NEW.titulo);

    ELSIF UPDATING THEN
        DECLARE
            accion VARCHAR2(250 char);
        BEGIN
            accion := 'Se modifico el libro: ' || :NEW.id;

            IF :NEW.inventario != :OLD.inventario THEN
                accion := accion || '. Inventario antes: ' || :OLD.inventario || ', Inventario actuak: ' || :NEW.inventario;
            END IF;

            IF :NEW.isbn != :OLD.isbn THEN
                accion := accion || '. ISBN anterior: ' || :OLD.isbn || ', ISBN actual: ' || :NEW.isbn;
            END IF;
            
            IF :NEW.titulo != :OLD.titulo THEN
                accion := accion || '. titulo anterior: ' || :OLD.titulo || ', titulo actual: ' || :NEW.titulo;
            END IF;
            
            IF :NEW.editorial_id != :OLD.editorial_id THEN
                accion := accion || '. editorial anterior: ' || :OLD.editorial_id || ', editorial actual: ' || :NEW.editorial_id;
            END IF;
            
            IF :NEW.genero_id != :OLD.genero_id THEN
                accion := accion || '. genero anterior: ' || :OLD.genero_id || ', genero actual: ' || :NEW.genero_id;
            END IF;
            
            IF :NEW.autor_id != :OLD.autor_id THEN
                accion := accion || '. autor anterior: ' || :OLD.autor_id || ', autor actual: ' || :NEW.autor_id;
            END IF;
            
            IF :NEW.anno_publicacion != :OLD.anno_publicacion THEN
                accion := accion || '. anno publicacion anterior: ' || :OLD.anno_publicacion || ', anno publicacion actual: ' || :NEW.anno_publicacion;
            END IF;

            INSERT INTO Bitacora_libro_p1 (fecha, usuario, descripcion)
            VALUES (SYSDATE, t_usuario, accion);
        END;

    ELSIF DELETING THEN
        INSERT INTO Bitacora_libro_p1 (fecha, usuario, descripcion)
        VALUES (SYSDATE, t_usuario, 'Se elimino el libro: ' || :OLD.titulo);

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

DROP PACKAGE paquete_modificaciones_p1; 
DROP PACKAGE paquete_consultas_p1;

DROP TRIGGER cambio_libros;

DROP TABLE prestamos_p1;
DROP TABLE resena_p1;
DROP TABLE libro_p1;
DROP TABLE genero_p1;
DROP TABLE editorial_p1;
DROP TABLE autor_p1;
DROP TABLE clientes_p1;
DROP TABLE bitacora_libro_p1;
DROP TABLE usuario_p1;
DROP TABLE empleado_p1;

