package com.softwerke.tms.dao.jdbc;

import com.softwerke.tms.dao.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;
import java.sql.SQLException;

@Component
public class UserDAOImpl implements UserDAO {

    private DataSource dataSource;

    @Autowired
    public void setDataSource(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    @Override
    public void save(User user) {
        String query = "insert into User (id, fk_role_id, principal_name,) values (?,?,?)";
        Connection con = null;
        PreparedStatement ps = null;
        try{
            con = dataSource.getConnection();
            ps = con.prepareStatement(query);
            ps.setInt(1, user.getId());
            ps.setInt(2, user.getFk_role_id());
            ps.setString(3, user.getPrincipal_name());
            //ps.setString(3, user.getRole());
            int out = ps.executeUpdate();
            if(out !=0){
                System.out.println("Employee saved with id="+user.getId());
            }else System.out.println("Employee save failed with id="+user.getId());
        }catch(SQLException e){
            e.printStackTrace();
        }finally{
            try {
                ps.close();
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
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
