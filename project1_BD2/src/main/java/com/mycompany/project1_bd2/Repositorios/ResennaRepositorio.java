package com.mycompany.project1_bd2.Repositorios;

import com.mycompany.project1_bd2.Queries;
import com.mycompany.project1_bd2.entidades.*;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import oracle.jdbc.driver.OracleConnection;

public class ResennaRepositorio {
    
    
     public List<Resenna> mostrarTodosResena(OracleConnection connection) {
        List<Resenna> resennas = new ArrayList<>();
        try {
            CallableStatement callableStatement = connection.prepareCall(Queries.MOSTRAR_RESENAS_PROC_CALL);
            callableStatement.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR);
            callableStatement.execute();

            // Obtener el cursor de salida
            ResultSet resultSet = (ResultSet) callableStatement.getObject(1);

            // Iterar sobre los resultados y procesarlos según sea necesario
            while (resultSet.next()) {
                // Obtener los datos de la reseña
                int id = resultSet.getInt("id");
                String descripcion = resultSet.getString("descripcion");
                int calificacion = resultSet.getInt("calificacion");
                int libroId = resultSet.getInt("libro_id");
                int clienteId = resultSet.getInt("cliente_id");
                
                Libro libro = new Libro(libroId, null, null, null, null, null, null, 0);
                Cliente cliente = new Cliente(clienteId, null, null, null, null);
                
                Resenna resenna = new Resenna(id,descripcion, calificacion, libro, cliente);
                resennas.add(resenna);
                
            }

            resultSet.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resennas;
    }

    public Resenna mostrarResenaPorId(OracleConnection connection, int idResena) {
        try {
            CallableStatement callableStatement = connection.prepareCall(Queries.MOSTRAR_RESENA_ID_PROC_CALL);
            callableStatement.setInt(1, idResena);
            callableStatement.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR);
            callableStatement.execute();

            // Obtener el cursor de salida
            ResultSet resultSet = (ResultSet) callableStatement.getObject(2);

            // Iterar sobre los resultados y procesarlos según sea necesario
            if (resultSet.next()) {
                // Obtener los datos de la reseña
                int id = resultSet.getInt("id");
                String descripcion = resultSet.getString("descripcion");
                int calificacion = resultSet.getInt("calificacion");
                int libroId = resultSet.getInt("libro_id");
                int clienteId = resultSet.getInt("cliente_id");
                
                Libro libro = new Libro(libroId, null, null, null, null, null, null, 0);
                Cliente cliente = new Cliente(clienteId, null, null, null, null);
                
                return new Resenna(id,descripcion, calificacion, libro, cliente);
            }

            resultSet.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public int insertarResena(OracleConnection connection, String descripcion, int calificacion, int libroId, int clienteId) {
        try {
            CallableStatement callableStatement = connection.prepareCall(Queries.RESENA_INSERTAR_FUNC_CALL);
            callableStatement.registerOutParameter(1, java.sql.Types.NUMERIC);
            callableStatement.setString(2, descripcion);
            callableStatement.setInt(3, calificacion);
            callableStatement.setInt(4, libroId);
            callableStatement.setInt(5, clienteId);

            callableStatement.execute();

            return callableStatement.getInt(1);

        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }

    public void modificarResena(OracleConnection connection, int idResena, String descripcion, int calificacion,
                                       int libroId, int clienteId) {
        try {
            CallableStatement callableStatement = connection.prepareCall(Queries.RESENA_MODIFICAR_FUNC_CALL);
            callableStatement.setInt(1, idResena);
            callableStatement.setString(2, descripcion);
            callableStatement.setInt(3, calificacion);
            callableStatement.setInt(4, libroId);
            callableStatement.setInt(5, clienteId);

            callableStatement.execute();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void borrarResena(OracleConnection connection, int idResena) {
        try {
            CallableStatement callableStatement = connection.prepareCall(Queries.RESENA_BORRAR_FUNC_CALL);
            callableStatement.setInt(1, idResena);

            callableStatement.execute();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
