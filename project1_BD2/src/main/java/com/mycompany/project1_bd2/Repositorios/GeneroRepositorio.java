package com.mycompany.project1_bd2.Repositorios;

import com.mycompany.project1_bd2.Queries;
import com.mycompany.project1_bd2.entidades.Genero;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.List;
import java.sql.Types;
import java.util.ArrayList;
import oracle.jdbc.driver.OracleConnection;


public class GeneroRepositorio {
    
    public static int insertarGenero(OracleConnection connection, String nombreGenero) {
        try {
            CallableStatement callableStatement = connection.prepareCall(Queries.GENERO_INSERTAR_FUNC_CALL);
            callableStatement.registerOutParameter(1, Types.NUMERIC);
            callableStatement.setString(2, nombreGenero);

            callableStatement.execute();
            return callableStatement.getInt(1);

        } catch (Exception e) {
            e.printStackTrace();
            return -1; // Retornar un valor indicando un error
        }
    }

    public static void modificarGenero(OracleConnection connection, int idGenero, String nombreGenero) {
        try{
            CallableStatement callableStatement = connection.prepareCall(Queries.GENERO_MODIFICAR_PROC_CALL);
            callableStatement.setInt(1, idGenero);
            callableStatement.setString(2, nombreGenero);

            callableStatement.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void borrarGenero(OracleConnection connection, int pIdGenero) {
        try {
            CallableStatement callableStatement = connection.prepareCall(Queries.GENERO_BORRAR_PROC_CALL);
            callableStatement.setInt(1, pIdGenero);

            callableStatement.execute();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static List<Genero> mostrarTodosGeneros(OracleConnection connection) {
        List<Genero> generos = new ArrayList<>();
        try {
            CallableStatement callableStatement = connection.prepareCall(Queries.MOSTRAR_GENEROS_PROC_CALL);
            callableStatement.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR);
            callableStatement.execute();

            // Obtener el cursor de salida
            ResultSet resultSet = (ResultSet) callableStatement.getObject(1);

            // Iterar sobre los resultados y procesarlos según sea necesario
            while (resultSet.next()) {
                // Obtener los datos del género
                int id = resultSet.getInt("id");
                String nombre = resultSet.getString("nombre");
                Genero genero = new Genero(id, nombre);
                generos.add(genero);
            }

            resultSet.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return generos;
    }

    
    public static Genero mostrarGeneroPorId(OracleConnection connection, int pIdGenero) {
        try {
            CallableStatement callableStatement = connection.prepareCall(Queries.MOSTRAR_GENERO_ID_PROC_CALL);
            callableStatement.setInt(1, pIdGenero);
            callableStatement.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR);
            callableStatement.execute();

            // Obtener el cursor de salida
            ResultSet resultSet = (ResultSet) callableStatement.getObject(2);

            // Iterar sobre los resultados y procesarlos según sea necesario
            if (resultSet.next()) {
                // Obtener los datos del género
                int id = resultSet.getInt("id");
                String nombre = resultSet.getString("nombre");
                return new Genero(id, nombre);
            }

            resultSet.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    
    public static List<Genero> mostrarGeneroYNumPrestamos(OracleConnection connection){
        List<Genero> generos = new ArrayList<>();
        try {
            CallableStatement callableStatement = connection.prepareCall(Queries.MOSTRAR_GENERO_POPULAR_PROC_CALL);
            callableStatement.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR);
            callableStatement.execute();

            // Obtener el cursor de salida
            ResultSet resultSet = (ResultSet) callableStatement.getObject(1);

            // Iterar sobre los resultados y procesarlos según sea necesario
            while (resultSet.next()) {
                // Obtener los datos del género
                String nombre = resultSet.getString("genero");
                int prestamos = resultSet.getInt("total_prestamos");
                Genero genero = new Genero(nombre, prestamos);
                generos.add(genero);
            }

            resultSet.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return generos;
    }
    
}
