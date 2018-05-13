package beans;

import java.io.Serializable;


public class PolicyAccident extends Policy implements Serializable{
	
	private String auto;

	public String getAuto() {
		return auto;
	}

	public void setAuto(String auto) {
		this.auto = auto;
	}
}
