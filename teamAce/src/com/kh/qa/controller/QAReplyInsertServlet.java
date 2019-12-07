package com.kh.qa.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.qa.model.service.QAService;
import com.kh.qa.model.vo.QAReply;

/**
 * Servlet implementation class QAReplyInsertServlet
 */
@WebServlet("/qarinsert.qabo")
public class QAReplyInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QAReplyInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String rcomment = request.getParameter("rcomment");
		int qaNo = Integer.parseInt(request.getParameter("qaNo"));
		int mno = Integer.parseInt(request.getParameter("mno"));
		System.out.println("나의 엠엔오 : " + mno);
		
		QAReply qa = new QAReply();
		
		qa.setrComment(rcomment);
		qa.setQaNo(qaNo);
		qa.setmNo(mno);
		
		int result = new QAService().insertQAReply(qa);
		
		System.out.println(rcomment);
		if(result >0) {
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().print("success");
		}else {
			
			response.getWriter().print("fail@");
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
