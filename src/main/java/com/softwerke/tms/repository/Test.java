package com.softwerke.tms.repository;

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
    String type;
    String level;
    String user;
    String cDate;
    String uDate;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getcDate() {
        return cDate;
    }

    public void setcDate(String cDate) {
        this.cDate = cDate;
    }

    public String getuDate() {
        return uDate;
    }

    public void setuDate(String uDate) {
        this.uDate = uDate;
    }

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

    public Test(int id, int fkChecklistId, int fkUserId, int fkTypeId, int fkLevelId, String title, String description, String fileName) {
        this.id = id;
        this.fkChecklistId = fkChecklistId;
        this.fkUserId = fkUserId;
        this.fkTypeId = fkTypeId;
        this.fkLevelId = fkLevelId;
        this.title = title;
        this.description = description;
        this.fileName = fileName;
    }

    public Test() {
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
