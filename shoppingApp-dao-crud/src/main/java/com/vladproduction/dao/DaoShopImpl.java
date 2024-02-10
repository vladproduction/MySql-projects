package com.vladproduction.dao;

import com.vladproduction.entity.Customer;
import com.vladproduction.entity.Shop;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DaoShopImpl implements Dao<Shop> {

    @Override
    public void create(Shop shop) throws SQLException {
        String sql = "INSERT INTO shop (brand) VALUES (?)";
        try (Connection connection = getConnection()) {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, shop.getBrand());
            ps.execute();
        }
    }

    @Override
    public Shop read(int id) throws SQLException {
        String sql = "select * from shop where id = ?";
        try (Connection connection = getConnection()) {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet resultSet = ps.executeQuery();
            if (resultSet.next()) {
                Shop shop = new Shop();
                shop.setBrand(resultSet.getString("brand"));

                return shop;
            }
        }
        return null;
    }

    @Override
    public List<Shop> readAll() throws SQLException {
        List<Shop> shops = new ArrayList<>();
        String sql = "select * from shop";
        try (Connection connection = getConnection()) {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()) {
                String brand = resultSet.getString("brand");
                Shop shop = new Shop(brand);
                shops.add(shop);
            }
            return shops;
        }
    }

    @Override
    public void update(int id, Shop candidate) throws SQLException {
        String sql = "update shop set brand = ? where id = ?";
        try (Connection c = getConnection()) {
            PreparedStatement ps = c.prepareStatement(sql);
            ps.setString(1, candidate.getBrand());
            ps.setInt(2, id);
            ps.executeUpdate();
        }
    }

    @Override
    public void delete(int id) throws SQLException {
        String sql = "delete from shop where id = ?";
        try(Connection c = getConnection()){
            PreparedStatement ps = c.prepareStatement(sql);
            ps.setInt(1, id);
            ps.execute();
        }

    }

    private static Connection getConnection() throws SQLException {
        String url = "jdbc:mysql://localhost:3306/shopping";
        String username = "root";
        String password = "11111111";

        return DriverManager.getConnection(url, username, password);
    }
}
