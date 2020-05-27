package com.lsh.Shop.product;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lsh.Shop.db.ProductDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
@WebServlet("/upload/product")
public class UploadSer extends HttpServlet {
	private static final long serialVersionUID = 1L;
      

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/ceo/upProduct.jsp");
		request.setAttribute("list", ProductDAO.getList());

		rd.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
		
		String uploadDir =this.getClass().getResource("").getPath();
		
		 uploadDir = uploadDir.substring(1,uploadDir.indexOf(".metadata"))+"uploadTest/WebContent/uploadImage";
		
		String save="/upload";
		String encType="UTF-8";
		int maxSize =1024*1024*5;//5�ް����� ���尡��
		ServletContext context = getServletContext();
		
		uploadDir = context.getRealPath(save);
		MultipartRequest multi = new MultipartRequest(request, uploadDir,maxSize,encType, new DefaultFileRenamePolicy());
			 System.out.println("post�����Դϴ�.2");	
		System.out.println("������ : "+uploadDir);
		///////////enctype="multipart/form-data ������ request.getparameter�Ұ� 
		
		String p_name = multi.getParameter("p_name");
		String p_price = multi.getParameter("p_price");
		String p_category = multi.getParameter("p_category");
		
		int p_new  = Integer.parseInt(multi.getParameter("p_new"));
		int p_discount = Integer.parseInt(multi.getParameter("p_discount"));
		int p_event = Integer.parseInt(multi.getParameter("p_event"));
		
//		System.out.println("p_name: "+p_name );
//		System.out.println("p_price: "+p_price );
//		System.out.println("p_category: "+p_category );
//		System.out.println("p_new : "+p_new );
//		System.out.println("p_discount : "+p_discount );
//		System.out.println("p_evnet : "+p_event );
//		
		
		
		//////////
		ProductVO pd = new ProductVO();
		pd.setP_name(p_name);
		pd.setP_price(p_price);
		pd.setP_category(p_category);
		pd.setP_new(p_new);
		pd.setP_event(p_event);
		pd.setP_discount(p_discount);
		pd.setP_file(multi.getOriginalFileName("file"));
		pd.setP_realfile(multi.getFilesystemName("file"));
		
		int result = ProductDAO.uploadPro(pd);
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		writer.println("<script>");
		if(result==1) {//성공
			writer.println("alert('상품등록에 성공했습니다.')");
			writer.println("location.href='/upload/product'");
		} else if(result==-1) {//실패
			writer.println("alert('상품등록에 실패했습니다..')");
			writer.println("history.back()");
		}else if(result == 0) {
			writer.println("alert('DB에러 발생.')");
			writer.println("history.back()");
		}
		writer.println("</script>");
	}

}
