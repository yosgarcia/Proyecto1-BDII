package com.mycompany.project1_bd2.Repositorios;

import com.mycompany.project1_bd2.Queries;
import com.mycompany.project1_bd2.entidades.Empleado;
import com.mycompany.project1_bd2.entidades.Usuario;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import oracle.jdbc.driver.OracleConnection;


public class UsuarioRepositorio {
    
    public Usuario mostrarUsuarioPorNombre(OracleConnection connection, String username) {
        try{
            CallableStatement callableStatement = connection.prepareCall(Queries.MOSTRAR_USUARIO_NOMBRE_PROC_CALL);

            callableStatement.setString(1, username);
            callableStatement.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR);
            callableStatement.execute();

            // Obtener el cursor de salida
            ResultSet resultSet = (ResultSet) callableStatement.getObject(2);

            // Iterar sobre los resultados y procesarlos según sea necesario
            if (resultSet.next()) {
                // Obtener los datos del usuario
                String userName = resultSet.getString("username");
                String contrasenna = resultSet.getString("contrasenna");
                int empleadoId = resultSet.getInt("empleado_id");

                Empleado empleado = new Empleado(empleadoId, null, null);
                Usuario usuario = new Usuario(userName, contrasenna, empleado);
                return usuario;
            }

            resultSet.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Usuario> mostrarUsuarios(OracleConnection connection) {
        List<Usuario> usuarios = new ArrayList<>();
        try {
            CallableStatement callableStatement = connection.prepareCall(Queries.MOSTRAR_USUARIOS_PROC_CALL);
            callableStatement.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR);
            callableStatement.execute();

            // Obtener el cursor de salida
            ResultSet resultSet = (ResultSet) callableStatement.getObject(1);

            // Iterar sobre los resultados y procesarlos según sea necesario
            while (resultSet.next()) {
                // Obtener los datos del usuario
                String userName = resultSet.getString("username");
                String contrasenna = resultSet.getString("contrasenna");
                int empleadoId = resultSet.getInt("empleado_id");

                Empleado empleado = new Empleado(empleadoId, null, null);
                Usuario usuario = new Usuario(userName, contrasenna, empleado);
                usuarios.add(usuario);
            }

            resultSet.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return usuarios;
    }

    public String insertarUsuario(OracleConnection connection, String username, String contrasenna, int empleadoId) {
        try {
            CallableStatement callableStatement = connection.prepareCall(Queries.USUARIO_INSERTAR_FUNC_CALL);
            callableStatement.registerOutParameter(1, java.sql.Types.VARCHAR);
            callableStatement.setString(2, username);
            callableStatement.setString(3, contrasenna);
            callableStatement.setInt(4, empleadoId);

            callableStatement.execute();

            return callableStatement.getString(1);

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public void modificarUsuario(OracleConnection connection, String username, String contrasenna, int empleadoId) {
        try {
            CallableStatement callableStatement = connection.prepareCall(Queries.USUARIO_MODIFICAR_FUNC_CALL);
            callableStatement.setString(1, username);
            callableStatement.setString(2, contrasenna);
            callableStatement.setInt(3, empleadoId);

            callableStatement.execute();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void borrarUsuario(OracleConnection connection, String username) {
        try {
            CallableStatement callableStatement = connection.prepareCall(Queries.USUARIO_BORRAR_FUNC_CALL);
            callableStatement.setString(1, username);

            callableStatement.execute();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
