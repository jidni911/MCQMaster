package com.jidnivai.MCQMaster.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class Config implements WebMvcConfigurer{

	@SuppressWarnings("null")
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
//		registry.addResourceHandler("/*.css").addResourceLocations();
//		registry.addResourceHandler("/*.js").addResourceLocations();
		registry.addResourceHandler("/*.png").addResourceLocations("/WEB-INF/assets/images/");
	}
	
	
}
