package dao;

import java.sql.ResultSet;
import java.util.List;
import java.util.Vector;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import model.CV;
import model.Job;
import modelView.JobAppliedItem;
import modelView.ResumeApplyItem;

public class JobApplyDAO {
	
	public static void addJobApply(int id_user, int id_cv, int id_job) {
		
		try {
			
			Connection conn = ConnectDB.getConnection();
			String sql = "insert into apply_job(id_user,id_cv,id_job) values (?,?,?)";
			PreparedStatement stmt = (PreparedStatement) conn.prepareStatement(sql);
			stmt.setInt(1, id_user);
			stmt.setInt(2, id_cv);
			stmt.setInt(3, id_job);
			stmt.executeUpdate();
			conn.close();
			
		}catch (Exception e) {e.printStackTrace();}
		
	}
	
	public static void deleteJobApply(int id_job_apply) {
		
		try {
			
			Connection conn = ConnectDB.getConnection();
			String sql = "delete from apply_job where id="+id_job_apply;
			conn.prepareStatement(sql).executeUpdate();
			conn.close();
			
		} catch (Exception e) {e.printStackTrace();}
		
	}
	
	public static int countJobApplyByIDJob(int id_job) {
		int count = 0;
		try {
			
			Connection conn = ConnectDB.getConnection();
			String sql = "select count(id_job) as numJobApply from apply_job where id_job="+id_job;
			ResultSet rs = conn.prepareStatement(sql).executeQuery();
			while (rs.next()) {
				count = rs.getInt("numJobApply");
			}
			conn.close();
			
		} catch (Exception e) {e.printStackTrace();}
		return count;
	}
	
	public static List<ResumeApplyItem> getListJobApply(int id_job){
		
		List<ResumeApplyItem> list = new Vector<ResumeApplyItem>();
		
		try {
			
			Connection conn = ConnectDB.getConnection();
			String sql = "select * from apply_job where id_job="+id_job+" order by apply_time desc";
			ResultSet rs = conn.prepareStatement(sql).executeQuery();
			while (rs.next()) {
				ResumeApplyItem data = new ResumeApplyItem();
				data.setApply_time(rs.getTimestamp("apply_time"));
				CV cv = ResumeDAO.getCVFromId(rs.getInt("id_cv"));
				data.setId(cv.getId());
				data.setName(cv.getName());
				data.setTitle(cv.getTitle());
				data.setSort_desc(cv.getSort_desc());
				data.setAddress(cv.getAddress());
				data.setExp(cv.getExp());
				data.setDegree(cv.getDegree());
				list.add(data);
			}
			conn.close();
			
		} catch (Exception e) {e.printStackTrace();}
		
		return list;
		
	}
	
	public static List<ResumeApplyItem> getListJobApplyFromSearch(int id_job, String keySearch, String degree, String sort_type){
		
		List<ResumeApplyItem> list = new Vector<ResumeApplyItem>();
		
		try {
			
			Connection conn = ConnectDB.getConnection();
			String sql = "select * from apply_job as aj,cv where aj.id_cv=cv.id and aj.id_job="+id_job;
			if (keySearch != "") {
				sql +=" and cv.name like '%"+keySearch+"%'";
			}
			if (!degree.contains("Tất cả bằng cấp")) {
				sql +=" and cv.degree like '%"+degree+"%'";
			}
			switch (sort_type) {
			
				case "Mới nhất": {
					sql +=" order by aj.apply_time desc";
					break;
				}
				case "Cũ nhất": {
					sql +=" order by aj.apply_time asc";
					break;
				}
				case "Tên (A -> Z)": {
					sql +="order by cv.name asc";
					break;
				}
				case "Tên (Z -> A)": {
					sql +="order by cv.name desc";
					break;
				}
			
			}
			
			ResultSet rs =conn.prepareStatement(sql).executeQuery();
			while(rs.next()) {
				ResumeApplyItem data = new ResumeApplyItem();
				data.setApply_time(rs.getTimestamp("apply_time"));
				CV cv = ResumeDAO.getCVFromId(rs.getInt("id_cv"));
				data.setId(cv.getId());
				data.setName(cv.getName());
				data.setTitle(cv.getTitle());
				data.setSort_desc(cv.getSort_desc());
				data.setAddress(cv.getAddress());
				data.setExp(cv.getExp());
				data.setDegree(cv.getDegree());
				list.add(data);
			}
			conn.close();
			
		} catch (Exception e) {e.printStackTrace();}
		
		return list;
		
	}
	
	public static List<JobAppliedItem> getJobApplied(int id_user){
		
		List<JobAppliedItem> list = new Vector<JobAppliedItem>();
		
		try {
			
			Connection conn = ConnectDB.getConnection();
			String sql = "select * from apply_job where id_user="+id_user;
			ResultSet rs = conn.prepareStatement(sql).executeQuery();
			
			while (rs.next()) {
				JobAppliedItem data = new JobAppliedItem();
				Job job = JobDAO.getJobById(rs.getInt("id_job"));
				data.setId(job.getId());
				data.setTitle(job.getTitle());
				data.setName_cpn(job.getName_cpn());
				data.setAddress(job.getAddress());
				data.setApply_time(rs.getTimestamp("apply_time"));
				data.setId_cv(rs.getInt("id_cv"));
				data.setId_job_apply(rs.getInt("id"));
				list.add(data);
			}
			conn.close();
			
		} catch (Exception e) {e.printStackTrace();}
		
		return list;
		
	}
}
