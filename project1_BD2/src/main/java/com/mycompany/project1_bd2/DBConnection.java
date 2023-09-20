package com.mycompany.project1_bd2;

import com.mycompany.project1_bd2.Repositorios.ClienteRepositorio;
import com.mycompany.project1_bd2.entidades.Cliente;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;
import java.util.Properties;
import oracle.jdbc.driver.OracleConnection;


public class DBConnection {
    private final String DB_URL;
    private final String DB_USER;
    private final String DB_PASSWORD;
    private OracleConnection connection;
    
    public DBConnection() {

        DB_URL = "jdbc:oracle:thin:@siuadb1_high?TNS_ADMIN=C:/Wallet";
        DB_USER = "YGARCIA";
        DB_PASSWORD = "bdAlajuela2023s2";

        try {
            // Configurar las propiedades de conexión
            Properties props = new Properties();
            props.setProperty("user", DB_USER);
            props.setProperty("password", DB_PASSWORD);

            // Cargar el controlador JDBC de Oracle
            Class.forName("oracle.jdbc.OracleDriver");

            // Establecer la conexión
            connection = (OracleConnection) DriverManager.getConnection(DB_URL, props);
            
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean isConnected() {
        return connection != null;
    }

    public void closeConnection() {
        try {
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public String getDB_URL() {
        return DB_URL;
    }

    public String getDB_USER() {
        return DB_USER;
    }

    public String getDB_PASSWORD() {
        return DB_PASSWORD;
    }

    public OracleConnection getConnection() {
        return connection;
    }
  
    /*
    public static void main(String[] args){
        DBConnection dbConection = new DBConnection();
        //Cliente usuarioAValidar = ClienteRepositorio.obtenerPorId(dbConection.getConnection(), 2);
        List<Cliente> clientes = ClienteRepositorio.obtenerTodosClientes(dbConection.getConnection());
        for(Cliente client : clientes){
            System.out.println("Nombre: " + client.getNombre());
        }
        
        int num = ClienteRepositorio.verificarClientePrestamo(dbConection.getConnection(), 32);
        if(num > 0){
            System.out.println("cliente no se puede eliminar");
        }else{
            ClienteRepositorio.borrarCliente(dbConection.getConnection(), 32);
            System.out.println("cliente eliminado");
        }
        
        List<Cliente> clientesNov = ClienteRepositorio.obtenerTodosClientes(dbConection.getConnection());
        for(Cliente client : clientesNov){
            System.out.println("Nombre: " + client.getNombre());
        }
        
        
        
        dbConection.closeConnection();
        
    }*/
    
    

}