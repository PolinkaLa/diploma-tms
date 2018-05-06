package com.softwerke.tms.dao.impl;

import com.softwerke.tms.dao.RoleDAO;
import com.softwerke.tms.repository.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Service;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Service
public class RoleDAOImpl extends JdbcDaoSupport implements RoleDAO {

    @Autowired
    public RoleDAOImpl(DataSource dataSource) {
        setDataSource(dataSource);
    }

    @Override
    public void insertRole(String name) {

    }

    @Override
    public String getRoleName(int id) {
        Role role = getJdbcTemplate().
                queryForObject("SELECT * FROM role WHERE id = ?",
                        new Object[] {id},
                        new RoleMapper()
                );
        return role.getName();
    }

    @Override
    public int getRoleId(String name) {
        return 0;
    }

    @Override
    public List<Role> getRoles() {
        List<Role> roles = getJdbcTemplate().
                query("SELECT * FROM role",
                        new RoleMapper()
                );
        return roles;
    }

    @Override
    public void updateRole(Role role) {

    }

    @Override
    public void delRole(int id) {

    }

    private class RoleMapper implements RowMapper<Role> {

        @Override
        public Role mapRow(ResultSet rs, int rowNum)
                throws SQLException {
            Role role = new Role();
            role.setId(rs.getInt("id"));
            role.setName(rs.getString("name"));
            return role;
        }
    }
}
