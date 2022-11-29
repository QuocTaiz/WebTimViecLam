package dao;

import java.sql.ResultSet;
import java.util.List;
import java.util.Vector;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import model.CV;

public class ResumeDAO {
	
	static public void addCV(CV cv, int id_user) {
		
		try {
			
			Connection conn = ConnectDB.getConnection();
    		String sql = "insert into cv(id_create, name, title, sort_desc, address, old, email, phone, exp, degree) values (?,?,?,?,?,?,?,?,?,?)";
    		PreparedStatement stmt = (PreparedStatement) conn.prepareStatement(sql);
    		stmt.setInt(1, id_user);
    		stmt.setString(2, cv.getName());
    		stmt.setString(3, cv.getTitle());
    		stmt.setString(4, cv.getSort_desc());
    		stmt.setString(5, cv.getAddress());
    		stmt.setInt(6, cv.getOld());
    		stmt.setString(7, cv.getEmail());
    		stmt.setString(8, cv.getPhone());
    		stmt.setString(9, cv.getExp());
    		stmt.setString(10, cv.getDegree());
    		
    		stmt.executeUpdate();
    		conn.close();
			
		} catch (Exception e) {e.printStackTrace();}
		
	}
	
	static public void updateCV(CV cv) {
		
		try {
			
			Connection conn = ConnectDB.getConnection();
    		String sql = "update cv set name=?, title=?, sort_desc=?, address=?, old=?, email=?, phone=?, exp=?, degree=?, change_time=? where id=?";
    		PreparedStatement stmt = (PreparedStatement) conn.prepareStatement(sql);
    		stmt.setString(1, cv.getName());
    		stmt.setString(2, cv.getTitle());
    		stmt.setString(3, cv.getSort_desc());
    		stmt.setString(4, cv.getAddress());
    		stmt.setInt(5, cv.getOld());
    		stmt.setString(6, cv.getEmail());
    		stmt.setString(7, cv.getPhone());
    		stmt.setString(8, cv.getExp());
    		stmt.setString(9, cv.getDegree());
    		
    		java.sql.Date date = new java.sql.Date(System.currentTimeMillis());
    		stmt.setDate(10, date);
    		stmt.setInt(11, cv.getId());
    		
    		stmt.executeUpdate();
    		conn.close();
			
		} catch (Exception e) {e.printStackTrace();}
		
	}
	
	static public void deleteCV(int id_cv) {
		
		try {
			
			Connection conn = ConnectDB.getConnection();
    		String sql = "delete from cv where id="+id_cv;
    		conn.prepareStatement(sql).executeUpdate();
    		conn.close();
			
		} catch (Exception e) {e.printStackTrace();}
		
	}
	
	static public CV getCVFromId(int id) {
		
		CV data = new CV();
		
		try {
			Connection conn = ConnectDB.getConnection();
			String sql = "select * from cv where id = ?";
			PreparedStatement stmt = (PreparedStatement) conn.prepareStatement(sql);
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				data.setId(rs.getInt("id"));
				data.setName(rs.getString("name"));
				data.setTitle(rs.getString("title"));
				data.setSort_desc(rs.getString("sort_desc"));
				data.setAddress(rs.getString("address"));
				data.setOld(rs.getInt("old"));
				data.setEmail(rs.getString("email"));
				data.setPhone(rs.getString("phone"));
				data.setExp(rs.getString("exp"));
				data.setDegree(rs.getString("degree"));
				data.setChange_time(rs.getDate("change_time"));
			}
		} catch (Exception e) {e.printStackTrace();}
		
		return data;
	}
	
	static public List<CV> getListCV(int id_user){
		
		List<CV> list = new Vector<CV>();
		
		try {
			
			Connection conn = ConnectDB.getConnection();
			String sql = "select * from cv where id_create="+id_user;
			ResultSet rs = conn.prepareStatement(sql).executeQuery();
			while (rs.next()) {
				CV data = new CV();
				data.setId(rs.getInt("id"));
				data.setName(rs.getString("name"));
				data.setTitle(rs.getString("title"));
				data.setSort_desc(rs.getString("sort_desc"));
				data.setAddress(rs.getString("address"));
				data.setOld(rs.getInt("old"));
				data.setEmail(rs.getString("email"));
				data.setPhone(rs.getString("phone"));
				data.setExp(rs.getString("exp"));
				data.setDegree(rs.getString("degree"));
				data.setChange_time(rs.getDate("change_time"));
				list.add(data);
			}
			
		} catch (Exception e) {e.printStackTrace();}
		
		return list;
	}
	 
}
