package qms.model;

public class RevisionDocument {
	private String auto_number;
	private String document_id;
	private String issuer;
	private String revision_level;
	private String date;
	private String approver1;
	private String approver2;
	private String approver3;
	private String comments;
	private String status;
	private String revision_id;
	

	public RevisionDocument()
	{
		super();
	}


	public RevisionDocument(String auto_number, String document_id,
			String issuer, String revision_level, String date,
			String approver1, String approver2, String approver3,
			String comments, String status, String revision_id) {
		super();
		this.auto_number = auto_number;
		this.document_id = document_id;
		this.issuer = issuer;
		this.revision_level = revision_level;
		this.date = date;
		this.approver1 = approver1;
		this.approver2 = approver2;
		this.approver3 = approver3;
		this.comments = comments;
		this.status = status;
		this.revision_id = revision_id;
	}


	public String getAuto_number() {
		return auto_number;
	}


	public void setAuto_number(String auto_number) {
		this.auto_number = auto_number;
	}


	public String getDocument_id() {
		return document_id;
	}


	public void setDocument_id(String document_id) {
		this.document_id = document_id;
	}


	public String getIssuer() {
		return issuer;
	}


	public void setIssuer(String issuer) {
		this.issuer = issuer;
	}


	public String getRevision_level() {
		return revision_level;
	}


	public void setRevision_level(String revision_level) {
		this.revision_level = revision_level;
	}


	public String getDate() {
		return date;
	}


	public void setDate(String date) {
		this.date = date;
	}


	public String getApprover1() {
		return approver1;
	}


	public void setApprover1(String approver1) {
		this.approver1 = approver1;
	}


	public String getApprover2() {
		return approver2;
	}


	public void setApprover2(String approver2) {
		this.approver2 = approver2;
	}


	public String getApprover3() {
		return approver3;
	}


	public void setApprover3(String approver3) {
		this.approver3 = approver3;
	}


	public String getComments() {
		return comments;
	}


	public void setComments(String comments) {
		this.comments = comments;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public String getRevision_id() {
		return revision_id;
	}


	public void setRevision_id(String revision_id) {
		this.revision_id = revision_id;
	}
	
	
	
	
}
