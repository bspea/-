package com.kh.member.controller.sira;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class PwdFindServlet
 */
@WebServlet("/pwdFind.me")
public class PwdFindServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PwdFindServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("find_HPEmail");
		String code = request.getParameter("find_CodeInput");
		
//		핸드폰번호 / 이메일
		String phone = null;
		String email = null;
		
		
		if(id.indexOf("@") != -1) {
			email = id;
		}else {
			phone = id;
		}
		
		
		ArrayList<Member> list = new MemberService().loginCodeSelect(email, phone, code);

		
		if(!list.isEmpty()) {
			request.setAttribute("id", id);
			request.getRequestDispatcher("views/sira/ace3_NewPwdSet.jsp").forward(request, response);
		}else {
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request,response); // 에러페이지
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
