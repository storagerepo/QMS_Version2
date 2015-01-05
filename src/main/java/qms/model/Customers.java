package qms.model;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class Customers
{
	private String customer_id;
	@NotEmpty
	private String customer_name;
	@NotEmpty
	private String address;
	@NotEmpty
	private String city;
	@NotEmpty
	private String state;
	@NotEmpty
	private String country;
	@NotEmpty
	private String zipcode;
	@NotEmpty
	private String website;
	@NotEmpty
	private String contact_name;
	@NotEmpty
	private String title_of_contact;
	@NotEmpty
	private String telephone;
	
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
	public Customers(String customer_id, String customer_name, String address,
			String city, String state, String country, String zipcode,
			String website, String contact_name, String title_of_contact,
			String telephone, String fax, String email_address,String feedback_id, String date_of_feedback,
			String type_of_feedback, String feedback_recorded_by,
			String feedback_details,String attachment_name,
			String attachment_type, String attachment_referrence) {
		super();
		this.customer_id = customer_id;
		this.customer_name = customer_name;
		this.address = address;
		this.city = city;
		this.state = state;
		this.country = country;
		this.zipcode = zipcode;
		this.website = website;
		this.contact_name = contact_name;
		this.title_of_contact = title_of_contact;
		this.telephone = telephone;
		this.fax = fax;
		this.email_address = email_address;
		this.feedback_id = feedback_id;
		this.date_of_feedback = date_of_feedback;
		this.type_of_feedback = type_of_feedback;
		this.feedback_recorded_by = feedback_recorded_by;
		this.feedback_details = feedback_details;
		this.attachment_name = attachment_name;
		this.attachment_type = attachment_type;
		this.attachment_referrence = attachment_referrence;
		
	}
	
	

	public Customers() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	@NotEmpty
	private String fax;
	@NotEmpty
	private String email_address;
	public String getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
	public String getCustomer_name() {
		return customer_name;
	}
	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getWebsite() {
		return website;
	}
	public void setWebsite(String website) {
		this.website = website;
	}
	public String getContact_name() {
		return contact_name;
	}
	public void setContact_name(String contact_name) {
		this.contact_name = contact_name;
	}
	public String getTitle_of_contact() {
		return title_of_contact;
	}
	public void setTitle_of_contact(String title_of_contact) {
		this.title_of_contact = title_of_contact;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}
	public String getEmail_address() {
		return email_address;
	}
	public void setEmail_address(String email_address) {
		this.email_address = email_address;
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