package qms.model;

public class RevisionForm
{
	private String auto_no;
	private String document_id;
	private String effective_date;
	private String approver1;
	private String issuer;
	private String comments;
	private String revision_id;
	public RevisionForm() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public RevisionForm(String auto_no,String document_id, String effective_date,
			String approver1, String issuer, String comments, String revision_id) {
		super();
		this.auto_no = auto_no;
		this.document_id = document_id;
		this.effective_date = effective_date;
		this.approver1 = approver1;
		this.issuer = issuer;
		this.comments = comments;
		this.revision_id = revision_id;
	}


	
	public String getAuto_no() {
		return auto_no;
	}


	public void setAuto_no(String auto_no) {
		this.auto_no = auto_no;
	}


	public String getDocument_id() {
		return document_id;
	}


	public void setDocument_id(String document_id) {
		this.document_id = document_id;
	}


	public String getEffective_date() {
		return effective_date;
	}
	public void setEffective_date(String effective_date) {
		this.effective_date = effective_date;
	}
	public String getApprover1() {
		return approver1;
	}
	public void setApprover1(String approver1) {
		this.approver1 = approver1;
	}
	public String getIssuer() {
		return issuer;
	}
	public void setIssuer(String issuer) {
		this.issuer = issuer;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public String getRevision_id() {
		return revision_id;
	}
	public void setRevision_id(String revision_id) {
		this.revision_id = revision_id;
	}
	
	
	
	
	
}