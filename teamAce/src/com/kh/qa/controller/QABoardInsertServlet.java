package com.kh.qa.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.qa.model.service.QAService;
import com.kh.qa.model.vo.QABoard;

/**
 * Servlet implementation class QABoardInsertServlet
 */
@WebServlet("/insert.qabo")
public class QABoardInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QABoardInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int mno = Integer.parseInt(request.getParameter("mno"));
		String qaTitle = request.getParameter("qaTitle");
		String qaContent = request.getParameter("qaContent");
		System.out.println(mno);
		System.out.println(qaTitle);
		System.out.println(qaContent);
		
		
		System.out.println("===============================================================mno번호 : "+mno);
		QABoard q = new QABoard();
		q.setmNo(mno);
		q.setQaTitle(qaTitle);
		q.setQaContent(qaContent);
		
		int result = new QAService().insertQABoard(q);
		
		if(result>0) {
			response.sendRedirect("list.qabo");
		}else {
			request.setAttribute("msg", "게시판 작성에 실피했습니다");
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
