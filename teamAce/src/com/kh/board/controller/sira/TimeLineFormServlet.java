package com.kh.board.controller.sira;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.board.model.service.BoardService;
import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class TimeLineFormServlet
 */
@WebServlet("/timeLines.bo")
public class TimeLineFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TimeLineFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 타임라인 페이지 서블릿
		
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("user");
		
		int mNo = loginUser.getmNo(); // 로그인한 회원번호를 mNo에
		
		if(request.getParameter("mNo") != null) { // 들어온 값이 있으면 친구 타임라인 조회
			mNo = Integer.parseInt(request.getParameter("mNo"));
		}
		
		
		
		
		
		ArrayList<Member> list  = new BoardService().friendsAll(mNo);
		
		// 그 회원번호로 멤버에대한 전체조회 해올거임
		Member member = new MemberService().memberAll(mNo);
		
		
		request.getSession().setAttribute("friendsList", list);
		request.getSession().setAttribute("member", member);
		request.getRequestDispatcher("views/sira/ace4_MyTimeLine.jsp").forward(request, response);
		
		
		/*request.getRequestDispatcher("views/sira/ace4_MyTimeLine.jsp").forward(request, response);*/
		
//		HttpSession session = request.getSession();
//		Member loginUser = (Member)session.getAttribute("user");
//		
//		// 이메일 / 핸드폰번호
//		String phone = null;
//		String email = null;
//		email = loginUser.getEmail();
//		phone = loginUser.getEmail();
//		
//		
//		ArrayList<Friends> list = new BoardService().friendmNoRecv(email, phone);
//		
//		System.out.println(list);
//	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
