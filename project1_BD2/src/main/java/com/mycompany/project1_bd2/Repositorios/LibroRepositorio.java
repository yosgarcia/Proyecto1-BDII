package com.mycompany.project1_bd2.Repositorios;

import com.mycompany.project1_bd2.Queries;
import com.mycompany.project1_bd2.entidades.Autor;
import com.mycompany.project1_bd2.entidades.Editorial;
import com.mycompany.project1_bd2.entidades.Genero;
import com.mycompany.project1_bd2.entidades.Libro;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
import oracle.jdbc.driver.OracleConnection;

public class LibroRepositorio {
    
    public int insertarLibro(OracleConnection connection, String pTitulo, int pIdEditorial, int pIdGenero, int pIdAutor,
                                    int pAnnoPublicacion, String pISBN, int pInventario) {
        try{
            CallableStatement callableStatement = connection.prepareCall(Queries.LIBRO_INSERTAR_FUNC_CALL);
            callableStatement.registerOutParameter(1, Types.NUMERIC);
            callableStatement.setString(2, pTitulo);
            callableStatement.setInt(3, pIdEditorial);
            callableStatement.setInt(4, pIdGenero);
            callableStatement.setInt(5, pIdAutor);
            callableStatement.setInt(6, pAnnoPublicacion);
            callableStatement.setString(7, pISBN);
            callableStatement.setInt(8, pInventario);

            callableStatement.execute();

            return callableStatement.getInt(1);

        } catch (Exception e) {
            e.printStackTrace();
            return -1; // Retornar un valor indicando un error
        }
    }

    public void modificarLibro(OracleConnection connection, int pIdLibro, String pTitulo, int pIdEditorial, int pIdGenero, int pIdAutor,
                                       int pAnnoPublicacion, String pISBN, int pInventario) {
        try {
            CallableStatement callableStatement = connection.prepareCall(Queries.LIBRO_MODIFICAR_PROC_CALL);
            callableStatement.setInt(1, pIdLibro);
            callableStatement.setString(2, pTitulo);
            callableStatement.setInt(3, pIdEditorial);
            callableStatement.setInt(4, pIdGenero);
            callableStatement.setInt(5, pIdAutor);
            callableStatement.setInt(6, pAnnoPublicacion);
            callableStatement.setString(7, pISBN);
            callableStatement.setInt(8, pInventario);

            callableStatement.execute();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void borrarLibro(OracleConnection connection, int pIdLibro) {
        try {
            CallableStatement callableStatement = connection.prepareCall(Queries.LIBRO_BORRAR_PROC_CALL);
            callableStatement.setInt(1, pIdLibro);

            callableStatement.execute();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Libro> mostrarTodosLibros(OracleConnection connection) {
        List<Libro> libros = new ArrayList<>();
        
        try{
            CallableStatement callableStatement = connection.prepareCall(Queries.MOSTRAR_LIBROS_PROC_CALL);
            callableStatement.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR);
            callableStatement.execute();

            // Obtener el cursor de salida
            ResultSet resultSet = (ResultSet) callableStatement.getObject(1);

            // Iterar sobre los resultados y procesarlos según sea necesario
            while (resultSet.next()) {
                // Obtener los datos del libro
                int id = resultSet.getInt("id");
                String titulo = resultSet.getString("titulo");
                int idEditorial = resultSet.getInt("editorial_id");
                int idGenero = resultSet.getInt("genero_id");
                int idAutor = resultSet.getInt("autor_id");
                Date annoPublicacion = resultSet.getDate("anno_publicacion");
                String isbn = resultSet.getString("isbn");
                int inventario = resultSet.getInt("inventario");
                
                Genero genero = new Genero(idGenero, null);
                Editorial editorial = new Editorial(idEditorial, null, null);
                Autor autor = new Autor(idAutor, null, null, null);
                
                Libro libro = new Libro(id, titulo, editorial, genero, autor, annoPublicacion, isbn, inventario);
                libros.add(libro);
                
            }

            resultSet.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return libros;
    }

    public Libro mostrarLibroPorId(OracleConnection connection, int pIdLibro) {
        try {
            CallableStatement callableStatement = connection.prepareCall(Queries.MOSTRAR_LIBRO_ID_PROC_CALL);
            callableStatement.setInt(1, pIdLibro);
            callableStatement.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR);
            callableStatement.execute();

            // Obtener el cursor de salida
            ResultSet resultSet = (ResultSet) callableStatement.getObject(2);

            // Iterar sobre los resultados y procesarlos según sea necesario
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String titulo = resultSet.getString("titulo");
                int idEditorial = resultSet.getInt("editorial_id");
                int idGenero = resultSet.getInt("genero_id");
                int idAutor = resultSet.getInt("autor_id");
                Date annoPublicacion = resultSet.getDate("anno_publicacion");
                String isbn = resultSet.getString("isbn");
                int inventario = resultSet.getInt("inventario");
                
                Genero genero = new Genero(idGenero, null);
                Editorial editorial = new Editorial(idEditorial, null, null);
                Autor autor = new Autor(idAutor, null, null, null);
                
                return new Libro(id, titulo, editorial, genero, autor, annoPublicacion, isbn, inventario);
            }

            resultSet.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
}
