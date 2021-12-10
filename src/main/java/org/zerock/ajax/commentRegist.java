package org.zerock.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javaqua.DAO.ReplyDAO;
import com.javaqua.dto.ReplyVO;

@WebServlet("/commentRegist")
public class commentRegist extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public commentRegist() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");		
		
		ReplyDAO rdao = ReplyDAO.getInstance();
		
		String user_id = request.getParameter("user_id");
		int bd_num = Integer.parseInt(request.getParameter("bd_num"));
		String bd_category2 = request.getParameter("bd_category2");
		String comment = request.getParameter("comment");
		
		PrintWriter out = response.getWriter();
		
		ReplyVO rvo = new ReplyVO();
		
		rvo.setUser_id(user_id);
		rvo.setBd_num(bd_num);
		rvo.setBd_category2(bd_category2);
		rvo.setComment(comment);
		
		boolean insertComment = rdao.insertComment(rvo);
		rdao.plusBoardReply(rvo);
		
		if(insertComment) {
			out.print("OK");
		}else {
			out.print("NO");
		}
	}

}
