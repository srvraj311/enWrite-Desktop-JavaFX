package com.srvraj311;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.stage.Stage;

import java.io.IOException;
import java.net.URL;

public class MainScreenController {

    @FXML
    public Button loginButtonHome;
    @FXML
    public Button signUpButtonMain;

    Stage stage;
    public void loginButtonPressed(ActionEvent event) throws IOException {
        stage = (Stage) ((Node) event.getSource()).getScene().getWindow();
        URL myFxml = ClassLoader.getSystemResource("loginScreen.fxml");
        Parent root = FXMLLoader.load(myFxml);
        Scene scene = new Scene(root);
        stage.setScene(scene);
    }
    public void signUpButtonPressed(ActionEvent event) throws IOException {
        stage = (Stage) ((Node) event.getSource()).getScene().getWindow();
        URL myFxml = ClassLoader.getSystemResource("signUpScreen.fxml");
        Parent root = FXMLLoader.load(myFxml);
        Scene scene = new Scene(root);
        stage.setScene(scene);
    }

}
