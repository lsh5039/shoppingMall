package com.lsh.Shop.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lsh.Shop.db.UserDAO;
import com.sun.org.apache.xml.internal.serialize.Printer;


@WebServlet("/mod")
public class UserModSer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");//
		User user = new User();
		user = UserDAO.getOne(id);
		request.setAttribute("user", user);
		RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/jsp/userInfo/userInfoMod.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String id = request.getParameter("id");
		String grade = request.getParameter("grade");
		int intGrade = Integer.parseInt(grade);
		User user = new User();
		user.setId(id);
		user.setGrade(intGrade);
		int result = 0;
		result = UserDAO.update(user);
		if(result==1) {
			PrintWriter writer = response.getWriter();
			writer.println("<script>");
			writer.println("alert('변경에 성공했습니다.')");
			writer.println("location.href='/usergrade'");
			writer.println("</script>");
			writer.close();
		}else {
			PrintWriter writer = response.getWriter();
			writer.println("<script>");
			writer.println("alert('변경에 실패했습니다.')");
			writer.println("history.back();");
			writer.println("</script>");
			writer.close();
		}
		response.sendRedirect("managementPage");
		
		
		
	}

}
