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
		if(user.getId()!=null) {
			request.setAttribute("msg", "아이디가 중복되었습니다.");
			request.setAttribute("id", id);
			RequestDispatcher rd = request.getRequestDispatcher("JoinSer");
			rd.forward(request, response);
		}else {//중복x
			request.setAttribute("msg", "사용 가능한 아이디입니다.");
			request.setAttribute("id", id);
			RequestDispatcher rd = request.getRequestDispatcher("JoinSer");
			rd.forward(request, response);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
