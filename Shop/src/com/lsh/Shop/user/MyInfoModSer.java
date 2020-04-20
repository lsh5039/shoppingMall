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

@WebServlet("/myinfo/mod/page")
public class MyInfoModSer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		User user = new User();
		user = UserDAO.getOne(id);
		request.setAttribute("user", user);
		RequestDispatcher rd =request.getRequestDispatcher("/WEB-INF/jsp/userInfo/myInfoMod.jsp");
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 User user = new User();
		 user.setId(request.getParameter("id"));
		 user.setPassword(request.getParameter("password"));
		 user.setName(request.getParameter("name"));
		 user.setAddress(request.getParameter("address"));
		 user.setNumber(request.getParameter("number"));
		 int result = UserDAO.update(user);
		 response.setCharacterEncoding("UTF-8");
		 response.setContentType("text/html; charset=UTF-8");
		 PrintWriter writer = response.getWriter();
		 writer.println("<script>");
		 if(result == 1) {//정보변경 성공
			 writer.println("alert('정보변경에 성공했습니다 다시로그인 해주세요')");
			 writer.println("location.href='/logoutpage'");
		 }else {//db오류
			 writer.println("alert('정보변경에 실패했습니다.')");
			 writer.println("history.back();");
		 }
		 writer.println("</script>");
		 writer.close();
	}

}
