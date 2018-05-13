package beans;

import java.io.Serializable;


public class PolicyLife extends Policy implements Serializable{

	private int years;

	public int getYears() {
		return years;
	}

	public void setYears(int years) {
		this.years = years;
	}


}
