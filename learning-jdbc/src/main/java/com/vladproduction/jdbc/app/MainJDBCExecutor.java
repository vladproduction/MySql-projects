package com.vladproduction.jdbc.app;

import com.vladproduction.jdbc.dao.PersonDaoImpl;
import com.vladproduction.jdbc.dto.PersonDto;

import java.util.List;

public class MainJDBCExecutor {

    private static final PersonDaoImpl personDaoImpl = new PersonDaoImpl();

    public static void main(String[] args) {

        //1) inserting person into db
        //insertPersonMethod();

        //2) get one person from db
        //getPersonByIdMethod();

        //3) get all persons from database
        //getAllPersonsMethod();

        //4) update person (if found by id) with candidate values
        //updatePersonByIdMethod();

        //5) delete person (if found by id)
        //deletePersonByIdMethod();

        //6) count all persons
        countAllPersonsMethod();

        //7) method return the last Person form database
        getLastPersonMethod();

        //8) method returning person by specifying name
        getPersonByName();

    }

    private static void getPersonByName() {
        personDaoImpl.getPersonByName("John");
    }

    private static void getLastPersonMethod() {
        personDaoImpl.getLastPerson();
    }

    private static void countAllPersonsMethod() {
        int counted = personDaoImpl.countPersons();
        //System.out.println(counted);
    }

    private static void deletePersonByIdMethod() {
        insertPersonMethod();
        personDaoImpl.deletePersonById(4);
    }

    private static void updatePersonByIdMethod() {
        personDaoImpl.updatePersonById(33, new PersonDto("Tommy", 24, "Holt"));

    }

    private static void getAllPersonsMethod() {
        List<PersonDto> allPersons = personDaoImpl.getAllPersons();
        for (PersonDto person : allPersons) {
            System.out.println(person);
        }
    }

    private static void getPersonByIdMethod(){
        PersonDto personById = personDaoImpl.getPersonById(3);
        System.out.println(personById);

    }

    private static void insertPersonMethod() {
        personDaoImpl.createPerson(new PersonDto("Tom4", 23, "Holt4"));
    }
}
