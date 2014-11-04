package qms.model;

import org.hibernate.validator.constraints.NotEmpty;

public class DocumentType {
	@NotEmpty
	private String document_type;
	private String id;

	public DocumentType(String id,String document_type)
	{
		super();
		this.id = id;
		this.document_type = document_type;
	}
	public DocumentType() {
		super();
		
	}
	public String getDocument_type() {
		return document_type;
	}
	public void setDocument_type(String document_type) {
		this.document_type = document_type;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
	

}
