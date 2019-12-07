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
import com.kh.board.model.vo.BoardReply;
import com.kh.board.model.vo.BoardReplyImage;
import com.kh.common.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class ReplyInsertServlet
 */
@WebServlet("/rinsert.new")
public class ReplyInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReplyInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
				request.setCharacterEncoding("utf-8");
		
				// 폼 전송을 multipart/form-data로 전송하기 때문에 
				
				// enctype이 multipart/form-data로 전송되었는지 확인!!
				if(ServletFileUpload.isMultipartContent(request)) {
					
					int maxSize=10*1024*1024;
					
					// 1_2. WebContent/resources 절대경로 추출  
					String root = request.getSession().getServletContext().getRealPath("/resources");
					
					// 1_3. 파일이 실제로 저장될 경로 (root/fileUpload_thumbnail/)
					//String savePath = "teamace/resorces/image/hye/";
					String savePath = root + "/image/hye/";
					
					//System.out.println(savePath);
					
					// 2_1. HttpServletRequest -> MultipartRequest 변경
					MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
					// getFileName() - 폼에서 전송된 파일 리스트들의 name값들을 반환
					Enumeration<String> files = multiRequest.getFileNames(); // 전송 순서 역순으로 쌓임(thumbnailImg4,3,2,1 순서로)
					String name = files.nextElement();
					String changeName = multiRequest.getFilesystemName(name);
				
					
					// 3_1. Board 테이블에 insert할 내용 뽑아서 Board객체 생성
					String content1 = multiRequest.getParameter("replyContent");
					int bNo1 = Integer.parseInt(multiRequest.getParameter("bNo"));
					int mNo1 = Integer.parseInt(multiRequest.getParameter("mNo"));
					// 세션객체 알아내서 로그인된 객체 알아와서 회원번호를 String으로 형변환하여 저장!
					
					BoardReply r = new BoardReply();
					r.setrComment(content1);
					r.setbNo(bNo1);
					r.setmNo(mNo1);
						
						BoardReplyImage bi = new BoardReplyImage(); // 첨부파일하나당 boardReplyImage하나
						bi.setImgPath("/resources/image/hye/" + changeName);	
						
						System.out.println("서블릿" + bi);
						
						int result = new BoardService().insertReply(r,bi); // 서비스에서 나눠지기때문에 이미지 객체 저장하려면 넘겨줘야함
						
						if(result > 0) {
							System.out.println("서블릿" +bi);
							
							response.getWriter().print("success");

						}else {
							
							response.getWriter().print("fail");
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
