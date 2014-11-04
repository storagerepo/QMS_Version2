package qms.model;
import org.hibernate.validator.constraints.NotEmpty;

public class ManagementReview
{

	public ManagementReview(String review_id, String management_review_date,
			String attendee_list_with_titles, String next_management_review_by,
			String category, String assessment, String report_link,
			String action_needed, String action_detail, String action_due_date,
			String responsibility, String completion_date,
			String continuous_improvement_project) {
		super();
		this.review_id = review_id;
		this.management_review_date = management_review_date;
		this.attendee_list_with_titles = attendee_list_with_titles;
		this.next_management_review_by = next_management_review_by;
		this.category = category;
		this.assessment = assessment;
		this.report_link = report_link;
		this.action_needed = action_needed;
		this.action_detail = action_detail;
		this.action_due_date = action_due_date;
		this.responsibility = responsibility;
		this.completion_date = completion_date;
		this.continuous_improvement_project = continuous_improvement_project;
	}
	public ManagementReview() {
		super();
		// TODO Auto-generated constructor stub
	}
	@NotEmpty
	public String review_id;
	@NotEmpty
	private String management_review_date;
	@NotEmpty
	private String attendee_list_with_titles;
	@NotEmpty
	private String next_management_review_by;
	@NotEmpty
	private String category;
	@NotEmpty
	private String assessment;
	@NotEmpty
	private String report_link;
	@NotEmpty
	private String action_needed;
	@NotEmpty
	private String action_detail;
	@NotEmpty
	private String action_due_date;
	@NotEmpty
	private String responsibility;
	@NotEmpty
	private String completion_date;
	@NotEmpty
	private String continuous_improvement_project;
	@NotEmpty
	
		public String getReview_id() {
			return review_id;
		}
		public void setReview_id(String review_id) {
			this.review_id = review_id;
		}
		public String getManagement_review_date() {
			return management_review_date;
		}
		public void setManagement_review_date(String management_review_date) {
			this.management_review_date = management_review_date;
		}
		public String getAttendee_list_with_titles() {
			return attendee_list_with_titles;
		}
		public void setAttendee_list_with_titles(String attendee_list_with_titles) {
			this.attendee_list_with_titles = attendee_list_with_titles;
		}
		public String getNext_management_review_by() {
			return next_management_review_by;
		}
		public void setNext_management_review_by(String next_management_review_by) {
			this.next_management_review_by = next_management_review_by;
		}
		public String getCategory() {
			return category;
		}
		public void setCategory(String category) {
			this.category = category;
		}
		public String getAssessment() {
			return assessment;
		}
		public void setAssessment(String assessment) {
			this.assessment = assessment;
		}
		public String getReport_link() {
			return report_link;
		}
		public void setReport_link(String report_link) {
			this.report_link = report_link;
		}
		public String getAction_needed() {
			return action_needed;
		}
		public void setAction_needed(String action_needed) {
			this.action_needed = action_needed;
		}
		public String getAction_detail() {
			return action_detail;
		}
		public void setAction_detail(String action_detail) {
			this.action_detail = action_detail;
		}
		public String getAction_due_date() {
			return action_due_date;
		}
		public void setAction_due_date(String action_due_date) {
			this.action_due_date = action_due_date;
		}
		public String getResponsibility() {
			return responsibility;
		}
		public void setResponsibility(String responsibility) {
			this.responsibility = responsibility;
		}
		public String getCompletion_date() {
			return completion_date;
		}
		public void setCompletion_date(String completion_date) {
			this.completion_date = completion_date;
		}
		public String getContinuous_improvement_project() {
			return continuous_improvement_project;
		}
		public void setContinuous_improvement_project(
				String continuous_improvement_project) {
			this.continuous_improvement_project = continuous_improvement_project;
		}

}