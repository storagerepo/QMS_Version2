package qms.model;

public class Job
{
	private String job_id;
	
	private String job_title;
	
	private String job_description;

	public Job() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Job(String job_id, String job_title, String job_description) {
		super();
		this.job_id = job_id;
		this.job_title = job_title;
		this.job_description = job_description;
	}

	public String getJob_id() {
		return job_id;
	}

	public void setJob_id(String job_id) {
		this.job_id = job_id;
	}

	public String getJob_title() {
		return job_title;
	}

	public void setJob_title(String job_title) {
		this.job_title = job_title;
	}

	public String getJob_description() {
		return job_description;
	}

	public void setJob_description(String job_description) {
		this.job_description = job_description;
	}
	
	
}