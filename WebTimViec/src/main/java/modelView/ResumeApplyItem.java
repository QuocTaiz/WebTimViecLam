package modelView;


import java.sql.Timestamp;

import model.CV;

public class ResumeApplyItem extends CV{
	
	private Timestamp apply_time;

	public Timestamp getApply_time() {
		return apply_time;
	}

	public void setApply_time(Timestamp apply_time) {
		this.apply_time = apply_time;
	}
	
	
	
}
