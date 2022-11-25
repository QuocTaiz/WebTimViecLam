package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.List;
import java.util.Vector;

import com.mysql.jdbc.PreparedStatement;

import model.Account;



public class AccountDAO {
	
	static public Account checkLogin(String email, String pass) {
		
		Account data = new Account();
		
		try {
			
			Connection conn = ConnectDB.getConnection();
			String sql = "select * from account where email = ? and password = ? ";
			PreparedStatement prestm = (PreparedStatement) conn.prepareStatement(sql);
			prestm.setString(1, email);
			prestm.setString(2, pass);
			
			ResultSet rs = prestm.executeQuery();
			if (rs.next()) {
				data.setId(rs.getInt("id"));
				data.setEmail(email);
				data.setPassword(pass);
				data.setRole(rs.getString("role"));
				data.setBlock(rs.getBoolean("is_block"));
			} 
		} catch (Exception e) {e.printStackTrace();}
		
		return data;
	}
	
	static public boolean checkBlock(String email, String pass) {
		
		try {
			
			Connection conn = ConnectDB.getConnection();
			String sql = "select is_block from account where email = ? and password = ? ";
			PreparedStatement prestm = (PreparedStatement) conn.prepareStatement(sql);
			prestm.setString(1, email);
			prestm.setString(2, pass);
			ResultSet rs = conn.prepareStatement(sql).executeQuery();
			while (rs.next()) {
				if (rs.getBoolean("is_block") == true) return true;
			}
			
		} catch (Exception e) {e.printStackTrace();}
		
		return false;
	}
	
	static public boolean changePassword(String email, String pass_old, String pass_new) {
		
		try {
			
			if (checkLogin(email, pass_old).getRole() != "") {
				Connection conn = ConnectDB.getConnection();
				String sql = "update account set password = ? where email = ? and password = ?";
				PreparedStatement prestm = (PreparedStatement) conn.prepareStatement(sql);
				prestm.setString(1, pass_new);
				prestm.setString(2, email);
				prestm.setString(3, pass_old);
				
				prestm.executeUpdate();
				
				return true;
			}
			
		} catch (Exception e) {e.printStackTrace();}
		
		return false;
	}
	
	static public boolean checkEmail(String email) {
		
		try {
			Connection conn = ConnectDB.getConnection();
			String sql = "select * from account where email = ?";
			PreparedStatement prestm = (PreparedStatement) conn.prepareStatement(sql);
			prestm.setString(1, email);
			ResultSet rs = prestm.executeQuery();
			if (rs.next()) {
				return true;
			}
			
		} catch (Exception e) {e.printStackTrace();}
		return false;
	}
	
	static public void blockAccount(int id_acc) {
		try {
			
			Connection conn = ConnectDB.getConnection();
			String sql = "update account set is_block=? where id=?";
			PreparedStatement prestm = (PreparedStatement) conn.prepareStatement(sql);
			prestm.setBoolean(1, true);
			prestm.setInt(2, id_acc);
			prestm.executeUpdate();
			conn.close();
			
		} catch (Exception e) {e.printStackTrace();}
	}
	
	static public void unBlockAccount(int id_acc) {
		
		try {
			
			Connection conn = ConnectDB.getConnection();
			String sql = "update account set is_block=? where id=?";
			PreparedStatement prestm = (PreparedStatement) conn.prepareStatement(sql);
			prestm.setBoolean(1, false);
			prestm.setInt(2, id_acc);
			prestm.executeUpdate();
			conn.close();
			
		} catch (Exception e) {e.printStackTrace();}
		
	}
	
	static public void deleteAccount(int id_acc) {
		try {
			
			Connection conn = ConnectDB.getConnection();
			String sql = "delete from account where id="+id_acc;
			conn.prepareStatement(sql).executeUpdate();
			conn.close();
			
		} catch (Exception e) {e.printStackTrace();}
	}
	
	static public List<Account> getAllAccount(){
		
		List<Account> list = new Vector<Account>();
		try {
			
			Connection conn = ConnectDB.getConnection();
			String sql = "select * from account where role<>'admin' order by is_block ";
			ResultSet rs = conn.prepareStatement(sql).executeQuery();
			while (rs.next()) {
				Account data = new Account();
				data.setId(rs.getInt("id"));
				data.setEmail(rs.getString("email"));
				data.setPassword(rs.getString("password"));
				data.setRole(rs.getString("role"));
				data.setBlock(rs.getBoolean("is_block"));
				list.add(data);
			}
			
		} catch (Exception e) {e.printStackTrace();}
		return list;
	}
}
