package com.kh.qa.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.qa.model.service.QAService;

/**
 * Servlet implementation class QABoardDeleteServlet
 */
@WebServlet("/QAdelete.qabo")
public class QABoardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QABoardDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qaNo = Integer.parseInt(request.getParameter("qaNo"));
		int mNo = Integer.parseInt(request.getParameter("mNo"));
		System.out.println("qaNO:====================위에부분"+qaNo);
		System.out.println("mNo:====================위에부분"+mNo);
		
		int result = new QAService().QABoardelete(qaNo, mNo);
		
		if(result > 0) {
			response.sendRedirect("list.qabo");
		} else {
			request.setAttribute("msg", "게시글 실패ㅡㅡ.");
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
