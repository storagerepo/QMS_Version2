package qms.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import com.itextpdf.text.Document;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import qms.controllers.AbstractITextPdfView;
import qms.model.ManagementReview;
import qms.model.SupplierPerformance;


public class SupplierPerformanceDAO extends AbstractITextPdfView {
	private DataSource dataSource;

	/* 
	 * Excel Sheet Generation
	 */
	public DataSource getDataSource() {
		return dataSource;
	}



	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	@Override
	protected void buildPdfDocument(Map<String, Object> model, Document doc,
	PdfWriter writer, HttpServletRequest request, HttpServletResponse response)
	throws Exception {
							
								@SuppressWarnings("unchecked")
								List<SupplierPerformance> supplierPerformances = (List<SupplierPerformance>) model.get("supplierPerformances");
								String[] fields = (String[])model.get("fields");
								
								int memolist = fields.length;
								System.out.println(memolist);
						       PdfPTable table=new PdfPTable(memolist+1);
						       float[] width= new float[memolist+1];
								table.setWidthPercentage(100);
								int i=1;
								 table.addCell(createLabelCell("SNO"));
								 width[0] = 1.0f;
			
		for (String field : fields) {
			
			if(field.equals("supplier_id"))
			{
				width[i] = 1.0f;
				 i++;
				 table.addCell(createLabelCell("ID"));
				
			}
			else if(field.equals("supplier_name"))
			{
				width[i] = 1.0f;
				 i++;
				 table.addCell(createLabelCell("Supplier Name"));
			
			}
			else if(field.equals("category"))
			{
				width[i] = 1.0f;
				 i++;
				 table.addCell(createLabelCell("Category"));
				
			}
			else if(field.equals("address"))
			{
				width[i] = 1.0f;
				 i++;
				 table.addCell(createLabelCell("Address"));
			
			}
			else if(field.equals("city"))
			{
				width[i] = 1.0f;
				 i++;
				 table.addCell(createLabelCell("City"));
			
			}
			else if(field.equals("state"))
			{
				width[i] = 1.0f;
				 i++;
				 table.addCell(createLabelCell("State"));
				
			}
			else if(field.equals("postalcode"))	
			{
				width[i] = 1.0f;
				 i++;
				 table.addCell(createLabelCell("Postal Code"));
				
			}else if(field.equals("country"))	
			{
				width[i] = 1.0f;
				 i++;
				 table.addCell(createLabelCell("Country"));
			
			}else if(field.equals("website"))	
			{
				width[i] = 1.0f;
				 i++;
				 table.addCell(createLabelCell("Website"));
			
			}else if(field.equals("certified_to"))
			{
				width[i] = 1.0f;
				 i++;
				 table.addCell(createLabelCell("Certified To"));
				
			}else if(field.equals("contact_name"))	
			{
				width[i] = 1.0f;
				 i++;
				 table.addCell(createLabelCell("Contact Name"));
			
			}else if(field.equals("contact_title"))	
			{
				width[i] = 1.0f;
				 i++;
				 table.addCell(createLabelCell("Contact Title"));
				
			}else if(field.equals("phone"))	
			{
				width[i] = 1.0f;
				 i++;
				 table.addCell(createLabelCell("Phone"));
				
			}else if(field.equals("fax"))	
			{
				width[i] = 1.0f;
				 i++;
				 table.addCell(createLabelCell("Fax"));
				
			}else if(field.equals("email_address"))	
			{
				width[i] = 1.0f;
				 i++;
				 table.addCell(createLabelCell("Email Address"));
			
			}
		}
	
		int j =1;
		for (SupplierPerformance supplierPerformance:supplierPerformances){	
			String sno = String.valueOf(j);
			table.addCell(createValueCell(sno));
			j++;
	
				for (String field : fields) {
					
					if(field.equals("supplier_id"))
					{
						table.addCell(createValueCell(
								supplierPerformance.getSupplier_id()));
							
					}
					else if(field.equals("supplier_name"))
					{
							table.addCell(createValueCell(
								supplierPerformance.getSupplier_name()));

					
					}
					else if(field.equals("category"))
					{
							table.addCell(createValueCell(
								supplierPerformance.getCategory()));
						
					}
					else if(field.equals("address"))	
					{
							table.addCell(createValueCell(
								supplierPerformance.getAddress()));
					
					}else if(field.equals("city"))	
					{
							table.addCell(createValueCell(
								supplierPerformance.getCity()));
					
					}else if(field.equals("state"))	
					{
							table.addCell(createValueCell(
								supplierPerformance.getState()));
					
					}else if(field.equals("postalcode"))
					{
							table.addCell(createValueCell(
								supplierPerformance.getPostalcode()));
						
					}else if(field.equals("country"))	
					{
							table.addCell(createValueCell(
								supplierPerformance.getCountry()));
					
					}else if(field.equals("website"))	
					{
							table.addCell(createValueCell(
								supplierPerformance.getWebsite()));
						
					}else if(field.equals("certified_to"))	
					{
							table.addCell(createValueCell(
								supplierPerformance.getCertified_to()));
						
					}else if(field.equals("contact_name"))	
					{
							table.addCell(createValueCell(supplierPerformance.getContact_name()));
							
					
					}else if(field.equals("contact_title"))	
					{
							table.addCell(createValueCell(supplierPerformance.getContact_title()));
						
					}else if(field.equals("phone"))	
					{
							table.addCell(createValueCell(
								supplierPerformance.getPhone()));
					
					}else if(field.equals("fax"))	
					{
							table.addCell(createValueCell(
								supplierPerformance.getFax()));
						
					}else if(field.equals("email_address"))	
					{
							table.addCell(createValueCell(
								supplierPerformance.getEmail_address()));
					
					}
					
				}
				
		}
		table.setWidths(width);
		
		doc.add(table);
	}
	
	//Getting unique id
	public String get_maxid() {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		String Max_id = "SP1001";
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {

			String cmd_select = "select max(auto_id) as auto_id from tbl_supplierperformance";
			resultSet = statement.executeQuery(cmd_select);
			if (resultSet.next()) {
				if (!resultSet.getString("auto_id").equals("null"))
					Max_id = "SP"
							+ (Integer.parseInt(resultSet.getString("auto_id")) + 1000 + 1);

			}

		} catch (Exception e) {
			System.out.println(e.toString());
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		} finally {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		return Max_id;
	}

	
	//Delete operation
	public boolean delete_supplierperformance(String supplier_id){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status=false;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
				e1.printStackTrace();
		}
		  try{
			  String cmd_delete="delete from tbl_supplierperformance where supplier_id ='"+supplier_id+"'";
			  status=statement.execute(cmd_delete);
			
	    }catch(Exception e){
	    	System.out.println(e.toString());
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    }finally{
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);	    	
	    }
		    return status;
		
	}
	
	//request method
	public List<SupplierPerformance> getsupplierperformance_byid(String supplier_id){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<SupplierPerformance> supplierPerformances = new ArrayList<SupplierPerformance>();
	    try{
			resultSet = statement.executeQuery("select * from tbl_supplierperformance where supplier_id ='"+supplier_id+"'");
			while(resultSet.next()){
				supplierPerformances.add(new SupplierPerformance(resultSet.getString("supplier_id"), resultSet.getString("supplier_name"), resultSet.getString("category"), resultSet.getString("address"), resultSet.getString("city"), resultSet.getString("state"), resultSet.getString("postalcode"), resultSet.getString("country"), resultSet.getString("website"), resultSet.getString("certified_to"), resultSet.getString("contact_name"), resultSet.getString("contact_title"), resultSet.getString("phone"), resultSet.getString("fax"), resultSet.getString("email_address")));
			}
	    }catch(Exception e){
	    	System.out.println(e.toString());
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    }finally{
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);	    	
	    }
	    return supplierPerformances;
		
	}
	
	//Update operation
	public boolean update_supplierperformance(SupplierPerformance supplierPerformance)
	{
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status=false;
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
				e1.printStackTrace();
		}
		  try{
			  String cmd_insert="update tbl_supplierperformance set supplier_name ='"+supplierPerformance.getSupplier_name()+"',category='"+supplierPerformance.getCategory()+"',address='"+supplierPerformance.getAddress()+"',city ='"+supplierPerformance.getCity()+"',state='"+supplierPerformance.getState()+"',postalcode='"+supplierPerformance.getPostalcode()+"',country='"+supplierPerformance.getCountry()+"',website='"+supplierPerformance.getWebsite()+"',certified_to='"+supplierPerformance.getCertified_to()+"',contact_name='"+supplierPerformance.getContact_name()+"',contact_title='"+supplierPerformance.getContact_title()+"',phone='"+supplierPerformance.getPhone()+"',fax='"+supplierPerformance.getFax()+"',email_address='"+supplierPerformance.getEmail_address()+"' where supplier_id ='"+supplierPerformance.getSupplier_id()+"'";
			  statement.execute(cmd_insert);
		  }catch(Exception e){
	    	System.out.println(e.toString());
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    }finally{
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);	    	
	    }
		    return status;
	}
	
	//Insert operation
	public boolean insert_supplierperformance(SupplierPerformance supplierPerformance)
	{
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status=false;
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
				e1.printStackTrace();
		}
		  try{
			  //DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		    	// Date date = new Date();
			  
			  String cmd_insert="insert into tbl_supplierperformance(supplier_id,supplier_name,category,address,city,state,postalcode,country,website,certified_to,contact_name,contact_title,phone,fax,email_address) values('"+supplierPerformance.getSupplier_id()+"','"+supplierPerformance.getSupplier_name()+"','"+supplierPerformance.getCategory()+"','"+supplierPerformance.getAddress()+"','"+supplierPerformance.getCity()+"','"+supplierPerformance.getState()+"','"+supplierPerformance.getPostalcode()+"','"+supplierPerformance.getCountry()+"','"+supplierPerformance.getWebsite()+"','"+supplierPerformance.getCertified_to()+"','"+supplierPerformance.getContact_name()+"','"+supplierPerformance.getContact_title()+"','"+supplierPerformance.getPhone()+"','"+supplierPerformance.getFax()+"','"+supplierPerformance.getEmail_address()+"')"; 
			  statement.execute(cmd_insert);
		  }catch(Exception e){
	    	System.out.println(e.toString());
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    }finally{
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);	    	
	    }
		    return status;
	}
	
	
	
	public List<SupplierPerformance> getsupplierperformance(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<SupplierPerformance> supplierPerformances = new ArrayList<SupplierPerformance>();
	    try{
			resultSet = statement.executeQuery("select * from tbl_supplierperformance");
			System.out.println("came");
			while(resultSet.next()){
				System.out.println("count");
				supplierPerformances.add(new SupplierPerformance(resultSet.getString("supplier_id"), resultSet.getString("supplier_name"), resultSet.getString("category"), resultSet.getString("address"), resultSet.getString("city"), resultSet.getString("state"), resultSet.getString("postalcode"), resultSet.getString("country"), resultSet.getString("website"), resultSet.getString("certified_to"), resultSet.getString("contact_name"), resultSet.getString("contact_title"), resultSet.getString("phone"), resultSet.getString("fax"), resultSet.getString("email_address")));
			}
	    }catch(Exception e){
	    	System.out.println(e.toString());
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    }finally{
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);	    	
	    }
	    return supplierPerformances;
		
	}
	
	//getting the supplierperformance list details
	public List<SupplierPerformance> list_supplierperformance(String supplier_id) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		List<SupplierPerformance> supplierPerformances = new ArrayList<SupplierPerformance>();

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			resultSet = statement.executeQuery("select * from tbl_supplierperformance where supplier_id='"+supplier_id+"'");
			while (resultSet.next()) {
							
				supplierPerformances.add(new SupplierPerformance(resultSet.getString("supplier_id"), resultSet.getString("supplier_name"), resultSet.getString("category"), resultSet.getString("address"), resultSet.getString("city"), resultSet.getString("state"), resultSet.getString("postalcode"), resultSet.getString("country"), resultSet.getString("website"), resultSet.getString("certified_to"), resultSet.getString("contact_name"), resultSet.getString("contact_title"), resultSet.getString("phone"), resultSet.getString("fax"), resultSet.getString("email_address")));
			System.out.println("Dao list result....");
			}
		} catch (Exception e) {
			System.out.println("error occured in dao...");
			System.out.println(e.toString());
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		} finally {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		return supplierPerformances;
	}

	
	public void releaseConnection(Connection con){
		try{if(con != null)
			con.close();
		}catch(Exception e){}
	}
	public void releaseResultSet(ResultSet rs){
		try{if(rs != null)
			rs.close();
	}catch(Exception e){}
	}
	public void releaseStatement(Statement stmt){
		try{if(stmt != null)
			stmt.close();
	}catch(Exception e){}
	}
	
	
	/*public List<InternalAudits> getinternalaudits(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<InternalAudits> internalaudits = new ArrayList<InternalAudits>();
	    try{
			resultSet = statement.executeQuery("select * from tbl_supplierperformance");
			System.out.println("came");
			while(resultSet.next()){
				System.out.println("count");
				internalaudits.add(new InternalAudits(resultSet.getString("audit_id"), resultSet.getString("audit_process"), resultSet.getString("audit_Start_date"), resultSet.getString("audit_due_date"), resultSet.getString("auditor"), resultSet.getString("audit_notes"), resultSet.getString("audit_finding"), resultSet.getString("audit_completion_date"), resultSet.getString("auditors_initials"), resultSet.getString("auditee_name")));
			}
	    }catch(Exception e){
	    	System.out.println(e.toString());
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    }finally{
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);	    	
	    }
	    return internalaudits;
		
	}
	*/
	
	
	
	
	//Search operation for find a particular records
	public List<SupplierPerformance> getSupplierPerformances(String suppliername,
			String phone, String email, int page) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<SupplierPerformance> supplierPerformances = new ArrayList<SupplierPerformance>();
		try {
			if(page >= 1)
	    	{
	    	int offset = 5 * (page - 1);
			int limit = 5;
		
			if(!suppliername.equals("") && !phone.equals("") && !email.equals(""))
			{
				resultSet = statement.executeQuery("select * from tbl_supplierperformance where supplier_name='"+ suppliername +"' and phone='"+ phone +"' and email_address='"+ email +"' limit " + offset + ","+ limit+"");
			}
			else if(suppliername.equals("") && !phone.equals("") && !email.equals(""))
			{
				resultSet = statement.executeQuery("select * from tbl_supplierperformance where phone='"+ phone +"' and email_address='"+ email +"' limit " + offset + ","+ limit+"");
			}
			else if(!suppliername.equals("") && phone.equals("") && !email.equals(""))
			{
				resultSet = statement.executeQuery("select * from tbl_supplierperformance where supplier_name='"+ suppliername +"' and email_address='"+ email +"' limit " + offset + ","+ limit+"");
			}
			else if(!suppliername.equals("") && !phone.equals("") && email.equals(""))
			{
				resultSet = statement.executeQuery("select * from tbl_supplierperformance where supplier_name='"+ suppliername +"' and phone='"+ phone +"' limit " + offset + ","+ limit+"");
			}
			else
			{
				resultSet = statement.executeQuery("select * from tbl_supplierperformance where supplier_name='"+ suppliername +"' or phone='"+ phone +"' or email_address='"+ email +"' limit " + offset + ","+ limit+"");
			}
	    	}
			else
			{
				if(!suppliername.equals("") && !phone.equals("") && !email.equals(""))
				{
					resultSet = statement.executeQuery("select * from tbl_supplierperformance where supplier_name='"+ suppliername +"' and phone='"+ phone +"' and email_address='"+ email +"'");
				}
				else if(suppliername.equals("") && !phone.equals("") && !email.equals(""))
				{
					resultSet = statement.executeQuery("select * from tbl_supplierperformance where phone='"+ phone +"' and email_address='"+ email +"'");
				}
				else if(!suppliername.equals("") && phone.equals("") && !email.equals(""))
				{
					resultSet = statement.executeQuery("select * from tbl_supplierperformance where supplier_name='"+ suppliername +"' and email_address='"+ email +"'");
				}
				else if(!suppliername.equals("") && !phone.equals("") && email.equals(""))
				{
					resultSet = statement.executeQuery("select * from tbl_supplierperformance where supplier_name='"+ suppliername +"' and phone='"+ phone +"'");
				}
				else
				{
					resultSet = statement.executeQuery("select * from tbl_supplierperformance where supplier_name='"+ suppliername +"' or phone='"+ phone +"' or email_address='"+ email +"'");
				}
				
			}
			while (resultSet.next()) {
			supplierPerformances.add(new SupplierPerformance(
					resultSet.getString("supplier_id"), 
					resultSet.getString("supplier_name"), 
					resultSet.getString("category"), 
					resultSet.getString("address"), 
					resultSet.getString("city"), 
					resultSet.getString("state"), 
					resultSet.getString("postalcode"), 
					resultSet.getString("country"), 
					resultSet.getString("website"), 
					resultSet.getString("certified_to"), 
					resultSet.getString("contact_name"), 
					resultSet.getString("contact_title"), 
					resultSet.getString("phone"), 
					resultSet.getString("fax"), 
					resultSet.getString("email_address")));
			

}
		} catch (Exception e) {
			//logger.info(e.toString());
			System.out.println(e.toString());
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		} finally {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		return supplierPerformances;

	}

	
	//Search operation for find a particular records
	public int FindSupplierPerformances(String suppliername,
			String phone, String email) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		int noofRecords=0;
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<SupplierPerformance> supplierPerformances = new ArrayList<SupplierPerformance>();
		try {
			
			if(!suppliername.equals("") && !phone.equals("") && !email.equals(""))
			{
				resultSet = statement.executeQuery("select count(*) as noofrecords from tbl_supplierperformance where supplier_name='"+ suppliername +"' and phone='"+ phone +"' and email_address='"+ email +"'");
			}
			else if(suppliername.equals("") && !phone.equals("") && !email.equals(""))
			{
				resultSet = statement.executeQuery("select count(*) as noofrecords from tbl_supplierperformance where phone='"+ phone +"' and email_address='"+ email +"'");
			}
			else if(!suppliername.equals("") && phone.equals("") && !email.equals(""))
			{
				resultSet = statement.executeQuery("select count(*) as noofrecords from tbl_supplierperformance where supplier_name='"+ suppliername +"' and email_address='"+ email +"'");
			}
			else if(!suppliername.equals("") && !phone.equals("") && email.equals(""))
			{
				resultSet = statement.executeQuery("select count(*) as noofrecords from tbl_supplierperformance where supplier_name='"+ suppliername +"' and phone='"+ phone +"'");
			}
			else
			{
				resultSet = statement.executeQuery("select count(*) as noofrecords from tbl_supplierperformance where supplier_name='"+ suppliername +"' or phone='"+ phone +"' or email_address='"+ email +"'");
			}
			
	    	
	    	
	    	if (resultSet.next())
				noofRecords = resultSet.getInt("noofrecords");

		} catch (Exception e) {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		} finally {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		return noofRecords;

	
	}

	//REPORT GENERATION
	public List<SupplierPerformance> get_supplierperformance_type(String type)
	 {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status = false;
		List<SupplierPerformance> supplierPerformances = new ArrayList<SupplierPerformance>();

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String cmd_select = null;
			
			if(type=="opensupplierperformance")
				cmd_select= "select * from tbl_supplierperformance" ;
			//cmd_select= "select * from tbl_supplierperformance where disposition==0 AND disposition_complete_date==NULL" ;
			
		/*		else if(type=="nodispositionover30days")
				//	cmd_select="select * from tbl_supplierperformance where disposition_complete_date between now() and DATE_ADDNOW(), INTERVAL 30 DAYS";
					cmd_select="select * from tbl_supplierperformance  WHERE   disposition_complete_date BETWEEN NOW() + INTERVAL 30 DAY AND NOW()";
					else if(type=="defined")
						cmd_select="select * from tbl_supplierperformance where disposition_complete_date between start AND end";
		*/	resultSet = statement.executeQuery(cmd_select);
			while (resultSet.next()) {
				System.out.println(" type result");
				supplierPerformances.add(new SupplierPerformance(
						resultSet.getString("supplier_id"), 
						resultSet.getString("supplier_name"), 
						resultSet.getString("category"), 
						resultSet.getString("address"), 
						resultSet.getString("city"), 
						resultSet.getString("state"), 
						resultSet.getString("postalcode"), 
						resultSet.getString("country"), 
						resultSet.getString("website"), 
						resultSet.getString("certified_to"), 
						resultSet.getString("contact_name"), 
						resultSet.getString("contact_title"), 
						resultSet.getString("phone"), 
						resultSet.getString("fax"), 
						resultSet.getString("email_address")));
				

			}

		} catch (Exception e) {
			System.out.println(e.toString());
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		} finally {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		return supplierPerformances;
	}



	
	public  List<SupplierPerformance> getlimitedsupplierreport(int page) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<SupplierPerformance> supplierPerformances = new ArrayList<SupplierPerformance>();

		try {

			String cmd;
			int offset = 5 * (page - 1);
			int limit = 5;
					cmd="select * from tbl_supplierperformance limit " + offset + ","+ limit+"" ;
				
				//	cmd = "select * from tbl_narrativereport order by pname asc limit " + offset + ","+ limit+"" ;

			resultSet = statement.executeQuery(cmd);
			while (resultSet.next()) {
				System.out.println(" type result");
				supplierPerformances.add(new SupplierPerformance(
						resultSet.getString("supplier_id"), 
						resultSet.getString("supplier_name"), 
						resultSet.getString("category"), 
						resultSet.getString("address"), 
						resultSet.getString("city"), 
						resultSet.getString("state"), 
						resultSet.getString("postalcode"), 
						resultSet.getString("country"), 
						resultSet.getString("website"), 
						resultSet.getString("certified_to"), 
						resultSet.getString("contact_name"), 
						resultSet.getString("contact_title"), 
						resultSet.getString("phone"), 
						resultSet.getString("fax"), 
						resultSet.getString("email_address")));
				

			}
			} catch (Exception e) {
			/*logger.info(e.toString());*/
				System.out.println(e.toString());
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		} finally {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		return supplierPerformances;

	}
	public int getnoofsupplierreport() {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		int noofRecords = 0;
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<SupplierPerformance> supplierPerformances = new ArrayList<SupplierPerformance>();
		try {

			String cmd;
			
					cmd = "select count(*) as noofrecords from tbl_supplierperformance ";
					System.out.println("command"+cmd);			
			resultSet = statement.executeQuery(cmd);
			if (resultSet.next())
				noofRecords = resultSet.getInt("noofrecords");

		} catch (Exception e) {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		} finally {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		return noofRecords;

	}


}
