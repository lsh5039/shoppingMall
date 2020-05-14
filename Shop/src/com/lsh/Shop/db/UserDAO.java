package com.lsh.Shop.db;
import com.lsh.Shop.user.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class UserDAO {
	public static List<User> getList(){
		List<User> list = new ArrayList<User>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from user";
		
		try {
			con = Conn.getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				User user = new User();
				user.setId(rs.getString("id"));
				user.setPassword(rs.getString("password"));
				user.setName(rs.getString("name"));
				user.setAddress(rs.getString("address"));
				user.setNumber(rs.getString("number"));
				user.setGrade(rs.getInt("grade"));
				user.setHave_money(rs.getInt("have_money"));
				user.setSpend_money(rs.getInt("spend_money"));
				list.add(user);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			Conn.close(con, ps, rs);
		}
		return list;
	}
	public static User getOne(String id) {
		User user = new User();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from user where id = ? ";
		try {
			con = Conn.getCon();
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				user.setId(rs.getString("id"));
				user.setPassword(rs.getString("password"));
				user.setName(rs.getString("name"));
				user.setAddress(rs.getString("address"));
				user.setNumber(rs.getString("number"));
				user.setGrade(rs.getInt("grade"));
				user.setPk(rs.getInt("pk"));
			}else {
				user.setId(null);//id�� �ߺ������ʴ°��
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			Conn.close(con, ps, rs);
		}
		
		return user;
	}
	
	
	public static int join(String id, String password, String name, String address, String number) {
		Connection con = null;
		PreparedStatement ps = null;
		String sql = "insert into user (id, password, name, address, number) values(?,?,?,?,?)";
		try {
			con = Conn.getCon();
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, password);
			ps.setString(3, name);
			ps.setString(4,address);
			ps.setString(5, number);
			ps.execute();
			return 1;//����
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			Conn.close(con, ps, null);
		}
		return -1;//����
	}
	public static int del(String id) {
		Connection con = null;
		PreparedStatement ps = null;
		String sql = "delete from user where id = ?";
		try {
			con = Conn.getCon();
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.execute();
			return 1;//회원삭제성공
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			Conn.close(con, ps, null);
		}
		return -1;//실패
	}
	public static int update(User user) {//��������
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		// 0 : �˼����� DB����
		// 1 : ����
		// -1 : �����������
		String sql = "update user set grade=? where id=?";//�����ڿ����� ��������
		if(user.getPassword()!=null) {//��й�ȣ�� ���� ��� �������� ��������
//			System.out.println("���� id : "+user.getId());
			sql = "update user set password = ?, name = ?, address=?, number=? where id =?";
		}
		try {
			con = Conn.getCon();
			ps = con.prepareStatement(sql);
			if(user.getPassword()!=null) {
				
				ps.setString(1, user.getPassword());
				ps.setString(2, user.getName());
				ps.setString(3, user.getAddress());
				ps.setString(4, user.getNumber());
				ps.setString(5, user.getId());
			}else {
				ps.setInt(1, user.getGrade());
				ps.setString(2, user.getId());
			}
			result = ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			Conn.close(con, ps, null);
		}
		return result;
	}
	public static int login(User user) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int result = 0;
//		0 DB에러
//		1 성공
//		-2패스워드 불일치
//		-1아이디 없음
		String sql = "select * from user where id = ?";
		try {
			con = Conn.getCon();
			ps = con.prepareStatement(sql);
			ps.setString(1, user.getId());
			rs = ps.executeQuery();
			if(rs.next()) {//아이디는 맞음
				String chkPw = rs.getString("password");
				if(chkPw.equals(user.getPassword())) {//아이디 비밀번호 일치
					user.setPk(rs.getInt("pk"));
					result = 1;//로그인 성공
				}else {
					result = -2;//패스워드 불일치
				}
			}else {
				result = -1;//아이디 없음
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			Conn.close(con, ps, rs);
		}
		return result;
	}
	
	
}

