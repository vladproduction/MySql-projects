package com.vladproduction.creatingDB;

import java.sql.*;

public class Main {
    public static void main(String[] args) {
        Main main = new Main();
        main.runApp();
    }

    private void runApp() {
        try (Connection connection = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/studentsdb", "root", "11111111")) {
            String sql = "SELECT * FROM studentsdb.students";
            try (PreparedStatement ps = connection.prepareStatement(sql);
                 ResultSet resultSet = ps.executeQuery()) {
                while (resultSet.next()){
                    int id = resultSet.getInt("id");
                    String name = resultSet.getString("name");
                    int age = resultSet.getInt("age");
                    System.out.printf("id = %d , name = %s, age = %d\n", id, name, age);
                }

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


    }
}
