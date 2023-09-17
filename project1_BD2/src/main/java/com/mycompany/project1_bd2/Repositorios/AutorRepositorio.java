package com.mycompany.project1_bd2.Repositorios;


import com.mycompany.project1_bd2.entidades.Autor;
import com.mycompany.project1_bd2.Queries;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import oracle.jdbc.driver.OracleConnection;
import java.util.ArrayList;
import java.util.List;
import java.sql.Types;

public class AutorRepositorio {
    
    
    public Autor obtenerPorId(OracleConnection connection, int id){
        try {
            // Llama al procedimiento almacenado
            CallableStatement callableStatement = connection.prepareCall(Queries.MOSTRAR_AUTOR_ID_PROC_CALL);
            callableStatement.setInt(1, id);
            callableStatement.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR);
            callableStatement.execute();

            // Obtiene el cursor de salida
            ResultSet resultSet = (ResultSet) callableStatement.getObject(2);

            // Itera sobre los resultados y muestra la información
            if (resultSet.next()) {
                int idAutor = resultSet.getInt("id");
                String nombre = resultSet.getString("nombre");
                String apellido = resultSet.getString("apellido");
                String nacionalidad = resultSet.getString("nacionalidad");

                Autor autor = new Autor(idAutor, nombre, apellido, nacionalidad);
                return autor;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    
    public List<Autor> obtenerTodosClientes(OracleConnection connection){
        List<Autor> autores = new ArrayList<>();

        try {
            // Llama al procedimiento almacenado
            CallableStatement callableStatement = connection.prepareCall(Queries.MOSTRAR_AUTORES_PROC_CALL);
            callableStatement.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR);
            callableStatement.execute();

            // Obtiene el cursor de salida
            ResultSet resultSet = (ResultSet) callableStatement.getObject(1);

            // Itera sobre los resultados y crea objetos Cliente
            while (resultSet.next()) {
                int idAutor = resultSet.getInt("id");
                String nombre = resultSet.getString("nombre");
                String apellido = resultSet.getString("apellido");
                String nacionalidad = resultSet.getString("nacionalidad");

                Autor autor = new Autor(idAutor, nombre, apellido, nacionalidad);
                autores.add(autor);
            }

            resultSet.close();
            callableStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return autores;
    }
    
    public int nuevoAutor(OracleConnection connection, String nombre, String apellido, String nacionalidad){
        try{
            CallableStatement callableStatement = connection.prepareCall(Queries.AUTOR_INSERTAR_FUNC_CALL);
            callableStatement.registerOutParameter(1, Types.NUMERIC);
            callableStatement.setString(2, nombre);
            callableStatement.setString(3, apellido);
            callableStatement.setString(4, nacionalidad);

            callableStatement.execute();

            return callableStatement.getInt(1);

        } catch (Exception e) {
            e.printStackTrace();
            return -1;  // Retornar un valor indicando un error
        }
    }
    
    
    public void modificarAutor(OracleConnection connection, int id, String nombre, String apellido, String nacionalidad){
        try{
            CallableStatement callableStatement = connection.prepareCall(Queries.AUTOR_MODIFICAR_FUNC_CALL);
            callableStatement.setInt(1, id);
            callableStatement.setString(2, nombre);
            callableStatement.setString(3, apellido);
            callableStatement.setString(4, nacionalidad);


            callableStatement.execute();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    
    public void borrarCiente(OracleConnection connection, int id){
        try{
            CallableStatement callableStatement = connection.prepareCall(Queries.AUTOR_BORRAR_FUNC_CALL);
            callableStatement.setInt(1, id);
            
            callableStatement.execute();
        } catch (Exception e){
            e.printStackTrace();
        }
    }
    
}
