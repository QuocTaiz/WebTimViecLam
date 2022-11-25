package service;

public class Service {
	
	public static String getStringFromListString(String[] args) {
		
		String s = String.join(", ", args);
		return s;
		
	}
		
}
