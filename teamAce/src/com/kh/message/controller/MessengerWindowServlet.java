package com.kh.message.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

/**
 * Servlet implementation class MessengerWindowServlet
 */
@WebServlet("/meseengerWindow.me")
public class MessengerWindowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessengerWindowServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 만약 하나의 컴퓨터로 다른 계정을 로그인 할 경우 동일한 세션을 쓰면 안되기 때문에 이렇게 지정합니다.
		String mNo = request.getParameter("mNo");
		String userMno = request.getParameter("userMNo");
		ArrayList<String> list = (ArrayList<String>)request.getSession().getAttribute("msgList"+ userMno);
		
		if (list == null)
			list = new ArrayList<String>();
		
		int result = 0;
		for (int i = 0; i < list.size(); ++i) {
			if (list.get(i).equals(mNo)) {
				// 이미 메세지 창이 열려있을 경우
				result = 1;
				break;
			}
		}
		
		
		// 이미 메세지창이 열려있을 경우 
		if (result == 1) {
			// ------------------- 내보내기
			// 세션은 창을 새로고침 해야 변경된 것이 적용됩니다. 따라서 세션을 Static처럼 사용하고, 실 데이터는 Gson으로 보내줍니다.
			response.setContentType("application/json; charset=UTF-8");
			Gson gson = new Gson();
			gson.toJson(list, response.getWriter());
		} else {
			// 메세지창이 열려있지 않을 경우
			response.setContentType("application/json; charset=UTF-8");
			Gson gson = new Gson();
			gson.toJson(list, response.getWriter());
			
			// 처음에는 먼저 보낸 뒤, 그 다음 데이터를 생성해줍니다.
			list.add(mNo);
			request.getSession().setAttribute("msgList" + userMno, list);
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
