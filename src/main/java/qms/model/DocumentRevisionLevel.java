package qms.model;
import org.hibernate.validator.constraints.NotEmpty;
public class DocumentRevisionLevel {
	private String id;

	private String revision_level;
	
	private String revision_prefix;
	
	private String input1;
	
	private String input2;
	
	private String combined_output;
	
	public DocumentRevisionLevel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DocumentRevisionLevel(String id,String revision_prefix,String revision_level,String input1,String input2,String combined_output) {
		super();
		this.id = id;
		this.revision_prefix = revision_prefix;
		this.revision_level = revision_level;
		this.input1 = input1;
		this.input2 = input2;
		this.combined_output = combined_output;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getRevision_prefix() {
		return revision_prefix;
	}
	public void setRevision_prefix(String revision_prefix) {
		this.revision_prefix = revision_prefix;
	}
	public String getRevision_level() {
		return revision_level;
	}
	public void setRevision_level(String revision_level) {
		this.revision_level = revision_level;
	}
	public String getInput1() {
		return input1;
	}
	public void setInput1(String input1) {
		this.input1 = input1;
	}
	public String getInput2() {
		return input2;
	}
	public void setInput2(String input2) {
		this.input2 = input2;
	}
	public String getCombined_output() {
		return combined_output;
	}
	public void setCombined_output(String combined_output) {
		this.combined_output = combined_output;
	}
	
	
	

}
