package com.srvraj311;

import javafx.beans.property.BooleanProperty;
import javafx.beans.property.SimpleBooleanProperty;
import javafx.beans.value.ObservableValue;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.Node;
import javafx.scene.control.*;
import javafx.scene.control.cell.CheckBoxListCell;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.input.MouseEvent;
import javafx.util.Callback;

import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.ResourceBundle;

public class HomeScreenController implements Initializable {
    @FXML
    public ListView<String> notesList;
    @FXML
    public TextArea noteTitleBox;
    @FXML
    public TextArea noteBox;
    @FXML
    public Button saveButton;
    @FXML
    public Button clearButton;
    @FXML
    public Button searchButton;
    @FXML
    public TextField searchField;


    // Global variables
    List<Note> notes = new ArrayList<>();
    String title;
    String note;
    String id;



    URL saveIconUrl = ClassLoader.getSystemResource("HomeScreenIcons/check.svg");
    Image img = new Image(String.valueOf(saveIconUrl));
    @Override
    public void initialize(URL location, ResourceBundle resources) {
        saveButton.setGraphic(new ImageView(img));

        // Initially Display Notes in Array
        for(Note note : notes) {
            notesList.getItems().add(note.getTitle());
        }
        // Onclick to view Notes
        notesList.setOnMouseClicked(new EventHandler<MouseEvent>() {
            @Override
            public void handle(MouseEvent event) {
                String current = notesList.getSelectionModel().getSelectedItem();
                System.out.println("Current Item : " + current);
                if(saveNoteWarning()){
                    clearFields();
                    for(Note note : notes){
                        if(note.getTitle().equals(current)){
                            noteTitleBox.setText(current);
                            noteBox.setText(note.getNote());
                        }
                    }
                }

            }
        });


    }

    private boolean saveNoteWarning() {
        if(noteTitleBox.getText().equals("") && noteBox.getText().equals("")){
            return true;
        }
        Alert alert = new Alert(Alert.AlertType.CONFIRMATION);
        alert.setTitle("Unsaved Changes Will Be Lost");
        alert.setHeaderText("Want to save current Note ? Ignore if Already saved");
        ButtonType yes = new ButtonType("Yes");
        ButtonType no = new ButtonType("No");
        ButtonType cancel = new ButtonType("Cancel");
        alert.getButtonTypes().setAll(yes, no, cancel);
        Optional<ButtonType> result = alert.showAndWait();
        if(result.get() == yes){
            saveNote();
            return true;
        }else if(result.get() == no){
            return true;
        }else{
            return false;
        }
    }

    public void saveNote(){
        this.title = noteTitleBox.getText();
        this.note = noteBox.getText();
        this.id = String.valueOf(notes.size() + 100001);
        
        Note note = new Note(this.title, this.note, this.id);
        notes.add(note);
        updateNotesList(notes);
        clearFields();
    }

    @FXML
    private void clearFields() {
        noteTitleBox.setText("");
        noteBox.setText("");
    }

    private void updateNotesList(List<Note> notes) {
        notesList.getItems().clear();
        //TODO : Checkbox features should be added here
        notesList.setCellFactory(CheckBoxListCell.forListView(new Callback<String, ObservableValue<Boolean>>() {
            @Override
            public ObservableValue<Boolean> call(String item) {
                BooleanProperty observable = new SimpleBooleanProperty();
                observable.addListener((obs, wasSelected, isNowSelected) -> {
                    System.out.println("CHECKBOX : Checkbox for " + item + "changed to " + wasSelected);

                });
                return observable;
            }
        }));
        for(Note note : notes){
            notesList.getItems().add(note.getTitle());
        }
    }
    public void setNotesBase(){
        notesList.getItems().clear();
        for(Note note : notes){
            notesList.getItems().add(note.getTitle());
        }
    }


    public void searchText(){
        notesList.getItems().clear();
        String searchText = this.searchField.getText();
        if(searchText.equals("")){
            setNotesBase();
        }

        List<Note> searchedList = new ArrayList<Note>();
        for(int i = 0; i < notes.size() ; i++){
            String noteTitle = notes.get(i).getTitle();
            String noteBody = notes.get(i).getNote();
            if(noteTitle.contains(searchText) || noteBody.contains(searchText)){
                searchedList.add(notes.get(i));
            }
        }
        for(Note note : searchedList){
            notesList.getItems().add(note.getTitle());
        }
    }

}
