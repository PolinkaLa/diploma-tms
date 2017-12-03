package com.softwerke.tms.dao.model;

/**
 * Created by LappoPolina on 26.11.2017.
 */
public class UserModel {
    private int id;
    private int fkRoleId;
    private String principalName;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getFkRoleId() {
        return fkRoleId;
    }

    public void setFkRoleId(int fkRoleId) {
        this.fkRoleId = fkRoleId;
    }

    public String getPrincipalName() {
        return principalName;
    }

    public void setPrincipalName(String principalName) {
        this.principalName = principalName;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", fk_role_id=" + fkRoleId +
                ", principal_name='" + principalName + '\'' +
                '}';
    }
}
