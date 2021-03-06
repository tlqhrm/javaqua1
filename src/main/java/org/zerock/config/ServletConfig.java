package org.zerock.config;

import java.io.IOException;
import java.util.Properties;
import java.util.concurrent.TimeUnit;

import javax.inject.Inject;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.http.CacheControl;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.mvc.WebContentInterceptor;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;


@EnableWebMvc
@ComponentScan(basePackages = {"org.zerock.controller","org.zerock.exception"})
@EnableGlobalMethodSecurity(prePostEnabled = true, securedEnabled = true)
public class ServletConfig implements WebMvcConfigurer {
	
//	private @Inject WebContentInterceptor webContentInterceptor;
	
	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		
		InternalResourceViewResolver bean = new	InternalResourceViewResolver();	
		bean.setViewClass(JstlView.class);
		bean.setPrefix("/WEB-INF/views/");
		//bean.setSuffix(".jsp");
		registry.viewResolver(bean);
	}
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		CacheControl cacheControl = CacheControl
//                .noCache();
                .maxAge(1, TimeUnit.DAYS);
		
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/").setCacheControl(cacheControl);
	}
	
	@Bean(name = "multipartResolver")
	public CommonsMultipartResolver getResolver() throws IOException{
		CommonsMultipartResolver resolver = new CommonsMultipartResolver();
		
		resolver.setMaxUploadSize(1024 * 1024 * 50);
		
		resolver.setMaxUploadSizePerFile(1024 * 1024 * 10);
		
		resolver.setMaxInMemorySize(1024 * 1024);
		
//		resolver.setUploadTempDir(new FileSystemResource("C:\\upload\\tmp"));
		
		resolver.setDefaultEncoding("utf-8");
		
		return resolver;
	}
	


}
