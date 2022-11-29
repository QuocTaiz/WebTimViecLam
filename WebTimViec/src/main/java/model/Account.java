package model;

public class Account {
	
	private int id = 0;
	private String email = "";
	private String password = "";
	private String role = "";
	private boolean isBlock;
	
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public boolean isBlock() {
		return isBlock;
	}
	public void setBlock(boolean isBlock) {
		this.isBlock = isBlock;
	}
	
	
}
