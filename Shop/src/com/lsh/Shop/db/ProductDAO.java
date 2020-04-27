package com.lsh.Shop.db;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.lsh.Shop.product.Product;

public class ProductDAO {
	public static Product getOne(Product param) {
		
		Product pd = new Product();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from product where p_num=? ";
		try {
			con = Conn.getCon();
			ps = con.prepareStatement(sql);
			ps.setInt(1, param.getP_num());
			rs = ps.executeQuery();
			if(rs.next()) {
				
				pd.setP_name(rs.getString("p_name"));
				pd.setP_price(rs.getString("p_price"));
				pd.setP_category(rs.getString("p_category"));
				pd.setP_new(rs.getInt("p_new"));
				pd.setP_event(rs.getInt("p_event"));
				pd.setP_discount(rs.getInt("p_discount"));
				pd.setP_file(rs.getString("p_file"));
				pd.setP_realfile(rs.getString("p_realfile"));

			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			Conn.close(con, ps, rs);
		}
		return pd;
	}
	
	
	
	
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
				pd.setP_num(rs.getInt("p_num"));
				pd.setP_name(rs.getString("p_name"));
				pd.setP_price(rs.getString("p_price"));
				pd.setP_category(rs.getString("p_category"));
				pd.setP_file(rs.getString("p_file"));
				pd.setP_realfile("p_realfile");
				pd.setP_discount(rs.getInt("p_discount"));
				pd.setP_event(rs.getInt("p_event"));
				pd.setP_new(rs.getInt("p_new"));
				list.add(pd);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			Conn.close(con, ps, rs);
		}
		return list;
	}
	
	
	public static int uploadPro(Product pd) {
		Connection con = null;
		PreparedStatement ps = null;
		String sql = "insert into product (p_name, p_price, p_category, p_new, p_event, p_discount, p_file, p_realfile) values(?,?,?,?,?,?,?,?)";
		int result = 0;
		try {
			con = Conn.getCon();
			ps = con.prepareStatement(sql);
			ps.setString(1, pd.getP_name());
			ps.setString(2, pd.getP_price());
			ps.setString(3, pd.getP_category());
			ps.setInt(4, pd.getP_new());
			ps.setInt(5, pd.getP_event());
			ps.setInt(6, pd.getP_discount());
			ps.setString(7, pd.getP_file());
			ps.setString(8, pd.getP_realfile());
			
			result = ps.executeUpdate();
			//1정상   0,-1 비정상
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			Conn.close(con, ps, null);
		}
		return result;
	}
	
	public static int proDel(Product param) {
		int result = 0;
		Connection con = null;
		PreparedStatement ps = null;
		String sql = "delete from product where p_num = ?";
		try {
			con = Conn.getCon();
			ps = con.prepareStatement(sql);
			ps.setInt(1, param.getP_num());
			result = ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			Conn.close(con, ps, null);
		}
	
		return result;
	}
	
	public static int proMod(Product param) {//상품수정
		int result=0;
		Connection con = null;
		PreparedStatement ps = null;
		String sql = "update product set p_name=?, p_price=?, p_category=?, p_new=?, p_event=?, p_discount=?";
		try {
			con = Conn.getCon();
			ps = con.prepareStatement(sql);
			ps.setString(1, param.getP_name());
			ps.setString(2, param.getP_price());
			ps.setString(3, param.getP_category());
			ps.setInt(4, param.getP_new());
			ps.setInt(5, param.getP_event());
			ps.setInt(6, param.getP_discount());
			result = ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			Conn.close(con, ps, null);
		}
		
		
		return result;
	}
	
	
}
