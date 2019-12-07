package com.kh.common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

// 기존 DefaultFileRenamePolicy 클래스와 동일한 구조로 작업하기 위해 implements해줘야함!!
public class MyFileRenamePolicy implements FileRenamePolicy {

	@Override
	public File rename(File originFile) {
		
		// 원본파일받아서 수정파일로 반환하는 메소드
		
		// 변경명 -> 파일 업로드된시간(년월일시분초)+0~100000 사이의 랜덤값(5자리랜덤값)
		
		// 원본명 aaa.png --> 변경명 2019092521330196523.png => fileUpload_thumbnail폴더로 들어감
		
		// 현재 시간을 long형으로 받음
		long currentTime = System.currentTimeMillis();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		
		// 5자리 랜덤 숫자 발생
		int ranNum = (int)(Math.random()*100000);
		
		// --확장자명 가져오기--
		// 원본 파일명
		String name = originFile.getName(); // --> "aaa.png"
		
		// 확장자만 추출해서 담아줄 변수
		String ext = "";
		
		// .의 위치값(파일명에 .이 있을수있으니 제일 마지막에 있는 .index)
		int dot = name.lastIndexOf("."); // 3
		// --> 실패시 -1값 담김
		
		if(dot != -1) { // 존재할 경우
			// .을 포함해서 확장자 추출 후 ext에 담기
			ext = name.substring(dot); // ".png" dot으로부터 마지막까지 담아주기
		}
		
		// 최종적으로 수정할 파일명 (import시  java.utill )
		String fileName = sdf.format(new Date(currentTime)) + ranNum + ext; 
											// 20190101123012 + 96523 + .png
		
		// 원본 파일을 변경된 파일명으로 생성해서 반환 (원본파일은 유지한채 파일명만 변경!)
		File newFile = new File(originFile.getParent(), fileName);	
		
		return newFile;
	}

}
