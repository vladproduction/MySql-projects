package com.vladproduction.dao;

import com.vladproduction.entity.Customer;
import com.vladproduction.entity.Shop;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DaoCustomerShopImpl implements DaoCustomerShop {


    @Override
    public void create(int customer_id, int shop_id) throws SQLException {
        String sql = "INSERT INTO customer_shop (customer_id, shop_id) VALUES (?, ?)";
        try (Connection connection = getConnection()) {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, customer_id);
            ps.setInt(2, shop_id);
            ps.executeUpdate();
        }
    }

    @Override
    public void deleteByCustomerId(int id) throws SQLException {
        String deleteFromShop = "DELETE FROM customer_shop WHERE customer_id = ?";
        try (Connection connection = getConnection()) {
            PreparedStatement ps1 = connection.prepareStatement(deleteFromShop);
            ps1.setInt(1, id);
            ps1.executeUpdate();
        }
    }

    @Override
    public void updateShopForCustomerById(int customer_id, int shop_id) throws SQLException {
        String updateShop = "UPDATE customer_shop SET shop_id = ? WHERE customer_id = ?";
        try(Connection connection = getConnection()){
            PreparedStatement ps = connection.prepareStatement(updateShop);
            ps.setInt(1, shop_id);
            ps.setInt(2, customer_id);
            ps.executeUpdate();
        }
    }

    @Override
    public List<Customer> readAllCustomersByShopId(int shop_id) throws SQLException {
        List<Customer> customers = new ArrayList<>();
        String sql = "SELECT c.* FROM customer_shop cs INNER JOIN customer c ON cs.customer_id = c.id WHERE cs.shop_id = ?";
        try(Connection connection = getConnection()){
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, shop_id);
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()){
                Customer customer = new Customer();
                String name = resultSet.getString("name");
                String phone = resultSet.getString("phone");
                customer.setName(name);
                customer.setPhone(phone);
                customers.add(customer);
            }
            return customers;
        }
    }

    @Override
    public List<Shop> readAllShopsByCustomerId(int customer_id) throws SQLException {
        List<Shop> shops = new ArrayList<>();
        String sql = "select s.* from customer_shop cs inner join shop s on cs.shop_id = s.id where cs.customer_id = ?";
        try(Connection connection = getConnection()){
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, customer_id);
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()){
                Shop shop = new Shop(resultSet.getString("brand"));
                shops.add(shop);
            }
            return shops;
        }
    }


    private static Connection getConnection() throws SQLException {
        String url = "jdbc:mysql://localhost:3306/shopping";
        String username = "root";
        String password = "11111111";
        return DriverManager.getConnection(url, username, password);
    }
}
