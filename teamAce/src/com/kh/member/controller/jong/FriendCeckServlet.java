package com.kh.member.controller.jong;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;

/**
 * Servlet implementation class FriendCeckServlet
 */
@WebServlet("/friendCheck.me")
public class FriendCeckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FriendCeckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int recvId = Integer.parseInt(request.getParameter("recvId"));
		int sendId = Integer.parseInt(request.getParameter("sendId"));
		
		System.out.println("아니 되면 된다고 얘기해줘 : " + recvId);
		System.out.println("아니 되면 된다고 얘기해줘 : " + sendId);
		
		
		int result = new MemberService().friendCheck(recvId, sendId);
		
		response.setContentType("text/html; charset=UTF-8");
		if (result > 0) {
			response.getWriter().print("complete");
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
