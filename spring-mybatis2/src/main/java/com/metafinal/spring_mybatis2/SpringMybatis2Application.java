package com.metafinal.spring_mybatis2;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = {"com.metafinal", "com.metafinal.spring_mybatis2"})
//XXXXMapper 인터페이스가 있는 패키지를 @MapperScan에 추가하자
@MapperScan(basePackages = {"com.metafinal.user.mapper","com.metafinal.board.mapper","com.metafinal.shop.mapper"})
public class SpringMybatis2Application {

	public static void main(String[] args) {
		SpringApplication.run(SpringMybatis2Application.class, args);
	}

}
