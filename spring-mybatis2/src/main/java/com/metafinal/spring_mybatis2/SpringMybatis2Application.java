package com.metafinal.spring_mybatis2;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication

@MapperScan(basePackages = {"com.metafinal.metahome.mapper"})
public class SpringMybatis2Application {

	public static void main(String[] args) {
		SpringApplication.run(SpringMybatis2Application.class, args);
	}

}
