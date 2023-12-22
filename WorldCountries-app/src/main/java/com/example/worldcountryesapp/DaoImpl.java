package com.example.worldcountryesapp;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DaoImpl implements Dao{
    @Override
    public List<Country> readAll() {
        List<Country> countries = new ArrayList();
        try(Connection c = getConnection()) {
            PreparedStatement ps = c.prepareStatement("select * from europe");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String continent = rs.getString("continent");
                String capital = rs.getString("capital");
                int population = rs.getInt("population");
                Country country = new Country(id,name,continent,capital,population);
                countries.add(country);
            }
            return countries;
        }catch (Exception ex){
            throw new RuntimeException(ex);
        }
    }

    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/world-countries","root","11111111");
    }
}
