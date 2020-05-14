package com.lsh.Shop.bbs;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lsh.Shop.Util;
import com.lsh.Shop.db.BbsDAO;
import com.lsh.Shop.user.User;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sun.org.apache.bcel.internal.generic.MULTIANEWARRAY;

/**
 * Servlet implementation class WriteSer
 */
@WebServlet("/write/page")
public class WriteSer extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession hs = request.getSession();
		User loginUser = (User)hs.getAttribute("loginUser");
		String bbs_pk = request.getParameter("bbs_pk");
		
		if(bbs_pk != null) {
			System.out.println("�Խù�no:"+bbs_pk);
			BbsVO param = new BbsVO();
			param.setBbs_pk(Integer.parseInt(bbs_pk));
			BbsVO vo = BbsDAO.getOne(param);

			request.setAttribute("one",vo);
			
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/bbs/write.jsp");
			
			rd.forward(request, response);
			
			return;
		}
		String pk = request.getParameter("pk");
		
		if(pk != null) {//글쓰기
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/bbs/write.jsp");
			rd.forward(request, response);
			return;
		}
		
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession hs = request.getSession();
		User loginUser = (User)hs.getAttribute("loginUser");
		if(loginUser==null) {
			response.sendRedirect("/loginpage");
			return;
		}
		
		
		
		
		
		String path = Integer.toString(loginUser.getPk());
		BbsVO vo =new BbsVO();
		vo = Util.uploadFile(request, path);
		int result = BbsDAO.doWrite(vo);
		

		if(result != 1) {
			RequestDispatcher rd = request.getRequestDispatcher("/q&a");
			request.setAttribute("msg", "글 쓰기에 실패했습니다.");
			rd.forward(request, response);	
			return;
		}else {
			response.sendRedirect("/q&a");
		}
		
		
	}

}
