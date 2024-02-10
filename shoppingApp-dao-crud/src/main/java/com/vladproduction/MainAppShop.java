package com.vladproduction;

import com.vladproduction.dao.Dao;
import com.vladproduction.dao.DaoShopImpl;
import com.vladproduction.entity.Shop;

import java.sql.SQLException;
import java.util.List;

public class MainAppShop {

    public static void main(String[] args) throws SQLException {
        //client side of app; init classes to start work;
        Shop shop1 = new Shop("adidas");
        Shop shop2 = new Shop("nike");
        Shop shop3 = new Shop("reebok");
        Dao daoShop = new DaoShopImpl();
//        daoShop.create(shop1);
//        daoShop.create(shop2);
//        daoShop.create(shop3);
//        System.out.println("----------read------------");
//        System.out.println(daoShop.read(1));
//        System.out.println(daoShop.read(3));



//        System.out.println("---------------readAll---------------");
//        List shops = daoShop.readAll();
//        System.out.println(shops.size());
//        for (Object shop : shops) {
//            System.out.println(shop);
//        }

//        System.out.println("---------------update---------------");
//        Shop newReebok = new Shop("NewReebok");
//        daoShop.update(3, newReebok);
//        List shops = daoShop.readAll();
//        for (Object shop : shops) {
//            System.out.println(shop);
//        }

//        System.out.println("---------------delete---------------");
//        daoShop.delete(3);
//        List shops = daoShop.readAll();
//        for (Object shop : shops) {
//            System.out.println(shop);
//        }



    }
}
