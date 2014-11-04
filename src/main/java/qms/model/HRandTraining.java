package qms.model;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class HRandTraining {
	/*private String auto_id;*/
	//private String id;
	
	private String id;
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
	private String calibration;
	private String responsibility;
	private String disposition;
	
	
	/*private CommonsMultipartFile attachments;
	private String attachment_name;	
	private String attachment_type;
	private String attachment_referrence;
	*/
	/*@NotEmpty
	private String list_of_functions_needes;
	*/
	
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

	public HRandTraining()
	{
		super();
	}


	public HRandTraining(String id, String name, String job_title,
			String date_hired,
			String attachment_name, String attachment_type,
			String attachment_referrence, String calibration,
			String responsibility, String disposition) {
		super();
		this.id = id;
		this.name = name;
		this.job_title = job_title;
		this.date_hired = date_hired;
		
		this.attachment_name = attachment_name;
		this.attachment_type = attachment_type;
		this.attachment_referrence = attachment_referrence;
		this.calibration = calibration;
		this.responsibility = responsibility;
		this.disposition = disposition;
	}


	public HRandTraining(String id, String name, String job_title,
			String date_hired, String attachment_name,
			String attachment_type, String attachment_referrence, 
			String calibration,String responsibility,
			String disposition, String documented_in,
			String qualified_by, String type_of_training, String trainer,
			String training_due_date, String training_completion_date,
			String training_effectiveness_review_due_date,
			String training_effectiveness_notes) {
		
		super();
		/*this.auto_id = auto_id;*/
		this.id = id;
		this.name = name;
		this.job_title = job_title;
		this.date_hired = date_hired;
		this.attachment_name = attachment_name;
		this.attachment_type = attachment_type;
		this.attachment_referrence = attachment_referrence;
		//this.auto_id = auto_id;
		this.calibration = calibration;
		this.responsibility = responsibility;
		this.disposition = disposition;
		this.documented_in = documented_in;
		this.qualified_by = qualified_by;
		this.type_of_training = type_of_training;
		this.trainer = trainer;
		this.training_due_date = training_due_date;
		this.training_completion_date = training_completion_date;
		this.training_effectiveness_review_due_date = training_effectiveness_review_due_date;
		this.training_effectiveness_notes = training_effectiveness_notes;
		
		
	}

	
	
	public HRandTraining(String id, String name, String job_title,
			String date_hired,  String documented_in,
			String qualified_by, String type_of_training, String trainer,
			String training_due_date, String training_completion_date,
			String training_effectiveness_review_due_date,
			String training_effectiveness_notes) {
		
		super();
/*		this.auto_id = auto_id;*/
		this.id = id;
		this.name = name;
		this.job_title = job_title;
		this.date_hired = date_hired;
		this.documented_in = documented_in;
		this.qualified_by = qualified_by;
		this.type_of_training = type_of_training;
		this.trainer = trainer;
		this.training_due_date = training_due_date;
		this.training_completion_date = training_completion_date;
		this.training_effectiveness_review_due_date = training_effectiveness_review_due_date;
		this.training_effectiveness_notes = training_effectiveness_notes;
		
		
	}

	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getJob_title() {
		return job_title;
	}

	public void setJob_title(String job_title) {
		this.job_title = job_title;
	}

	public String getDate_hired() {
		return date_hired;
	}

	public void setDate_hired(String date_hired) {
		this.date_hired = date_hired;
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

	public String getCalibration() {
		return calibration;
	}

	public void setCalibration(String calibration) {
		this.calibration = calibration;
	}

	public String getResponsibility() {
		return responsibility;
	}

	public void setResponsibility(String responsibility) {
		this.responsibility = responsibility;
	}

	public String getDisposition() {
		return disposition;
	}

	public void setDisposition(String disposition) {
		this.disposition = disposition;
	}

	public String getDocumented_in() {
		return documented_in;
	}

	public void setDocumented_in(String documented_in) {
		this.documented_in = documented_in;
	}

	public String getQualified_by() {
		return qualified_by;
	}

	public void setQualified_by(String qualified_by) {
		this.qualified_by = qualified_by;
	}

	public String getType_of_training() {
		return type_of_training;
	}

	public void setType_of_training(String type_of_training) {
		this.type_of_training = type_of_training;
	}

	public String getTrainer() {
		return trainer;
	}

	public void setTrainer(String trainer) {
		this.trainer = trainer;
	}

	public String getTraining_due_date() {
		return training_due_date;
	}

	public void setTraining_due_date(String training_due_date) {
		this.training_due_date = training_due_date;
	}

	public String getTraining_completion_date() {
		return training_completion_date;
	}

	public void setTraining_completion_date(String training_completion_date) {
		this.training_completion_date = training_completion_date;
	}

	public String getTraining_effectiveness_review_due_date() {
		return training_effectiveness_review_due_date;
	}

	public void setTraining_effectiveness_review_due_date(
			String training_effectiveness_review_due_date) {
		this.training_effectiveness_review_due_date = training_effectiveness_review_due_date;
	}

	public String getTraining_effectiveness_notes() {
		return training_effectiveness_notes;
	}

	public void setTraining_effectiveness_notes(String training_effectiveness_notes) {
		this.training_effectiveness_notes = training_effectiveness_notes;
	}

}