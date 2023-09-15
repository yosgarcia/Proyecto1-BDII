/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.project1_bd2;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import oracle.jdbc.driver.OracleConnection;


public class DBConnection {
    private final String DB_URL;
    private final String DB_USER;
    private final String DB_PASSWORD;
    private OracleConnection connection;
    
    public DBConnection() {

        DB_URL = "jdbc:oracle:thin:@siuadb1_high?TNS_ADMIN=C:/Wallet";
        DB_USER = "YGARCIA"; // Reemplaza con tu nombre de usuario
        DB_PASSWORD = "bdAlajuela2023s2"; // Reemplaza con tu contraseña

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

    public static void main(String[] args) {
        DBConnection dBConnection = new DBConnection();
        if (dBConnection.isConnected()) {
            System.out.println("Conexión exitosa a la base de datos Oracle.");
            try {
                System.out.println("Database Username is: " + dBConnection.connection.getUserName());
            } catch(SQLException e){
                
            }
            
            // Puedes realizar operaciones en la base de datos aquí
        } else {
            System.err.println("Error al conectar a la base de datos Oracle.");
        }

        // Asegúrate de cerrar la conexión cuando hayas terminado
        dBConnection.closeConnection();
    }

}
