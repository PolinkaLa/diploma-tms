package com.softwerke.tms.model;

import java.sql.Timestamp;

public class Checklist {
    int id;
    int fkProjectId;
    String title;
    Timestamp createdDate;
    boolean activeStatus;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getFkProjectId() {
        return fkProjectId;
    }

    public void setFkProjectId(int fkProjectId) {
        this.fkProjectId = fkProjectId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public boolean isActiveStatus() {
        return activeStatus;
    }

    public void setActiveStatus(boolean activeStatus) {
        this.activeStatus = activeStatus;
    }

    public Timestamp getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Timestamp createdDate) {
        this.createdDate = createdDate;
    }
}
