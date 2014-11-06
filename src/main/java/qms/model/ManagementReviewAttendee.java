package qms.model;

public class ManagementReviewAttendee {

	private String id;
	private String review_id;
	private String attendee_name;
	private String job_title;
	public ManagementReviewAttendee() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public ManagementReviewAttendee(String id, String review_id,
			String attendee_name, String job_title) {
		super();
		this.id = id;
		this.review_id = review_id;
		this.attendee_name = attendee_name;
		this.job_title = job_title;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getReview_id() {
		return review_id;
	}
	public void setReview_id(String review_id) {
		this.review_id = review_id;
	}
	public String getAttendee_name() {
		return attendee_name;
	}
	public void setAttendee_name(String attendee_name) {
		this.attendee_name = attendee_name;
	}
	public String getJob_title() {
		return job_title;
	}
	public void setJob_title(String job_title) {
		this.job_title = job_title;
	}
	
	
}
