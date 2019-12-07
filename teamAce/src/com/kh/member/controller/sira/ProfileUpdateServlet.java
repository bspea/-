package com.kh.member.controller.sira;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.common.MyFileRenamePolicy;
import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class ProfileUpdateServlet
 */
@WebServlet("/fileProfile.me")
public class ProfileUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
request.setCharacterEncoding("utf-8");
		
		String formData = request.getParameter("formData");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize=10*1024*1024;
			
			// 절대경로 추출(resources)
			String root = request.getSession().getServletContext().getRealPath("/resources"); // c부터시작하기떄문에..X 
			
			// 다시 경로 만들어줌
			String dbRoot = request.getContextPath(); // /teamace
			
			dbRoot = dbRoot+"/resources/fileUploadProfile_thumbnail/"; // dbRoot = /teamace + /resources/fileupload_thumbnail/
			
			
			// 파일이 실제로 저장될 경로
			String savePath = root + "/fileUploadProfile_thumbnail/";
			
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			ArrayList<String> originFiles = new ArrayList<>();
			ArrayList<String> changeFiles = new ArrayList<>();
			
			Enumeration<String> files = multiRequest.getFileNames(); // 파일이름 가지고옴
			
			String str ="";
			
			while(files.hasMoreElements()) {
				
				String name = files.nextElement();
				
				if(multiRequest.getFilesystemName(name) != null) {
					
					String originName = multiRequest.getOriginalFileName(name); // --> getParameter같은 느낌 name값으로 값 가져오기
					
					String changeName = multiRequest.getFilesystemName(name);
					
					dbRoot = dbRoot+changeName;
					
					originFiles.add(originName);
					changeFiles.add(changeName);
				}
			}
			
			
			
			// 회원번호, 배경이미지
			HttpSession session = request.getSession();
			Member loginUser = (Member)session.getAttribute("user");
			
			int mNo = loginUser.getmNo();
			
			Member mb = new Member();
			mb.setProfileImage(dbRoot);
			
			int result = new MemberService().profileImageUpdate(mNo, mb);
			response.setContentType("text/html; charset=UTF-8"); 
		
			if(result > 0) {
				response.getWriter().print(dbRoot);
				loginUser.setProfileImage(dbRoot);
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
