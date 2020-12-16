package com.phuag.sample.admin;

import com.phuag.sample.common.security.annotation.EnableLocalResourceServer;
import org.springframework.boot.SpringApplication;
import org.springframework.cloud.client.SpringCloudApplication;
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
@SpringCloudApplication
@EnableFeignClients
@EnableLocalResourceServer
@EnableSwagger2
public class BaseAdminApplication {
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
        SpringApplication.run(BaseAdminApplication.class, args);
    }
}
