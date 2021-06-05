package com.srvraj311;

import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.image.ImageView;
import javafx.scene.input.MouseEvent;
import javafx.stage.Stage;

public class LoginController implements Initializable {
    @FXML
    public CheckBox rememberDeviceCheckBox;
    @FXML
    public Hyperlink forgotHyperlink;
    @FXML
    public TextField passwordField;
    @FXML
    public TextField emailField;
    @FXML
    public Button loginButton;
    @FXML
    public ImageView loginGoogle;


    String email;
    String password;
    boolean rememberDevice;



    public boolean checkInput(String email, String password){
        if(email.equals("") || password.equals("")){
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setContentText("Email or Password cannot be Empty ! ");
            alert.show();
            return false;
        }
        return true;
    }
    public void onPressButton(){
        email = emailField.getText();
        password = passwordField.getText();
        rememberDevice = rememberDeviceCheckBox.selectedProperty().getValue();
        if(checkInput(email , password)){
            login();
        }
    }
    public void login(){
        ////////////////////////// MAIN LOGIN FUNCTION \\\\\\\\\\\\\\\\\\\\\\\\\
        System.out.println(email + " " + password + " " + rememberDevice);
    }
    public void cancel(ActionEvent event) throws IOException {
        Stage stage = (Stage) ((Node) event.getSource()).getScene().getWindow();
        URL myFxml = ClassLoader.getSystemResource("MainLoginScreen.fxml");
        Parent root = FXMLLoader.load(myFxml);
        Scene scene = new Scene(root);
        stage.setScene(scene);
    }

    @Override
    public void initialize(URL location, ResourceBundle resources) {
        loginGoogle.setOnMouseClicked(new EventHandler<MouseEvent>() {
            @Override
            public void handle(MouseEvent event) {
                try {
                    googleLoginFunction(event);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        });
    }

    private void googleLoginFunction(MouseEvent event) throws IOException {
        //TODO: Change it in Future : Google Login
        Stage stage = (Stage) ((Node) event.getSource()).getScene().getWindow();
        URL myFxml = ClassLoader.getSystemResource("HomeScreen.fxml");
        Parent root = FXMLLoader.load(myFxml);
        Scene scene = new Scene(root);
        stage.setScene(scene);
    }
}
