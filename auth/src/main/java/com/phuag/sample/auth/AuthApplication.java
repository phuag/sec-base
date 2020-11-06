package com.phuag.sample.auth;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.Bean;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

/**
 * @author phuag
 * @date 2017/3/1
 */
@SpringBootApplication
@EnableFeignClients
@EnableSwagger2
//@ComponentScan(basePackages =
//        {"com.phuag.sample.auth",
//        "com.phuag.sample.common"})
public class AuthApplication {
    @Bean
    public Docket createRestApi() {
        return new Docket(DocumentationType.SWAGGER_2)
                .apiInfo(apiInfo())
                .useDefaultResponseMessages(false)
                .select()
                .apis(RequestHandlerSelectors.basePackage("com.phuag.sample"))
                .build();
    }

    private ApiInfo apiInfo() {
        return new ApiInfoBuilder()
                .title("系统API文档")
                .contact(new Contact("作者", "访问地址", "联系方式"))
                .build();
    }

    public static void main(String[] args) {
        SpringApplication.run(AuthApplication.class, args);
    }
}
