package qms.model;

import org.hibernate.validator.constraints.NotEmpty;

public class DocumentIssuer {

	@NotEmpty
	private String auto_id;
	@NotEmpty
	private String issuer;
	
	public DocumentIssuer(String auto_id,String issuer)
	{
		super();
		this.auto_id = auto_id;
		this.issuer = issuer;
	}
	
	public DocumentIssuer()
	{
		super();
	}

	public String getAuto_id() {
		return auto_id;
	}

	public void setAuto_id(String auto_id) {
		this.auto_id = auto_id;
	}

	public String getIssuer() {
		return issuer;
	}

	public void setIssuer(String issuer) {
		this.issuer = issuer;
	}
	
}
