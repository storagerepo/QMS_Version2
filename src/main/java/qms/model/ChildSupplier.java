package qms.model;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotEmpty;
public class ChildSupplier {
	private String po;
	
	private String receipt_date;
	@NotEmpty
	private String type_of_problem;
	@NotEmpty
	private String problem_details;
	@NotEmpty
	private String problem_found_at;
	@NotEmpty
	private String request_corrective_action;
	@NotEmpty
	private String due_date_for_corrective_action;
	@NotEmpty
	private String deduction_for_issue;
	@NotEmpty
	private String recorded_by;
	
	private String recording_date;
	
	public ChildSupplier(String po,String receipt_date,String type_of_problem,String problem_details,String problem_found_at,
			String request_corrective_action,String due_date_for_corrective_action,String deduction_for_issue,String recorded_by,String recording_date)
	{
		this.po = po;
		this.receipt_date = receipt_date;
		this.type_of_problem = type_of_problem;
		this.problem_details = problem_details;
		this.problem_found_at = problem_found_at;
		this.request_corrective_action = request_corrective_action;
		this.due_date_for_corrective_action =due_date_for_corrective_action;
		this.deduction_for_issue = deduction_for_issue;
		this.recorded_by = recorded_by;
		this.recording_date = recording_date;
	}
	public ChildSupplier()
	{
		super();
	}
	public String getPo() {
		return po;
	}
	public void setPo(String po) {
		this.po = po;
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
	public String getProblem_details() {
		return problem_details;
	}
	public void setProblem_details(String problem_details) {
		this.problem_details = problem_details;
	}
	public String getProblem_found_at() {
		return problem_found_at;
	}
	public void setProblem_found_at(String problem_found_at) {
		this.problem_found_at = problem_found_at;
	}
	public String getRequest_corrective_action() {
		return request_corrective_action;
	}
	public void setRequest_corrective_action(String request_corrective_action) {
		this.request_corrective_action = request_corrective_action;
	}
	public String getDue_date_for_corrective_action() {
		return due_date_for_corrective_action;
	}
	public void setDue_date_for_corrective_action(
			String due_date_for_corrective_action) {
		this.due_date_for_corrective_action = due_date_for_corrective_action;
	}
	public String getDeduction_for_issue() {
		return deduction_for_issue;
	}
	public void setDeduction_for_issue(String deduction_for_issue) {
		this.deduction_for_issue = deduction_for_issue;
	}
	public String getRecorded_by() {
		return recorded_by;
	}
	public void setRecorded_by(String recorded_by) {
		this.recorded_by = recorded_by;
	}
	public String getRecording_date() {
		return recording_date;
	}
	public void setRecording_date(String recording_date) {
		this.recording_date = recording_date;
	}
	
	

}
