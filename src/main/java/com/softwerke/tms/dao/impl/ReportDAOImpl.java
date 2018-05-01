package com.softwerke.tms.dao.impl;

import com.softwerke.tms.dao.ReportDAO;
import com.softwerke.tms.repository.ReportData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Service;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Service
public class ReportDAOImpl extends JdbcDaoSupport implements ReportDAO {
    @Autowired
    ReportDAOImpl (DataSource dataSource) {
        setDataSource(dataSource);
    }

    @Override
    public List<ReportData> getTestsGroupByUsers() {
        List<ReportData> reportData = getJdbcTemplate().
                query("SELECT fk_user_id, COUNT(fk_user_id) FROM test GROUP BY fk_user_id",
                        new ReportDataMapper()
                );
        return reportData;
    }

    private class ReportDataMapper implements RowMapper<ReportData> {

        @Override
        public ReportData mapRow(ResultSet rs, int rowNum)
                throws SQLException {
            ReportData reportData = new ReportData();
            reportData.setValue(rs.getInt("COUNT(fk_user_id)"));
            reportData.setName(rs.getString("fk_user_id"));
            return reportData;
        }
    }
}
