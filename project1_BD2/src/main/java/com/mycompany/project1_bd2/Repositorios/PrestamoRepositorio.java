package com.mycompany.project1_bd2.Repositorios;

import com.mycompany.project1_bd2.Queries;
import com.mycompany.project1_bd2.entidades.*;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.util.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import oracle.jdbc.driver.OracleConnection;


public class PrestamoRepositorio {
    
    
    public static List<Prestamo> mostrarTodosPrestamos(OracleConnection connection) {
        List<Prestamo> prestamos = new ArrayList<>();
        try {
            CallableStatement callableStatement = connection.prepareCall(Queries.MOSTRAR_PRESTAMOS_PROC_CALL);
            callableStatement.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR);
            callableStatement.execute();

            // Obtener el cursor de salida
            ResultSet resultSet = (ResultSet) callableStatement.getObject(1);

            // Iterar sobre los resultados y procesarlos según sea necesario
            while (resultSet.next()) {
                // Obtener los datos del préstamo
                int id = resultSet.getInt("id");
                Date fechaPrestamo = resultSet.getDate("fecha_prestamo");
                Date fechaDevolucion = resultSet.getDate("fecha_devolucion");
                int libroId = resultSet.getInt("libro_id");
                int clienteId = resultSet.getInt("cliente_id");

                Libro libro = new Libro(libroId, null, null, null, null, null, null, 0);
                Cliente cliente = new Cliente(clienteId, null, null, null, null);
                
                Prestamo prestamo = new Prestamo(id, fechaPrestamo, fechaDevolucion, libro, cliente);
                prestamos.add(prestamo);
                
            }

            resultSet.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return prestamos;
    }

    public static Prestamo mostrarPrestamoPorId(OracleConnection connection, int idPrestamo) {
        try {
            CallableStatement callableStatement = connection.prepareCall(Queries.MOSTRAR_PRESTAMO_ID_PROC_CALL);
            callableStatement.setInt(1, idPrestamo);
            callableStatement.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR);
            callableStatement.execute();

            // Obtener el cursor de salida
            ResultSet resultSet = (ResultSet) callableStatement.getObject(2);

            // Iterar sobre los resultados y procesarlos según sea necesario
            if (resultSet.next()) {
                int id = resultSet.getInt("id");
                Date fechaPrestamo = resultSet.getDate("fecha_prestamo");
                Date fechaDevolucion = resultSet.getDate("fecha_devolucion");
                int libroId = resultSet.getInt("libro_id");
                int clienteId = resultSet.getInt("cliente_id");

                Libro libro = new Libro(libroId, null, null, null, null, null, null, 0);
                Cliente cliente = new Cliente(clienteId, null, null, null, null);
                
                return new Prestamo(id, fechaPrestamo, fechaDevolucion, libro, cliente);
            }

            resultSet.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void borrarPrestamo(OracleConnection connection, int idPrestamo) {
        try {
            CallableStatement callableStatement = connection.prepareCall(Queries.PRESTAMO_BORRAR_PROC_CALL);
            callableStatement.setInt(1, idPrestamo);

            callableStatement.execute();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void modificarPrestamo(OracleConnection connection, int idPrestamo, Date fechaPrestamo, Date fechaDevolucion,
                                         int libroId, int clienteId) {
        try {
            CallableStatement callableStatement = connection.prepareCall(Queries.PRESTAMO_MODIFICAR_PROC_CALL);
            callableStatement.setInt(1, idPrestamo);
            callableStatement.setDate(2, new java.sql.Date(fechaPrestamo.getTime()));
            callableStatement.setDate(3, new java.sql.Date(fechaDevolucion.getTime()));
            callableStatement.setInt(4, libroId);
            callableStatement.setInt(5, clienteId);

            callableStatement.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static int insertarPrestamo(OracleConnection connection, Date fechaPrestamo, Date fechaDevolucion, int libroId, int clienteId) {
        try {
            CallableStatement callableStatement = connection.prepareCall(Queries.PRESTAMO_INSERTAR_FUNC_CALL);
            callableStatement.registerOutParameter(1, java.sql.Types.NUMERIC);
            callableStatement.setDate(2, new java.sql.Date(fechaPrestamo.getTime()));
            callableStatement.setDate(3, new java.sql.Date(fechaDevolucion.getTime()));
            callableStatement.setInt(4, libroId);
            callableStatement.setInt(5, clienteId);

            callableStatement.execute();

            return callableStatement.getInt(1);

        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }
}
