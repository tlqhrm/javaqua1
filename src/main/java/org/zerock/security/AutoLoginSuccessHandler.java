package org.zerock.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.omg.CORBA.UserException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import lombok.extern.log4j.Log4j;

@Log4j
public class AutoLoginSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth)
			throws IOException, ServletException {
		
		
		
		
		UserDetails userDetails = (UserDetails)auth.getPrincipal();
		log.warn("Login Success");
		
		
		HttpSession session = request.getSession();
		
		
			
		System.out.println(session.getAttribute("prevPage"));
		List<String> roleNames = new ArrayList<>();

		auth.getAuthorities().forEach(authority -> {

			roleNames.add(authority.getAuthority());

		});

		log.warn("ROLE NAMES: " + roleNames);
		

		
		session.setAttribute("id", userDetails.getUsername());
		
		log.warn("Session Id = "+session.getAttribute("id"));

		if (roleNames.contains("ROLE_ADMIN")) {
			session.setAttribute("admin", 1);
//			response.sendRedirect((String) session.getAttribute("prevPage"));
			if(session.getAttribute("prevPage") != null) {
				session.removeAttribute("prevPage");
			}
			
		}

		if (roleNames.contains("ROLE_MEMBER")) {
			session.setAttribute("admin", 0);
//			response.sendRedirect((String) session.getAttribute("prevPage"));
			if(session.getAttribute("prevPage") != null) {
				session.removeAttribute("prevPage");
			}
			
		}

		response.sendRedirect(request.getRequestURI());
	}
}


