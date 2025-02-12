package com.vladproduction.jdbc.statements;

public class SqlStatements {

    public static final String CREATE_PERSON =
            "INSERT INTO person (name, age, info) VALUES (?, ?, ?)";

    public static final String GET_BY_ID =
            "SELECT  name, age, info FROM person WHERE id = ?";

    public static final String GET_ALL_PERSONS =
            "SELECT * FROM person";

    public static final String UPDATE_PERSON =
            "UPDATE person SET name = ?, age = ?, info = ? WHERE id = ?";

    public static final String DELETE_PERSON =
            "DELETE FROM person WHERE id = ?";

    public static final String COUNT_PERSONS =
            "SELECT COUNT(*) FROM person";

    public static final String GET_LAST_PERSON =
            "SELECT * FROM person ORDER BY id DESC LIMIT 1";

    public static final String GET_PERSON_BY_NAME =
            "SELECT * FROM person WHERE name = ?";

}
