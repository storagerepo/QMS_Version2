package qms.model;

import org.hibernate.validator.constraints.NotEmpty;

public class DocumentLocation {

	@NotEmpty
	private String id;
	private String doc_location;
	
	public DocumentLocation(String id,String doc_location)
	{
		super();
		this.id = id;
		this.doc_location = doc_location;
	}
	
	public DocumentLocation()
	{
		super();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDoc_location() {
		return doc_location;
	}

	public void setDoc_location(String doc_location) {
		this.doc_location = doc_location;
	}
}

	