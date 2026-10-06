package com.library.dao;

import com.library.model.User;
import com.library.util.DBConnection;

import java.sql.*;

public class UserDAO {
    
    public static boolean register(User user) {
        boolean flag = false;
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("INSERT INTO users (name, email, password, role) VALUES (?,?,?, 'user')");
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            // Using MD5 for demo hash
//            ps.setString(3, md5(user.getPassword()));
            ps.setString(3, user.getPassword());
            int i = ps.executeUpdate();
            if (i > 0) flag = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }
    
    public static User login(String email, String password) {
        User user = null;
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE email=? AND password=?");
            ps.setString(1, email);
//            ps.setString(2, md5(password));
            ps.setString(2,password);
            
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setRole(rs.getString("role"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
    
    // MD5 hashing (for demo; use stronger hash for production)
    /*  //HASHING FOR FUTURE USE
    private static String md5(String input) {

        try {

            java.security.MessageDigest md =
                java.security.MessageDigest.getInstance("MD5");

            byte[] digest = md.digest(input.getBytes());

            StringBuilder sb = new StringBuilder();

            for (byte b : digest) {

                sb.append(String.format("%02x", b));

            }

            return sb.toString();

        } catch (Exception e) {

            return input;

        }
    }
    */
   
}