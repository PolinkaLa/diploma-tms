package com.softwerke.tms.dao.model;

import java.sql.Timestamp;

public class Test {
    int id;
    int fkChecklistId;
    int fkUserId;
    int fkTypeId;
    int fkLevelId;
    String title;
    String description;
    Timestamp createdDate;
    Timestamp updatedDate;
    String fileName;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getFkChecklistId() {
        return fkChecklistId;
    }

    public void setFkChecklistId(int fkChecklistId) {
        this.fkChecklistId = fkChecklistId;
    }

    public int getFkUserId() {
        return fkUserId;
    }

    public void setFkUserId(int fkUserId) {
        this.fkUserId = fkUserId;
    }

    public int getFkTypeId() {
        return fkTypeId;
    }

    public void setFkTypeId(int fkTypeId) {
        this.fkTypeId = fkTypeId;
    }

    public int getFkLevelId() {
        return fkLevelId;
    }

    public void setFkLevelId(int fkLevelId) {
        this.fkLevelId = fkLevelId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Timestamp getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Timestamp createdDate) {
        this.createdDate = createdDate;
    }

    public Timestamp getUpdatedDate() {
        return updatedDate;
    }

    public void setUpdatedDate(Timestamp updatedDate) {
        this.updatedDate = updatedDate;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    @Override
    public String toString() {
        return "Test{" +
                "id=" + id +
                ", fkChecklistId=" + fkChecklistId +
                ", fkUserId=" + fkUserId +
                ", fkTypeId=" + fkTypeId +
                ", fkLevelId=" + fkLevelId +
                ", title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", createdDate=" + createdDate +
                ", updatedDate=" + updatedDate +
                ", fileName='" + fileName + '\'' +
                '}';
    }
}
