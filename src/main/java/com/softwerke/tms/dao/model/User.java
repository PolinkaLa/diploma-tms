package com.softwerke.tms.dao.model;

/**
 * Created by LappoPolina on 26.11.2017.
 */
public class User {
    private int id;
    private int fk_role_id;
    private String principal_name;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getFk_role_id() {
        return fk_role_id;
    }

    public void setFk_role_id(int fk_role_id) {
        this.fk_role_id = fk_role_id;
    }

    public String getPrincipal_name() {
        return principal_name;
    }

    public void setPrincipal_name(String principal_name) {
        this.principal_name = principal_name;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", fk_role_id=" + fk_role_id +
                ", principal_name='" + principal_name + '\'' +
                '}';
    }
}
