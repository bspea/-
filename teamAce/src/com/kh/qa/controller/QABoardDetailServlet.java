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
 * Servlet implementation class QABoardDetailServlet
 */
@WebServlet("/detail.qabo")
public class QABoardDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QABoardDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		System.out.println("되는지 안되는지 테스트하는중");
		
		int qano = Integer.parseInt(request.getParameter("qaNo"));
		System.out.println("====================== 아래 표시");
		System.out.println(qano);
		
		QABoard qa = new QAService().selectQABoard(qano);
		
		if(qa!=null) {
			request.setAttribute("qa", qa);
			request.getRequestDispatcher("views/chul/comment.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "공지사항 조회에 실패했읍니다");
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
