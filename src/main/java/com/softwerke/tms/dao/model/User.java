package com.softwerke.tms.dao.model;

public class User {
    static int count = 0;
    private int id;
    private int fkRoleId;
    private String principalName;
    private String name;
    private String email;

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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public User(String login, String name,String email) {
        this.principalName = login;

        int index = name.lastIndexOf("=");
        if(index >= 0){
            this.name = name.substring(index + 1);
        }

        index = email.lastIndexOf("=");
        if(index >= 0){
            this.email = email.substring(index + 1);
        }
    }

    public User(String login) {
        this.principalName = login;
        this.fkRoleId = 1;
        this.id = count++;
    }

    public User() {}

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", fk_role_id=" + fkRoleId +
                ", principal_name='" + principalName + '\'' +
                '}';
    }
}
