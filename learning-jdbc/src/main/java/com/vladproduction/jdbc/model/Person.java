package com.vladproduction.jdbc.model;

import lombok.Getter;
import lombok.Setter;

import java.util.Objects;

@Setter
@Getter
public class Person {

    private int id;
    private String name;
    private int age;
    private String info;

    public Person() {
    }

    public Person(int id, String name, int age, String info) {
        this.id = id;
        this.name = name;
        this.age = age;
        this.info = info;
    }

    @Override
    public boolean equals(Object o) {
        if (o == null || getClass() != o.getClass()) return false;
        Person person = (Person) o;
        return id == person.id && age == person.age && Objects.equals(name, person.name) && Objects.equals(info, person.info);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, age, info);
    }

    @Override
    public String toString() {
        return String.format("Person: %s, age: %d, info: %s", name, age, info);
    }

}
