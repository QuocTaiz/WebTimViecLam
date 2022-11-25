package modelView;

import java.sql.Timestamp;

import model.Job;

public class JobAppliedItem extends Job{
	
	
	private int id_job_apply;
	private int id_cv;
	private Timestamp apply_time;
	
	public int getId_job_apply() {
		return id_job_apply;
	}
	public void setId_job_apply(int id_job_apply) {
		this.id_job_apply = id_job_apply;
	}
	public int getId_cv() {
		return id_cv;
	}
	public void setId_cv(int id_cv) {
		this.id_cv = id_cv;
	}
	public Timestamp getApply_time() {
		return apply_time;
	}
	public void setApply_time(Timestamp apply_time) {
		this.apply_time = apply_time;
	}
	
	
	
}
