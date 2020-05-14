package com.lsh.Shop;

import java.io.File;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import com.lsh.Shop.bbs.BbsVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class Util {
	public static BbsVO uploadFile(HttpServletRequest request, String filePath) {
		BbsVO vo =new BbsVO(); 
		String fileNm = null;
		
		
		String path = request.getSession().getServletContext().getRealPath("upBbsImg/" + filePath);
		int size = 1024 * 1024 * 10;
		

		File file = new File(path);		
		if(!file.exists()) {
			System.out.println("폴더생성");			
			
			file.mkdirs();
		}
		
		try {
			MultipartRequest mr = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());
						
			Enumeration files = mr.getFileNames();
			String str = (String)files.nextElement();			
			fileNm = mr.getFilesystemName(str);
			System.out.println("fileNm: " + fileNm);
			
			String title = mr.getParameter("title");
			String content = mr.getParameter("content");
			String pw = mr.getParameter("pw");
			String email = mr.getParameter("email");
			vo.setTitle(title);
			vo.setContent(content);
			vo.setPw(pw);
			vo.setEmail(email);
			vo.setImg(fileNm);
			int pk = Integer.parseInt(filePath);
			vo.setUser_pk(pk);
		
			
		
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return vo;
	}
}
