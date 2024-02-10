package com.vladproduction;

import com.vladproduction.dao.Dao;
import com.vladproduction.dao.DaoCustomerImpl;

import java.sql.SQLException;

public class MainAppCustomer {

    public static void main(String[] args) throws SQLException {
        //client side of app; init classes to start work;
//        Customer customer1 = new Customer("aaa", "555");
        Dao daoCustomer = new DaoCustomerImpl();
//        daoCustomer.create(customer1);
//        System.out.println(daoCustomer.read(4));

//        System.out.println("---------------readAll---------------");
//        List<Customer> customers = daoCustomer.readAll();
//        System.out.println(customers.size());
//        for (Customer customer : customers) {
//            System.out.println(customer);
//        }
//        System.out.println("---------------update---------------");
//        Customer jack = new Customer("Jack", "222");
//        daoCustomer.update(2, jack);
//        List<Customer> customers = daoCustomer.readAll();
//        System.out.println(customers.size());
//        for (Customer customer : customers) {
//            System.out.println(customer);
//        }

//        System.out.println("---------------delete---------------");
//        daoCustomer.delete(4);
//        List<Customer> customers = daoCustomer.readAll();
//        System.out.println(customers.size());
//        for (Customer customer : customers) {
//            System.out.println(customer);
//        }
        daoCustomer.delete(1);



    }
}
