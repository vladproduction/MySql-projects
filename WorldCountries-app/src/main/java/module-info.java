module com.example.worldcountryesapp {
    requires javafx.controls;
    requires javafx.fxml;
    requires java.sql;


    opens com.example.worldcountryesapp to javafx.fxml;
    exports com.example.worldcountryesapp;
}