package com.mycompany.project1_bd2.Repositorios;

import com.mycompany.project1_bd2.entidades.BitacoraLibro;
import com.mycompany.project1_bd2.Queries;
import com.mycompany.project1_bd2.entidades.Usuario;
import java.sql.CallableStatement;
import java.sql.Date;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import oracle.jdbc.driver.OracleConnection;


public class BitacoraLibroRepositorio {
    
    
    public static List<BitacoraLibro> mostrarBitacoras(OracleConnection connection) {
        List<BitacoraLibro> bitacoras = new ArrayList<>();
        
        try{
            CallableStatement callableStatement = connection.prepareCall(Queries.MOSTRAR_BITACORAS_PROC_CALL);
            callableStatement.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR);
            callableStatement.execute();

            
            ResultSet resultSet = (ResultSet) callableStatement.getObject(1);

            while (resultSet.next()) {
                int idBitacora = resultSet.getInt("id");
                Date fecha = resultSet.getDate("fecha");
                String usuario = resultSet.getString("usuario");
                String descripcion = resultSet.getString("descripcion");
                Usuario nUsuario = new Usuario(usuario, null, null);
                BitacoraLibro bitacoraLibro = new BitacoraLibro(idBitacora, fecha, nUsuario, descripcion);
                bitacoras.add(bitacoraLibro);
            }
            
            resultSet.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return bitacoras;
    }
    
    
    
    public static List<BitacoraLibro> mostrarUltimasNBitacoras(OracleConnection connection, int pNum) {
        
        List<BitacoraLibro> bitacoras = new ArrayList<>();
        try{
            CallableStatement callableStatement = connection.prepareCall(Queries.MOSTRAR_N_BITACORAS_PROC_CALL);
            callableStatement.setInt(1, pNum);
            callableStatement.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR);
            callableStatement.execute();

            // Obtiene el cursor de salida
            ResultSet resultSet = (ResultSet) callableStatement.getObject(2);

            // Itera sobre los resultados
            while (resultSet.next()) {
                int idBitacora = resultSet.getInt("id");
                Date fecha = resultSet.getDate("fecha");
                String usuario = resultSet.getString("usuario");
                String descripcion = resultSet.getString("descripcion");
                Usuario nUsuario = new Usuario(usuario, null, null);
                BitacoraLibro bitacoraLibro = new BitacoraLibro(idBitacora, fecha, nUsuario, descripcion);
                bitacoras.add(bitacoraLibro);
            }

            resultSet.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return bitacoras;
    }
    
    
    public static void modificarUsuarioBitacora(OracleConnection connection, String usuario){
        try{
            CallableStatement callableStatement = connection.prepareCall(Queries.BITACORA_USUARIO_MODIFICAR_PROC_CALL);
            callableStatement.setString(1, usuario);
            callableStatement.execute();
            connection.commit();
        } catch (Exception e){
            e.printStackTrace();
        }
    }


}
