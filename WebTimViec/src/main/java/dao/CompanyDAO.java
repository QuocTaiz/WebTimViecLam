package dao;

import java.sql.ResultSet;
import java.util.List;
import java.util.Vector;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import model.Company;

public class CompanyDAO {
	
	public static void addCompany(Company cpn, int id_create) {	// add company
		
		try {
			Connection conn = ConnectDB.getConnection();
			String sql = "insert into company(id_create, name, title, sort_desc, address, num_employees, website, phone, email)"+
							"values (?,?,?,?,?,?,?,?,?)";
			PreparedStatement stmt = (PreparedStatement) conn.prepareStatement(sql);
			stmt.setInt(1, id_create);
			stmt.setString(2, cpn.getName());
			stmt.setString(3, cpn.getTitle());
			stmt.setString(4, cpn.getSort_desc());
			stmt.setString(5, cpn.getAddress());
			stmt.setInt(6, cpn.getNum_employees());
			stmt.setString(7, cpn.getWebsite());
			stmt.setString(8, cpn.getPhone());
			stmt.setString(9, cpn.getEmail());
			stmt.executeUpdate();
			conn.close();
			
		} catch (Exception e) {e.printStackTrace();}
		
	}
	
	public static Company getCompanyById(int id_cpn) { //get company by id-cpn
		
		Company data = new Company();
		
		try {
			
			Connection conn = ConnectDB.getConnection();
			String sql = "select * from company where id="+id_cpn;
			ResultSet rs = conn.prepareStatement(sql).executeQuery();
			while (rs.next()) {
				data.setId(rs.getInt("id"));
				data.setName(rs.getString("name"));
				data.setTitle(rs.getString("title"));
				data.setSort_desc(rs.getString("sort_desc"));
				data.setAddress(rs.getString("address"));
				data.setNum_employees(rs.getInt("num_employees"));
				data.setWebsite(rs.getString("website"));
				data.setPhone(rs.getString("phone"));
				data.setEmail(rs.getString("email"));
			}
			conn.close();
			
		} catch (Exception e) {e.printStackTrace();}
		
		return data;
		
	}
	
	public static List<Company> getListCompanyById(int id_user){  //get list company by id, if id=0 -> get all
		
		List<Company> list = new Vector<Company>();
		
		try {
			
			Connection conn = ConnectDB.getConnection();
			String sql = "select * from company ";
			if (id_user != 0) {
				sql += "where id_create="+id_user; 
			}
			ResultSet rs = conn.prepareStatement(sql).executeQuery();
			while (rs.next()) {
				Company data = new Company();
				data.setId(rs.getInt("id"));
				data.setName(rs.getString("name"));
				data.setTitle(rs.getString("title"));
				data.setSort_desc(rs.getString("sort_desc"));
				data.setAddress(rs.getString("address"));
				data.setNum_employees(rs.getInt("num_employees"));
				data.setWebsite(rs.getString("website"));
				data.setPhone(rs.getString("phone"));
				data.setEmail(rs.getString("email"));
				data.setNumJob(JobDAO.countJobByCompanyId(data.getId()));
				list.add(data);
			}
			conn.close();
			
		} catch (Exception e) {e.printStackTrace();}
		
		return list;
		
	}
	
	public static List<String> getListNameCompanyById(int id_user){ //get list name company
		
		List<String> list = new Vector<String>();
		
		try {
			
			Connection conn = ConnectDB.getConnection();
			String sql = "select name from company where id_create="+id_user;
			ResultSet rs = conn.prepareStatement(sql).executeQuery();
			while(rs.next()) {
				list.add(rs.getString("name"));
			}
			
		} catch (Exception e) {e.printStackTrace();}
		
		return list;
		
	}
	
	public static int getIdCompanyByName(String name) {
		
		int id = -1;
		
		try {
			
			Connection conn = ConnectDB.getConnection();
			String sql = "select id from company where name='"+name+"'";
			ResultSet rs = conn.prepareStatement(sql).executeQuery();
			while (rs.next()) {
				id = rs.getInt("id");
			}
			
		} catch (Exception e) {e.printStackTrace();}
		
		return id;
		
	}
	
	public static void deleteCompanyById(int id) {	// delete company
		
		try {
			
			Connection conn = ConnectDB.getConnection();
			String sql = "delete from company where id="+id;
			conn.prepareStatement(sql).executeUpdate();
			conn.close();
			
		} catch (Exception e) {e.printStackTrace();}
		
	}
	
	public static void updateCompany(Company cpn) {
		
		try {
			
			Connection conn = ConnectDB.getConnection();
			String sql = "update company set name=?, title=?, sort_desc=?, num_employees=?, address=?,"
					+ " website=?, phone=?, email=? where id=?";
			PreparedStatement stmt = (PreparedStatement) conn.prepareStatement(sql);
			stmt.setString(1, cpn.getName());
			stmt.setString(2, cpn.getTitle());
			stmt.setString(3, cpn.getSort_desc());
			stmt.setInt(4, cpn.getNum_employees());
			stmt.setString(5, cpn.getAddress());
			stmt.setString(6, cpn.getWebsite());
			stmt.setString(7, cpn.getPhone());
			stmt.setString(8, cpn.getEmail());
			stmt.setInt(9, cpn.getId());
			stmt.executeUpdate();
			conn.close();
			
		} catch (Exception e) {e.printStackTrace();}
		
	}
	
}
