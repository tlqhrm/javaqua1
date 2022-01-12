package org.zerock.security;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.omg.CORBA.UserException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth)
			throws IOException, ServletException {
		
		HttpSession session = request.getSession();
		
		RequestCache requestCache = new HttpSessionRequestCache();
		SavedRequest savedRequest = requestCache.getRequest(request, response);
		
		String prevPage = (String) session.getAttribute("prevPage");
		if(prevPage!=null) session.removeAttribute("prevPage");
		
		String uri = request.getContextPath();
		//경우1 일 경우 uri에 경로 저장
		if(savedRequest!=null) {
			uri = savedRequest.getRedirectUrl();		
			log.warn("uri1"+uri);
		}
		//경우2 일 경우 uri에 경로 저장
		else if(prevPage!=null) {
			uri = prevPage;
			log.warn("uri2"+uri);
		}
		log.warn(request.getContextPath());
		log.warn(request.getRequestURI());
		log.warn(request.getRequestURL());
		log.warn(request.getHeader("Referer"));
		log.warn("uri3"+uri);
		UserDetails userDetails = (UserDetails)auth.getPrincipal();
		log.warn("Login Success");
		
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
			response.sendRedirect("/admin/member");
			return;  
		}else if (roleNames.contains("ROLE_MEMBER")) {
			session.setAttribute("admin", 0);
		}


		response.sendRedirect(uri);
	}
	
	public static String convertMapToURLParameters(Map<String, String[]> paramMap) throws UnsupportedEncodingException {
        String parameterString = "";
        for (Map.Entry<String, String[]> mapEntry : paramMap.entrySet()) {
            for (String value : mapEntry.getValue()) {
                parameterString += (parameterString.isEmpty() ? "?" : "&") + mapEntry.getKey() + "=" + URLEncoder.encode(value, "UTF-8");
            }
        }
        return parameterString;
    }
}


