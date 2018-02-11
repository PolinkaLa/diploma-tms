package com.softwerke.tms.model;

public class User {
    private static int count;
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

    public User(String principalName) {
        this.id = count++;
        this.fkRoleId = 1;
        this.principalName = principalName;
    }

    public User (){}

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", fk_role_id=" + fkRoleId +
                ", principal_name='" + principalName + '\'' +
                '}';
    }
}
