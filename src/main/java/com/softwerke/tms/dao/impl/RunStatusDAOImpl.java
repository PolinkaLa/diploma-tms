package com.softwerke.tms.dao.impl;

import com.softwerke.tms.dao.RunStatusDAO;
import com.softwerke.tms.repository.RunStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Service;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Service
public class RunStatusDAOImpl  extends JdbcDaoSupport implements RunStatusDAO {

    @Autowired
    public RunStatusDAOImpl(DataSource dataSource) {
        setDataSource(dataSource);
    }

    @Override
    public String getStatusName(int id) {
        RunStatus runStatus = getJdbcTemplate().
                queryForObject("SELECT * FROM run_status WHERE id = ?",
                        new Object[] {id},
                        new RunStatusMapper()
                );
        return runStatus.getName();
    }

    @Override
    public List<RunStatus> getStatuses() {
        List<RunStatus> runStatus = getJdbcTemplate().
                query("SELECT * FROM run_status",
                        new RunStatusMapper()
                );
        return runStatus;
    }

    private class RunStatusMapper implements RowMapper<RunStatus> {

        @Override
        public RunStatus mapRow(ResultSet rs, int rowNum)
                throws SQLException {
            RunStatus runStatus = new RunStatus();
            runStatus.setId(rs.getInt("id"));
            runStatus.setName(rs.getString("name"));
            return runStatus;
        }
    }
}
