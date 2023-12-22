package com.example.worldcountryesapp;

import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;

import java.util.List;

public class Controller {
    @FXML
    public Label LabelWorldCountry;
    @FXML
    public TextField TextFieldEnterCountry;
    @FXML
    public TextArea TextAriaInfo;
    @FXML
    public Button ButtonClick;

    public void onButtonClickAction(){
        System.out.println("onButtonClickAction()");
        String nameCountry = TextFieldEnterCountry.getText();
        Dao dao = new DaoImpl();
        List<Country> listCountry = dao.readAll();
        for (int i = 0; i < listCountry.size(); i++) {
            Country country = listCountry.get(i);
            if(country.getName().contains(nameCountry)){
                TextAriaInfo.setText(country.toString());
            }
        }
    }
}
