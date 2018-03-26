package com.softwerke.tms.dao.impl;

import com.softwerke.tms.dao.TypeDAO;
import com.softwerke.tms.model.Type;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Service;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Service
public class TypeDAOImpl extends JdbcDaoSupport implements TypeDAO {

    @Autowired
    public TypeDAOImpl(DataSource dataSource) {
        setDataSource(dataSource);
    }

    @Override
    public void insertType(String name) {
        // TODO
    }

    @Override
    public String getTypeName(int id) {
        Type type = getJdbcTemplate().
                queryForObject("SELECT * FROM type WHERE id = ?",
                        new Object[] {id},
                        new TypeMapper()
                );
        return type.getName();
    }

    @Override
    public int getTypeId(String name) {
        Type type = getJdbcTemplate().
                queryForObject("SELECT * FROM type WHERE name = ?",
                        new Object[] {name},
                        new TypeMapper()
                );
        return type.getId();
    }

    @Override
    public List<Type> getTypes() {
        List<Type> types = getJdbcTemplate().
                query("SELECT * FROM type",
                        new TypeMapper()
                );
        return types;
    }

    @Override
    public void updateType(Type type) {
        // TODO
    }

    @Override
    public void delType(int id) {
        // TODO
    }

    private class TypeMapper implements RowMapper<Type> {

        @Override
        public Type mapRow(ResultSet rs, int rowNum)
                throws SQLException {
            Type type = new Type();
            type.setId(rs.getInt("id"));
            type.setName(rs.getString("name"));
            return type;
        }
    }
}
