package qms.model;

import org.hibernate.validator.constraints.NotEmpty;
public class DocumentPrefix {
	private String id;
	@NotEmpty
	private String doc_prefix;
	
	
	private String document_id;
	
	
	
	
	public DocumentPrefix() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DocumentPrefix(String id,String doc_prefix, String document_id) {
		super();
		this.id = id;
		this.doc_prefix = doc_prefix;
		this.document_id = document_id;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDoc_prefix() {
		return doc_prefix;
	}
	public void setDoc_prefix(String doc_prefix) {
		this.doc_prefix = doc_prefix;
	}
	public String getDocument_id() {
		return document_id;
	}
	public void setDocument_id(String document_id) {
		this.document_id = document_id;
	}
	
	

}
