package com.softwerke.tms;

import org.springframework.beans.factory.SmartInitializingSingleton;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import javax.sql.DataSource;

@Configuration
@ComponentScan(ApplicationConfiguration.BASE_PACKAGE_TO_SCAN)
public class ApplicationConfiguration {

    public static final String BASE_PACKAGE_TO_SCAN = "com.softwerke.tms";
    @Bean
    public SmartInitializingSingleton smartInitializingSingleton() {
        return new SmartInitializingSingleton() {

            @Override
            public void afterSingletonsInstantiated() {

            }
        };
    }

    @Bean
    public DataSource dataSource(){
        DriverManagerDataSource dataSource = new DriverManagerDataSource();

        dataSource.setDriverClassName("com.mysql.jdbc.Driver");
        dataSource.setUrl("jdbc:mysql://localhost:3306/tms_db");
        dataSource.setUsername("root");
        dataSource.setPassword("1234"); // for home 1234; for office root

        return dataSource;
    }

    @Bean
    public JdbcTemplate jdbcTemplate() {
        return new JdbcTemplate(dataSource());
    }
}