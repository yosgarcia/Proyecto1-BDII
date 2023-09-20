package com.mycompany.project1_bd2.Repositorios;
import com.mycompany.project1_bd2.entidades.Empleado;
import com.mycompany.project1_bd2.Queries;
import java.sql.CallableStatement;
import java.sql.Date;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.Types;
import oracle.jdbc.driver.OracleConnection;

public class EmpleadoRepositorio {
    
    public static int nuevoEmpleado(OracleConnection connection, String nombre, String apellido) {
        try{
            CallableStatement callableStatement = connection.prepareCall(Queries.EMPLEADO_INSERTAR_FUNC_CALL);
            callableStatement.registerOutParameter(1, Types.NUMERIC);
            callableStatement.setString(2, nombre);
            callableStatement.setString(3, apellido);

            callableStatement.execute();
            return callableStatement.getInt(1);

        } catch (Exception e) {
            e.printStackTrace();
            return -1; // Retornar un valor indicando un error
        }
    }

    public static void modificarEmpleado(OracleConnection connection, int idEmpleado, String nombre, String apellido) {
        try {
            CallableStatement callableStatement = connection.prepareCall(Queries.EMPLEADO_MODIFICAR_PROC_CALL);
            callableStatement.setInt(1, idEmpleado);
            callableStatement.setString(2, nombre);
            callableStatement.setString(3, apellido);

            callableStatement.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void borrarEmpleado(OracleConnection connection, int pIdEmpleado) {
        try {
            CallableStatement callableStatement = connection.prepareCall(Queries.EMPLEADO_BORRAR_PROC_CALL);
            callableStatement.setInt(1, pIdEmpleado);

            callableStatement.execute();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static Empleado mostrarEmpleadosPorId(OracleConnection connection, int pIdEmpleado) {
        try {
            CallableStatement callableStatement = connection.prepareCall(Queries.MOSTRAR_EDITORIAL_ID_PROC_CALL);
            callableStatement.setInt(1, pIdEmpleado);
            callableStatement.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR);
            callableStatement.execute();

            // Obtener el cursor de salida
            ResultSet resultSet = (ResultSet) callableStatement.getObject(2);

            // Iterar sobre los resultados y procesarlos según sea necesario
            if (resultSet.next()) {
                // Obtener los datos del empleado
                int id = resultSet.getInt("id");
                String nombre = resultSet.getString("nombre");
                String apellido = resultSet.getString("apellido");
                
                return new Empleado(id, nombre, apellido);
            }

            resultSet.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Empleado> mostrarTodosEmpleados(OracleConnection connection) {
        List<Empleado> empleados = new ArrayList<>();
        try {
            CallableStatement callableStatement = connection.prepareCall(Queries.MOSTRAR_EMPLEAADOS_PROC_CALL);
            callableStatement.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR);
            callableStatement.execute();

            // Obtener el cursor de salida
            ResultSet resultSet = (ResultSet) callableStatement.getObject(1);

            // Iterar sobre los resultados y procesarlos según sea necesario
            while (resultSet.next()) {
                // Obtener los datos del empleado
                int id = resultSet.getInt("id");
                String nombre = resultSet.getString("nombre");
                String apellido = resultSet.getString("apellido");

                Empleado empleado = new Empleado(id, nombre, apellido);
                empleados.add(empleado);
            }

            resultSet.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return empleados;
    }
    
    
}
