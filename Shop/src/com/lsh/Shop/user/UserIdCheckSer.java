package com.lsh.Shop.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lsh.Shop.db.UserDAO;


@WebServlet("/checkID")
public class UserIdCheckSer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		
		User user = UserDAO.getOne(id);
		System.out.println(id);
		System.out.println(user.getId());
		if(user.getId()!=null) {
			request.setAttribute("msg", "사용 가능한 아이디입니다.");
			request.setAttribute("id", id);
			RequestDispatcher rd = request.getRequestDispatcher("joinpage");
			rd.forward(request, response);
		}else {//�ߺ�x
			request.setAttribute("msg", "중복된 아이디 입니다.");
			request.setAttribute("id", id);
			RequestDispatcher rd = request.getRequestDispatcher("joinpage");
			rd.forward(request, response);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
