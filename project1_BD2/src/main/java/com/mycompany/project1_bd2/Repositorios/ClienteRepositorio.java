package com.mycompany.project1_bd2.Repositorios;

import com.mycompany.project1_bd2.entidades.Cliente;
import com.mycompany.project1_bd2.Queries;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import oracle.jdbc.driver.OracleConnection;
import java.util.ArrayList;
import java.util.List;
import java.sql.Types;

public class ClienteRepositorio {
    
    
    public static Cliente obtenerPorId(OracleConnection connection, int id){
        try {
            // Llama al procedimiento almacenado
            CallableStatement callableStatement = connection.prepareCall(Queries.MOSTRAR_CLIENTE_ID_PROC_CALL);
            callableStatement.setInt(1, id);
            callableStatement.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR);
            callableStatement.execute();

            // Obtiene el cursor de salida
            ResultSet resultSet = (ResultSet) callableStatement.getObject(2);

            // Itera sobre los resultados y muestra la información
            if (resultSet.next()) {
                int idCliente = resultSet.getInt("id");
                String nombre = resultSet.getString("nombre");
                String apellido = resultSet.getString("apellido");
                String correo = resultSet.getString("correo");
                String telefono = resultSet.getString("telefono");

                Cliente cliente = new Cliente(idCliente, nombre, apellido, correo, telefono);
                return cliente;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    
    public static List<Cliente> obtenerTodosClientes(OracleConnection connection){
        List<Cliente> clientes = new ArrayList<>();

        try {
            // Llama al procedimiento almacenado
            CallableStatement callableStatement = connection.prepareCall(Queries.MOSTRAR_CLIENTES_PROC_CALL);
            callableStatement.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR);
            callableStatement.execute();

            // Obtiene el cursor de salida
            ResultSet resultSet = (ResultSet) callableStatement.getObject(1);

            // Itera sobre los resultados y crea objetos Cliente
            while (resultSet.next()) {
                int idCliente = resultSet.getInt("id");
                String nombre = resultSet.getString("nombre");
                String apellido = resultSet.getString("apellido");
                String correo = resultSet.getString("correo");
                String telefono = resultSet.getString("telefono");

                Cliente cliente = new Cliente(idCliente, nombre, apellido, correo, telefono);
                clientes.add(cliente);
            }

            resultSet.close();
            callableStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return clientes;
    }
    
    public static int nuevoCliente(OracleConnection connection, String nombre, String apellido, String correo, String telefono){
        try{
            CallableStatement callableStatement = connection.prepareCall(Queries.CLIENTE_INSERTAR_FUNC_CALL);
            callableStatement.registerOutParameter(1, Types.NUMERIC);
            callableStatement.setString(2, nombre);
            callableStatement.setString(3, apellido);
            callableStatement.setString(4, correo);
            callableStatement.setString(5, telefono);

            callableStatement.execute();
            return callableStatement.getInt(1);

        } catch (Exception e) {
            e.printStackTrace();
            return -1;  // Retornar un valor indicando un error
        }
    }
    
    
    public static void modificarCliente(OracleConnection connection, int id, String nombre, String apellido, String correo, String telefono){
        try{
            CallableStatement callableStatement = connection.prepareCall(Queries.CLIENTE_MODIFICAR_PROC_CALL);
            callableStatement.setInt(1, id);
            callableStatement.setString(2, nombre);
            callableStatement.setString(3, apellido);
            callableStatement.setString(4, correo);
            callableStatement.setString(5, telefono);

            callableStatement.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    
    public static void borrarCliente(OracleConnection connection, int id){
        try{
            CallableStatement callableStatement = connection.prepareCall(Queries.CLIENTE_BORRAR_PROC_CALL);
            callableStatement.setInt(1, id);
            
            callableStatement.execute();
            
        } catch (Exception e){
            e.printStackTrace();
            throw new RuntimeException(e);

        }
    }
    
    public static int verificarClientePrestamo(OracleConnection connection, int id){
        try{
            CallableStatement callableStatement = connection.prepareCall(Queries.VALIDAR_CLIENTE_PRESTAMO);
            callableStatement.registerOutParameter(1, Types.NUMERIC);
            callableStatement.setInt(2, id);

            callableStatement.execute();
            return callableStatement.getInt(1);

        } catch (Exception e) {
            e.printStackTrace();
            return -1;  // Retornar un valor indicando un error
        }
    }
    
    public static int verificarClienteResena(OracleConnection connection, int id){
        try{
            CallableStatement callableStatement = connection.prepareCall(Queries.VALIDAR_CLIENTE_RESENA);
            callableStatement.registerOutParameter(1, Types.NUMERIC);
            callableStatement.setInt(2, id);

            callableStatement.execute();
            return callableStatement.getInt(1);

        } catch (Exception e) {
            e.printStackTrace();
            return -1;  // Retornar un valor indicando un error
        }
    }
}
