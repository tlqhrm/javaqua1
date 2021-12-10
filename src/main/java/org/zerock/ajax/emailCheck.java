package org.zerock.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javaqua.DAO.MemberDAO;

@WebServlet("/emailCheck")
public class emailCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public emailCheck() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/htm; charset=utf-8");		
		
		MemberDAO mDao = MemberDAO.getInstance();
		String email = request.getParameter("email");
		PrintWriter out = response.getWriter();
		
		System.out.println(email);
		
		boolean checkEmail = mDao.emailCheck(email);
		
		System.out.println(checkEmail);
		
		if(checkEmail) {
			out.print("not-useable");
		}else {
			out.print("useable");
		}
	}

}
