package com.vladproduction.dao;

import com.vladproduction.entity.Customer;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DaoCustomerImpl implements Dao<Customer> {

    @Override
    public void create(Customer customer) throws SQLException {
        String sql = "INSERT INTO customer (name, phone) VALUES (?, ?)";
        try (Connection connection = getConnection()) {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, customer.getName());
            ps.setString(2, customer.getPhone());
            ps.execute();
        }
    }

    @Override
    public Customer read(int id) throws SQLException {
        String sql = "select * from customer where id = ?";
        try (Connection connection = getConnection()) {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet resultSet = ps.executeQuery();
            if (resultSet.next()) {
                Customer customer = new Customer();
                customer.setName(resultSet.getString("name"));
                customer.setPhone(resultSet.getString("phone"));
                return customer;
            }
        }
        return null;
    }

    @Override
    public List<Customer> readAll() throws SQLException {
        List<Customer> customers = new ArrayList<>();
        String sql = "select * from customer";
        try (Connection connection = getConnection()) {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("name");
                String phone = resultSet.getString("phone");
                Customer customer = new Customer(name, phone);
                customers.add(customer);
            }
            return customers;
        }
    }

    @Override
    public void update(int id, Customer candidate) throws SQLException {
        String sql = "update customer set name = ?, phone = ? where id = ?";
        try (Connection c = getConnection()) {
            PreparedStatement ps = c.prepareStatement(sql);
            ps.setString(1, candidate.getName());
            ps.setString(2, candidate.getPhone());
            ps.setInt(3, id);
            ps.executeUpdate();
        }
    }

    @Override
    public void delete(int id) throws SQLException {
        String sql = "delete from customer where id = ?";
        try(Connection c = getConnection()){
            PreparedStatement ps = c.prepareStatement(sql);
            ps.setInt(1,id);
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
