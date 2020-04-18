package com.lsh.Shop.db;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.lsh.Shop.product.Product;

public class ProductDAO {
	public static List<Product> getList(){
		List<Product> list = new ArrayList<Product>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from Product";
		try {
			con = Conn.getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				Product pd = new Product();
				 pd.setP_name(rs.getString("p_name"));
				pd.setP_price(rs.getInt("p_price"));
				pd.setCategory(rs.getString("category"));
				pd.setP_img(rs.getString("p_img"));
				list.add(pd);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			Conn.close(con, ps, rs);
		}
		return list;
	}
	
	
	public int uploadPro(Product pd) {
		Connection con = null;
		PreparedStatement ps = null;
		String sql = "insert into product (p_name, p_price, category, p_img) values(?,?,?,?)";
		try {
			con = Conn.getCon();
			ps = con.prepareStatement(sql);
			ps.setString(1, pd.getP_name());
			ps.setInt(2, pd.getP_price());
			ps.setString(3, pd.getCategory());
			ps.setString(4, pd.getP_img());
			ps.execute();
			
			return 1;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			Conn.close(con, ps, null);
		}
		return -1;//½ÇÆÐ
	}
	
	
}
