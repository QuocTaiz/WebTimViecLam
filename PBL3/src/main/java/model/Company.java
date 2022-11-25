package model;



public class Company {
	
	private int id;
	private String name;
	private String title;
	private String sort_desc;
	private String address;
	private int num_employees;
	private String website;
	private String phone;
	private String email;
	private String img = null;
	private int numJob = 0;
	
	public Company() {
		
	}
	
	public Company(int id, String name, String title, String sort_desc, String address, int num_employees,
				String website, String phone, String email) {
		
		this.id = id;
		this.name = name;
		this.title = title;
		this.sort_desc = sort_desc;
		this.address = address;
		this.num_employees = num_employees;
		this.website = website;
		this.phone = phone;
		this.email = email;
	}
	
	public Company(String name, String title, String sort_desc, String address, int num_employees,
			String website, String phone, String email) {
	
		this.name = name;
		this.title = title;
		this.sort_desc = sort_desc;
		this.address = address;
		this.num_employees = num_employees;
		this.website = website;
		this.phone = phone;
		this.email = email;
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
	public int getNum_employees() {
		return num_employees;
	}
	public void setNum_employees(int num_employees) {
		this.num_employees = num_employees;
	}
	public String getWebsite() {
		return website;
	}
	public void setWebsite(String website) {
		this.website = website;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public int getNumJob() {
		return numJob;
	}

	public void setNumJob(int numJob) {
		this.numJob = numJob;
	}
	
	
}
