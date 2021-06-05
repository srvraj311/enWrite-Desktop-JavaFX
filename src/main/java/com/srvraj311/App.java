package com.srvraj311;
import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;

import java.net.URL;


public class App extends Application{
    @Override
    public void start(Stage stage) throws Exception {
        URL myFxml = ClassLoader.getSystemResource("MainLoginScreen.fxml");
        Parent root = FXMLLoader.load(myFxml);
        Scene scene = new Scene(root);
        stage.setTitle("Welcome to enWrite");
        stage.setScene(scene);
        stage.show();
    }

    public static void main(String[] args) {
        launch(args);
    }

}
