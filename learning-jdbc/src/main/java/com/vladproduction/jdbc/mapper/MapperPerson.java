package com.vladproduction.jdbc.mapper;

import com.vladproduction.jdbc.dto.PersonDto;
import com.vladproduction.jdbc.model.Person;

import java.util.ArrayList;
import java.util.List;

public class MapperPerson {

    public static PersonDto toPersonDto(Person person) {
        PersonDto personDto = new PersonDto();
        personDto.setName(person.getName());
        personDto.setAge(person.getAge());
        personDto.setInfo(person.getInfo());
        return personDto;
    }

    public static Person toPerson(PersonDto personDto) {
        Person person = new Person();
        person.setName(personDto.getName());
        person.setAge(personDto.getAge());
        person.setInfo(personDto.getInfo());
        return person;
    }

    public static List<PersonDto> toPersonDtoList(List<Person> persons) {
        List<PersonDto> personDtoList = new ArrayList<>();
        for (Person person : persons) {
            personDtoList.add(toPersonDto(person));
        }
        return personDtoList;
    }

    public static List<Person> toPersonList(List<PersonDto> personDtoList) {
        List<Person> personList = new ArrayList<>();
        for (PersonDto personDto : personDtoList) {
            personList.add(toPerson(personDto));
        }
        return personList;
    }

}
