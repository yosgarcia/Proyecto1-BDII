package com.mycompany.project1_bd2;

import com.mycompany.project1_bd2.Repositorios.LibroRepositorio;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Date;
import java.util.Properties;
import oracle.jdbc.driver.OracleConnection;


public class DBConnection {
    private final String DB_URL;
    private final String DB_USER;
    private final String DB_PASSWORD;
    private OracleConnection connection;
    private static String usuario;

    
    
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
    
    public static String getUsuario() {
        return usuario;
    }

    public static void setUsuario(String usuario) {
        DBConnection.usuario = usuario;
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
        int idLibro = LibroRepositorio.insertarLibro(dbConection.getConnection(), "Harry Potter", 1, 1, 1, new Date("2/02/2014"), "2020202", 23);
        
        if(idLibro != -1){
            System.out.println("Se inserto libro con id: " + idLibro);
            
        } else{
            System.out.println("error");
        }
        
        
        
        dbConection.closeConnection();
        
    }*/
    
    

}