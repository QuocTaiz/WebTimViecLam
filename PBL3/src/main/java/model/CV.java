package model;

import java.sql.Date;

public class CV {
	
	private int id;
	private String name;
	private String title;
	private String sort_desc;
	private String address;
	private int old;
	private String email;
	private String phone;
	private String exp;
	private String degree;
	private String img = null;
	private Date change_time;
	
	public CV() {}
	
	public CV(String name, String title, String sort_desc, String address, int old, String email, String phone,
			String exp, String degree) {
		super();
		this.name = name;
		this.title = title;
		this.sort_desc = sort_desc;
		this.address = address;
		this.old = old;
		this.email = email;
		this.phone = phone;
		this.exp = exp;
		this.degree = degree;
	}
	
	public CV(int id, String name, String title, String sort_desc, String address, int old, String email, String phone,
			String exp, String degree) {
		super();
		this.id = id;
		this.name = name;
		this.title = title;
		this.sort_desc = sort_desc;
		this.address = address;
		this.old = old;
		this.email = email;
		this.phone = phone;
		this.exp = exp;
		this.degree = degree;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	
	public int getOld() {
		return old;
	}
	public void setOld(int old) {
		this.old = old;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getExp() {
		return exp;
	}
	public void setExp(String exp) {
		this.exp = exp;
	}
	public String getDegree() {
		return degree;
	}
	public void setDegree(String degree) {
		this.degree = degree;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public Date getChange_time() {
		return change_time;
	}
	public void setChange_time(Date change_time) {
		this.change_time = change_time;
	}
	
	
}
