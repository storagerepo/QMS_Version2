package qms.model;

public class ExternalDocument
{
	private String edocument_id;
	
	private String issuer;
	
	private String revision_level;
	
	private String date;
	
	private String approver1;
	
	private String approver2;
	
	private String approver3;
	
	private String comments;
	
	private String status;

	

	public ExternalDocument() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getEdocument_id() {
		return edocument_id;
	}

	public void setEdocument_id(String edocument_id) {
		this.edocument_id = edocument_id;
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
	
	public ExternalDocument(String edocument_id, String issuer,
			String revision_level, String date, String approver1,
			String approver2, String approver3, String comments, String status) {
		super();
		this.edocument_id = edocument_id;
		this.issuer = issuer;
		this.revision_level = revision_level;
		this.date = date;
		this.approver1 = approver1;
		this.approver2 = approver2;
		this.approver3 = approver3;
		this.comments = comments;
		this.status = status;
	}
	
	
	
}