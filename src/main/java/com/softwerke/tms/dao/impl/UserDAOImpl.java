package com.softwerke.tms.dao.impl;

import com.softwerke.tms.dao.UserDAO;
import com.softwerke.tms.model.User;
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
    public void insertUser(User user) {

    }

    @Override
    public User getUser(int userID) {
        User user = getJdbcTemplate().
                queryForObject("SELECT * FROM user WHERE id = ?",
                        new Object[] {userID},
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

    public void updateUser(User user){}

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
