package org.zerock.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;
import org.springframework.security.web.csrf.CsrfFilter;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.zerock.security.AutoLoginSuccessHandler;
import org.zerock.security.CustomAccessDeniedHandler;
import org.zerock.security.CustomAuthenticationEntryPoint;
import org.zerock.security.CustomLoginFailureHandler;
import org.zerock.security.CustomLoginSuccessHandler;
import org.zerock.security.CustomLogoutSuccessHandler;
import org.zerock.security.CustomUserDetailsService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Configuration
@EnableWebSecurity
@Log4j


public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Setter(onMethod_ = { @Autowired })
	private DataSource dataSource;

	@Bean
	public UserDetailsService customUserService() {
		return new CustomUserDetailsService();
	}
	
	@Override
	public void configure(HttpSecurity http) throws Exception {
		CharacterEncodingFilter filter = new CharacterEncodingFilter();
        filter.setEncoding("UTF-8");
        filter.setForceEncoding(true);
        http.addFilterBefore(filter,CsrfFilter.class);
        
        
		http.authorizeRequests()
		.antMatchers("/member/login").anonymous()
		.antMatchers("/member/joinForm").anonymous()
		.antMatchers("/member/join").anonymous()
		.antMatchers("/member/login").anonymous()
		.antMatchers("/member/idCheck").anonymous()
		.antMatchers("/member/emailCheck").anonymous()
		.antMatchers("/member/*").authenticated()
		.antMatchers("/board/readBoard").permitAll()
		.antMatchers("/board/boardList").permitAll()
		.antMatchers("/board/*").authenticated()
		.antMatchers("/cart/*").authenticated()
		.antMatchers("/reply/getReplyList").permitAll()
		.antMatchers("/reply/*").authenticated()
		.antMatchers("/order/*").authenticated()
		.antMatchers("/product/productList").permitAll()
		.antMatchers("/product/productDetail").permitAll()
		.antMatchers("/product/*").access("hasRole('ROLE_ADMIN')")
		.antMatchers("/qna/qna_list").permitAll()
		.antMatchers("/qna/*").authenticated()
		.antMatchers("/review/review_list").permitAll()
		.antMatchers("/review/*").authenticated()
		.antMatchers("/admin/*").hasAnyRole("ROLE_ADMIN")
		;
		
		//권한이 없을 때
		http.exceptionHandling().authenticationEntryPoint(authenticationEntryPoint());
		
		//권한이 맞지않을 때
		http.exceptionHandling().accessDeniedHandler(accessDeniedHandler());
		
		http.formLogin().loginPage("/member/login")
		.loginProcessingUrl("/member/login")
		.successHandler(loginSuccessHandler())
		.failureHandler(loginFailureHandler())
		.usernameParameter("user_id")
		.passwordParameter("user_pw");
		
		
		http.logout()
		.logoutUrl("/member/logout")
		.invalidateHttpSession(true)
		.deleteCookies("remember-me","JSESSION_ID");
		
		
		
		http.rememberMe()
        .key("zerock")
        .tokenRepository(persistentTokenRepository())
        .authenticationSuccessHandler(loginSuccessHandler())
        .tokenValiditySeconds(604800);
	}
	
	
	
	@Bean
	public AuthenticationSuccessHandler loginSuccessHandler() {
		return new CustomLoginSuccessHandler();
	}
	@Bean
	public AuthenticationSuccessHandler autologinSuccessHandler() {
		return new AutoLoginSuccessHandler();
	}
	@Bean
	public AuthenticationFailureHandler loginFailureHandler() {
		return new CustomLoginFailureHandler();
	}
	@Bean
	public AccessDeniedHandler accessDeniedHandler() {
		return new CustomAccessDeniedHandler();
	}
	@Bean
	public AuthenticationEntryPoint authenticationEntryPoint() {
		return new CustomAuthenticationEntryPoint();
	}

	
	
	 @Override
		 protected void configure(AuthenticationManagerBuilder auth) throws Exception
		 {
		 log.info("------------");
		 auth.userDetailsService(customUserService()).passwordEncoder(passwordEncoder());
		 }
	
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Bean
	public PersistentTokenRepository persistentTokenRepository() {
		JdbcTokenRepositoryImpl repo = new JdbcTokenRepositoryImpl();
		repo.setDataSource(dataSource);
		return repo;
	}
}
