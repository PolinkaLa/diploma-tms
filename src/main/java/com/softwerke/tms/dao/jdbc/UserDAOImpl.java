package com.softwerke.tms.dao.jdbc;

import com.softwerke.tms.dao.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.sql.SQLException;

@Component
public class UserDAOImpl implements UserDAO {

    private DataSource dataSource;
    private JdbcTemplate jdbcTemplate;

    @PersistenceContext
    private EntityManager entityManager;

    @Autowired
    public void setDataSource(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    @Override
    public void save(User user) {
        String query = "insert into user (fk_role_id, principal_name, id) values (?,?,?)";
        jdbcTemplate.update(new PreparedStatementCreator() {
            public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
                PreparedStatement preparedStatement = connection.prepareStatement(query);
                preparedStatement.setInt(1, user.getFkRoleId());
                preparedStatement.setString(2, user.getPrincipalName());
                preparedStatement.setInt(3, user.getId());
                return preparedStatement;
            }
        });
    }

    @Override
    public User getByPrinsipalName(String prinsipalName) {
        return null;
    }

    @Override
    public void update(User user) {
    }

    @Override
    public void deleteById(int id) {
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<User> getAll() {
        String query = "select * from user";
        List<User> userList = this.jdbcTemplate.query(query, new RowMapper<User>() {
            public User mapRow(ResultSet resulSet, int rowNum) throws SQLException {
                User user = new User();
                user.setId(resulSet.getInt("id"));
                user.setPrincipalName(resulSet.getString("prinsipal_name"));
                user.setFkRoleId(resulSet.getInt("fk_role_id"));
                return user;
            }
        });
        return userList;
    }
}
