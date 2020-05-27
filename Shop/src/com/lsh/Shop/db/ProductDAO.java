package com.lsh.Shop.db;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.lsh.Shop.product.CartVO;
import com.lsh.Shop.product.ProductVO;
import com.lsh.Shop.user.User;

public class ProductDAO {
	
	public static List<CartVO> getCartList(User user){
		List<CartVO> list = new ArrayList<CartVO>();
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = " select A.pk,A.name,A.grade,A.have_money, B.cart_pk,C.* "
				+" from user A "
				+" inner join cart B "
				+" on A.pk = ? "//B.user_pk
				+" inner join product C "
				+" on C.p_num = B.p_num ";
		try {
			con = Conn.getCon();
			ps = con.prepareStatement(sql);
			ps.setInt(1, user.getPk());
			rs = ps.executeQuery();
			while(rs.next()) {
				CartVO vo = new CartVO();
				vo.setPk(rs.getInt("pk"));
				vo.setName(rs.getString("name"));
				vo.setGrade(rs.getShort("grade"));
				vo.setHaveMoney(rs.getInt("have_money"));
				vo.setCart_pk(rs.getInt("cart_pk"));
				vo.setP_num(rs.getInt("p_num"));
				vo.setP_name(rs.getString("p_name"));
				vo.setImage(rs.getString("p_file"));
				list.add(vo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			Conn.close(con, ps, rs);
		}
		return list;
	}
	
	
	
	
	public static int doCart(ProductVO param) {
		int result = 0;
		Connection con=null;
		PreparedStatement ps = null;
		String sql = "insert into cart(user_pk, p_num) values (?,?) ";
		try {
			con = Conn.getCon();
			ps = con.prepareStatement(sql);
			ps.setInt(1, param.getUser_pk());
			ps.setInt(2, param.getP_num());
			result = ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			Conn.close(con, ps, null);
		}
		return result;
	}
	
	
	public static ProductVO getOne(ProductVO param) {		
		ProductVO pd = new ProductVO();
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
	
	public static List<ProductVO> getList(ProductVO param){
		List<ProductVO> list = new ArrayList<ProductVO>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = " select * from Product ";
		
		
		if(param.getFind() != null) {//검색
			sql+="where p_name like '%"+param.getFind()+"%' ";
		}
		
		
		try {
			con = Conn.getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				ProductVO pd = new ProductVO();
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
	
	
	
	
	
	public static List<ProductVO> getList(){
		List<ProductVO> list = new ArrayList<ProductVO>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from Product";
		try {
			con = Conn.getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				ProductVO pd = new ProductVO();
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
	
	
	public static int uploadPro(ProductVO pd) {
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
			//1����   0,-1 ������
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			Conn.close(con, ps, null);
		}
		return result;
	}
	
	public static int proDel(ProductVO param) {
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
	
	public static int proMod(ProductVO param) {//��ǰ����
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
