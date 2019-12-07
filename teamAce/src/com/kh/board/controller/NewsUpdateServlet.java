package com.kh.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Board;
import com.kh.board.model.vo.BoardImage;
import com.kh.common.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;


/**
 * Servlet implementation class NewsUpdateServlet
 */
@WebServlet("/update.news")
public class NewsUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewsUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");

	
		if(ServletFileUpload.isMultipartContent(request)) {
			System.out.println("여기처음");
		
			int maxSize=10*1024*1024;
			
			String root = request.getSession().getServletContext().getRealPath("/resources");
		
			String savePath = root + "/image/hye/";
			
			// 2_1. HttpServletRequest -> MultipartRequest 변경
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			// 2_2. DB에 저장하기 위해  리스트들 만들기!!
			ArrayList<String> imgPath = new ArrayList<>(); // 경로만 담길 list
			
			// getFileName() - 폼에서 전송된 파일 리스트들의 name값들을 반환
			Enumeration<String> files = multiRequest.getFileNames(); // 전송 순서 역순으로 쌓임(thumbnailImg4,3,2,1 순서로)
			
			  while(files.hasMoreElements()) { // files에 다음꺼 있을경우
                  String name = files.nextElement();
                  
                  // 파일이 존재할 경우(저장된 파일명이 있을경우)
                  if(multiRequest.getFilesystemName(name) != null) {
                     
                     // getFilesystemName() - rename된 파일명(즉, 서버에 업로드된 파일명)
                     String changeName = multiRequest.getFilesystemName(name);
                     
                     System.out.println(changeName);
                     imgPath.add(changeName);
            
                  }
          }
			 System.out.println(imgPath.size());
			
			String content = multiRequest.getParameter("content");
			int bNo = Integer.parseInt(multiRequest.getParameter("bNo"));

	
		
			Board b = new Board();
			b.setbContent(content);
			b.setbNo(bNo);

			System.out.println("서블릿ffff" + b);
			

	
			// 3_2. BoardImage 테이블에서 upset할 Attachment객체 생성해서 ArrayList에 담기
			ArrayList<BoardImage> list = new ArrayList<>();
			
	
			int result = new BoardService().updateNewsfeed(b);
			
			
			if(result > 0) {
				System.out.println("사진수정" + list);
				response.sendRedirect("test.me");
				//response.sendRedirect("/loginForm.jsp");
				
			}else {
				// DB에 값 기록하는게 실패했을 경우
				// 서버에 업로드된 파일 삭제
				
				for(int i=0; i<imgPath.size(); i++) {
					
					File failedFile = new File ("/resources/image/hye/" + imgPath.get(i));
					failedFile.delete();
					
				
				}
				// 사진 게시판 등록 실패
				// request.setAttribute("msg", "사진 게시판 등록 실패!!");
				// request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
				System.out.println("사진 수정 실패!!!!!!!!!!!!!!11");
				
			}
			
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
