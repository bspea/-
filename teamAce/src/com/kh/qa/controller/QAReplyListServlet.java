package com.kh.qa.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.qa.model.service.QAService;
import com.kh.qa.model.vo.QAReply;

/**
 * Servlet implementation class QAReplyListServlet
 */
@WebServlet("/qarlist.qabo")
public class QAReplyListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QAReplyListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		int qaNo=Integer.parseInt(request.getParameter("qaNo"));
		
		ArrayList<QAReply> list = new QAService().selectQARlist(qaNo);
		
//		Gson gson= new Gson();
		
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy년 MM월 dd일").create();
		
		gson.toJson(list, response.getWriter());
		
		System.out.println("여기 리스트는 뭇ㄴ반혼?:"+list);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
