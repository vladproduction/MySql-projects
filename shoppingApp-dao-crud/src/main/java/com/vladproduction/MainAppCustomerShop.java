package com.vladproduction;

import com.vladproduction.dao.DaoCustomerShop;
import com.vladproduction.dao.DaoCustomerShopImpl;
import com.vladproduction.entity.Shop;

import java.sql.SQLException;
import java.util.List;

public class MainAppCustomerShop {
    public static void main(String[] args) throws SQLException {
        DaoCustomerShop daoCustomerShop = new DaoCustomerShopImpl();
//        daoCustomerShop.create(1, 1);
//        daoCustomerShop.create(2, 2);
//        daoCustomerShop.create(3, 4);
//        daoCustomerShop.deleteByCustomerId(3);
//        daoCustomerShop.updateShopForCustomerById(1, 2);
//        List<Customer> customers = daoCustomerShop.readAllCustomersByShopId(2);
//        for (Customer customer : customers) {
//            System.out.println(customer);
//        }
        List<Shop> shops = daoCustomerShop.readAllShopsByCustomerId(1);
        shops.forEach(System.out::println);

    }
}
