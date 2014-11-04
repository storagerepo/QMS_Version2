package qms.model;

import org.hibernate.validator.constraints.NotEmpty;

public class Type_of_NC {
	private int auto_id;
	@NotEmpty
	private String type_of_nc;
	public Type_of_NC() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Type_of_NC(int auto_id, String type_of_nc) {
		super();
		this.auto_id = auto_id;
		this.type_of_nc = type_of_nc;
	}
	public int getAuto_id() {
		return auto_id;
	}
	public void setAuto_id(int auto_id) {
		this.auto_id = auto_id;
	}
	public String getType_of_nc() {
		return type_of_nc;
	}
	public void setType_of_nc(String type_of_nc) {
		this.type_of_nc = type_of_nc;
	}

}
