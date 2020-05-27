package com.lsh.Shop.product;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lsh.Shop.db.ProductDAO;
import com.lsh.Shop.user.User;


@WebServlet("/cart/page")
public class CartSer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession hs = request.getSession();
		User loginUser = (User)hs.getAttribute("loginUser");
		if(loginUser == null) {
			response.sendRedirect("/index");
			return;
		}
	
		
		//장바구니에 뭐가있는지 보러갈때
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/productInfo/cart.jsp");
		User user = new User();
		user.setPk(loginUser.getPk());
		request.setAttribute("list", ProductDAO.getCartList(user));
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession hs = request.getSession();
		User loginUser = (User)hs.getAttribute("loginUser");
		if(loginUser == null) {
			
			
			response.sendRedirect("/index");
			return;
		}
		
		String p_num = request.getParameter("p_num");
		if(p_num!=null) {//상품을 장바구니에 넣을때
			ProductVO vo = new ProductVO();
			vo.setP_num(Integer.parseInt(p_num));
			vo.setUser_pk(loginUser.getPk());
			int result = ProductDAO.doCart(vo);
			
			if(result != 1) {
				System.out.println("실패");
			}
			//response.sendRedirect("/index");
			return;
		}
		
	}

}
