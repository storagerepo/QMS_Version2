package qms.dao;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import com.itextpdf.text.Document;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import qms.controllers.AbstractITextPdfView;
import qms.model.*;

public class CustomerFeedbackDAO extends AbstractITextPdfView
{
	private DataSource dataSource; 

	/**
	 * Excel Sheet Generation
	 */
	
	@Override
	protected void buildPdfDocument(Map<String, Object> model, Document doc,
			PdfWriter writer, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		 @SuppressWarnings("unchecked")
		List<CustomerFeedback> customerFeedbacks = (List<CustomerFeedback>) model.get("customerFeedbacks");
		String[] fields=(String[])model.get("fields");
		int memolist = fields.length;
		System.out.println("memo length = "+memolist);
       PdfPTable table=new PdfPTable(memolist+1);
       float[] width= new float[memolist+1];
		table.setWidthPercentage(100);
		int i=1;
		 table.addCell(createLabelCell("SNO"));
		 width[0] = 1.0f;
		
		 for (String field : fields) {
				if(field.equals("date_of_feedback"))
				{
					width[i] = 1.0f;
					 i++;
					 table.addCell(createLabelCell("Date of Feedback"));
				
				}
				else if(field.equals("type_of_feedback"))
				{
					width[i] = 1.0f;
					 i++;
					 table.addCell(createLabelCell("Type of Feedback"));
					
				}
				else if(field.equals("feedback_recorded_by"))
				{
					width[i] = 1.0f;
					 i++;
					 table.addCell(createLabelCell("Feedback recorded by"));
					
				}
				else if(field.equals("feedback_details"))
				{
					width[i] = 1.0f;
					 i++;
					 table.addCell(createLabelCell("Feedback Details"));
					
				}
				
		 }
		 
		 int j=1;
		 for (CustomerFeedback customerFeedback:customerFeedbacks) {
				
				String sno = String.valueOf(j);
				table.addCell(createValueCell(sno));
				j++;
					for (String field : fields) {
						
						if(field.equals("date_of_feedback"))
						{
							table.addCell(createValueCell(customerFeedback.getDate_of_feedback()));
								
						}
						else if(field.equals("type_of_feedback"))
						{
							table.addCell(createValueCell(customerFeedback.getType_of_feedback()));

							
						}
						else if(field.equals("feedback_recorded_by"))
						{
							table.addCell(createValueCell(customerFeedback.getFeedback_recorded_by()));
								
						}
						else if(field.equals("feedback_details"))	
						{
							table.addCell(createValueCell(customerFeedback.getFeedback_details()));
							
						}
					
					}
		 }	
			table.setWidths(width);
			
			doc.add(table);
	}
	
	public boolean insert_customerfeedback(CustomerFeedback customerFeedback) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status = false;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String cmd_insert = "insert into tbl_customerfeedback(date_of_feedback,type_of_feedback,feedback_recorded_by,feedback_details,attachment_name,attachement_type,attachment_referrence) values('"+customerFeedback.getDate_of_feedback()+"','"+customerFeedback.getType_of_feedback()+"','"+customerFeedback.getFeedback_recorded_by()+"','"+customerFeedback.getFeedback_details()+"','"+customerFeedback.getAttachment_name()+"','"+customerFeedback.getAttachment_type()+"','"+customerFeedback.getAttachment_referrence()+"')";
			System.out.println(statement.execute(cmd_insert));
			
			//status = statement.execute(cmd_insert);
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
		return status;

	}
	
	public boolean delete_customerfeedback(String feedback_id) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status = false;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String cmd_delete = "delete from tbl_customerfeedback where feedback_id='"+feedback_id+"'";
			System.out.println(cmd_delete);
			status = statement.execute(cmd_delete);
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
		return status;

	}
	
	
	
	
	
	
	
	
	public List<CustomerFeedback> getCustomersfeedbacks(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<CustomerFeedback> customerFeedbacks = new ArrayList<CustomerFeedback>();
	    try{
			resultSet = statement.executeQuery("select * from tbl_customerfeedback");
			//System.out.println("came");
			while(resultSet.next()){
		     customerFeedbacks.add(new CustomerFeedback(resultSet.getString("feedback_id"),resultSet.getString("date_of_feedback"),resultSet.getString("type_of_feedback"),resultSet.getString("feedback_recorded_by"),resultSet.getString("feedback_details"),resultSet.getString("attachment_name"),resultSet.getString("attachement_type"),resultSet.getString("attachment_referrence")));
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
	    return customerFeedbacks;
		
	}
	
	public List<CustomerFeedback> getParticular_Customersfeedbacks(String feedback_id){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<CustomerFeedback> customerFeedbacks = new ArrayList<CustomerFeedback>();
	    try{
			resultSet = statement.executeQuery("select * from tbl_customerfeedback where feedback_id='"+feedback_id+"'");
			//System.out.println("came");
			while(resultSet.next()){
			customerFeedbacks.add(new CustomerFeedback(resultSet.getString("feedback_id"),resultSet.getString("date_of_feedback"), resultSet.getString("type_of_feedback"), resultSet.getString("feedback_recorded_by"), resultSet.getString("feedback_details"), resultSet.getString("attachment_name"),resultSet.getString("attachement_type"),resultSet.getString("attachment_referrence")));
				
				
			
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
	    return customerFeedbacks;
		
	}
	
	
	public boolean update_customerfeedback(CustomerFeedback customerFeedback) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status = false;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String attachment_name ="";
			  String attachment_type="",attachment_reference="";
			  System.out.println("feedback id = "+customerFeedback.getFeedback_id());
			  if(customerFeedback.getAttachment_name() == null || customerFeedback.getAttachment_type() == null || customerFeedback.getAttachment_referrence() == null)
				 {
				  System.out.println("same file attached");
					 resultSet=statement.executeQuery("select attachment_name,attachement_type,attachment_referrence from tbl_customerfeedback where feedback_id='"+customerFeedback.getFeedback_id()+"'");
				  while(resultSet.next())
				  {
					  attachment_name= resultSet.getString("attachment_name");
					  attachment_type= resultSet.getString("attachement_type");
					   attachment_reference= resultSet.getString("attachment_referrence");
				  }
				  statement.executeUpdate("update tbl_customerfeedback set date_of_feedback='"+customerFeedback.getDate_of_feedback()+"',type_of_feedback='"+customerFeedback.getType_of_feedback()+"',feedback_recorded_by='"+customerFeedback.getFeedback_recorded_by()+"',feedback_details='"+customerFeedback.getFeedback_details()+"',attachment_name='"+attachment_name+"',attachement_type='"+attachment_type+"',attachment_referrence='"+attachment_reference+"' where feedback_id='"+customerFeedback.getFeedback_id()+"'");
				
				  status=true;
				 }
			  else{
				  System.out.println("else");
			String cmd_update = "update tbl_customerfeedback set date_of_feedback='"+customerFeedback.getDate_of_feedback()+"',type_of_feedback='"+customerFeedback.getType_of_feedback()+"',feedback_recorded_by='"+customerFeedback.getFeedback_recorded_by()+"',feedback_details='"+customerFeedback.getFeedback_details()+"',attachment_name='"+customerFeedback.getAttachment_name()+"', attachement_type='"+customerFeedback.getAttachment_type()+"', attachment_referrence='"+customerFeedback.getAttachment_referrence()+"' where feedback_id='"+customerFeedback.getFeedback_id()+"'";
			System.out.println(statement.execute(cmd_update));
			System.out.println("update feedback="+status);
			System.out.println("feed back id= "+customerFeedback.getFeedback_id());
			statement.execute(cmd_update);
			status = true;
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
		return status;
		

	}
	
	public List<CustomerFeedback> getfeedback_report(String type_of_feedback,String from_date,String to_date){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		List<CustomerFeedback> customerFeedbacks = new ArrayList<CustomerFeedback>();
	    try{
	    	System.out.println("yes");
	    	String cmd_sqlString="";
	    	System.out.println(type_of_feedback);
	    	if(type_of_feedback.equals("Complaint"))
	    		cmd_sqlString="select * from tbl_customerfeedback where date_of_feedback BETWEEN '"+from_date+"' AND '"+to_date+"' AND type_of_feedback='Complaint'";
	    	else
	    		cmd_sqlString="select * from tbl_customerfeedback where date_of_feedback BETWEEN '"+from_date+"' AND '"+to_date+"' AND type_of_feedback='Suggestion'";
		    	System.out.println(cmd_sqlString);
			resultSet = statement.executeQuery(cmd_sqlString);
			while(resultSet.next()){
				customerFeedbacks.add(new CustomerFeedback(resultSet.getString("feedback_id"),resultSet.getString("date_of_feedback"), resultSet.getString("type_of_feedback"), resultSet.getString("feedback_recorded_by"), resultSet.getString("feedback_details"), resultSet.getString("attachment_name"),resultSet.getString("attachement_type"),resultSet.getString("attachment_referrence")));
			}
	   
	    
	    
	    }
	    catch(Exception e)
	    {
	    	System.out.println(e.toString());
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    }
	    finally{
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);	    	
	    }
	    return customerFeedbacks;
	    
	    
	    }
	
	public List<CustomerFeedback> getfindcustomerfeedback(String date, String type,int page) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<CustomerFeedback> customerFeedbacks = new ArrayList<CustomerFeedback>();
		try {
			if(page >= 1)
	    	{
	    	int offset = 5 * (page - 1);
			int limit = 5;
			
			if(!date.equals("") && !type.equals(""))
			{
				resultSet = statement.executeQuery("select * from tbl_customerfeedback where date_of_feedback='"+ date +"' and type_of_feedback='"+ type +"' limit " + offset + ","+ limit+"");
			}
			else if(!date.equals("") && type.equals(""))
			{
				resultSet = statement.executeQuery("select * from tbl_customerfeedback where date_of_feedback='"+ date +"' limit " + offset + ","+ limit+"");
			}
			else if(date.equals("") && !type.equals(""))
			{
				resultSet = statement.executeQuery("select * from tbl_customerfeedback where type_of_feedback='"+ type +"' limit " + offset + ","+ limit+"");
			}
			else
			{
				resultSet = statement.executeQuery("select * from tbl_customerfeedback where date_of_feedback='"+ date +"' or type_of_feedback='"+ type +"' limit " + offset + ","+ limit+"");
			}
	    	}
			else
			{

				if(!date.equals("") && !type.equals(""))
				{
					resultSet = statement.executeQuery("select * from tbl_customerfeedback where date_of_feedback='"+ date +"' and type_of_feedback='"+ type +"'");
				}
				else if(!date.equals("") && type.equals(""))
				{
					resultSet = statement.executeQuery("select * from tbl_customerfeedback where date_of_feedback='"+ date +"'");
				}
				else if(date.equals("") && !type.equals(""))
				{
					resultSet = statement.executeQuery("select * from tbl_customerfeedback where type_of_feedback='"+ type +"'");
				}
				else
				{
					resultSet = statement.executeQuery("select * from tbl_customerfeedback where date_of_feedback='"+ date +"' or type_of_feedback='"+ type +"'");
				}
			}
		while (resultSet.next()) {
			customerFeedbacks.add(new CustomerFeedback(resultSet.getString("feedback_id"),resultSet.getString("date_of_feedback"), resultSet.getString("type_of_feedback"), resultSet.getString("feedback_recorded_by"), resultSet.getString("feedback_details"), resultSet.getString("attachment_name"),resultSet.getString("attachement_type"),resultSet.getString("attachment_referrence")));
			

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
		return customerFeedbacks;

	}
	
	public int getFindCustomerfeedback(String date, String type) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		int noofRecords =0;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<CustomerFeedback> customerFeedbacks = new ArrayList<CustomerFeedback>();
		try {
			if(!date.equals("") && !type.equals(""))
			{
				resultSet = statement.executeQuery("select count(*) as noofrecords from tbl_customerfeedback where date_of_feedback='"+ date +"' and type_of_feedback='"+ type +"'");
			}
			else if(!date.equals("") && type.equals(""))
			{
				resultSet = statement.executeQuery("select count(*) as noofrecords from tbl_customerfeedback where date_of_feedback='"+ date +"'");
			}
			else if(date.equals("") && !type.equals(""))
			{
				resultSet = statement.executeQuery("select count(*) as noofrecords from tbl_customerfeedback where type_of_feedback='"+ type +"'");
			}
			else
			{
				resultSet = statement.executeQuery("select count(*) as noofrecords from tbl_customerfeedback where date_of_feedback='"+ date +"' or type_of_feedback='"+ type +"'");
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

	public  List<CustomerFeedback> getlimitedfeedbackreport(int page) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<CustomerFeedback> customerFeedbacks = new ArrayList<CustomerFeedback>();
		
		  try {

			String cmd;
			int offset = 5 * (page - 1);
			int limit = 5;
					cmd="select * from tbl_customerfeedback limit " + offset + ","+ limit+"" ;
				
				//	cmd = "select * from tbl_narrativereport order by pname asc limit " + offset + ","+ limit+"" ;

			resultSet = statement.executeQuery(cmd);
			while(resultSet.next()){
		     customerFeedbacks.add(new CustomerFeedback(resultSet.getString("feedback_id"),
		    		 resultSet.getString("date_of_feedback"),
		    		 resultSet.getString("type_of_feedback"),
		    		 resultSet.getString("feedback_recorded_by"),
		    		 resultSet.getString("feedback_details"),
		    		 resultSet.getString("attachment_name"),
		    		 resultSet.getString("attachement_type"),
		    		 resultSet.getString("attachment_referrence")));
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
		return customerFeedbacks;

	}
	public int getnooffeedbackreport() {
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
		List<CustomerFeedback> customerFeedbacks = new ArrayList<CustomerFeedback>();
		try {

			String cmd;
				cmd = "select count(*) as noofrecords from tbl_customerfeedback ";
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
	
	
	public DataSource getDataSource() {
		return dataSource;
	}
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
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
}