package qms.model;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class CustomerFeedback
{
	private String feedback_id;
	
	@NotEmpty
	private String date_of_feedback;
	private String type_of_feedback;
	private String feedback_recorded_by;
	
	@NotEmpty
	private String feedback_details;
	private CommonsMultipartFile attachments;
	private String attachment_name;	
	private String attachment_type;
	private String attachment_referrence;
		
	public CustomerFeedback(String feedback_id, String date_of_feedback,
			String type_of_feedback, String feedback_recorded_by,
			String feedback_details,String attachment_name,
			String attachment_type, String attachment_referrence) {
		super();
		this.feedback_id = feedback_id;
		this.date_of_feedback = date_of_feedback;
		this.type_of_feedback = type_of_feedback;
		this.feedback_recorded_by = feedback_recorded_by;
		this.feedback_details = feedback_details;
		this.attachment_name = attachment_name;
		this.attachment_type = attachment_type;
		this.attachment_referrence = attachment_referrence;
	}
	
	public String getFeedback_id() {
		return feedback_id;
	}
	public void setFeedback_id(String feedback_id) {
		this.feedback_id = feedback_id;
	}
	public String getAttachment_name() {
		return attachment_name;
	}
	public void setAttachment_name(String attachment_name) {
		this.attachment_name = attachment_name;
	}
		
	public String getAttachment_referrence() {
		return attachment_referrence;
	}
	public void setAttachment_referrence(String attachment_referrence) {
		this.attachment_referrence = attachment_referrence;
	}	
	public String getAttachment_type() {
		return attachment_type;
	}
	public void setAttachments_type(String attachment_type) {
		this.attachment_type = attachment_type;
	}
	public CustomerFeedback() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getDate_of_feedback() {
		return date_of_feedback;
	}
	public void setDate_of_feedback(String date_of_feedback) {
		this.date_of_feedback = date_of_feedback;
	}
	public String getType_of_feedback() {
		return type_of_feedback;
	}
	public void setType_of_feedback(String type_of_feedback) {
		this.type_of_feedback = type_of_feedback;
	}
	public String getFeedback_recorded_by() {
		return feedback_recorded_by;
	}
	public void setFeedback_recorded_by(String feedback_recorded_by) {
		this.feedback_recorded_by = feedback_recorded_by;
	}
	public String getFeedback_details() {
		return feedback_details;
	}
	public void setFeedback_details(String feedback_details) {
		this.feedback_details = feedback_details;
	}
	public CommonsMultipartFile getAttachments() {
		return attachments;
	}
	public void setAttachments(CommonsMultipartFile attachments) {
		this.attachments = attachments;
	}
	
	
	
}