package com.lsh.Shop.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.lsh.Shop.bbs.BbsVO;
import com.lsh.Shop.user.User;

public class BbsDAO {
	
	public static int del(BbsVO param) {
		int result = 0;
		Connection con = null;
		PreparedStatement ps = null;
		String sql = "delete from bbs where bbs_pk = ? and user_pk = ?";
		
		try {
			con = Conn.getCon();
			ps = con.prepareStatement(sql);
			ps.setInt(1, param.getBbs_pk());
			ps.setInt(2, param.getUser_pk());
			result = ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			Conn.close(con, ps, null);
		}
		
		
		return result;
	}
	
	
	
	public static int  doWrite(BbsVO param) {
		int result=0;
		Connection con = null;
		PreparedStatement ps = null;
		String sql = "insert into bbs (title, email, content, pw,user_pk ,img) values(?,?,?,?,?,?)";
		try { 
			con = Conn.getCon();
			ps = con.prepareStatement(sql);
			ps.setString(1, param.getTitle());
			ps.setString(2, param.getEmail());
			ps.setString(3, param.getContent());
			ps.setString(4, param.getPw());
			ps.setInt(5, param.getUser_pk());
			ps.setString(6, param.getImg());
			result = ps.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			Conn.close(con, ps, null);
		}
		return result;
		
	}
	
	public static List<BbsVO> getList(){
		List<BbsVO> list = new ArrayList<BbsVO>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select A.*, B.name, B.grade " + 
				" from bbs A" + 
				" inner join user B" + 
				" on A.user_pk = B.pk "+
				" order by bbs_pk desc ";
		
		try {
			con = Conn.getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				BbsVO vo =new BbsVO();
				vo.setBbs_pk(rs.getInt("bbs_pk"));
				vo.setContent(rs.getString("content"));
				vo.setEmail(rs.getString("email"));
				vo.setHits(rs.getInt("hits"));
				vo.setImg(rs.getString("img"));
				vo.setUser_pk(rs.getInt("user_pk"));
				vo.setPw(rs.getString("pw"));
				vo.setTitle(rs.getString("title"));
				vo.setR_dt(rs.getString("r_dt"));
				vo.setM_dt(rs.getString("m_dt"));
				vo.setName(rs.getString("name"));
				vo.setGrade(rs.getInt("grade"));
				list.add(vo);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			Conn.close(con, ps, rs);
		}
		
		
		return list;
	}
	public static BbsVO getOne(BbsVO param) {
		BbsVO vo = new BbsVO();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from bbs where bbs_pk = ?";
		
		try {
			con = Conn.getCon();
			ps = con.prepareStatement(sql);
			ps.setInt(1, param.getBbs_pk());
			rs = ps.executeQuery();
			if(rs.next()) {
				vo.setBbs_pk(rs.getInt("bbs_pk"));
				vo.setContent(rs.getString("content"));
				vo.setEmail(rs.getString("email"));
				vo.setHits(rs.getInt("hits"));
				vo.setImg(rs.getString("img"));
				vo.setPw(rs.getString("pw"));
				vo.setTitle(rs.getString("title"));
				vo.setUser_pk(rs.getInt("user_pk"));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			Conn.close(con, ps, rs);
		}
		return vo;
	}
	public static int upHits(BbsVO param) {
		int result = 0;
		Connection con = null;
		PreparedStatement ps = null;
		String sql = "update bbs set hits = hits+1 where bbs_pk = ?";
		try {
			con = Conn.getCon();
			ps = con.prepareStatement(sql);
			ps.setInt(1, param.getBbs_pk());
			result  = ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			Conn.close(con, ps, null);
		}
		
		return result;
	}
	public static int confirmPw(BbsVO param, String pw) {
		int result = 0;
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select bbs_pk from bbs where pw = ? and bbs_pk = ?";
		try {
			con = Conn.getCon();
			ps = con.prepareStatement(sql);
			ps.setString(1, pw);
			ps.setInt(2, param.getBbs_pk());
			rs = ps.executeQuery();
			if(rs.next()) {
				result = 1;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			Conn.close(con, ps, rs);
		}
		
		return result;
	}
	
	public static int update(BbsVO param) {
		int result=0;
		Connection con = null;
		PreparedStatement ps = null;
		String sql = "update bbs set title=?, email=?, content=? where bbs_pk =? and user_pk = ?";
		try {
			con = Conn.getCon();
			ps = con.prepareStatement(sql);
			ps.setString(1, param.getTitle());
			ps.setString(2, param.getEmail());
			ps.setString(3, param.getContent());
			ps.setInt(4, param.getBbs_pk());
			ps.setInt(5, param.getUser_pk());
			result  = ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			Conn.close(con, ps, null);
		}
		return result;
	}
	
}
