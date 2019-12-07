package com.kh.member.controller.sira;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class joinCodeServlet
 */
@WebServlet("/joinCode.me")
public class JoinCodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinCodeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("lH_HP_Email");
		String codeNo = request.getParameter("hJoin_codeInput");

		
//		핸드폰번호 / 이메일
		String phone = null;
		String email = null;
		
		
		if(id.indexOf("@") != -1) {
			email = id;
		}else {
			phone = id;
		}
		
		
		ArrayList<Member> list = new MemberService().loginCodeSelect(email, phone, codeNo);
		
		
			if(!list.isEmpty()) {
				/*request.setAttribute("msg", "회원가입에 성공했습니다.");*/
				response.sendRedirect("test.me"); // 뉴스피드페이지경로
			}else {
				/*request.setAttribute("msg", "회원가입에 실패했습니다.");*/
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
