package com.kh.message.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class MessengerCloseServlet
 */
@WebServlet("/messengerClose.me")
public class MessengerCloseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessengerCloseServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 만약 하나의 컴퓨터로 다른 계정을 로그인 할 경우 동일한 세션을 쓰면 안되기 때문에 이렇게 지정합니다.
		String mNo = request.getParameter("mNo");
		String userMno = "" + ((Member)request.getSession().getAttribute("user")).getmNo();
		ArrayList<String> list = (ArrayList<String>)request.getSession().getAttribute("msgList"+ userMno);
		
		list.remove(mNo);
		request.getSession().setAttribute("msgList" + userMno, list);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
