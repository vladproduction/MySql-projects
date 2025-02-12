package com.vladproduction.jdbc.dto;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class PersonDto {

    private String name;
    private int age;
    private String info;

    public PersonDto() {
    }

    public PersonDto(String name, int age, String info) {
        this.name = name;
        this.age = age;
        this.info = info;
    }

    @Override
    public String toString() {
        return String.format("Person: %s, age: %d, info: %s", name, age, info);
    }


}
