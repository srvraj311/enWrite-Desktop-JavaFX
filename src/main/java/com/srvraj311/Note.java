package com.srvraj311;

import javax.xml.crypto.Data;
import java.util.Date;

public class Note {
    private String title;
    private String note;
    private String dateTime;
    private String id;

    public Note(String title, String note, String id) {
        Date date = new Date();
        this.dateTime = date.toString();
        this.title = title;
        this.note = note;
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getDateTime() {
        return dateTime;
    }

    public void setDateTime(String dateTime) {
        this.dateTime = dateTime;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }



}
