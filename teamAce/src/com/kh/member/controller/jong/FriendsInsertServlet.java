package com.kh.member.controller.jong;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;

/**
 * Servlet implementation class FriendsInsertServlet
 */
/**
 * 친구 추가 수락을 눌렀을 때 발생하는 서블릿입니다.
 * @author 차종환
 *
 */
@WebServlet("/friendsInsert.me")
public class FriendsInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FriendsInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String recvId = request.getParameter("mRecvId");
		String requestId = request.getParameter("mId");
		
				
		int result = new MemberService().friendInsert(recvId, requestId);
		
		response.setContentType("text/html; charset=UTF-8");
		if (result > 0) {
			new MemberService().alramInsert(Integer.parseInt(requestId), Integer.parseInt(recvId), "님과 이제부터 친구입니다!", "null");
			response.getWriter().print("complete");
		}
		else
			response.getWriter().print("fail");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
