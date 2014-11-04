package qms.model;
import org.hibernate.validator.constraints.NotEmpty;
public class ReportedByNC {
	
	private int auto_id;
	private String type_of_nc;
	@NotEmpty
	private String group_person;
	
	public ReportedByNC(){
		super();
	}
	public ReportedByNC(int auto_id,String type_of_nc,String group_person)
	{
		super();
		this.auto_id = auto_id;
		this.type_of_nc = type_of_nc;
		this.group_person = group_person;
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

	public String getGroup_person() {
		return group_person;
	}

	public void setGroup_person(String group_person) {
		this.group_person = group_person;
	}

	
}
