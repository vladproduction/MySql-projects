package com.vladproduction.jdbc.dao;

import com.vladproduction.jdbc.connection.DatabaseConnectionManager;
import com.vladproduction.jdbc.dto.PersonDto;
import com.vladproduction.jdbc.model.Person;
import lombok.extern.slf4j.Slf4j;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static com.vladproduction.jdbc.mapper.MapperPerson.*;
import static com.vladproduction.jdbc.statements.SqlStatements.*;

@Slf4j
public class PersonDaoImpl implements PersonDao {

    private final Connection connection;

    public PersonDaoImpl() {
        this.connection = DatabaseConnectionManager.getInstance().getConnection();
    }

    @Override
    public void createPerson(PersonDto personDto) {
        //conversion dto int person to persist
        Person person = toPerson(personDto);
        try (PreparedStatement ps = connection.prepareStatement(CREATE_PERSON)) {
            ps.setString(1, person.getName());
            ps.setInt(2, person.getAge());
            ps.setString(3, person.getInfo());
            int rowsAffected = ps.executeUpdate(); // Execute the insert

            // Log success information
            System.out.println("\n=== createPerson ===");
            log.info("Inserted person: {}. Rows affected: {}", person, rowsAffected);
        } catch (SQLException e) {
            // Log the error with complete stack trace
            log.error("Unable to insert person into the database. Person details: {}. Error: {}", person, e.getMessage(), e);
            throw new RuntimeException("Error creating person", e);
        }
    }

    @Override
    public PersonDto getPersonById(int id) {
        Person person = new Person();
        try (PreparedStatement ps = connection.prepareStatement(GET_BY_ID)) {
            ps.setInt(1, id);
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()) {
                person.setName(resultSet.getString("name"));
                person.setAge(resultSet.getInt("age"));
                person.setInfo(resultSet.getString("info"));
            }
            // Log success information
            System.out.println("\n=== getPersonById ===");
            log.info("ID: {}. Found {}.", id, person);
        } catch (SQLException e) {
            // Log the error with complete stack trace
            log.error("Unable to get person from the database by id: {}. Person details: {}. Error: {}", id, person, e.getMessage(), e);
            throw new RuntimeException("Error creating person", e);
        }
        return toPersonDto(person);
    }

    @Override
    public List<PersonDto> getAllPersons() {
        List<PersonDto> persons = new ArrayList<>();
        try (PreparedStatement ps = connection.prepareStatement(GET_ALL_PERSONS)) {
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()) {
                Person person = new Person();
                person.setName(resultSet.getString("name"));
                person.setAge(resultSet.getInt("age"));
                person.setInfo(resultSet.getString("info"));
                persons.add(toPersonDto(person));
            }
            System.out.println("\n=== getAllPersons ===");
            log.info("Retrieved {} persons from database.", persons.size());
        } catch (SQLException e) {
            log.error("Unable to get persons from the database. Error: {}", e.getMessage(), e);
            throw new RuntimeException("Unable to get persons from the database", e);
        }
        return persons;
    }

    @Override
    public void updatePersonById(int id, PersonDto candidate) {
        //retrieve existing person using provided id
        PersonDto existingPersonDto = getPersonById(id);
        System.out.println("Found by Id: " + id + ", " + existingPersonDto);
        if (existingPersonDto == null) {
            log.error("Unable to find person with id: {}. No update performed.", id);
            throw new RuntimeException("Unable to find person with id: " + id);
        }
        existingPersonDto.setName(candidate.getName());
        existingPersonDto.setAge(candidate.getAge());
        existingPersonDto.setInfo(candidate.getInfo());

        try (PreparedStatement ps = connection.prepareStatement(UPDATE_PERSON)) {
            ps.setString(1, existingPersonDto.getName());
            ps.setInt(2, existingPersonDto.getAge());
            ps.setString(3, existingPersonDto.getInfo());
            ps.setInt(4, id);

            int rowAffected = ps.executeUpdate();
            System.out.println("\n=== updatePersonById ===");
            log.info("Updated person with id: {}. Rows affected: {}", id, rowAffected);
            System.out.println("Updated: " + existingPersonDto);
        } catch (SQLException e) {
            log.error("Unable to update person with id: {}. Error: {}", id, e.getMessage(), e);
            throw new RuntimeException("Unable to update person with id: " + id, e);
        }
    }

    @Override
    public void deletePersonById(int id) {
        PersonDto existingPersonDto = getPersonById(id);
        if (existingPersonDto == null) {
            log.error("Unable to find person with id: {}. No update performed.", id);
            throw new RuntimeException("Unable to find person with id: " + id);
        }
        try (PreparedStatement ps = connection.prepareStatement(DELETE_PERSON)) {
            ps.setInt(1, id);
            ps.executeUpdate();
            System.out.println("\n=== deletePersonById ===");
            log.info("Deleted person with id: {}", id);
        } catch (SQLException e) {
            log.error("Unable to delete person with id: {}. Error: {}", id, e.getMessage(), e);
            throw new RuntimeException("Unable to delete person with id: " + id, e);
        }
    }

    @Override
    public int countPersons() {
        int count = 0;
        try (PreparedStatement ps = connection.prepareStatement(COUNT_PERSONS)) {
            ResultSet resultSet = ps.executeQuery();
            if (resultSet.next()) {
                count = resultSet.getInt(1); // Get the count from the first column
            }
            log.info("Retrieved {} persons from database.", count);
        } catch (SQLException e) {
            log.error("Unable to count persons in the database. Error: {}", e.getMessage(), e);
            throw new RuntimeException("Unable to get persons from the database", e);
        }
        return count;
    }

    @Override
    public void getLastPerson() {
        PersonDto lastPersonDto;
        Person person = new Person();

        try (PreparedStatement ps = connection.prepareStatement(GET_LAST_PERSON);
             ResultSet resultSet = ps.executeQuery()) {

            if (resultSet.next()) {
                lastPersonDto = new PersonDto();
                lastPersonDto.setName(resultSet.getString("name"));
                lastPersonDto.setAge(resultSet.getInt("age"));
                lastPersonDto.setInfo(resultSet.getString("info"));
                // Assuming there's a way to also get the ID, if needed:
                person.setId(resultSet.getInt("id"));

                log.info("Retrieved last person: {}. ID: {}", lastPersonDto, person.getId());
            } else {
                log.info("No entries found in the database.");
            }
        } catch (SQLException e) {
            log.error("Unable to retrieve last person from the database. Error: {}", e.getMessage(), e);
            throw new RuntimeException("Error retrieving last person", e);
        }
    }

    @Override
    public PersonDto getPersonByName(String name) {
        PersonDto personDto = null;
        Person person = new Person();

        try (PreparedStatement ps = connection.prepareStatement(GET_PERSON_BY_NAME)) {
            ps.setString(1, name); // Set the name parameter
            ResultSet resultSet = ps.executeQuery();

            if (resultSet.next()) {
                personDto = new PersonDto();
                personDto.setName(resultSet.getString("name"));
                personDto.setAge(resultSet.getInt("age"));
                personDto.setInfo(resultSet.getString("info"));
                // Assuming there's a way to also get the ID, if needed:
                person.setId(resultSet.getInt("id"));

                log.info("Retrieved person by name '{}': {}. ID: {}", name, personDto, person.getId());
            } else {
                log.info("No person found with the name '{}'.", name);
            }
        } catch (SQLException e) {
            log.error("Unable to retrieve person by name '{}'. Error: {}", name, e.getMessage(), e);
            throw new RuntimeException("Error retrieving person by name", e);
        }
        return personDto;
    }
}
