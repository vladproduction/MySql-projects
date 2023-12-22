package vladproduction.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public abstract class AbstractRepository {

    protected Connection getConnection() throws SQLException {

        String url = ConfigUtils.getConfigProperties("DB.url");
        String login = ConfigUtils.getConfigProperties("DB.login");
        String password = ConfigUtils.getConfigProperties("DB.password");
        return DriverManager.getConnection(url,login,password);

    }
}
