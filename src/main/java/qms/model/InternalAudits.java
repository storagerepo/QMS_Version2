package qms.model;

import org.hibernate.validator.constraints.NotEmpty;

public class InternalAudits{
	
	private String id;
	
	@NotEmpty
	private String process;
	
	@NotEmpty
	private String audit_start_date;
	
	@NotEmpty
	private String audit_due_date;
	
	private String auditor;
	@NotEmpty
	private String auditor_notes;
	
	private String finding;
	
	@NotEmpty
	private String completion_date;
	
	@NotEmpty
	private String auditors_initials;
	
	@NotEmpty
	private String auditee_name;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
	
	public InternalAudits()
	{
		super();
		// TODO Auto-generated constructor stub
	}
	public InternalAudits(String id, String process,
			String audit_start_date, String audit_due_date, String auditor,
			String auditor_notes, String finding, String completion_date,
			String auditors_initials, String auditee_name) {
		super();
		this.id = id;
		this.process = process;
		this.audit_start_date = audit_start_date;
		this.audit_due_date = audit_due_date;
		this.auditor = auditor;
		this.auditor_notes = auditor_notes;
		this.finding = finding;
		this.completion_date = completion_date;
		this.auditors_initials = auditors_initials;
		this.auditee_name = auditee_name;
	
	
	}
	
	public String getProcess() {
		return process;
	}
	public void setProcess(String process) {
		this.process = process;
	}
	public String getAudit_start_date() {
		return audit_start_date;
	}
	public void setAudit_start_date(String audit_start_date) {
		this.audit_start_date = audit_start_date;
	}
	public String getAudit_due_date() {
		return audit_due_date;
	}
	public void setAudit_due_date(String audit_due_date) {
		this.audit_due_date = audit_due_date;
	}
	public String getAuditor() {
		return auditor;
	}
	public void setAuditor(String auditor) {
		this.auditor = auditor;
	}
	public String getAuditor_notes() {
		return auditor_notes;
	}
	public void setAuditor_notes(String auditor_notes) {
		this.auditor_notes = auditor_notes;
	}
	public String getFinding() {
		return finding;
	}
	public void setFinding(String finding) {
		this.finding = finding;
	}
	public String getCompletion_date() {
		return completion_date;
	}
	public void setCompletion_date(String completion_date) {
		this.completion_date = completion_date;
	}
	public String getAuditors_initials() {
		return auditors_initials;
	}
	public void setAuditors_initials(String auditors_initials) {
		this.auditors_initials = auditors_initials;
	}
	public String getAuditee_name() {
		return auditee_name;
	}
	public void setAuditee_name(String auditee_name) {
		this.auditee_name = auditee_name;
	}
}
	