package qms.model;

public class UserProfile {
	private static final long serialVersionUID = 1L;
	private Long id;
	private String fullName;
	private String username;
	private String password;
	private String cpassword;
	private String email;
	private boolean updateByEmail;
	
	public UserProfile() {
		super();
		// TODO Auto-generated constructor stub
	}
	public UserProfile(String fullName, String username, String password,
			String email, boolean updateByEmail) {
		super();
		this.fullName = fullName;
		this.username = username;
		this.password = password;
		this.email = email;
		this.updateByEmail = updateByEmail;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getCpassword() {
		return cpassword;
	}
	public void setCpassword(String cpassword) {
		this.cpassword = cpassword;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public boolean isUpdateByEmail() {
		return updateByEmail;
	}
	public void setUpdateByEmail(boolean updateByEmail) {
		this.updateByEmail = updateByEmail;
	} 
}
