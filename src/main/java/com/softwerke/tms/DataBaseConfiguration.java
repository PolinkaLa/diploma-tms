package com.softwerke.tms;

import javax.sql.DataSource;
import org.apache.commons.dbcp.BasicDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.sql2o.Sql2o;

@Configuration
public class DataBaseConfiguration {

    @Bean
    public Sql2o dataSource() {
        String url = "jdbc:mysql://localhost:3306/tms_db";
        String user = "root";
        String password = "1234";
        Sql2o sql2o = new Sql2o(url, user, password);
        return sql2o;
    }

}