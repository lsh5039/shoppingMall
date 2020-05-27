package com.lsh.Shop;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lsh.Shop.ajax.Ajax;
import com.lsh.Shop.db.BbsDAO;
import com.lsh.Shop.db.ProductDAO;
import com.lsh.Shop.product.ProductVO;


@WebServlet("/index")
public class IndexSer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd =request.getRequestDispatcher("/WEB-INF/jsp/main.jsp");
		
		String find = request.getParameter("find");
		
		if(find != null) {//검색시
			ProductVO pd = new ProductVO();
			pd.setFind(find);
			request.setAttribute("list", ProductDAO.getList(pd));
			
		}else if(find==null) {
			request.setAttribute("list", ProductDAO.getList());
		}
		
		
		
		rd.forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//특정 단어 검색으로 들옴
		String find = request.getParameter("find");
		System.out.println("post의 find : "+find);
		
		response.setContentType("text/html;charset=UTF-8");
		ProductVO vo = new ProductVO();
		vo.setFind(find);
		System.out.println("vo.getFind : "+vo.getFind());
		response.getWriter().write(Ajax.getJson(vo));
	}

}
