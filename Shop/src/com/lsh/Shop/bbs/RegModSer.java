package com.lsh.Shop.bbs;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lsh.Shop.db.BbsDAO;
import com.lsh.Shop.user.User;

/**
 * Servlet implementation class RegModSer
 */
@WebServlet("/regMod")
public class RegModSer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession hs = request.getSession();
		User loginUser = (User)hs.getAttribute("loginUser");
		if(loginUser==null) {
			response.sendRedirect("/loginpage");
			return;
		}
		String del = request.getParameter("del");
		String mod = request.getParameter("mod");

		if(del != null) {//삭제시
			BbsVO vo = new BbsVO();
			vo.setBbs_pk(Integer.parseInt(del));
			vo.setUser_pk(loginUser.getPk());
			int result = BbsDAO.del(vo);
			if(result == 1) {//삭제성공
				response.sendRedirect("/q&a");
				return;
			}
			response.sendRedirect("/q&a");//����
			return;
		}
		if(mod != null) {//수정
			int bbs_pk = Integer.parseInt(mod);
			String title = request.getParameter("title");
			String email = request.getParameter("email");
			String content = request.getParameter("content");
			BbsVO modVO = new BbsVO();
			modVO.setTitle(title);
			modVO.setContent(content);
			modVO.setEmail(email);
			modVO.setUser_pk(loginUser.getPk());
			modVO.setBbs_pk(bbs_pk);
			int result = BbsDAO.update(modVO);
			
			
			if(result != 1) {//실패
				RequestDispatcher rd = request.getRequestDispatcher("/write/page?bbs_pk="+bbs_pk);
				request.setAttribute("msg", "글 수정에 실패했습니다.");
				rd.forward(request, response);
				return;
			}else {
				response.sendRedirect("/q&a");
			}
			
			
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
