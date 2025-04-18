/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.kelompok7pbo.finalprojectpbo;

import java.sql.Connection;

/**
 *
 * @author albia
 */
public class FinalProjectPBO {

    public static void main(String[] args) {
        Connection connection = Database.getConnection();
        System.out.print(connection);
        
        new Login(connection);
    }
}
