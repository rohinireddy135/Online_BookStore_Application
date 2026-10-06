package com.library.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    static Connection con = null;
   
    public static Connection getConnection() {
    	    String url="jdbc:mysql://localhost:3306/dc_library";
    	    String userName="root";
    	    String password="tiger";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection( url,userName,password);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}
