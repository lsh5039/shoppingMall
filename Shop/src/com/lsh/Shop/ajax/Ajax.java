package com.lsh.Shop.ajax;

import java.util.ArrayList;
import java.util.List;

import com.lsh.Shop.db.ProductDAO;
import com.lsh.Shop.product.ProductVO;

public class Ajax {
	public static String getJson(ProductVO param) {
		if(param.getP_file() == null) {
			param.setP_file("");
		}
			StringBuffer result = new StringBuffer();
			result.append("{\"result\":[");
			List<ProductVO> list = new ArrayList<ProductVO>();
			list = ProductDAO.getList(param);
			System.out.println("Ajax안 param.name: "+param.getP_name());
			System.out.println("Ajax안 list.size: "+list.size());
			for(int i=0;i<list.size();i++) {
				result.append("{\"p_num\" : \""+list.get(i).getP_num()+"\",");
				result.append("\"p_name\" : \""+list.get(i).getP_name()+"\",");
				result.append("\"p_price\" : \""+list.get(i).getP_price()+"\",");
				result.append("\"p_category\" : \""+list.get(i).getP_category()+"\",");
				result.append("\"p_file\" : \""+list.get(i).getP_file()+"\",");
				result.append("\"p_realfile\" : \""+list.get(i).getP_realfile()+"\",");
				result.append("\"p_discount\" : \""+list.get(i).getP_discount()+"\",");
				result.append("\"p_event\" : \""+list.get(i).getP_event()+"\",");
				result.append("\"p_new\" : \""+list.get(i).getP_new()+"\"},");
			}
			result.append("]}");
			System.out.println(result.toString());
			
		
		return result.toString();
	}
}
