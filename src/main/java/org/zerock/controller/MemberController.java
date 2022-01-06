package org.zerock.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.zerock.domain.AuthVO;
import org.zerock.domain.MemberVO;
import org.zerock.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping( value = "/member/", produces = "application/text; charset=UTF-8")
public class MemberController {
	
	@Autowired
	private MemberService service;

	@GetMapping("/joinForm")
	public String JoinForm() {
		
		log.info("joinForm.......");

		return "/join.jsp";
	}
	
	@PostMapping("/join")
	public String join(MemberVO member) {
		
		log.info("memberRegister: " + member);
		
		AuthVO avo = new AuthVO();
		avo.setUser_id(member.getUser_id());
		avo.setAuth("ROLE_MEMBER");

		
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		member.setUser_pw(passwordEncoder.encode(member.getUser_pw()));
		service.register(member,avo);
				
		return "redirect:/member/login";
	}
	
	@GetMapping("/login")
	public String LoginForm(HttpSession session, HttpServletResponse response, HttpServletRequest request) throws IOException {
		String referer = request.getHeader("Referer");
		PrintWriter out = response.getWriter();
		System.out.println("loginForm: "+referer);
		String referrer = request.getHeader("Referer");
		log.info("/loginForm");
		if(referer == null) {
			referer = "http://localhost:8090/";
		}
		if(!referer.contains("/member/login")) {
			
		    request.getSession().setAttribute("prevPage", referrer);
		}

	   

		return "/login.jsp";
	}
	
	
	@PostMapping("/login")
	public String Login(MemberVO member,Model model, String save, HttpSession session, HttpServletResponse response, HttpServletRequest request) throws IOException {
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		session = request.getSession();
		
		System.out.println("---------------------asd");
//		PrintWriter out = response.getWriter();
//		String id = member.getUser_id();
//		
//		String referer = request.getHeader("Referer");
//		System.out.println(save);
//		
//		if(save == null || save.equals("null")){
//			Cookie scookie = new Cookie("save", null);
//			scookie.setMaxAge(0);
//			response.addCookie(scookie);
//		}
//		else {
//			Cookie scookie = new Cookie("save", id);
//			scookie.setMaxAge(60*60*24*7);
//			response.addCookie(scookie);			
//		}		
//		member = service.get(member);
//		
//		if(member != null ) {			
//			session.setAttribute("id",id);
//			session.setAttribute("name",member.getName());
//				session.setAttribute("admin",member.getAdmin());
//
//			System.out.println("login: "+referer);
//			out.print("<script>history.go(-1);</script>");
//			out.flush();
//			out.close();
//		}else {
//			
//			out.print("<script>alert('로그인 정보가 일치하지 않습니다.');location.href = document.referrer;</script>");
//			out.flush();
//			out.close();
//
//		}
		System.out.println("---------------");
		
		return "/login.jsp";
	}
	
	
	@GetMapping("/logout")
	public void logout(HttpSession session,HttpServletRequest request, HttpServletResponse response) throws IOException {
		log.info("logout..." );
		
		PrintWriter out = response.getWriter();
		System.out.println(session.getAttribute("name"));
		session = request.getSession();
		session.invalidate();
		out.print("<script>location.href = document.referrer;</script>");
		out.flush();
		out.close();

	}
	
	@ResponseBody
	@PostMapping("/idCheck")

	public String idCheck(String id) {
				
		boolean result = service.getId(id);
		
		log.info("idCheck....."+result);
		
		if(result) {
			return "not-useable";
		}else {
			return "useable";
		}
	}
	
	@ResponseBody
	@PostMapping("/emailCheck")
	public String emailCheck(String email,String user_id) {
		
		int result;
		if(user_id != null) {
			result = service.getEmail(email, user_id);
		}else {		
			result = service.getEmail(email);
		}
		log.info("emailCheck....."+result);
		
		if(result > 0) {
			return "not-useable";
		}else {
			return "useable";
		}
	}
	
	@ResponseBody
	@PostMapping("/selectMember")
	public MemberVO selectMember(String user_id) {	
		log.info("selectMember....");
		//MemberVO mvo = new MemberVO();
		//mvo = service.selectMember(user_id);
		MemberVO mvo = service.selectMember(user_id);	
		log.info(mvo);
		return mvo;
	}
	
	@GetMapping("/updateMemberForm")
	public String updateForm(Model model, String user_id) {
		log.info("updateMemberForm....");
		MemberVO mvo = new MemberVO();
		mvo = service.selectMember(user_id);
		log.info(mvo);
		model.addAttribute("mvo",mvo);
		return "/member_update.jsp";
	}
	
	@PostMapping("/updateMember")
	public String updateForm(MemberVO mvo) {
		
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		mvo.setUser_pw(passwordEncoder.encode(mvo.getUser_pw()));
		
		service.updateMember(mvo);
		return "redirect:/";
	}
	
	@GetMapping("/passwordCheckForm")
	public String passwordCheckForm() {
		
		return "/password_check.jsp";
	}
	@PostMapping("/passwordCheck")
	public String passwordCheck(MemberVO mvo, HttpServletResponse response, Model model) throws IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String user_pw = mvo.getUser_pw();
		mvo = service.passwordCheck(mvo);
		String encodedPw = mvo.getUser_pw();
		log.info(mvo);
		
		
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		
		if(passwordEncoder.matches(user_pw, encodedPw)) {
			model.addAttribute("mvo",mvo);
			return "/member_update.jsp";
		}else {
			model.addAttribute("errorMsg","비밀번호가 일치하지 않습니다.");
			return "/password_check.jsp";
		}
		

		
		
		
		
	}
}
