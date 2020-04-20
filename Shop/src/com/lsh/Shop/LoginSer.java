package com.lsh.Shop;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lsh.Shop.db.UserDAO;
import com.lsh.Shop.user.User;


@WebServlet("/loginpage")
public class LoginSer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/userInfo/login.jsp");
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		User user = new User();
		user.setId(id);
		user.setPassword(password);
		int result = UserDAO.login(user);
//		0 DB오류
//		1 로그인성공
//		-2비밀번호불일치
//		-1아이디 불일치
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		writer.println("<script>");
		if(result==1) {
			user = UserDAO.getOne(id);
			writer.println("alert('환영합니다 고객님')");
			HttpSession session =request.getSession();
			session.setAttribute("loginUser", user);
			writer.println("location.href='/main'");
		}else if(result==-1) {
			writer.println("alert('아이디가 일치하지 않습니다.')");
			writer.println("history.back();");
		}else if(result==-2) {
			writer.println("alert('비밀번호가 일치하지 않습니다.')");
			writer.println("history.back();");
		}else {
			writer.println("alert('알수없는 오류가 발생했습니다.')");
			writer.println("hitory.back();");
		}
		
		writer.println("</script>");
		writer.close();
	}

}
