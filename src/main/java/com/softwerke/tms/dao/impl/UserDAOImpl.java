package com.softwerke.tms.dao.impl;

import com.softwerke.tms.dao.UserDAO;
import com.softwerke.tms.repository.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Service;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Service
public class UserDAOImpl extends JdbcDaoSupport implements UserDAO {

    @Autowired
    public UserDAOImpl(DataSource dataSource) {
        setDataSource(dataSource);
    }

    @Override
    public void insertUser(String name) {
        getJdbcTemplate().update ("INSERT INTO user ( fk_role_id, principal_name) VALUE ( ?, ?)",
                 1, name);
    }

    @Override
    public User getUser(String login) throws Exception  {
        User user = null;
        try {
            user = getJdbcTemplate().
                    queryForObject("SELECT * FROM user WHERE principal_name = ?",
                            new Object[]{login},
                            new UserDAOImpl.UserMapper()
                    );
        }
        catch (Exception e) {
            return null;
        }
        return user;
    }

    @Override
    public User getUserByID(int id) {
        User user = null;
            user = getJdbcTemplate().
                    queryForObject("SELECT * FROM user WHERE id = ?",
                            new Object[]{id},
                            new UserDAOImpl.UserMapper()
                    );
        return user;
    }

    @Override
    public List<User> getUsers() {
        List<User> users = getJdbcTemplate().
                query("SELECT * FROM user",
                        new UserDAOImpl.UserMapper()
                );
        return users;
    }

    public void updateUser(User user) throws Exception{
        try {
            getJdbcTemplate().update ("UPDATE user SET fk_role_id = ? WHERE id = ?",
                    user.getFkRoleId(),
                    user.getId());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean isUserExist(String login) throws Exception {
        if (getUser(login) == null) {
            return false;
        }
        return true;
    }

    @Override
    public int getUserRole(String login) {
        User user = null;
            user = getJdbcTemplate().
                    queryForObject("SELECT * FROM user WHERE principal_name = ?",
                            new Object[]{login},
                            new UserDAOImpl.UserMapper()
                    );
        return user.getFkRoleId();
    }

    private class UserMapper implements RowMapper<User> {

        @Override
        public User mapRow(ResultSet rs, int rowNum)
                throws SQLException {
            User user = new User();
            user.setId(rs.getInt("id"));
            user.setFkRoleId(rs.getInt("fk_role_id"));
            user.setPrincipalName(rs.getString("principal_name"));
            return user;
        }
    }
}
