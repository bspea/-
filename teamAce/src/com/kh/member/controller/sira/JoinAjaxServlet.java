package com.kh.member.controller.sira;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class ajaxJoinServlet
 */
@WebServlet("/ajaxJoin.me")
public class JoinAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinAjaxServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		회원가입 servlet
		
		request.setCharacterEncoding("UTF-8");
		
		String sung = request.getParameter("sung");
		String name = request.getParameter("name");
		String emailHP = request.getParameter("emailHP");
		String password = request.getParameter("pwd");
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		String gender = request.getParameter("gender");

//		핸드폰번호 / 이메일
		String phone = null;
		String email = null;
		
		if(emailHP.indexOf("@") != -1) {
			email = emailHP;
		}else {
			phone = emailHP;
		}
		
		
//		년도 + 월 + 일 결합 --> birth
		String mon = month;
		String dd = day;
		
		if (mon.length() == 1)
			month = "0" + month;
		
		if (dd.length() == 1)
			day = "0" + day;
		
		String birth = year.substring(2, 4) + month + day;
		
		
//		성 + 이름 결합 --> mName
		String mName = sung + name;
		
		// 이메일 혹은 핸드폰 URL 생성
		String random = ((int)(Math.random()*1000)) + ""; // double이라 뒤에 + ""붙여서 String으로들어갈수있게..
		

		
		
		
		Member member = new Member(mName, email, phone, password, birth, gender);
		
		int result = new MemberService().insertMember(member, random);
		
		
		PrintWriter out = response.getWriter();
		if(result > 0) {
			out.print("success");
		}else {
			out.print("fail");
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
