package com.vladproduction.dao;

import java.sql.SQLException;
import java.util.List;

public interface Dao<T> {

    void create(T t) throws SQLException;
    T read(int id) throws SQLException;
    List<T> readAll() throws SQLException;
    void update(int id, T candidate) throws SQLException;
    void delete(int id) throws SQLException;
}
