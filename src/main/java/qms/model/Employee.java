package qms.model;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class Employee
{
	private String employee_id;
	@NotEmpty
	private String name;
	@NotEmpty
	private String job_title;
	@NotEmpty
	private String date_hired;
	private CommonsMultipartFile attachments;
	private String attachment_name;	
	private String attachment_type;
	private String attachment_referrence;
	@NotEmpty
	private String list_of_functions_needes;
	@NotEmpty
	private String documented_in;
	/*@NotEmpty*/
	private String qualified_by;
	@NotEmpty
	private String type_of_training;
	@NotEmpty
	private String trainer;
	@NotEmpty
	private String training_due_date;
	@NotEmpty
	private String training_completion_date;
	@NotEmpty
	private String training_effectiveness_review_due_date;
	@NotEmpty
	private String training_effectiveness_notes;
	@NotEmpty
	private String process;
	@NotEmpty
	private String process_name;
	@NotEmpty
	private String doc_control;
	@NotEmpty
	private String management_rep;
	private String management;
	private String process_owner;
	private String document_control;
	
    
	public Employee(String employee_id, String name, String job_title,
			String date_hired, String attachment_name,
			String attachment_type, String attachment_referrence,String process,String process_name,String doc_control,String management_rep,
			String list_of_functions_needes, String documented_in,
			String qualified_by, String type_of_training, String trainer,
			String training_due_date, String training_completion_date,
			String training_effectiveness_review_due_date,
			String training_effectiveness_notes,String management,String process_owner,String document_control) {
		
		super();
		this.employee_id = employee_id;
		this.name = name;
		this.job_title = job_title;
		this.date_hired = date_hired;
		this.attachment_name = attachment_name;
		this.attachment_type = attachment_type;
		this.attachment_referrence = attachment_referrence;
		this.list_of_functions_needes = list_of_functions_needes;
		this.documented_in = documented_in;
		this.qualified_by = qualified_by;
		this.type_of_training = type_of_training;
		this.trainer = trainer;
		this.training_due_date = training_due_date;
		this.training_completion_date = training_completion_date;
		this.training_effectiveness_review_due_date = training_effectiveness_review_due_date;
		this.training_effectiveness_notes = training_effectiveness_notes;
		this.process=process;
		this.process_name=process_name;
		this.doc_control=doc_control;
		this.management_rep=management_rep;
		this.management = management;
		this.process_owner =process_owner;
		this.document_control = document_control;
	}
	public Employee() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getEmployee_id() {
		return employee_id;
	}
	public String getName() {
		return name;
	}
	public String getJob_title() {
		return job_title;
	}
	public String getDate_hired() {
		return date_hired;
	}
	
	
	public String getProcess() {
		return process;
	}
	public void setProcess(String process) {
		this.process = process;
	}
	public String getProcess_name() {
		return process_name;
	}
	public void setProcess_name(String process_name) {
		this.process_name = process_name;
	}
	public String getDoc_control() {
		return doc_control;
	}
	public void setDoc_control(String doc_control) {
		this.doc_control = doc_control;
	}
	public String getManagement_rep() {
		return management_rep;
	}
	public void setManagement_rep(String management_rep) {
		this.management_rep = management_rep;
	}
	public String getList_of_functions_needes() {
		return list_of_functions_needes;
	}
	public String getDocumented_in() {
		return documented_in;
	}
	public String getQualified_by() {
		return qualified_by;
	}
	public String getType_of_training() {
		return type_of_training;
	}
	public String getTrainer() {
		return trainer;
	}
	public String getTraining_due_date() {
		return training_due_date;
	}
	public String getTraining_completion_date() {
		return training_completion_date;
	}
	public String getTraining_effectiveness_review_due_date() {
		return training_effectiveness_review_due_date;
	}
	public String getTraining_effectiveness_notes() {
		return training_effectiveness_notes;
	}
	public void setEmployee_id(String employee_id) {
		this.employee_id = employee_id;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setJob_title(String job_title) {
		this.job_title = job_title;
	}
	public void setDate_hired(String date_hired) {
		this.date_hired = date_hired;
	}
	
	public void setList_of_functions_needes(String list_of_functions_needes) {
		this.list_of_functions_needes = list_of_functions_needes;
	}
	public void setDocumented_in(String documented_in) {
		this.documented_in = documented_in;
	}
	public void setQualified_by(String qualified_by) {
		this.qualified_by = qualified_by;
	}
	public void setType_of_training(String type_of_training) {
		this.type_of_training = type_of_training;
	}
	public void setTrainer(String trainer) {
		this.trainer = trainer;
	}
	public void setTraining_due_date(String training_due_date) {
		this.training_due_date = training_due_date;
	}
	public void setTraining_completion_date(String training_completion_date) {
		this.training_completion_date = training_completion_date;
	}
	public void setTraining_effectiveness_review_due_date(
			String training_effectiveness_review_due_date) {
		this.training_effectiveness_review_due_date = training_effectiveness_review_due_date;
	}
	public void setTraining_effectiveness_notes(String training_effectiveness_notes) {
		this.training_effectiveness_notes = training_effectiveness_notes;
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
	public String getManagement() {
		return management;
	}
	public void setManagement(String management) {
		this.management = management;
	}
	public String getProcess_owner() {
		return process_owner;
	}
	public void setProcess_owner(String process_owner) {
		this.process_owner = process_owner;
	}
	public String getDocument_control() {
		return document_control;
	}
	public void setDocument_control(String document_control) {
		this.document_control = document_control;
	}
	
		
}