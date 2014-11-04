package qms.model;

import org.hibernate.validator.constraints.NotEmpty;

public class ProductIDNC {
	private int auto_id;
	@NotEmpty
	private String productid_nc;
	public ProductIDNC() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProductIDNC(int auto_id, String productid_nc) {
		super();
		this.auto_id = auto_id;
		this.productid_nc = productid_nc;
	}
	public int getAuto_id() {
		return auto_id;
	}
	public void setAuto_id(int auto_id) {
		this.auto_id = auto_id;
	}
	public String getProductid_nc() {
		return productid_nc;
	}
	public void setProductid_nc(String productid_nc) {
		this.productid_nc = productid_nc;
	}
	
}
