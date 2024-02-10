package com.vladproduction.dao;

import com.vladproduction.entity.Customer;
import com.vladproduction.entity.Shop;

import java.sql.SQLException;
import java.util.List;

public interface DaoCustomerShop {

    void create(int customer_id, int shop_id) throws SQLException;
    void deleteByCustomerId(int customer_id) throws SQLException;
    void updateShopForCustomerById(int customer_id, int shop_id) throws SQLException;
    List<Customer> readAllCustomersByShopId(int shop_id) throws SQLException;
    List<Shop> readAllShopsByCustomerId(int customer_id) throws SQLException;

}
