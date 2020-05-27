package com.lsh.Shop.product;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lsh.Shop.db.ProductDAO;

/**
 * Servlet implementation class ProRegModSer
 */
@WebServlet("/proRegMod")
public class ProRegModSer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mod = request.getParameter("mod");
		String del = request.getParameter("del");
		if(mod!=null && del==null) {//수정삭제가 아닌경우 , 그냥 디테일정보
			int modInt = Integer.parseInt(mod);
			ProductVO pd = new ProductVO();
			pd.setP_num(modInt);
			request.setAttribute("one",ProductDAO.getOne(pd));
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/ceo/proMod.jsp");
			rd.forward(request, response);
			
		}else if(mod==null && del!=null) {//삭제시
			int delInt = Integer.parseInt(del);
			ProductVO pd = new ProductVO();
			pd.setP_num(delInt);
			int result = ProductDAO.proDel(pd);
			String msg="삭제에 실패했습니다.";
			if(result!=1) {//�������� db����
				request.setAttribute("msg", msg);
			}
			response.sendRedirect("/upload/product");
			return;
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String p_name = request.getParameter("p_name");
		String p_price = request.getParameter("p_price");
		String p_category = request.getParameter("p_category");
		String p_new = request.getParameter("p_new");
		String p_event = request.getParameter("p_event");
		String p_discount = request.getParameter("p_discount");
		
//		System.out.println("p_name:"+p_name);
//		System.out.println("p_price:"+p_price );
//		System.out.println(" p_category:"+ p_category);
//		System.out.println("p_new :"+ p_new);
//		System.out.println(" p_event:"+ p_event);
//		System.out.println(" p_discount:"+p_discount );
		ProductVO pd = new ProductVO();
		pd.setP_name(p_name);
		pd.setP_price(p_price);
		pd.setP_category(p_category);
		pd.setP_new(Integer.parseInt(p_new));
		pd.setP_event(Integer.parseInt(p_event));
		pd.setP_discount(Integer.parseInt(p_discount));
		ProductDAO.proMod(pd);
		response.sendRedirect("/upload/product");
		
	}

}
