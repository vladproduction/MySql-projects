package com.vladproduction.entity;

import java.util.Objects;

public class Shop {

    private String brand;

    public Shop(String brand) {
        this.brand = brand;
    }

    public Shop() {
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Shop shop = (Shop) o;
        return Objects.equals(brand, shop.brand);
    }

    @Override
    public int hashCode() {
        return Objects.hash(brand);
    }

    @Override
    public String toString() {
        return "Shop{" +
                "brand='" + brand + '\'' +
                '}';
    }
}
