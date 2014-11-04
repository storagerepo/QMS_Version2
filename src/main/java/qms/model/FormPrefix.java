package qms.model;
import org.hibernate.validator.constraints.NotEmpty;
public class FormPrefix {
	private String id;
	@NotEmpty
	private String form_name;
	@NotEmpty
	private String form_prefix;
	
	public FormPrefix() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FormPrefix(String id,String form_name, String form_prefix) {
		super();
		this.id = id;
		this.form_name = form_name;
		this.form_prefix = form_prefix;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getForm_prefix() {
		return form_prefix;
	}
	public void setForm_prefix(String form_prefix) {
		this.form_prefix = form_prefix;
	}
	public String getForm_name() {
		return form_name;
	}
	public void setForm_name(String form_name) {
		this.form_name = form_name;
	}
	
	

}
