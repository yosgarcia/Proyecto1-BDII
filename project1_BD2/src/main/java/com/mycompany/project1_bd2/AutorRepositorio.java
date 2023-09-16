package com.mycompany.project1_bd2;

public class AutorRepositorio {
    
    
    public Autor obtenerPorId(OracleConnection connection, int id){
        try {
            // Llama al procedimiento almacenado
            CallableStatement callableStatement = connection.prepareCall(Queries.MOSTRAR_AUTOR_ID_PROC_CALL);
            callableStatement.setInt(1, id);
            callableStatement.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR);
            callableStatement.execute();

            // Obtiene el cursor de salida
            ResultSet resultSet = (ResultSet) callableStatement.getObject(1);

            // Itera sobre los resultados y muestra la información
            if (resultSet.next()) {
                int idCliente = resultSet.getInt("id");
                String nombre = resultSet.getString("nombre");
                String apellido = resultSet.getString("apellido");
                String correo = resultSet.getString("nacionalidad");

                Cliente cliente = new Autor(idCliente, nombre, apellido, correo, telefono);
                return cliente;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
