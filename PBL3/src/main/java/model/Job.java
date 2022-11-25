package model;

import java.sql.Timestamp;

public class Job {
	
	private int id;
	private int id_cpn;
	private String name_cpn;
	private String title;
	private String sort_desc;
	private String address;
	private String job_type;
	private String job_salary;
	private String job_exp;
	private String job_NoHW;
	private String job_degree;
	private Timestamp time_post = null;
	private int num_job_apply;
	private String status;
	
	
	public Job() {
		
	}
	
	
	
	public Job(int id, int id_cpn, String name_cpn, String title, String sort_desc, String address, String job_type,
			String job_salary, String job_exp, String job_NoHW, String job_degree) {
		super();
		this.id = id;
		this.id_cpn = id_cpn;
		this.name_cpn = name_cpn;
		this.title = title;
		this.sort_desc = sort_desc;
		this.address = address;
		this.job_type = job_type;
		this.job_salary = job_salary;
		this.job_exp = job_exp;
		this.job_NoHW = job_NoHW;
		this.job_degree = job_degree;
	}



	public Job(int id_cpn, String name_cpn, String title, String sort_desc, String address, String job_type, String job_salary,
			String job_exp, String job_NoHW, String job_degree) {
		
		this.id_cpn = id_cpn;
		this.name_cpn = name_cpn;
		this.title = title;
		this.sort_desc = sort_desc;
		this.address = address;
		this.job_type = job_type;
		this.job_salary = job_salary;
		this.job_exp = job_exp;
		this.job_NoHW = job_NoHW;
		this.job_degree = job_degree;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getId_cpn() {
		return id_cpn;
	}
	public void setId_cpn(int id_cpn) {
		this.id_cpn = id_cpn;
	}
	public String getName_cpn() {
		return name_cpn;
	}
	public void setName_cpn(String name_cpn) {
		this.name_cpn = name_cpn;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSort_desc() {
		return sort_desc;
	}
	public void setSort_desc(String sort_desc) {
		this.sort_desc = sort_desc;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getJob_type() {
		return job_type;
	}
	public void setJob_type(String job_type) {
		this.job_type = job_type;
	}
	public String getJob_salary() {
		return job_salary;
	}
	public void setJob_salary(String job_salary) {
		this.job_salary = job_salary;
	}
	public String getJob_exp() {
		return job_exp;
	}
	public void setJob_exp(String job_exp) {
		this.job_exp = job_exp;
	}
	public String getJob_NoHW() {
		return job_NoHW;
	}
	public void setJob_NoHW(String job_NoHW) {
		this.job_NoHW = job_NoHW;
	}
	public String getJob_degree() {
		return job_degree;
	}
	public void setJob_degree(String job_degree) {
		this.job_degree = job_degree;
	}
	public Timestamp getTime_post() {
		return time_post;
	}
	public void setTime_post(Timestamp time_post) {
		this.time_post = time_post;
	}
	public int getNum_job_apply() {
		return num_job_apply;
	}
	public void setNum_job_apply(int num_job_apply) {
		this.num_job_apply = num_job_apply;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	} 
	
	
}
