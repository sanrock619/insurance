package beans;

import java.io.Serializable;


public class PolicyTour extends Policy implements Serializable{
	
	private String location;

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}
}
