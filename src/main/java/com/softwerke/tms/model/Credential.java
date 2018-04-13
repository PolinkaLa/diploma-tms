package com.softwerke.tms.model;

public class Credential{

    private String login;

    private String name;

    private String email;

    private int id;

    private int role;

    public Credential() {
    }

    public Credential(String login,
                String name,
                String email) {
        this.login = login;

        int index = name.lastIndexOf("=");
        if(index >= 0){
            this.name = name.substring(index + 1);
        }

        index = email.lastIndexOf("=");
        if(index >= 0){
            this.email = email.substring(index + 1);
        }
    }


    public String getLogin() {
        return login;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}