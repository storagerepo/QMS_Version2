package qms.model;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotEmpty;

public class SupplierPerformance {
	private String supplier_id;
	@NotEmpty
	private String supplier_name;
	
	@NotEmpty
	private String category;
	
	@NotEmpty
	private String address;
	
	@NotEmpty
	private String city;
	
	@NotEmpty
	private String state;
	
	@NotEmpty
	private String postalcode;
	
	@NotEmpty
	private String country;
	
	@NotEmpty
	private String website;
	
	@NotEmpty
	private String certified_to;
	
	@NotEmpty
	private String contact_name;
	
	@NotEmpty
	private String contact_title;
	
	@NotEmpty
	private String phone;
	
	@NotEmpty
	private String fax;
	
	@NotEmpty
	private String email_address;
	
	private String performance_id;
	
	private String receipt_date;
	private String type_of_problem;
	private String quality;
	private String delivery;
	private String customerservice;
	private String problemdetails;
	private String problem_found_at;
	private String correctiveaction;
	private String dueaction_date;
	private String deduction;
	private String recordedby;
	private String recording_date;
	public SupplierPerformance() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SupplierPerformance(String supplier_id, String supplier_name,
			String category, String address, String city, String state,
			String postalcode, String country, String website,
			String certified_to, String contact_name, String contact_title,
			String phone, String fax, String email_address,
			String performance_id, String receipt_date, String type_of_problem,
			String quality, String delivery, String customerservice,
			String problemdetails, String problem_found_at,
			String correctiveaction, String dueaction_date, String deduction,
			String recordedby, String recording_date) {
		super();
		this.supplier_id = supplier_id;
		this.supplier_name = supplier_name;
		this.category = category;
		this.address = address;
		this.city = city;
		this.state = state;
		this.postalcode = postalcode;
		this.country = country;
		this.website = website;
		this.certified_to = certified_to;
		this.contact_name = contact_name;
		this.contact_title = contact_title;
		this.phone = phone;
		this.fax = fax;
		this.email_address = email_address;
		this.performance_id = performance_id;
		this.receipt_date = receipt_date;
		this.type_of_problem = type_of_problem;
		this.quality = quality;
		this.delivery = delivery;
		this.customerservice = customerservice;
		this.problemdetails = problemdetails;
		this.problem_found_at = problem_found_at;
		this.correctiveaction = correctiveaction;
		this.dueaction_date = dueaction_date;
		this.deduction = deduction;
		this.recordedby = recordedby;
		this.recording_date = recording_date;
	}
	
	public SupplierPerformance(String deduction) {
		super();
		this.deduction = deduction;
	}
	public String getSupplier_id() {
		return supplier_id;
	}
	public void setSupplier_id(String supplier_id) {
		this.supplier_id = supplier_id;
	}
	public String getSupplier_name() {
		return supplier_name;
	}
	public void setSupplier_name(String supplier_name) {
		this.supplier_name = supplier_name;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
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
	public String getPostalcode() {
		return postalcode;
	}
	public void setPostalcode(String postalcode) {
		this.postalcode = postalcode;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getWebsite() {
		return website;
	}
	public void setWebsite(String website) {
		this.website = website;
	}
	public String getCertified_to() {
		return certified_to;
	}
	public void setCertified_to(String certified_to) {
		this.certified_to = certified_to;
	}
	public String getContact_name() {
		return contact_name;
	}
	public void setContact_name(String contact_name) {
		this.contact_name = contact_name;
	}
	public String getContact_title() {
		return contact_title;
	}
	public void setContact_title(String contact_title) {
		this.contact_title = contact_title;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
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
	public String getPerformance_id() {
		return performance_id;
	}
	public void setPerformance_id(String performance_id) {
		this.performance_id = performance_id;
	}
	public String getReceipt_date() {
		return receipt_date;
	}
	public void setReceipt_date(String receipt_date) {
		this.receipt_date = receipt_date;
	}
	public String getType_of_problem() {
		return type_of_problem;
	}
	public void setType_of_problem(String type_of_problem) {
		this.type_of_problem = type_of_problem;
	}
	public String getQuality() {
		return quality;
	}
	public void setQuality(String quality) {
		this.quality = quality;
	}
	public String getDelivery() {
		return delivery;
	}
	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}
	public String getCustomerservice() {
		return customerservice;
	}
	public void setCustomerservice(String customerservice) {
		this.customerservice = customerservice;
	}
	public String getProblemdetails() {
		return problemdetails;
	}
	public void setProblemdetails(String problemdetails) {
		this.problemdetails = problemdetails;
	}
	public String getProblem_found_at() {
		return problem_found_at;
	}
	public void setProblem_found_at(String problem_found_at) {
		this.problem_found_at = problem_found_at;
	}
	public String getCorrectiveaction() {
		return correctiveaction;
	}
	public void setCorrectiveaction(String correctiveaction) {
		this.correctiveaction = correctiveaction;
	}
	public String getDueaction_date() {
		return dueaction_date;
	}
	public void setDueaction_date(String dueaction_date) {
		this.dueaction_date = dueaction_date;
	}
	public String getDeduction() {
		return deduction;
	}
	public void setDeduction(String deduction) {
		this.deduction = deduction;
	}
	public String getRecordedby() {
		return recordedby;
	}
	public void setRecordedby(String recordedby) {
		this.recordedby = recordedby;
	}
	public String getRecording_date() {
		return recording_date;
	}
	public void setRecording_date(String recording_date) {
		this.recording_date = recording_date;
	}
	
	
	}
