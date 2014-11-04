package qms.model;

import org.hibernate.validator.constraints.NotEmpty;

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
	
	
	public Customers(String customer_id, String customer_name, String address,
			String city, String state, String country, String zipcode,
			String website, String contact_name, String title_of_contact,
			String telephone, String fax, String email_address) {
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
	
	
}