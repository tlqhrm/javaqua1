package org.zerock.config;

import javax.servlet.Filter;
import javax.servlet.MultipartConfigElement;
import javax.servlet.ServletRegistration;

import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class WebConfig extends AbstractAnnotationConfigDispatcherServletInitializer{

	@Override
	protected Class<?>[] getRootConfigClasses() {
		// TODO Auto-generated method stub
		return new Class[] {RootConfig.class};
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
		// TODO Auto-generated method stub
		return new Class[] {ServletConfig.class};
	}

	@Override
	protected String[] getServletMappings() {
		// TODO Auto-generated method stub
		return new String[] {"/"};
	}
	
	@Override
	protected void customizeRegistration(ServletRegistration.Dynamic registration) {
		
		registration.setInitParameter("throwExceptionIfNoHandlerFound", "true");
		
		MultipartConfigElement multipartConfig = new MultipartConfigElement("C:\\sts\\spring_study\\ex021\\src\\main\\webapp\\resources\\upload\\board\\tmp",(1024*1024*5), (1024*1024*40), (1024*1024*5));
	}

	@Override
	protected Filter[] getServletFilters() {
		CharacterEncodingFilter characterEncodingFilter =
				new CharacterEncodingFilter();
		characterEncodingFilter.setEncoding("UTF-8");
		characterEncodingFilter.setForceEncoding(true);
		
		return new Filter[] {characterEncodingFilter};
	}

}
