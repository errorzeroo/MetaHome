package com.metafinal.spring_mybatis2;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication

@MapperScan("com.metafinal.home.mapper")
@ComponentScan(basePackages = {"com.metafinal", "com.metafinal.spring_mybatis2"})
public class SpringMybatis2Application {

	public static void main(String[] args) {
		SpringApplication.run(SpringMybatis2Application.class, args);
	}

}
