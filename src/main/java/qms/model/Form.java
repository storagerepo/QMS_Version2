package qms.model;

import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.Length;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class Form {
	
	/*private String document_type_id;*/
	private String auto_number;

	@NotEmpty
	private String location;
	
    @NotEmpty

    private String form_or_rec_id;

    @NotEmpty

	private String responsibility;

    @NotEmpty

	private String form_or_rec_title;

    @NotEmpty
	private String process;
	
	@NotEmpty
	private String media_type;
	
	@NotEmpty
	private String retention_time;
	
	@NotEmpty
	private String form;
	
    private CommonsMultipartFile attachments;
	
	private String attachment_name;	
	
	private String attachment_type;
	
	private String attachment_referrence;
	
	
	private String document_type_id;
	
	
	private String document_type_id1;
	
	private String auto_no;
	
	@NotEmpty
	private String effective_date;
	
	@NotEmpty
	private String document_id;
	
	@NotEmpty
	private String approver1;
	
	@NotEmpty
	private String issuer;
	
	@NotEmpty

	private String comments;

	
    private String revision_id;
	
	public Form() {
		super();
		// TODO Auto-generated constructor stub
	}




	public Form(String auto_number, String location, String form_or_rec_id,
			String responsibility, String form_or_rec_title, String process,
			String media_type, String retention_time, String form,String  attachment_name,String attachment_type, String attachment_referrence,
			String auto_no, String effective_date, String document_id,
			String approver1, String issuer, String comments, String revision_id) {
		super();
		this.auto_number = auto_number;
		this.location = location;
		this.form_or_rec_id = form_or_rec_id;
		this.responsibility = responsibility;
		this.form_or_rec_title = form_or_rec_title;
		this.process = process;
		this.media_type = media_type;
		this.retention_time = retention_time;
		this.form = form;
		this.attachment_referrence=attachment_referrence;
		this.attachment_name=attachment_name;
		this.attachment_type=attachment_type;
		this.auto_no = auto_no;
		this.effective_date = effective_date;
		this.document_id = document_id;
		this.approver1 = approver1;
		this.issuer = issuer;
		this.comments = comments;
		this.revision_id = revision_id;
		
	}




	public Form(String location, String form_or_rec_id, String responsibility,
			String form_or_rec_title, String process, String media_type,
			String retention_time, String form, String attachment_name,
			String attachment_type, String attachment_referrence) {
		super();
		this.location = location;
		this.form_or_rec_id = form_or_rec_id;
		this.responsibility = responsibility;
		this.form_or_rec_title = form_or_rec_title;
		this.process = process;
		this.media_type = media_type;
		this.retention_time = retention_time;
		this.form = form;
		this.attachment_name = attachment_name;
		this.attachment_type = attachment_type;
		this.attachment_referrence = attachment_referrence;
	}




	public String getAuto_number() {
		return auto_number;
	}




	public void setAuto_number(String auto_number) {
		this.auto_number = auto_number;
	}




	public String getLocation() {
		return location;
	}




	public void setLocation(String location) {
		this.location = location;
	}




	public String getForm_or_rec_id() {
		return form_or_rec_id;
	}




	public void setForm_or_rec_id(String form_or_rec_id) {
		this.form_or_rec_id = form_or_rec_id;
	}




	public String getResponsibility() {
		return responsibility;
	}




	public void setResponsibility(String responsibility) {
		this.responsibility = responsibility;
	}




	public String getForm_or_rec_title() {
		return form_or_rec_title;
	}




	public void setForm_or_rec_title(String form_or_rec_title) {
		this.form_or_rec_title = form_or_rec_title;
	}




	public String getProcess() {
		return process;
	}




	public void setProcess(String process) {
		this.process = process;
	}




	public String getMedia_type() {
		return media_type;
	}




	public void setMedia_type(String media_type) {
		this.media_type = media_type;
	}




	public String getRetention_time() {
		return retention_time;
	}




	public void setRetention_time(String retention_time) {
		this.retention_time = retention_time;
	}




	public String getForm() {
		return form;
	}




	public void setForm(String form) {
		this.form = form;
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
	

	public String getAuto_no() {
		return auto_no;
	}




	public void setAuto_no(String auto_no) {
		this.auto_no = auto_no;
	}




	public String getEffective_date() {
		return effective_date;
	}




	public void setEffective_date(String effective_date) {
		this.effective_date = effective_date;
	}




	public String getDocument_id() {
		return document_id;
	}




	public void setDocument_id(String document_id) {
		this.document_id = document_id;
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




	public String getDocument_type_id() {
		return document_type_id;
	}




	public void setDocument_type_id(String document_type_id) {
		this.document_type_id = document_type_id;
	}




	public String getDocument_type_id1() {
		return document_type_id1;
	}




	public void setDocument_type_id1(String document_type_id1) {
		this.document_type_id1 = document_type_id1;
	}




	public String getRevision_id() {
		return revision_id;
	}




	public void setRevision_id(String revision_id) {
		this.revision_id = revision_id;
	}




	




	
	
}
