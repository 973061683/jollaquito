/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Emmanuelsg
 */
public class ConexionOracle {
    
    public static Connection conecta(){
        Connection cn = null;
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            cn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","prueba","Luis1234");
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return cn;
    }
    
}
