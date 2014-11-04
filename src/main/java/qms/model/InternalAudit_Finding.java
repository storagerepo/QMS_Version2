package qms.model;

public class InternalAudit_Finding {

	private String id;
	private String finding;
	public InternalAudit_Finding() {
		super();
		// TODO Auto-generated constructor stub
	}
	public InternalAudit_Finding(String id, String finding) {
		super();
		this.id = id;
		this.finding = finding;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getFinding() {
		return finding;
	}
	public void setFinding(String finding) {
		this.finding = finding;
	}
	
}
