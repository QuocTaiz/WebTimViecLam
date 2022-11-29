package dao;

import java.sql.ResultSet;
import java.util.List;
import java.util.Vector;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import model.Job;

public class JobDAO {
	
	public static Job getJobById(int id_job) {
		Job job = new Job();
		
		try {
			
			Connection conn = ConnectDB.getConnection();
			String sql = "select * from job where id="+id_job;
			ResultSet rs = conn.prepareStatement(sql).executeQuery();
			while (rs.next()) {
				job.setId(rs.getInt("id"));
				job.setId_cpn(rs.getInt("id_cpn"));
				job.setTitle(rs.getString("title"));
				job.setName_cpn(CompanyDAO.getCompanyById(job.getId_cpn()).getName());
				job.setSort_desc(rs.getString("sort_desc"));
				job.setAddress(rs.getString("address"));
				job.setJob_type(rs.getString("job_type"));
				job.setJob_exp(rs.getString("job_exp"));
				job.setJob_salary(rs.getString("job_salary"));
				job.setJob_NoHW(rs.getString("job_NoHW"));
				job.setJob_degree(rs.getString("job_degree"));
				job.setTime_post(rs.getTimestamp("time_post"));
				job.setStatus(rs.getString("status"));
			}
			
			conn.close();
			
			
		} catch (Exception e) {e.printStackTrace();}
		
		return job;
	}
	
	public static List<Job> getListAllJob(){
		
		List<Job> list = new Vector<Job>();
		
        try {
			
			Connection conn = ConnectDB.getConnection();
			String sql = "select * from job order by status";
			ResultSet rs = conn.prepareStatement(sql).executeQuery();
			while(rs.next()) {
				Job job = new Job();
				job.setId(rs.getInt("id"));
				job.setId_cpn(rs.getInt("id_cpn"));
				job.setName_cpn(CompanyDAO.getCompanyById(job.getId_cpn()).getName());
				job.setTitle(rs.getString("title"));
				job.setSort_desc(rs.getString("sort_desc"));
				job.setAddress(rs.getString("address"));
				job.setJob_type(rs.getString("job_type"));
				job.setJob_exp(rs.getString("job_exp"));
				job.setJob_salary(rs.getString("job_salary"));
				job.setJob_NoHW(rs.getString("job_NoHW"));
				job.setJob_degree(rs.getString("job_degree"));
				job.setTime_post(rs.getTimestamp("time_post"));
				job.setNum_job_apply(JobApplyDAO.countJobApplyByIDJob(job.getId()));
				job.setStatus(rs.getString("status"));
				list.add(job);
			}
			
		} catch (Exception e) {e.printStackTrace();}
		
		return list;
		
	}
	
	public static List<Job> getListJobByIdCpn(int id_cpn){
		
		List<Job> list = new Vector<Job>();
		
		try {
			
			Connection conn = ConnectDB.getConnection();
			String sql = "select * from job where id_cpn="+id_cpn;
			ResultSet rs = conn.prepareStatement(sql).executeQuery();
			while(rs.next()) {
				Job job = new Job();
				job.setId(rs.getInt("id"));
				job.setId_cpn(rs.getInt("id_cpn"));
				job.setName_cpn(CompanyDAO.getCompanyById(job.getId_cpn()).getName());
				job.setTitle(rs.getString("title"));
				job.setSort_desc(rs.getString("sort_desc"));
				job.setAddress(rs.getString("address"));
				job.setJob_type(rs.getString("job_type"));
				job.setJob_exp(rs.getString("job_exp"));
				job.setJob_salary(rs.getString("job_salary"));
				job.setJob_NoHW(rs.getString("job_NoHW"));
				job.setJob_degree(rs.getString("job_degree"));
				job.setTime_post(rs.getTimestamp("time_post"));
				job.setNum_job_apply(JobApplyDAO.countJobApplyByIDJob(job.getId()));
				job.setStatus(rs.getString("status"));
				list.add(job);
			}
			
		} catch (Exception e) {e.printStackTrace();}
		
		return list;
		
	}
	
public static List<Job> getListJobById(int id_user){
		
		List<Job> list = new Vector<Job>();
		
		try {
			
			Connection conn = ConnectDB.getConnection();
			String sql = "select * from job where id_user="+id_user;
			ResultSet rs = conn.prepareStatement(sql).executeQuery();
			while(rs.next()) {
				Job job = new Job();
				job.setId(rs.getInt("id"));
				job.setId_cpn(rs.getInt("id_cpn"));
				job.setName_cpn(CompanyDAO.getCompanyById(job.getId_cpn()).getName());
				job.setTitle(rs.getString("title"));
				job.setSort_desc(rs.getString("sort_desc"));
				job.setAddress(rs.getString("address"));
				job.setJob_type(rs.getString("job_type"));
				job.setJob_exp(rs.getString("job_exp"));
				job.setJob_salary(rs.getString("job_salary"));
				job.setJob_NoHW(rs.getString("job_NoHW"));
				job.setJob_degree(rs.getString("job_degree"));
				job.setTime_post(rs.getTimestamp("time_post"));
				job.setNum_job_apply(JobApplyDAO.countJobApplyByIDJob(job.getId()));
				job.setStatus(rs.getString("status"));
				list.add(job);
			}
			
		} catch (Exception e) {e.printStackTrace();}
		
		return list;
		
	}
	
	public static List<Job> getListJobLatest(){
		
		List<Job> list = new Vector<Job>();
		
		try {
			Connection conn = ConnectDB.getConnection();
			String sql = "select * from job order by time_post desc limit 4";
			ResultSet rs = conn.prepareStatement(sql).executeQuery();
			while(rs.next()) {
				Job job = new Job();
				job.setId(rs.getInt("id"));
				job.setId_cpn(rs.getInt("id_cpn"));
				job.setName_cpn(CompanyDAO.getCompanyById(job.getId_cpn()).getName());
				job.setTitle(rs.getString("title"));
				job.setSort_desc(rs.getString("sort_desc"));
				job.setAddress(rs.getString("address"));
				job.setJob_type(rs.getString("job_type"));
				job.setJob_exp(rs.getString("job_exp"));
				job.setJob_salary(rs.getString("job_salary"));
				job.setJob_NoHW(rs.getString("job_NoHW"));
				job.setJob_degree(rs.getString("job_degree"));
				job.setTime_post(rs.getTimestamp("time_post"));
				job.setStatus(rs.getString("status"));
				list.add(job);
			}
			conn.close();
		} catch (Exception e) {e.printStackTrace();}
		
		return list;
		
	}
	
	public static List<Job> getListJobBySearch(String keySearch, String address, String jobCate){
		
		List<Job> list = new Vector<Job>();
		
		try {
			
			Connection conn = ConnectDB.getConnection();
			String sql = "select * from job where 1";
			if (keySearch != "") {
				sql += " and title like '%"+keySearch+"%'";
			}
			if (address != "") {
				sql += " and address like '%"+address+"%'";
			}
			if (!jobCate.equals("Tất cả") && jobCate != "") {
				sql += " and title like '%"+jobCate+"%'";
			}
			ResultSet rs = conn.prepareStatement(sql).executeQuery();
			while (rs.next()) {
				Job job = new Job();
				job.setId(rs.getInt("id"));
				job.setId_cpn(rs.getInt("id_cpn"));
				job.setName_cpn(CompanyDAO.getCompanyById(job.getId_cpn()).getName());
				job.setTitle(rs.getString("title"));
				job.setSort_desc(rs.getString("sort_desc"));
				job.setAddress(rs.getString("address"));
				job.setJob_type(rs.getString("job_type"));
				job.setJob_exp(rs.getString("job_exp"));
				job.setJob_salary(rs.getString("job_salary"));
				job.setJob_NoHW(rs.getString("job_NoHW"));
				job.setJob_degree(rs.getString("job_degree"));
				job.setTime_post(rs.getTimestamp("time_post"));
				list.add(job);
			}
			conn.close();
			
		} catch (Exception e) {e.printStackTrace();}
		
		return list;
		
	}
	
	public static int countJobByCompanyId(int id_cpn) {
		
		int count = 0;
		try {
			Connection conn = ConnectDB.getConnection();
			String sql = "select count(id_cpn) as numJob from job where id_cpn="+id_cpn;
			ResultSet rs = conn.prepareStatement(sql).executeQuery();
			while(rs.next()) {
				count = rs.getInt("numJob");
			}
			
			conn.close();
		} catch (Exception e) {e.printStackTrace();}
		return count;
	}
	
	public static void addJob(Job job, int id_user) {
		
		try {
			
			Connection conn = ConnectDB.getConnection();
			String sql = "insert into job(id_user, id_cpn, title, sort_desc, address, job_type, "
					+ "job_salary, job_exp, job_NoHW, job_degree) values (?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement stmt = (PreparedStatement) conn.prepareStatement(sql);
			stmt.setInt(1, id_user);
			stmt.setInt(2, job.getId_cpn());
			stmt.setString(3, job.getTitle());
			stmt.setString(4, job.getSort_desc());
			stmt.setString(5, job.getAddress());
			stmt.setString(6, job.getJob_type());
			stmt.setString(7, job.getJob_salary());
			stmt.setString(8, job.getJob_exp());
			stmt.setString(9, job.getJob_NoHW());
			stmt.setString(10, job.getJob_degree());
			stmt.executeUpdate();
			conn.close();
			
		} catch (Exception e) {e.printStackTrace();}
		
	}
	
	public static void updateJob(Job job) {
		
		try {
			
			Connection conn = ConnectDB.getConnection();
			String sql = "update job set id_cpn=?, title=?, sort_desc=?, address=?, "
					+ "job_type=?, job_salary=?, job_exp=?, job_NoHW=?, job_degree=? where id=?";
			PreparedStatement stmt = (PreparedStatement) conn.prepareStatement(sql);
			stmt.setInt(1, job.getId_cpn());
			stmt.setString(2, job.getTitle());
			stmt.setString(3, job.getSort_desc());
			stmt.setString(4, job.getAddress());
			stmt.setString(5, job.getJob_type());
			stmt.setString(6, job.getJob_salary());
			stmt.setString(7, job.getJob_exp());
			stmt.setString(8, job.getJob_NoHW());
			stmt.setString(9, job.getJob_degree());
			stmt.setInt(10, job.getId());
			stmt.executeUpdate();
			conn.close();
		} catch (Exception e) {e.printStackTrace();}
		
	}
	
	public static void deleteJob(int id_job) {
		
		try {
			
			Connection conn = ConnectDB.getConnection();
			String sql = "delete from job where id="+id_job;
			conn.prepareStatement(sql).executeUpdate();
			conn.close();
			
		} catch (Exception e) {e.printStackTrace();}
		
	}
	
	public static void setStatus(int id_job, String status) {
		
		try {
			
			Connection conn = ConnectDB.getConnection();
			String sql = "update job set status=? where id=?";
			PreparedStatement stmt = (PreparedStatement) conn.prepareStatement(sql);
			stmt.setString(1,status);
			stmt.setInt(2, id_job);
			stmt.executeUpdate();
			conn.close();
			
		} catch (Exception e) {e.printStackTrace();}
		
	}
	
}
