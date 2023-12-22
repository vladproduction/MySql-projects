package vladproduction.config;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class ConfigUtils {

    public static String getConfigProperties(String key){

        try(InputStream in = ConfigUtils.class.getResourceAsStream("/chinook_db.properties")){
            Properties properties = new Properties();
            properties.load(in);
            String value = properties.getProperty(key);
            return value;
        }catch (IOException e){
            throw new RuntimeException(e);
        }
    }
}
