package com.phuag.ds.datasource;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

/**
 * @author phuag
 */
@SpringBootApplication
@EnableDiscoveryClient
public class DSAdminApplication {

    public static void main(String[] args) {
        SpringApplication.run(DSAdminApplication.class, args);
    }
}
