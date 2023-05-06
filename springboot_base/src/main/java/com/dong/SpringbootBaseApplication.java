package com.dong;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;

@SpringBootApplication
@ServletComponentScan
@MapperScan("com.dong.mapper")
public class SpringbootBaseApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringbootBaseApplication.class, args);
	}

}
