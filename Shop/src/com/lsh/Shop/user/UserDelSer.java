package com.lsh.Shop.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lsh.Shop.db.UserDAO;

/**
 * Servlet implementation class UserDelSer
 */
@WebServlet("/del")
public class UserDelSer extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		int result = UserDAO.del(id);
		if(result == -1) {
			PrintWriter writer = response.getWriter();
			writer.println("<script>");
			writer.println("alert('회원삭제에 실패했습니다.')");
			writer.println("</script>");
		}
		
		response.sendRedirect("managementPage");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
