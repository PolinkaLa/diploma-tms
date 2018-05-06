package com.softwerke.tms.dao;

import com.softwerke.tms.repository.Role;

import java.util.List;

public interface RoleDAO {
    void insertRole(String name);

    String getRoleName(int id);

    int getRoleId(String name);

    List<Role> getRoles();

    void updateRole (Role role);

    void delRole(int id);
}
