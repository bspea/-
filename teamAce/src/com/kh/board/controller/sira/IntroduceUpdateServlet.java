package com.kh.board.controller.sira;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.board.model.service.BoardService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class IntroduceUpdateServlet
 */
@WebServlet("/textUpdate.bo")
public class IntroduceUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IntroduceUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 소개글 업데이트 서블릿
		String content = request.getParameter("tContent");
		int loginUNum = Integer.parseInt(request.getParameter("loginUNum"));
		
		System.out.println("tContent: " + content);
		System.out.println("loginUNum: " + loginUNum);
		
		Member m = new Member();
		m.setIntroduceText(content);
		m.setmNo(loginUNum);
		HttpSession session = request.getSession();
		int result = new BoardService().introduceUpdate(m);
		response.setContentType("text/html; charset=UTF-8"); 
		if(result > 0) {
			response.getWriter().print("success");
			Member loginUser=(Member)session.getAttribute("user");
			loginUser.setIntroduceText(content);
		}else {
			response.getWriter().print("fail");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
