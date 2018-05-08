package com.softwerke.tms.dao.impl;

import com.softwerke.tms.dao.LevelDAO;
import com.softwerke.tms.repository.Level;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Service;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Service
public class LevelDAOImpl extends JdbcDaoSupport implements LevelDAO {

    @Autowired
    public LevelDAOImpl(DataSource dataSource) {
        setDataSource(dataSource);
    }

    @Override
    public void insertLevel(String name) {
        getJdbcTemplate().update ("INSERT INTO level (name) VALUE ( ?)", name);
    }

    @Override
    public String getLevelName(int id) {
        Level level = getJdbcTemplate().
                queryForObject("SELECT * FROM level WHERE id = ?",
                        new Object[] {id},
                        new LevelMapper()
                );
        return level.getName();
    }

    @Override
    public List<Level> getLevels() {
        List<Level> levels = getJdbcTemplate().
                query("SELECT * FROM level",
                        new LevelMapper()
                );
        return levels;
    }

    @Override
    public void updateLevel(Level level) throws Exception{
        try {
            getJdbcTemplate().update("UPDATE level SET name = ?  WHERE id = ?",
                    level.getName(),
                    level.getId());
        }catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delLevel(Level level) throws Exception{
        try {
            getJdbcTemplate().update("DELETE FROM level WHERE id = ?",
                    level.getId());
        }catch (Exception e) {
            e.printStackTrace();
        }
    }
    private class LevelMapper implements RowMapper<Level> {

        @Override
        public Level mapRow(ResultSet rs, int rowNum)
                throws SQLException {
            Level level = new Level();
            level.setId(rs.getInt("id"));
            level.setName(rs.getString("name"));
            return level;
        }
    }
}
