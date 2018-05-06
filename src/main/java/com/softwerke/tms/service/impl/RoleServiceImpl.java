package com.softwerke.tms.service.impl;

import com.softwerke.tms.dao.RoleDAO;
import com.softwerke.tms.repository.Role;
import com.softwerke.tms.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleDAO roleDAO;


    @Override
    public List<Role> getRoles() {
        return roleDAO.getRoles();
    }
}
