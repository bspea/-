package com.kh.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Board;
import com.kh.board.model.vo.BoardImage;
import com.kh.board.model.vo.BoardLike;

/**
 * Servlet implementation class BoardDetailServlet
 */
@WebServlet("/detail.news")
public class BoardDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		int bno = Integer.parseInt(request.getParameter("bNo"));

		int imgNo = Integer.parseInt(request.getParameter("imgNo"));
		
		// 한개의 글정보 가져오기
		Board b = new BoardService().selectOneNewsfeed(bno);
		
		// 한개의 게시판에 있는 사진들 리스트 조회
		ArrayList<BoardImage> polist = new BoardService().selectOnePhotoList(bno);
		
		// 좋아요 누른 리스트 조회
		ArrayList<BoardLike> likeList = new BoardService().selectOneLikeList(bno);
		
		// 좋아요카운트수
		//int llist = new BoardService().selectCountLikeList(bno);
		
		request.setAttribute("imgNo", imgNo);
		request.setAttribute("polist", polist);
		request.setAttribute("b", b);
		request.setAttribute("likeList", likeList);
		
		// 사진 상세보기창 jsp로 보내주기
		request.getRequestDispatcher("views/hye/photoDetailView.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
