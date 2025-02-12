package com.vladproduction.jdbc.connection;

import lombok.extern.slf4j.Slf4j;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

@Slf4j
public class DatabaseConnectionManager {

    private static DatabaseConnectionManager instance;
    private static Connection connection;
    private String url;
    private String user;
    private String password;

    private DatabaseConnectionManager() {
        loadDatabaseProperties();
    }

    public static synchronized DatabaseConnectionManager getInstance() {
        if (instance == null) {
            instance = new DatabaseConnectionManager();
        }
        return instance;
    }

    private void loadDatabaseProperties() {
        Properties properties = new Properties();
        try (InputStream input = getClass().getClassLoader().getResourceAsStream("db.properties")) {
            if (input == null) {
                log.error("Sorry, unable to find db.properties");
                return;
            }
            properties.load(input);
            this.url = properties.getProperty("db.url");
            this.user = properties.getProperty("db.user");
            this.password = properties.getProperty("db.password");
        } catch (IOException ex) {
            log.error("Error loading database properties", ex);
        }
    }

    public Connection getConnection() {
        try {
            if (connection == null || connection.isClosed()) {
                connection = DriverManager.getConnection(url, user, password);
            }
            return connection;
        } catch (SQLException e) {
            log.error("Unable to connect to the database: {}", e.getMessage(), e);
            throw new RuntimeException("Database connection error", e);
        }
    }

}
