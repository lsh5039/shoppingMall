package com.lsh.Shop;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lsh.Shop.db.ProductDAO;
import com.lsh.Shop.product.Product;


@WebServlet("/index")
public class IndexSer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd =request.getRequestDispatcher("/WEB-INF/jsp/main.jsp");
		String chItem = request.getParameter("chItem");
		String find = request.getParameter("find");
		request.setAttribute("find", find);
		
		Product pd = new Product();
		pd.setFind(find);
		if(chItem == null) {//전체상품보기 or 처음 페이지에 진입할때
			request.setAttribute("list", ProductDAO.getList(pd));
			rd.forward(request, response);
			return;
		}
		
		switch(chItem) {

			case "event":
				pd.setP_event(1);
				
				
				request.setAttribute("list", ProductDAO.getList(pd));
				break;
			case "new":
				pd.setP_new(1);
				request.setAttribute("list", ProductDAO.getList(pd));
				break;
			case "dis":
				pd.setP_discount(1);
				request.setAttribute("list", ProductDAO.getList(pd));
				break;
			case "all": 
				request.setAttribute("list", ProductDAO.getList());
				System.out.println("default");
				break;
		}
		
		request.setAttribute("ch", chItem);
		
		
		
		rd.forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
