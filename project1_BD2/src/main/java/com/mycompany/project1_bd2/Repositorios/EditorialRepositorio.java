package com.mycompany.project1_bd2.Repositorios;

import com.mycompany.project1_bd2.entidades.Editorial;
import com.mycompany.project1_bd2.Queries;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
import oracle.jdbc.driver.OracleConnection;


public class EditorialRepositorio {
    
    public static Editorial mostrarEditorialPorId(OracleConnection connection, int pIdEditorial) {
        try{
            CallableStatement callableStatement = connection.prepareCall(Queries.MOSTRAR_EDITORIAL_ID_PROC_CALL);
            callableStatement.setInt(1, pIdEditorial);
            callableStatement.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR);
            callableStatement.execute();

            // Obtiene el cursor de salida
            ResultSet resultSet = (ResultSet) callableStatement.getObject(2);

            // Itera sobre los resultados y muestra la información
            if (resultSet.next()) {
                int idEditorial = resultSet.getInt("id");
                String nombre = resultSet.getString("nombre");
                String origen = resultSet.getString("origen");
                Editorial editorial = new Editorial(idEditorial, nombre, origen);
                return editorial;
            }

            resultSet.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return null;
    }
    
    
    public static List<Editorial> mostrarTodosEditoriales(OracleConnection connection) {
        
        List<Editorial> editoriales = new ArrayList<>();
        try {
            CallableStatement callableStatement = connection.prepareCall(Queries.MOSTRAR_EDITORIALES_PROC_CALL);
            callableStatement.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR);
            callableStatement.execute();

            // Obtiene el cursor de salida
            ResultSet resultSet = (ResultSet) callableStatement.getObject(1);

            // Itera sobre los resultados y muestra la información
            while (resultSet.next()) {
                int idEditorial = resultSet.getInt("id");
                String nombre = resultSet.getString("nombre");
                String origen = resultSet.getString("origen");
                Editorial editorial = new Editorial(idEditorial, nombre, origen);
                editoriales.add(editorial);
            }

            resultSet.close();
            callableStatement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return editoriales;
    }
    
    public static int nuevoEditorial(OracleConnection connection, String nombre, String origen){
        try{
            CallableStatement callableStatement = connection.prepareCall(Queries.EDITORIAL_INSERTAR_FUNC_CALL);
            callableStatement.registerOutParameter(1, Types.NUMERIC);
            callableStatement.setString(2, nombre);
            callableStatement.setString(3, origen);

            callableStatement.execute();
            connection.commit();

            return callableStatement.getInt(1);

        } catch (Exception e) {
            e.printStackTrace();
            return -1;  // Retornar un valor indicando un error
        }
    }
    
    
    public static void modificarEditorial(OracleConnection connection, int id, String nombre, String origen) {
        try {
            CallableStatement callableStatement = connection.prepareCall(Queries.EDITORIAL_MODIFICAR_PROC_CALL);
            callableStatement.setInt(1, id);
            callableStatement.setString(2, nombre);
            callableStatement.setString(3, origen);

            callableStatement.execute();
            connection.commit();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
     public static void borrarEditorial(OracleConnection connection, int id) {
        try {
            CallableStatement callableStatement = connection.prepareCall(Queries.EDITORIAL_BORRAR_PROC_CALL);
            callableStatement.setInt(1, id);

            callableStatement.execute();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
     public static List<Editorial> mostrarOrigenYNumPrestamos(OracleConnection connection){
        List<Editorial> editoriales = new ArrayList<>();
        try {
            CallableStatement callableStatement = connection.prepareCall(Queries.MOSTRAR_EDITORIAL_ORIGEN_POPULAR_PROC_CALL);
            callableStatement.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR);
            callableStatement.execute();

            // Obtener el cursor de salida
            ResultSet resultSet = (ResultSet) callableStatement.getObject(1);

            // Iterar sobre los resultados y procesarlos según sea necesario
            while (resultSet.next()) {
                // Obtener los datos del género
                String origen = resultSet.getString("origen_editorial");
                int prestamos = resultSet.getInt("total_prestamos");
                Editorial editorial = new Editorial(origen, prestamos);
                editoriales.add(editorial);
            }

            resultSet.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return editoriales;
    }
    
}
