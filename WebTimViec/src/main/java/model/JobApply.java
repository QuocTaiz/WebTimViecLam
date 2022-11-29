package model;

import java.sql.Date;

public class JobApply {
	private int id;
	private int id_job;
	private Date apply_time;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getId_job() {
		return id_job;
	}
	public void setId_job(int id_job) {
		this.id_job = id_job;
	}
	public Date getApply_time() {
		return apply_time;
	}
	public void setApply_time(Date apply_time) {
		this.apply_time = apply_time;
	}
	
	

}
