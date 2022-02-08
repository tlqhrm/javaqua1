package org.zerock.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

public class CustomLoginFailureHandler implements AuthenticationFailureHandler {
	 private final String DEFAULT_FAILURE_URL = "/member/login";
	

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		
		String errorMsg = null;
		
		if(exception instanceof BadCredentialsException || exception instanceof InternalAuthenticationServiceException) {
			errorMsg = "로그인 실패 : 아이디 또는 비밀번호가 일치하지 않습니다.";
		}else {
			errorMsg = "로그인 실패 : 알수없는 이유로 로그인에 실패했습니다. 관리자에게 문의하세요.";
		}
		
		request.setAttribute("errorMsg", errorMsg);
		request.getRequestDispatcher(DEFAULT_FAILURE_URL).forward(request, response);
		
	}

}
