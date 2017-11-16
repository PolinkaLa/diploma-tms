package com.softwerke.tms.entity;

public class User {

    private String login;

    private String name;

    private String email;

    public User() {
    }

    public User(String login,
                String name,
                String email) {
        this.login = login;
        this.name = name;
        this.email = email;
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
}