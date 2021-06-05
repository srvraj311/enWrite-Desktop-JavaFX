package com.srvraj311;

import com.google.api.core.ApiFuture;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.cloud.firestore.Firestore;
import com.google.cloud.firestore.WriteResult;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseAuthException;
import com.google.firebase.auth.UserRecord;
import com.google.firebase.cloud.FirestoreClient;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;
import javafx.scene.image.ImageView;
import javafx.stage.Stage;
import org.springframework.stereotype.Service;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URL;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class SignUpController {
    @FXML
    public TextField nameField;
    @FXML
    public TextField emailField;
    @FXML
    public TextField passwordField1;
    @FXML
    public TextField passwordField2;
    @FXML
    public ImageView userAvatarSignUpScreen;
    @FXML
    public Button cancleButtonSignUpPage;
    @FXML
    public Button signUpButton;

    // Data Variables
    String name;
    String email;
    String password;
    String password2;

    // REGEX variables
    private static String EMAIL_PATTERN = "^(.+)@(.+)$";
    private static String PASSWORD_PATTERN = "^(?=.*[0-9])"
            + "(?=.*[a-z])(?=.*[A-Z])"
            + "(?=.*[@#$%^&+=])"
            + "(?=\\S+$).{8,20}$";
    private static final Pattern pattern = Pattern.compile(EMAIL_PATTERN);
    private static final Pattern pattern2 = Pattern.compile(PASSWORD_PATTERN);

    // Add Server Options here
    public boolean checkInputs(){
        Alert alert = new Alert(Alert.AlertType.ERROR);
        if(!name.equals("") && (name.length() < 4 || name.length() > 100)){
            alert.setContentText("Name must be minimum 4 character long and maximum 100 character");
            alert.setTitle("Error in name");
            alert.show();
            return false;
        }
        Matcher emailMatcher = pattern.matcher(email);
        Matcher passwordMatcher = pattern2.matcher(password);
        if(!emailMatcher.matches()){
            alert.setContentText("The email you entered is Invalid or Does not Exist");
            alert.setTitle("Error : E-mail Invalid");
            alert.show();
            return false;
        }
        if(!password.equals(password2)){
            alert.setContentText("Two passwords that you entered does not matches");
            alert.setTitle("Error : Password Mismatched");
            alert.show();
            return false;
        }
        if(!passwordMatcher.matches()){
            alert.setContentText("Passwords are too weak, Must contain \n 1.Any one 0-9 Numbers\n 2.Any one a-z or A-Z Alphabets \n 3. Any one Special Character \n 4. 8 to 20 characters long");
            alert.setTitle("Error : Password Weak");
            alert.show();
            return false;
        }
        return true;
    }
    public void getData(){
        name = nameField.getText();
        email = emailField.getText();
        password = passwordField1.getText();
        password2 = passwordField2.getText();
    }
    public void signUp(ActionEvent event) throws FirebaseAuthException, IOException {
        getData();
        boolean allOk = false;
        if(checkInputs()){
            System.out.println("SIGN UP : All inputs are correct, Starting Sign Up Process");

            /////////// -------   Register User Part  ------------ ////////////\

            System.out.println("SIGN UP : Success");
            allOk = true;
        }
        if(allOk){
            Stage stage = (Stage) ((Node) event.getSource()).getScene().getWindow();
            URL myFxml = ClassLoader.getSystemResource("HomeScreen.fxml");
            Parent root = FXMLLoader.load(myFxml);
            Scene scene = new Scene(root);
            stage.setScene(scene);
        }
    }
    public void cancel(ActionEvent event) throws IOException {
        Stage stage = (Stage) ((Node) event.getSource()).getScene().getWindow();
        URL myFxml = ClassLoader.getSystemResource("MainLoginScreen.fxml");
        Parent root = FXMLLoader.load(myFxml);
        Scene scene = new Scene(root);
        stage.setScene(scene);
    }
}
