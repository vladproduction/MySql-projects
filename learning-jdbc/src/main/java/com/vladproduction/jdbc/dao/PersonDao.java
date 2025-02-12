package com.vladproduction.jdbc.dao;

import com.vladproduction.jdbc.dto.PersonDto;

import java.util.List;

public interface PersonDao {

    void createPerson(PersonDto personDto);

    PersonDto getPersonById(int id);

    List<PersonDto> getAllPersons();

    void updatePersonById(int id, PersonDto candidate);

    void deletePersonById(int id);

    int countPersons();

    void getLastPerson();

    PersonDto getPersonByName(String name);

}
