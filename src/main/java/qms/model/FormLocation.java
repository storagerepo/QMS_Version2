package qms.model;
import org.hibernate.validator.constraints.NotEmpty;
public class FormLocation {
	
	private String location_id;
	@NotEmpty
	private String form_location;
	
	
	public FormLocation() {
		super();
		// TODO Auto-generated constructor stub
	}


	public FormLocation(String location_id, String form_location) {
		super();
		this.location_id = location_id;
		this.form_location = form_location;
	}


	public String getLocation_id() {
		return location_id;
	}


	public void setLocation_id(String location_id) {
		this.location_id = location_id;
	}


	public String getForm_location() {
		return form_location;
	}


	public void setForm_location(String form_location) {
		this.form_location = form_location;
	}
	
	

}
