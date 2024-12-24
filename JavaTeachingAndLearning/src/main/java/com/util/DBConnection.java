package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static Connection myConnection = null;
    private static String myURL = "jdbc:mysql://localhost:3306/JavaTeachAndLearn";

    DBConnection() {
    }

    public static Connection getConnection() throws ClassNotFoundException {
        if (myConnection != null) {
            return myConnection;
        } else {
            try {
                // establish and open mysql database connection
                Class.forName("com.mysql.cj.jdbc.Driver");
                myConnection = DriverManager.getConnection(myURL, "root", "admin");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return myConnection;
    }

    public static void closeConnection() throws ClassNotFoundException {
        try {
            if (myConnection != null) {
                myConnection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
