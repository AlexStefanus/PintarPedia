/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.kelompok7pbo.finalprojectpbo;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author albia
 */
public class Database {
    public static Connection getConnection() {
    Connection conn = null;
    String url = "jdbc:mysql://localhost:3306/ensiklopedia";
    String username = "root";
    String password = "";

    try {
        conn = DriverManager.getConnection(url, username, password);
        System.out.println("Success connecting to database");
    } catch(Exception e) {
        e.printStackTrace();
    }
    return conn;
    }
}
