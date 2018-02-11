package com.softwerke.tms.model;

public class Credential{

    private String login;

    private String name;

    private String email;

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
}