package com.lsh.Shop.bbs;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lsh.Shop.db.BbsDAO;
import com.lsh.Shop.user.User;

/**
 * Servlet implementation class BbsSer
 */
@WebServlet("/q&a")
public class BbsSer extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/bbs/bbs.jsp");
//		HttpSession hs = request.getSession();
//		User loginUser = (User)hs.getAttribute("loginUser");
//		if(loginUser==null) {
//			response.sendRedirect("/loginpage");
//			return;
//		}
		request.setAttribute("list", BbsDAO.getList());
		  
			
		
		
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
