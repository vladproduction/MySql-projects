package com.example.worldcountryesapp;

public class Country {

    private int id;
    private String name;
    private String continent;
    private String capital;
    private int population;

    public Country(int id, String name, String continent, String capital, int population) {
        this.id = id;
        this.name = name;
        this.continent = continent;
        this.capital = capital;
        this.population = population;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getContinent() {
        return continent;
    }

    public void setContinent(String continent) {
        this.continent = continent;
    }

    public String getCapital() {
        return capital;
    }

    public void setCapital(String capital) {
        this.capital = capital;
    }

    public int getPopulation() {
        return population;
    }

    public void setPopulation(int population) {
        this.population = population;
    }

    @Override
    public String toString() {
        return "Country:("+id +") " + name + "\n" +
                "continent: " + continent + "\n"+
                "capital: " + capital + "\n"+
                "population: " + population ;
    }
}


