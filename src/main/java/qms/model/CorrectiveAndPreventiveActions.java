package qms.model;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class CorrectiveAndPreventiveActions
{
	public CorrectiveAndPreventiveActions() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CorrectiveAndPreventiveActions(String capa_id, String nc_id,
			String source_of_nonconformance, String external_id,
			String type_of_nonconformance, String date_found,
			String temporary_action, String nature_of_nc,
			String capa_requestor, String request_date, String capa_due_date,
			String assigned_team_leader, String team_members,
			String root_cause_analysis_file, String use_5_why_in_system,
			String why, String root_cause_statement,
			String upload_external_analysis, String action,
			String responsibility, String due_date, String completion_date,
			String verified_by, String verification_date, String attachment_name, String attachment_type,
			String attachment_referrence)
	// String attachment_name, String attachment_type,
	//String attachment_referrence
	{
		super();
		this.capa_id = capa_id;
		this.nc_id = nc_id;
		this.source_of_nonconformance = source_of_nonconformance;
		this.external_id = external_id;
		this.type_of_nonconformance = type_of_nonconformance;
		this.date_found = date_found;
		this.temporary_action = temporary_action;
		this.nature_of_nc = nature_of_nc;
		this.capa_requestor = capa_requestor;
		this.request_date = request_date;
		this.capa_due_date = capa_due_date;
		this.assigned_team_leader = assigned_team_leader;
		this.team_members = team_members;
		this.root_cause_analysis_file = root_cause_analysis_file;
		this.use_5_why_in_system = use_5_why_in_system;
		this.why = why;
		this.root_cause_statement = root_cause_statement;
		this.upload_external_analysis = upload_external_analysis;
		
		this.action = action;
		this.responsibility = responsibility;
		this.due_date = due_date;
		this.completion_date = completion_date;
		this.verified_by = verified_by;
		this.verification_date = verification_date;
		this.attachment_name = attachment_name;
		this.attachment_type = attachment_type;
		this.attachment_referrence = attachment_referrence;
	
	}
	private String auto_id;
	@NotEmpty
	private String capa_id;
	@NotEmpty
	private String nc_id;
	@NotEmpty
	private String source_of_nonconformance;
	@NotEmpty
	private String external_id;
	@NotEmpty
	private String type_of_nonconformance;
	@NotEmpty
	private String date_found;
	@NotEmpty
	private String temporary_action;
	@NotEmpty
	private String nature_of_nc;
	
	@NotEmpty
	private String capa_requestor;
	@NotEmpty
	private String request_date;
	@NotEmpty
	private String capa_due_date;
	
	
	@NotEmpty
	private String assigned_team_leader;
	@NotEmpty
	private String team_members;
	@NotEmpty
	private String root_cause_analysis_file;
	
	private String use_5_why_in_system;
	
	private String why;
	@NotEmpty
	private String root_cause_statement;
	
	private String upload_external_analysis;

	@NotEmpty
	private String action;
	@NotEmpty
	private String responsibility;
	@NotEmpty
	private String due_date;
	@NotEmpty
	private String completion_date;
	@NotEmpty
	private String verified_by;
	@NotEmpty
	private String verification_date;
	
	private CommonsMultipartFile attachments;
	private String attachment_name;	
	private String attachment_type;
	private String attachment_referrence;

	public String getNature_of_nc() {
		return nature_of_nc;
	}
	public void setNature_of_nc(String nature_of_nc) {
		this.nature_of_nc = nature_of_nc;
	}
	
	public String getAttachment_name() {
		return attachment_name;
	}

	public void setAttachment_name(String attachment_name) {
		this.attachment_name = attachment_name;
	}

	public String getAttachment_type() {
		return attachment_type;
	}

	public void setAttachment_type(String attachment_type) {
		this.attachment_type = attachment_type;
	}

	public String getAttachment_referrence() {
		return attachment_referrence;
	}

	public void setAttachment_referrence(String attachment_referrence) {
		this.attachment_referrence = attachment_referrence;
	}

	
	public CommonsMultipartFile getAttachments() {
		return attachments;
	}

	public void setAttachments(CommonsMultipartFile attachments) {
		this.attachments = attachments;
	}

	public String getRoot_cause_statement() {
		return root_cause_statement;
	}
	public void setRoot_cause_statement(String root_cause_statement) {
		this.root_cause_statement = root_cause_statement;
	}
	public String getNc_id() {
		return nc_id;
	}
	public String getCapa_id() {
		return capa_id;
	}
	public void setCapa_id(String capa_id) {
		this.capa_id = capa_id;
	}
	public void setNc_id(String nc_id) {
		this.nc_id = nc_id;
	}
	public String getSource_of_nonconformance() {
		return source_of_nonconformance;
	}
	public void setSource_of_nonconformance(String source_of_nonconformance) {
		this.source_of_nonconformance = source_of_nonconformance;
	}
	public String getExternal_id() {
		return external_id;
	}
	public void setExternal_id(String external_id) {
		this.external_id = external_id;
	}
	public String getType_of_nonconformance() {
		return type_of_nonconformance;
	}
	public void setType_of_nonconformance(String type_of_nonconformance) {
		this.type_of_nonconformance = type_of_nonconformance;
	}
	public String getDate_found() {
		return date_found;
	}
	public void setDate_found(String date_found) {
		this.date_found = date_found;
	}
	public String getTemporary_action() {
		return temporary_action;
	}
	public void setTemporary_action(String temporary_action) {
		this.temporary_action = temporary_action;
	}
	public String getCapa_requestor() {
		return capa_requestor;
	}
	public void setCapa_requestor(String capa_requestor) {
		this.capa_requestor = capa_requestor;
	}
	public String getRequest_date() {
		return request_date;
	}
	public void setRequest_date(String request_date) {
		this.request_date = request_date;
	}
	public String getCapa_due_date() {
		return capa_due_date;
	}
	public void setCapa_due_date(String capa_due_date) {
		this.capa_due_date = capa_due_date;
	}
	public String getAssigned_team_leader() {
		return assigned_team_leader;
	}
	public void setAssigned_team_leader(String assigned_team_leader) {
		this.assigned_team_leader = assigned_team_leader;
	}
	public String getTeam_members() {
		return team_members;
	}
	public void setTeam_members(String team_members) {
		this.team_members = team_members;
	}
	public String getRoot_cause_analysis_file() {
		return root_cause_analysis_file;
	}
	public void setRoot_cause_analysis_file(String root_cause_analysis_file) {
		this.root_cause_analysis_file = root_cause_analysis_file;
	}
	public String getUse_5_why_in_system() {
		return use_5_why_in_system;
	}
	public void setUse_5_why_in_system(String use_5_why_in_system) {
		this.use_5_why_in_system = use_5_why_in_system;
	}
	public String getWhy() {
		return why;
	}
	public void setWhy(String why) {
		this.why = why;
	}
	
	public String getUpload_external_analysis() {
		return upload_external_analysis;
	}
	public void setUpload_external_analysis(String upload_external_analysis) {
		this.upload_external_analysis = upload_external_analysis;
	}
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
	public String getResponsibility() {
		return responsibility;
	}
	public void setResponsibility(String responsibility) {
		this.responsibility = responsibility;
	}
	public String getDue_date() {
		return due_date;
	}
	public void setDue_date(String due_date) {
		this.due_date = due_date;
	}
	public String getCompletion_date() {
		return completion_date;
	}
	public void setCompletion_date(String completion_date) {
		this.completion_date = completion_date;
	}
	public String getVerified_by() {
		return verified_by;
	}
	public void setVerified_by(String verified_by) {
		this.verified_by = verified_by;
	}
	public String getVerification_date() {
		return verification_date;
	}
	public void setVerification_date(String verification_date) {
		this.verification_date = verification_date;
	}
	
	
}