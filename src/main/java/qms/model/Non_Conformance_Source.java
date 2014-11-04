package qms.model;
import org.hibernate.validator.constraints.NotEmpty;
public class Non_Conformance_Source
{
	
	private int auto_id;
	@NotEmpty
	private String source_of_nc;
	public Non_Conformance_Source() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Non_Conformance_Source(int auto_id,String source_of_nc) {
		super();
		this.auto_id = auto_id;
		this.source_of_nc = source_of_nc;
	}

	public int getAuto_id() {
		return auto_id;
	}

	public void setAuto_id(int auto_id) {
		this.auto_id = auto_id;
	}

	public String getSource_of_nc() {
		return source_of_nc;
	}

	public void setSource_of_nc(String source_of_nc) {
		this.source_of_nc = source_of_nc;
	}
	
}