package com.softwerke.tms.repository;

import java.sql.Timestamp;

public class Run {
    int id;
    String name;
    Timestamp createdDate;
    String cDate;
    int fkChecklistId;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Timestamp getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Timestamp createdDate) {
        this.createdDate = createdDate;
    }

    public String getcDate() {
        return cDate;
    }

    public void setcDate(String cDate) {
        this.cDate = cDate;
    }

    public int getFkChecklistId() {
        return fkChecklistId;
    }

    public void setFkChecklistId(int fkChecklistId) {
        this.fkChecklistId = fkChecklistId;
    }
}
