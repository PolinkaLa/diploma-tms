package com.softwerke.tms.dao.jdbc;

import com.softwerke.tms.dao.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.sql2o.Connection;
import org.sql2o.Sql2o;

import java.util.List;

@Repository
public class UserDAOImpl implements UserDAO {

    @Autowired
    Sql2o sql2o;

    @Override
    public void save(String login) {
        String sql = "insert into user (fk_role_id, principal_name) values ( :role, :login)";

        try (Connection con = sql2o.open()) {
            int insertedId = (int) con.createQuery(sql, true)
                    .addParameter("role", 1)
                    .addParameter("login", login)
                    .executeUpdate()
                    .getKey();
        }
    }

    @Override
    public User getById(int id) {
        return null;
    }

    @Override
    public void update(User user) {

    }

    @Override
    public void deleteById(int id) {

    }

    @Override
    public List<User> getAll() {
        return null;
    }
}
