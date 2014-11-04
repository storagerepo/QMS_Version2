package qms.model;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class InstructionMaintenance {
	
	private String auto_id;
	

	
	private CommonsMultipartFile attachments;
	
	private String attachment_name;	
	
	private String attachment_type;
	
	private String attachment_referrence;

	public InstructionMaintenance() {
		super();
		// TODO Auto-generated constructor stub
	}

	public InstructionMaintenance(String auto_id,
			
			String attachment_name, String attachment_type,
			String attachment_referrence) {
		super();
		this.auto_id = auto_id;
	
		this.attachment_name = attachment_name;
		this.attachment_type = attachment_type;
		this.attachment_referrence = attachment_referrence;
	}

	public String getAuto_id() {
		return auto_id;
	}

	public void setAuto_id(String auto_id) {
		this.auto_id = auto_id;
	}


	public CommonsMultipartFile getAttachments() {
		return attachments;
	}

	public void setAttachments(CommonsMultipartFile attachments) {
		this.attachments = attachments;
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

	
	
}
