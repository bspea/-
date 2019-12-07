package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * 차종환 2019-10-05
 */
@WebServlet("/login.me")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("hJEmail");
		String password = request.getParameter("hJPwd");
		
		Member instance = null;
		// 아이디에 @가 들어있는지 아닌지를 확인하여 
		if (id.indexOf("@") == -1) {
			// 아이디가 이메일 형식이 아닐 경우 (핸드폰 번호를 입력했을 경우)
			instance = new MemberService().loginMember(id, password, "phone");
		} else {
			// 아이디가 이메일 형식일 경우
			instance = new MemberService().loginMember(id, password, "email");
		}
		
		// 로그인 처리
		if (instance != null) {
			// 로그인에 성공했을 경우
			request.getSession().setAttribute("user", instance);		
			response.sendRedirect("test.me");
		} else {
			// 로그인에 실패했을 경우
			request.getRequestDispatcher("loginForm.me").forward(request, response);
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
