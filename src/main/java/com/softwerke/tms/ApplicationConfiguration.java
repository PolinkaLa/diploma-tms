package com.softwerke.tms;

import org.springframework.beans.factory.SmartInitializingSingleton;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

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
}