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


import qms.controllers.AbstractITextPdfView;
import qms.model.Form;
import qms.model.FormLocation;
import qms.model.Revision_No;


public class FormDAO extends AbstractITextPdfView{
	private DataSource datasource;

	@Override
	protected void buildPdfDocument(Map<String, Object> model, Document doc,
			PdfWriter writer, HttpServletRequest request, HttpServletResponse response)
	throws Exception {

		
		
		  
		
		@SuppressWarnings("unchecked")
		List<Form> form = (List<Form>) model.get("form");
		String[] fields=(String[])model.get("fields");
		int memolist = fields.length;
		System.out.println(memolist+1);
       PdfPTable table=new PdfPTable(memolist+1);
       float[] width= new float[memolist+1];
      
		table.setWidthPercentage(100);
		int i=1;
		 table.addCell(createLabelCell("SNO"));
		 width[0] = 1.0f;
		for (String field : fields) {
			
			if(field.equals("location"))
			{
				width[i] = 1.0f;
				 i++;
				 table.addCell(createLabelCell("Location"));
				
			}
			else if(field.equals("form_or_rec_id"))
			{
				width[i] = 1.0f;
				 i++;
				 table.addCell(createLabelCell("Form/Rec Id"));
				
			}
			else if(field.equals("responsibility"))	
			{
				width[i] = 1.0f;
				 i++;
				 table.addCell(createLabelCell("Responsibility"));
				
			}else if(field.equals("form_or_rec_title"))	
			{
				width[i] = 1.0f;
				 i++;
				 table.addCell(createLabelCell("Form/Rec Title"));
				
			}else if(field.equals("process"))	
			{
				width[i] = 1.0f;
				 i++;
				 table.addCell(createLabelCell("Process"));
				
			}else if(field.equals("media_type"))
			{
				width[i] = 1.0f;
				 i++;
				 table.addCell(createLabelCell("Media Type"));
			
			}else if(field.equals("retention_time"))	
			{
				width[i] = 1.0f;
				 i++;
				 table.addCell(createLabelCell("Retention Time"));
				
			}else if(field.equals("form"))	
			{
				width[i] = 1.0f;
				 i++;
				 table.addCell(createLabelCell("Form"));
				
			}else if(field.equals("effective_date"))	
			{
				width[i] = 1.0f;
				 i++;
				 table.addCell(createLabelCell("Effective Date"));
				
			}else if(field.equals("document_id"))	
			{
				width[i] = 1.0f;
				 i++;
				 table.addCell(createLabelCell("Document Id"));
				
			}else if(field.equals("approver1"))	
			{
				width[i] = 1.0f;
				 i++;
				 table.addCell(createLabelCell("Approver 1"));
				
			}else if(field.equals("issuer"))	
			{
				width[i] = 1.0f;
				 i++;
				 table.addCell(createLabelCell("Issuer"));
				
			}else if(field.equals("comments"))	
			{
				width[i] = 1.0f;
				 i++;
				 table.addCell(createLabelCell("Comments"));
			
			}
			else if(field.equals("revision_id"))	
			{
				width[i] = 1.0f;
				 i++;
				 table.addCell(createLabelCell("Revsion No"));
				
			}
			
		}
		int j=1;
		
			for (Form forms:form){	
				String sno = String.valueOf(j);
				table.addCell(createValueCell(sno));
				j++;
				for (String field : fields) {
					
					 if(field.equals("location"))
					{
						table.addCell(createValueCell(
								forms.getLocation()));

						
					}
					else if(field.equals("form_or_rec_id"))
					{
						table.addCell(createValueCell(
								forms.getForm_or_rec_id())
								);
					}
					else if(field.equals("responsibility"))	
					{
						table.addCell(createValueCell(
								forms.getResponsibility()));
						
					}else if(field.equals("form_or_rec_title"))	
					{
						table.addCell(createValueCell(
								forms.getForm_or_rec_title()));
						
					}else if(field.equals("process"))	
					{
						table.addCell(createValueCell(
								forms.getProcess()));
						
					}else if(field.equals("media_type"))
					{
						table.addCell(createValueCell(
								forms.getMedia_type()));
						
					}else if(field.equals("retention_time"))	
					{
						table.addCell(createValueCell(
								forms.getRetention_time()));
						
					}else if(field.equals("form"))	
					{
						if(forms.getForm().equals("Yes"))
							table.addCell(createValueCell("Yes"));
							else
								table.addCell(createValueCell("No"));
							
					}else if(field.equals("effective_date"))	
					{
						table.addCell(createValueCell(
								forms.getEffective_date()));
					
					}else if(field.equals("document_id"))	
					{
						table.addCell(createValueCell(
								forms.getDocument_id()));
						
					}else if(field.equals("approver1"))	
					{
						table.addCell(createValueCell(
								forms.getApprover1()));
						
					}else if(field.equals("issuer"))	
					{
						table.addCell(createValueCell(
								forms.getIssuer()));
						
					}else if(field.equals("comments"))	
					{
						table.addCell(createValueCell(
								forms.getComments()));
						
					}
					else if(field.equals("revision_id"))	
					{
						table.addCell(createValueCell(
								forms.getRevision_id()));
						
					}
					
				}
			}
			table.setWidths(width);
			 doc.add(table);
			
	}
	public DataSource getDatasource() {
		return datasource;
	}


	public void setDatasource(DataSource datasource) {
		this.datasource = datasource;
	}


	//Getting unique id
	public String get_formid()
	{
		 Connection con = null;
		 Statement statement = null;
		 ResultSet resultset = null;
		 String Max_id = "F1001";
		 try
		 {
			 con = datasource.getConnection();
			 statement = con.createStatement();
		 }
		 catch(SQLException e)
		 {
			 e.printStackTrace();
		 }
		 try
		 {
			 String cmd_select = "select max(auto_id) as id from tbl_form";
			 resultset = statement.executeQuery(cmd_select);
			 if(resultset.next())
			 {
				 if(!resultset.getString("id").equals("null"))
				 {
					 Max_id = "F" + (Integer.parseInt(resultset.getString("id")) + 1001);
				 }
			 }
			 
		 }
		 catch(Exception e)
		 {
			 System.out.println("max"+e.toString());
			 System.out.println(e.toString());
			 releaseResultSet(resultset);
			 releaseStatement(statement);
		 }
		 finally
		 {
			releaseResultSet(resultset);
			releaseStatement(statement);
			releaseConnection(con);
		 }
		 return Max_id;
	}

	//Delete operation
	public boolean delete_form(String auto_no)
	{
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status = false;
		try
		{
			con = datasource.getConnection();
			statement = con.createStatement();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		try
		{
			String cmd_delete1 = "delete from tbl_form where auto_number ='"+auto_no+"'";
			status = statement.execute(cmd_delete1);
			String cmd_delete2 = "delete from tbl_form_child where auto_no ='"+auto_no+"'";
			status = statement.execute(cmd_delete2);
			String cmd_delete3 = "delete from tbl_revisionform where auto_no='"+auto_no+"'";
			System.out.println(cmd_delete3 );
			status = statement.execute(cmd_delete3);
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		finally
		{
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		return status;
	}
	
	//Request method
	public List<Form> getform()
	{
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try
		{
			con = datasource.getConnection();
			statement = con.createStatement();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		List<Form> form = new ArrayList<Form>();
		try
		{
			resultSet = statement.executeQuery("select t1.*,t2.* from tbl_form as t1 join tbl_form_child as t2 on t1.auto_number=t2.auto_no");
			while(resultSet.next())
			{
			form.add(new Form(resultSet.getString("auto_number"), resultSet.getString("location"), resultSet.getString("form_or_rec_id"),resultSet.getString("responsibility"),resultSet.getString("form_or_rec_title"), resultSet.getString("process"), resultSet.getString("media_type"),resultSet.getString("retention_time"),resultSet.getString("form"),resultSet.getString("attachment_name"),resultSet.getString("attachment_type"),resultSet.getString("attachment_referrence"),resultSet.getString("auto_no"),resultSet.getString("effective_date"),resultSet.getString("document_id"),resultSet.getString("approver1"),resultSet.getString("issuer"),resultSet.getString("comments"),resultSet.getString("revision_id")));
			}
		}
			catch(Exception e)
			{
				System.out.println(e.toString());
				releaseResultSet(resultSet);
				releaseStatement(statement);
				releaseConnection(con);
			}
			finally
			{
				releaseResultSet(resultSet);
				releaseStatement(statement);
				releaseConnection(con);
			}
			return form;
		}
	
	//Update Operation
	public boolean update_form(Form form,String auto_number,String admin)
	{
		System.out.println("auto number = "+auto_number);
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status = false;
		try
		{
			con= datasource.getConnection();
			statement = con.createStatement();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		try
		{
			String form_id = new String(form.getForm_or_rec_id());
			System.out.println("auto number @@@@@@@ = "+form.getAuto_no());
			System.out.println("form_or_rec_id="+form_id);
			String[] strings = form_id.split(",");
			String formid="";
			
			 String approver1 = new String(form.getApprover1());
			  String[] split = approver1.split(",");
			  String approver = split[0];
			if(strings.length >1)
			
			 formid = strings[1];
			
			System.out.println("form id = "+formid);
			
			 String attachment_name ="";
			  String attachment_type="",attachment_reference="",form_or_rec_id="";
			  System.out.println("revision_id="+form.getRevision_id());
			  String revision_id ="";/*Integer.parseInt(form.getRevision_id());*/
			  System.out.println(revision_id);
			
			  
			if((form.getAttachment_name() == null && form.getForm_or_rec_id().equals(",")) || (form.getAttachment_type() == null && form.getForm_or_rec_id().equals(",")) || (form.getAttachment_referrence() == null && form.getForm_or_rec_id().equals(",")))
			 {
				System.out.println("all null");
				 resultSet=statement.executeQuery("select tbl_form.form_or_rec_id,tbl_form.attachment_name,tbl_form.attachment_type,tbl_form.attachment_referrence,tbl_form_child.revision_id from tbl_form,tbl_form_child where tbl_form.auto_number='"+form.getAuto_no()+"'");
			System.out.println("select tbl_form.form_or_rec_id,tbl_form.attachment_name,tbl_form.attachment_type,tbl_form.attachment_referrence,tbl_form_child.revisiion_id from tbl_form,tbl_form_child where tbl_form.auto_number='"+form.getAuto_no()+"'");
				 while(resultSet.next())
			  {
				   form_or_rec_id=resultSet.getString("form_or_rec_id");
				  attachment_name=resultSet.getString("attachment_name");
				  attachment_type=resultSet.getString("attachment_type");
				   attachment_reference= resultSet.getString("attachment_referrence");
				   
				  revision_id = resultSet.getString("revision_id");
				 System.out.println("revision id ="+revision_id);
			  }
				
			if(form.getRevision_id().equals(""))
			{
				System.out.println("revision empty");
				statement.executeUpdate("update tbl_form set location='"+form.getLocation()+"',form_or_rec_id='"+form_or_rec_id+"',responsibility='"+form.getResponsibility()+"',form_or_rec_title='"+form.getForm_or_rec_title()+"',process='"+form.getProcess()+"',media_type='"+form.getMedia_type()+"',retention_time='"+form.getRetention_time()+"',form='"+form.getForm()+"',attachment_name='"+attachment_name+"',attachment_type='"+attachment_type+"',attachment_referrence='"+attachment_reference+"' where auto_number='"+form.getAuto_no()+"'");
				  statement.executeUpdate("update tbl_form_child set effective_date='"+form.getEffective_date()+"',document_id='"+form_or_rec_id+"',approver1='"+approver+"',issuer='"+form.getIssuer()+"',comments='"+form.getComments()+"',revision_id='"+revision_id+"' where auto_no='"+form.getAuto_no()+"'");	
				  status =true;
			}
			else{
				System.out.println("revision Noempty");
			  statement.executeUpdate("update tbl_form set location='"+form.getLocation()+"',form_or_rec_id='"+form_or_rec_id+"',responsibility='"+form.getResponsibility()+"',form_or_rec_title='"+form.getForm_or_rec_title()+"',process='"+form.getProcess()+"',media_type='"+form.getMedia_type()+"',retention_time='"+form.getRetention_time()+"',form='"+form.getForm()+"',attachment_name='"+attachment_name+"',attachment_type='"+attachment_type+"',attachment_referrence='"+attachment_reference+"' where auto_number='"+form.getAuto_no()+"'");
			  statement.executeUpdate("update tbl_form_child set effective_date='"+form.getEffective_date()+"',document_id='"+form_or_rec_id+"',approver1='"+approver+"',issuer='"+form.getIssuer()+"',comments='"+form.getComments()+"',revision_id='"+form.getRevision_id()+"' where auto_no='"+form.getAuto_no()+"'");	
			  status =true;
			}
			 } 
			
			else if(form.getForm_or_rec_id().equals(","))
			{
				System.out.println("form id null");
				 resultSet=statement.executeQuery("select  tbl_form.form_or_rec_id,tbl_form_child.revision_id from tbl_form,tbl_form_child where tbl_form.auto_number='"+form.getAuto_no()+"'");
				
 
				 while(resultSet.next())
				  {
					  form_or_rec_id=resultSet.getString("form_or_rec_id");
					   revision_id = resultSet.getString("revision_id");
					   System.out.println("revision id ="+revision_id);	
				  }
				 if(form.getRevision_id().equals(""))
					{
					  String cmd_update1 = "update tbl_form set location='"+form.getLocation()+"',form_or_rec_id='"+form_or_rec_id+"',responsibility='"+form.getResponsibility()+"',form_or_rec_title='"+form.getForm_or_rec_title()+"',process='"+form.getProcess()+"',media_type='"+form.getMedia_type()+"',retention_time='"+form.getRetention_time()+"',form='"+form.getForm()+"',attachment_name='"+form.getAttachment_name()+"',attachment_type='"+form.getAttachment_type()+"',attachment_referrence='"+form.getAttachment_referrence()+"' where auto_number='"+form.getAuto_no()+"'";
						statement.execute(cmd_update1);
						String cmd_update2="update tbl_form_child set effective_date='"+form.getEffective_date()+"',document_id='"+form_or_rec_id+"',approver1='"+approver+"',issuer='"+form.getIssuer()+"',comments='"+form.getComments()+"',revision_id='"+revision_id+"' where auto_no='"+form.getAuto_no()+"'";
					    statement.execute(cmd_update2);
					    status =true;
					 
					
					}
				else{
				  String cmd_update1 = "update tbl_form set location='"+form.getLocation()+"',form_or_rec_id='"+form_or_rec_id+"',responsibility='"+form.getResponsibility()+"',form_or_rec_title='"+form.getForm_or_rec_title()+"',process='"+form.getProcess()+"',media_type='"+form.getMedia_type()+"',retention_time='"+form.getRetention_time()+"',form='"+form.getForm()+"',attachment_name='"+form.getAttachment_name()+"',attachment_type='"+form.getAttachment_type()+"',attachment_referrence='"+form.getAttachment_referrence()+"' where auto_number='"+form.getAuto_no()+"'";
					statement.execute(cmd_update1);
					String cmd_update2="update tbl_form_child set effective_date='"+form.getEffective_date()+"',document_id='"+form_or_rec_id+"',approver1='"+approver+"',issuer='"+form.getIssuer()+"',comments='"+form.getComments()+"',revision_id='"+form.getRevision_id()+"' where auto_no='"+form.getAuto_no()+"'";
				    statement.execute(cmd_update2);
				    status =true;
				}
			}
			else if(form.getAttachment_name() == null || form.getAttachment_type() == null || form.getAttachment_referrence() == null)
			 {
				System.out.println("attachment null");
				 resultSet=statement.executeQuery("select tbl_form.attachment_name,tbl_form.attachment_type,tbl_form.attachment_referrence,tbl_form_child.revision_id from tbl_form,tbl_form_child where tbl_form.auto_number='"+form.getAuto_no()+"'");
				

				 while(resultSet.next())
			  {
				 
				  attachment_name=resultSet.getString("attachment_name");
				  attachment_type=resultSet.getString("attachment_type");
				   attachment_reference= resultSet.getString("attachment_referrence");
				   revision_id = resultSet.getString("revision_id");
				  System.out.println("revision id ="+revision_id);
			  }
				 if(form.getRevision_id().equals(""))
					{
						statement.executeUpdate("update tbl_form set location='"+form.getLocation()+"',form_or_rec_id='"+formid+"',responsibility='"+form.getResponsibility()+"',form_or_rec_title='"+form.getForm_or_rec_title()+"',process='"+form.getProcess()+"',media_type='"+form.getMedia_type()+"',retention_time='"+form.getRetention_time()+"',form='"+form.getForm()+"',attachment_name='"+attachment_name+"',attachment_type='"+attachment_type+"',attachment_referrence='"+attachment_reference+"' where auto_number='"+form.getAuto_no()+"'");
						  statement.executeUpdate("update tbl_form_child set effective_date='"+form.getEffective_date()+"',document_id='"+formid+"',approver1='"+approver+"',issuer='"+form.getIssuer()+"',comments='"+form.getComments()+"',revision_id='"+revision_id+"' where auto_no='"+form.getAuto_no()+"'");	
						  status =true;
					}
					else{
			  statement.executeUpdate("update tbl_form set location='"+form.getLocation()+"',form_or_rec_id='"+formid+"',responsibility='"+form.getResponsibility()+"',form_or_rec_title='"+form.getForm_or_rec_title()+"',process='"+form.getProcess()+"',media_type='"+form.getMedia_type()+"',retention_time='"+form.getRetention_time()+"',form='"+form.getForm()+"',attachment_name='"+attachment_name+"',attachment_type='"+attachment_type+"',attachment_referrence='"+attachment_reference+"' where auto_number='"+form.getAuto_no()+"'");
			  statement.executeUpdate("update tbl_form_child set effective_date='"+form.getEffective_date()+"',document_id='"+formid+"',approver1='"+approver+"',issuer='"+form.getIssuer()+"',comments='"+form.getComments()+"',revision_id='"+form.getRevision_id()+"' where auto_no='"+form.getAuto_no()+"'");	
			  status =true;
					}
			 } 
			else{
				System.out.println("not null");
				 resultSet=statement.executeQuery("select revision_id from tbl_form_child where auto_no='"+form.getAuto_no()+"'");
				 while(resultSet.next())
				  {
					   revision_id = resultSet.getString("revision_id");
					  System.out.println("revision id ="+revision_id);
				  }
				 if(form.getRevision_id().equals(""))
					{
					 String cmd_update1 = "update tbl_form set location='"+form.getLocation()+"',form_or_rec_id='"+formid+"',responsibility='"+form.getResponsibility()+"',form_or_rec_title='"+form.getForm_or_rec_title()+"',process='"+form.getProcess()+"',media_type='"+form.getMedia_type()+"',retention_time='"+form.getRetention_time()+"',form='"+form.getForm()+"',attachment_name='"+form.getAttachment_name()+"',attachment_type='"+form.getAttachment_type()+"',attachment_referrence='"+form.getAttachment_referrence()+"' where auto_number='"+form.getAuto_no()+"'";
						statement.execute(cmd_update1);
						String cmd_update2="update tbl_form_child set effective_date='"+form.getEffective_date()+"',document_id='"+formid+"',approver1='"+approver+"',issuer='"+form.getIssuer()+"',comments='"+form.getComments()+"',revision_id='"+revision_id+"' where auto_no='"+form.getAuto_no()+"'";
					    statement.execute(cmd_update2);
					    status =true;
						
					}
					else{
			String cmd_update1 = "update tbl_form set location='"+form.getLocation()+"',form_or_rec_id='"+formid+"',responsibility='"+form.getResponsibility()+"',form_or_rec_title='"+form.getForm_or_rec_title()+"',process='"+form.getProcess()+"',media_type='"+form.getMedia_type()+"',retention_time='"+form.getRetention_time()+"',form='"+form.getForm()+"',attachment_name='"+form.getAttachment_name()+"',attachment_type='"+form.getAttachment_type()+"',attachment_referrence='"+form.getAttachment_referrence()+"' where auto_number='"+form.getAuto_no()+"'";
			statement.execute(cmd_update1);
			String cmd_update2="update tbl_form_child set effective_date='"+form.getEffective_date()+"',document_id='"+formid+"',approver1='"+approver+"',issuer='"+form.getIssuer()+"',comments='"+form.getComments()+"',revision_id='"+form.getRevision_id()+"' where auto_no='"+form.getAuto_no()+"'";
		    statement.execute(cmd_update2);
		    status =true;
					}
			}
		
			
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		finally
		{
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		return status;
	}
	
	//Insert Operation
	public boolean insert_form(Form form)
	{
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		ResultSet resultSet1 = null;
		boolean status=false;
		
		String decimal1 = "",floor1 = "";
		
		try {
			con = datasource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
				e1.printStackTrace();
		}
		  try{
			  System.out.println("inserting");
			  resultSet1=statement.executeQuery("select first,second from tbl_revision_format where sno='1'");
			  while(resultSet1.next())
			  {
				decimal1  = resultSet1.getString("first");
				floor1 = resultSet1.getString("second");
			  }
			  if(decimal1.equalsIgnoreCase("integer"))
			  {
				  if(floor1.equalsIgnoreCase("integer"))
				  {
					  String bothint;	
						 bothint="insert into tbl_form_child(auto_no,effective_date,document_id,approver1,issuer,comments,revision_id) values('"+form.getAuto_no()+"','"+form.getEffective_date()+"','"+form.getForm_or_rec_id()+"','"+form.getApprover1()+"','"+form.getIssuer()+"','"+form.getComments()+"','0.0')";
						 statement.execute(bothint);
				  }
				  else if(floor1.equalsIgnoreCase("alpha"))
				  {
					  String intalpha;	
						 intalpha="insert into tbl_form_child(auto_no,effective_date,document_id,approver1,issuer,comments,revision_id) values('"+form.getAuto_no()+"','"+form.getEffective_date()+"','"+form.getForm_or_rec_id()+"','"+form.getApprover1()+"','"+form.getIssuer()+"','"+form.getComments()+"','"+0+".a')";
						 statement.execute(intalpha);
				  }
				  else if(floor1.equalsIgnoreCase("romain"))
				  {
					  String intromain;	
					  intromain="insert into tbl_form_child(auto_no,effective_date,document_id,approver1,issuer,comments,revision_id) values('"+form.getAuto_no()+"','"+form.getEffective_date()+"','"+form.getForm_or_rec_id()+"','"+form.getApprover1()+"','"+form.getIssuer()+"','"+form.getComments()+"','"+0+".i')";
						 statement.execute(intromain);
				  }
				  else
				  {
					  String intonly;	
					  intonly="insert into tbl_form_child(auto_no,effective_date,document_id,approver1,issuer,comments,revision_id) values('"+form.getAuto_no()+"','"+form.getEffective_date()+"','"+form.getForm_or_rec_id()+"','"+form.getApprover1()+"','"+form.getIssuer()+"','"+form.getComments()+"','"+0+"')";
						 statement.execute(intonly);
				  }
			  }
			  else  if(decimal1.equalsIgnoreCase("alpha"))
			  {
				  if(floor1.equalsIgnoreCase("integer"))
				  {
					  String bothint;	
						 bothint="insert into tbl_form_child(auto_no,effective_date,document_id,approver1,issuer,comments,revision_id) values('"+form.getAuto_no()+"','"+form.getEffective_date()+"','"+form.getForm_or_rec_id()+"','"+form.getApprover1()+"','"+form.getIssuer()+"','"+form.getComments()+"','a.0')";
						 statement.execute(bothint);
				  }
				  else if(floor1.equalsIgnoreCase("alpha"))
				  {
					  String intalpha;	
						 intalpha="insert into tbl_form_child(auto_no,effective_date,document_id,approver1,issuer,comments,revision_id) values('"+form.getAuto_no()+"','"+form.getEffective_date()+"','"+form.getForm_or_rec_id()+"','"+form.getApprover1()+"','"+form.getIssuer()+"','"+form.getComments()+"','a.a')";
						 statement.execute(intalpha);
				  }
				  else if(floor1.equalsIgnoreCase("romain"))
				  {
					  String intromain;	
					  intromain="insert into tbl_form_child(auto_no,effective_date,document_id,approver1,issuer,comments,revision_id) values('"+form.getAuto_no()+"','"+form.getEffective_date()+"','"+form.getForm_or_rec_id()+"','"+form.getApprover1()+"','"+form.getIssuer()+"','"+form.getComments()+"','a.i')";
						 statement.execute(intromain);
				  }
				  else
				  {
					  String intonly;	
					  intonly="insert into tbl_form_child(auto_no,effective_date,document_id,approver1,issuer,comments,revision_id) values('"+form.getAuto_no()+"','"+form.getEffective_date()+"','"+form.getForm_or_rec_id()+"','"+form.getApprover1()+"','"+form.getIssuer()+"','"+form.getComments()+"','a')";
						 statement.execute(intonly);
				  }
				  
			  }
			  else if(decimal1.equalsIgnoreCase("romain"))
			  {
				  if(floor1.equalsIgnoreCase("integer"))
				  {
					  String bothint;	
						 bothint="insert into tbl_form_child(auto_no,effective_date,document_id,approver1,issuer,comments,revision_id) values('"+form.getAuto_no()+"','"+form.getEffective_date()+"','"+form.getForm_or_rec_id()+"','"+form.getApprover1()+"','"+form.getIssuer()+"','"+form.getComments()+"','i.0')";
						 statement.execute(bothint);
				  }
				  else if(floor1.equalsIgnoreCase("alpha"))
				  {
					  String intalpha;	
						 intalpha="insert into tbl_form_child(auto_no,effective_date,document_id,approver1,issuer,comments,revision_id) values('"+form.getAuto_no()+"','"+form.getEffective_date()+"','"+form.getForm_or_rec_id()+"','"+form.getApprover1()+"','"+form.getIssuer()+"','"+form.getComments()+"','i.a')";
						 statement.execute(intalpha);
				  }
				  else if(floor1.equalsIgnoreCase("romain"))
				  {
					  String intromain;	
					  intromain="insert into tbl_form_child(auto_no,effective_date,document_id,approver1,issuer,comments,revision_id) values('"+form.getAuto_no()+"','"+form.getEffective_date()+"','"+form.getForm_or_rec_id()+"','"+form.getApprover1()+"','"+form.getIssuer()+"','"+form.getComments()+"','i.i')";
						 statement.execute(intromain);
				  }
				  else
				  {
					  String intonly;	
					  intonly="insert into tbl_form_child(auto_no,effective_date,document_id,approver1,issuer,comments,revision_id) values('"+form.getAuto_no()+"','"+form.getEffective_date()+"','"+form.getForm_or_rec_id()+"','"+form.getApprover1()+"','"+form.getIssuer()+"','"+form.getComments()+"','i')";
						 statement.execute(intonly);
				  }
			  }
			  String cmd_insert1="insert into tbl_form(auto_number,location,form_or_rec_id,responsibility,form_or_rec_title,process,media_type,retention_time,form,attachment_name,attachment_type,attachment_referrence) values('"+form.getAuto_no()+"','"+form.getLocation()+"','"+form.getForm_or_rec_id()+"','"+form.getResponsibility()+"','"+form.getForm_or_rec_title()+"','"+form.getProcess()+"','"+form.getMedia_type()+"','"+form.getRetention_time()+"','"+form.getForm()+"','"+form.getAttachment_name()+"','"+form.getAttachment_type()+"','"+form.getAttachment_referrence()+"')"; 
			  statement.execute(cmd_insert1);
			  
			  /*String cmd_insert1="insert into tbl_doccontrol_main(document_id,document_title,document_type,media_type,location,process,external,attachment_name,attachment_type,attachment_referrence) values('"+documentMain.getDocument_id()+"','"+documentMain.getDocument_title()+"','"+documentMain.getDocument_type()+"','"+documentMain.getMedia_type()+"','"+documentMain.getLocation()+"','"+documentMain.getProcess()+"','"+documentMain.getExternal()+"','"+documentMain.getAttachment_name()+"','"+documentMain.getAttachment_type()+"','"+documentMain.getAttachment_referrence()+"')";
			  statement.execute(cmd_insert1);*/
			  
			 /* String cmd_insert2;	
				 cmd_insert2="insert into tbl_form_child(auto_no,effective_date,document_id,approver1,issuer,comments,revision_id) values('"+form.getAuto_no()+"','"+form.getEffective_date()+"','"+form.getForm_or_rec_id()+"','"+form.getApprover1()+"','"+form.getIssuer()+"','"+form.getComments()+"','"+0+"')";
				 statement.execute(cmd_insert2);*/
		
			 status=true;
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
	
	
	//Request method by using auto_no
	public List<Form> getform(String auto_no){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = datasource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Form> form = new ArrayList<Form>();
	    try{
	    	resultSet = statement.executeQuery("select t1.*,t2.* from tbl_form as t1 join tbl_form_child as t2 on t1.auto_number='"+auto_no+"' AND t2.auto_no='"+auto_no+"'");
			System.out.println("came");
			while(resultSet.next()){
								form.add(new Form(resultSet.getString("auto_number"), resultSet.getString("location"), resultSet.getString("form_or_rec_id"),resultSet.getString("responsibility"),resultSet.getString("form_or_rec_title"), resultSet.getString("process"), resultSet.getString("media_type"),resultSet.getString("retention_time"),resultSet.getString("form"),resultSet.getString("attachment_name"),resultSet.getString("attachment_type"),resultSet.getString("attachment_referrence"), resultSet.getString("auto_no"),resultSet.getString("effective_date"),resultSet.getString("document_id"),resultSet.getString("approver1"),resultSet.getString("issuer"),resultSet.getString("comments"),resultSet.getString("revision_id")));
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
	    return form;
		
	}
	
	//Request method by using auto_number
	public List<Form> list_form(String auto_number){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = datasource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Form> form = new ArrayList<Form>();
	    try{
	    	resultSet = statement.executeQuery("select t1.*,t2.* from tbl_form as t1 join tbl_form_child as t2 on t1.auto_number= '"+auto_number+"' and t2.auto_no='"+auto_number+"' ");
			System.out.println("came");
			while(resultSet.next()){
								form.add(new Form(resultSet.getString("auto_number"), resultSet.getString("location"), resultSet.getString("form_or_rec_id"),resultSet.getString("responsibility"),resultSet.getString("form_or_rec_title"), resultSet.getString("process"), resultSet.getString("media_type"),resultSet.getString("retention_time"),resultSet.getString("form"),resultSet.getString("attachment_name"),resultSet.getString("attachment_type"),resultSet.getString("attachment_referrence"), resultSet.getString("auto_no"),resultSet.getString("effective_date"),resultSet.getString("document_id"),resultSet.getString("approver1"),resultSet.getString("issuer"),resultSet.getString("comments"),resultSet.getString("revision_id")));
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
	    return form;
		
	}
	
	public boolean list_formExit(String auto_number,String form_id){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean exit= false;
		try {
			con = datasource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Form> form = new ArrayList<Form>();
	    try{
	    	
	    	resultSet = statement.executeQuery("select t1.*,t2.* from tbl_form as t1 join tbl_form_child as t2 on t1.auto_number != '"+auto_number+"' and t2.auto_no !='"+auto_number+"' where form_or_rec_id='"+form_id+"'");
			System.out.println("came");
			while(resultSet.next()){
								form.add(new Form(resultSet.getString("auto_number"), resultSet.getString("location"), resultSet.getString("form_or_rec_id"),resultSet.getString("responsibility"),resultSet.getString("form_or_rec_title"), resultSet.getString("process"), resultSet.getString("media_type"),resultSet.getString("retention_time"),resultSet.getString("form"),resultSet.getString("attachment_name"),resultSet.getString("attachment_type"),resultSet.getString("attachment_referrence"), resultSet.getString("auto_no"),resultSet.getString("effective_date"),resultSet.getString("document_id"),resultSet.getString("approver1"),resultSet.getString("issuer"),resultSet.getString("comments"),resultSet.getString("revision_id")));
			exit = true;
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
	    System.out.println();
	    return exit;
		
	}
	
	/*public List<Form> getform(String recordtitle,
			String mediatype, String retentiontime) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		try {
			con = datasource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Form> form = new ArrayList<Form>();
		try {
			
			String cmd="";
			
			cmd = "select * from tbl_form as t1 join tbl_form_child as t2 on t1.auto_id=t2.auto_id where t1.form_or_rec_title='"+ recordtitle +"' or t1.form_media_type='"+ mediatype +"' or t1.retention_time='"+ retentiontime +"'";
			
			resultSet = statement.executeQuery(cmd);
		while (resultSet.next()) {
			form.add(new Form(resultSet.getString("auto_number"), resultSet.getString("location"), resultSet.getString("form_or_rec_id"),resultSet.getString("responsibility"),resultSet.getString("form_or_rec_title"), resultSet.getString("process"), resultSet.getString("media_type"),resultSet.getString("retention_time"),resultSet.getString("form"),resultSet.getString("attachment_name"),resultSet.getString("attachment_type"),resultSet.getString("attachment_referrence"), resultSet.getString("auto_no"),resultSet.getString("effective_date"),resultSet.getString("document_id"),resultSet.getString("approver1"),resultSet.getString("issuer"),resultSet.getString("comments")));
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
		return form;

	}*/
	
	//Search operation for find a particular record
	public List<Form> view_form(int page) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		//boolean status = false;
		System.out.println("auto_number");
		List<Form> form = new ArrayList<Form>();

		try {
			con = datasource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			if(page >= 1){
			int offset = 10 * (page - 1);
			int limit = 10;
		
			resultSet = statement.executeQuery("select t1.*,t2.* from tbl_form as t1 join tbl_form_child as t2 on t1.auto_number=t2.auto_no limit " + offset + ","+ limit+"");
			}
			
		//	String cmd_select = "select * from tb1_internalaudits";
			//resultSet = statement.executeQuery(cmd_select);
			while (resultSet.next()) {
							
								
				form.add(new Form(resultSet
						.getString("auto_number"), resultSet
						.getString("location"), resultSet
						.getString("form_or_rec_id"), resultSet
						.getString("responsibility"), resultSet
						.getString("form_or_rec_title"), resultSet
						.getString("process"), resultSet
						.getString("media_type"), resultSet
						.getString("retention_time"), resultSet
						.getString("form"), resultSet
						.getString("attachment_name"),resultSet
						.getString("attachment_type"), resultSet
						.getString("attachment_referrence"), resultSet
						.getString("auto_no"), resultSet
						.getString("effective_date"), resultSet
						.getString("document_id"), resultSet
						.getString("approver1"), resultSet
						.getString("issuer"), resultSet
						.getString("comments"),resultSet.getString("revision_id")));
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
		return form;
	}
	
	//Search operation for find a particular record
		public List<Form> search_form(String process,int page) {
			Connection con = null;
			Statement statement = null;
			ResultSet resultSet = null;
			//boolean status = false;
			System.out.println("auto_number");
			List<Form> form = new ArrayList<Form>();

			try {
				con = datasource.getConnection();
				statement = con.createStatement();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			try {
				if(page >= 1){
				int offset = 5 * (page - 1);
				int limit = 5;
			
				resultSet = statement.executeQuery("select t1.*,t2.* from tbl_form as t1 join tbl_form_child as t2 on t1.auto_number=t2.auto_no where t1.process like'"+process+"' limit " + offset + ","+ limit+"");
				}
				else
					resultSet = statement.executeQuery("select t1.*,t2.* from tbl_form as t1 join tbl_form_child as t2 on t1.auto_number=t2.auto_no where t1.process like'"+process+"'");

			//	String cmd_select = "select * from tb1_internalaudits";
				//resultSet = statement.executeQuery(cmd_select);
				while (resultSet.next()) {
								
									
					form.add(new Form(resultSet
							.getString("auto_number"), resultSet
							.getString("location"), resultSet
							.getString("form_or_rec_id"), resultSet
							.getString("responsibility"), resultSet
							.getString("form_or_rec_title"), resultSet
							.getString("process"), resultSet
							.getString("media_type"), resultSet
							.getString("retention_time"), resultSet
							.getString("form"), resultSet
							.getString("attachment_name"),resultSet
							.getString("attachment_type"), resultSet
							.getString("attachment_referrence"), resultSet
							.getString("auto_no"), resultSet
							.getString("effective_date"), resultSet
							.getString("document_id"), resultSet
							.getString("approver1"), resultSet
							.getString("issuer"), resultSet
							.getString("comments"),resultSet.getString("revision_id")));
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
			return form;
		}
	public List<Form> search_form1(String process,int page) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		//boolean status = false;
		System.out.println("auto_number");
		List<Form> form = new ArrayList<Form>();

		try {
			con = datasource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			if(page >= 1){
			int offset = 5 * (page - 1);
			int limit = 5;
		
			resultSet = statement.executeQuery("select t1.*,t2.* from tbl_form as t1 join tbl_form_child as t2 on t1.auto_number=t2.auto_no where t1.process like'"+process+"' limit " + offset + ","+ limit+"");
			}
			else
				resultSet = statement.executeQuery("select t1.*,t2.* from tbl_form as t1 join tbl_form_child as t2 on t1.auto_number=t2.auto_no where t1.process like'"+process+"'");

		//	String cmd_select = "select * from tb1_internalaudits";
			//resultSet = statement.executeQuery(cmd_select);
			while (resultSet.next()) {
							
								
				form.add(new Form(resultSet
						.getString("auto_number"), resultSet
						.getString("location"), resultSet
						.getString("form_or_rec_id"), resultSet
						.getString("responsibility"), resultSet
						.getString("form_or_rec_title"), resultSet
						.getString("process"), resultSet
						.getString("media_type"), resultSet
						.getString("retention_time"), resultSet
						.getString("form"), resultSet
						.getString("attachment_name"),resultSet
						.getString("attachment_type"), resultSet
						.getString("attachment_referrence"), resultSet
						.getString("auto_no"), resultSet
						.getString("effective_date"), resultSet
						.getString("document_id"), resultSet
						.getString("approver1"), resultSet
						.getString("issuer"), resultSet
						.getString("comments"),resultSet.getString("revision_id")));
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
		return form;
	}
	
	//get allrecords
	public List<Form> getallforms() {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		//boolean status = false;
		System.out.println("auto_number");
		List<Form> form = new ArrayList<Form>();

		try {
			con = datasource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			
		
			resultSet = statement.executeQuery("select t1.*,t2.* from tbl_form as t1 join tbl_form_child as t2 on t1.auto_number=t2.auto_no");
			
		//	String cmd_select = "select * from tb1_internalaudits";
			//resultSet = statement.executeQuery(cmd_select);
			while (resultSet.next()) {
							
								
				form.add(new Form(resultSet
						.getString("auto_number"), resultSet
						.getString("location"), resultSet
						.getString("form_or_rec_id"), resultSet
						.getString("responsibility"), resultSet
						.getString("form_or_rec_title"), resultSet
						.getString("process"), resultSet
						.getString("media_type"), resultSet
						.getString("retention_time"), resultSet
						.getString("form"), resultSet
						.getString("attachment_name"),resultSet
						.getString("attachment_type"), resultSet
						.getString("attachment_referrence"), resultSet
						.getString("auto_no"), resultSet
						.getString("effective_date"), resultSet
						.getString("document_id"), resultSet
						.getString("approver1"), resultSet
						.getString("issuer"), resultSet
						.getString("comments"),resultSet.getString("revision_id")));
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
		return form;
	}
	public int Search_form(String process) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		int noofRecords =0;
		System.out.println("auto_number");
		List<Form> form = new ArrayList<Form>();

		try {
			con = datasource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			resultSet = statement.executeQuery("select count(*) as noofrecords from tbl_form as t1 join tbl_form_child as t2 on t1.auto_number=t2.auto_no where t1.process like'"+process+"'");
			
			if (resultSet.next())
				noofRecords = resultSet.getInt("noofrecords");
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
		return noofRecords;
	}
	//Request method for human resources
	public List<Form> gethuman_resources(String process){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = datasource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Form> form = new ArrayList<Form>();
	    try{
			resultSet = statement.executeQuery("select t1.*,t2.* from tbl_form as t1 join tbl_form_child as t2 on t1.auto_number=t2.auto_no where t1.process='"+process+"'");
			System.out.println("fhr");
			while(resultSet.next()){
				form.add(new Form(resultSet.getString("auto_number"), resultSet.getString("location"), resultSet.getString("form_or_rec_id"),resultSet.getString("responsibility"),resultSet.getString("form_or_rec_title"), resultSet.getString("process"), resultSet.getString("media_type"),resultSet.getString("retention_time"),resultSet.getString("form"),resultSet.getString("attachment_name"),resultSet.getString("attachment_type"),resultSet.getString("attachment_referrence"), resultSet.getString("auto_no"),resultSet.getString("effective_date"),resultSet.getString("document_id"),resultSet.getString("approver1"),resultSet.getString("issuer"),resultSet.getString("comments"),resultSet.getString("revision_id")));
				
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
	    return form;
		
	}
	
	//viewforms
	public int view_form() {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		int noofRecords =0;
		System.out.println("auto_number");
		List<Form> form = new ArrayList<Form>();

		try {
			con = datasource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			resultSet = statement.executeQuery("select count(*) as noofrecords from tbl_form as t1 join tbl_form_child as t2 on t1.auto_number=t2.auto_no ");
			
			if (resultSet.next())
				noofRecords = resultSet.getInt("noofrecords");
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
		return noofRecords;
	}

	//
	
	public List<Form> getengineering(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = datasource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Form> form = new ArrayList<Form>();
	    try{
			resultSet = statement.executeQuery("select t1.*,t2.* from tbl_form as t1 join tbl_form_child as t2 on t1.auto_number=t2.auto_no where form_or_rec_id LIKE  'FEN%'");
			System.out.println("fen");
			while(resultSet.next()){
				form.add(new Form(resultSet.getString("auto_number"), resultSet.getString("location"), resultSet.getString("form_or_rec_id"),resultSet.getString("responsibility"),resultSet.getString("form_or_rec_title"), resultSet.getString("process"), resultSet.getString("media_type"),resultSet.getString("retention_time"),resultSet.getString("form"),resultSet.getString("attachment_name"),resultSet.getString("attachment_type"),resultSet.getString("attachment_referrence"), resultSet.getString("auto_no"),resultSet.getString("effective_date"),resultSet.getString("document_id"),resultSet.getString("approver1"),resultSet.getString("issuer"),resultSet.getString("comments"),resultSet.getString("revision_id")));
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
	    return form;
		
	}
	
	public List<String> getDocument_prefix(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = datasource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<String> prefix = new ArrayList<String>();
		//int i=0;
	    try{
	    	//System.out.println("Edit:"+document_id);
			resultSet = statement.executeQuery("select * from tbl_form_id_prefix");
			while(resultSet.next())
			{
		
				prefix.add(resultSet.getString("prefix"));
				
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
	    return prefix;
		
	}
	
	public List<Form> insert_prefix(String prefix){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = datasource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		int flag=0;
		List<Form> form = new ArrayList<Form>();
	    try{
	    	String cmd_available="Select * from tbl_form_id_prefix where prefix='"+prefix+"'";
	    	System.out.println(cmd_available);
	    	resultSet=statement.executeQuery(cmd_available);	    	
	    	if(resultSet.next())
	    	{
	    	 flag=1;
	    	}
	    	if(flag==0)
	    	{
	    	statement.execute("insert into tbl_form_id_prefix (form_type,prefix) values('Userdefined','"+prefix+"')");
	    	}
			
	    }catch(Exception e){
	    	System.out.println("prefix:"+e.toString());
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    }finally{
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);	    	
	    }
	    return form;
		
	}
	
	
	
	public  List<Form> getlimitedformreportview(int page) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		
		try {
			con = datasource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Form> form = new ArrayList<Form>();
		  try {

			String cmd;
			int offset = 10 * (page - 1);
			int limit = 10;
					cmd="select t1.*,t2.* from tbl_form as t1 join tbl_form_child as t2 on t1.auto_number=t2.auto_no limit " + offset + ","+ limit+"" ;
				
				//	cmd = "select * from tbl_narrativereport order by pname asc limit " + offset + ","+ limit+"" ;

			resultSet = statement.executeQuery(cmd);
			while(resultSet.next()){
				form.add(new Form(resultSet.getString("auto_number"), 
						resultSet.getString("location"), 
						resultSet.getString("form_or_rec_id"),
						resultSet.getString("responsibility"),
						resultSet.getString("form_or_rec_title"),
						resultSet.getString("process"), 
						resultSet.getString("media_type"),
						resultSet.getString("retention_time"),
						resultSet.getString("form"),
						resultSet.getString("attachment_name"),
						resultSet.getString("attachment_type"),
						resultSet.getString("attachment_referrence"),
						resultSet.getString("auto_no"),
						resultSet.getString("effective_date"),
						resultSet.getString("document_id"),
						resultSet.getString("approver1"),
						resultSet.getString("issuer"),
						resultSet.getString("comments"),resultSet.getString("revision_id")));
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
		return form;

	}
	
	public  List<Form> getlimitedformreport(int page) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		
		try {
			con = datasource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Form> form = new ArrayList<Form>();
		  try {

			String cmd;
			int offset = 5 * (page - 1);
			int limit = 5;
					cmd="select t1.*,t2.* from tbl_form as t1 join tbl_form_child as t2 on t1.auto_number=t2.auto_no limit " + offset + ","+ limit+"" ;
				
				//	cmd = "select * from tbl_narrativereport order by pname asc limit " + offset + ","+ limit+"" ;

			resultSet = statement.executeQuery(cmd);
			while(resultSet.next()){
				form.add(new Form(resultSet.getString("auto_number"), 
						resultSet.getString("location"), 
						resultSet.getString("form_or_rec_id"),
						resultSet.getString("responsibility"),
						resultSet.getString("form_or_rec_title"),
						resultSet.getString("process"), 
						resultSet.getString("media_type"),
						resultSet.getString("retention_time"),
						resultSet.getString("form"),
						resultSet.getString("attachment_name"),
						resultSet.getString("attachment_type"),
						resultSet.getString("attachment_referrence"),
						resultSet.getString("auto_no"),
						resultSet.getString("effective_date"),
						resultSet.getString("document_id"),
						resultSet.getString("approver1"),
						resultSet.getString("issuer"),
						resultSet.getString("comments"),resultSet.getString("revision_id")));
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
		return form;

	}
	public int getnoofformreport() {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		int noofRecords = 0;
		

		try {
			con = datasource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Form> form = new ArrayList<Form>();
		try {

			String cmd;
				cmd = "select count(*) as noofrecords from tbl_form as t1 join tbl_form_child as t2 on t1.auto_number=t2.auto_no ";
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
	public int getFormat() {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status = false;
		int count=0;
		List<Revision_No> format = new ArrayList<Revision_No>();

		try {
			con = datasource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String cmd_select = "select * from tbl_revision_format";
			resultSet = statement.executeQuery(cmd_select);
			while (resultSet.next()) {
				
				format.add(new Revision_No(resultSet
						.getString("first"), resultSet
						.getString("second")
						));
				count=count+1;
			}	
			
		} catch (Exception e) {
			System.out.println(e.toString());
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		} finally {
			System.out.println("count = "+count);
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		return count;
	}
	public List<Revision_No> getFormattype() {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status = false;
		List<Revision_No> format = new ArrayList<Revision_No>();

		try {
			con = datasource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String cmd_select = "select * from tbl_revision_format where sno='1'";
			resultSet = statement.executeQuery(cmd_select);
			while (resultSet.next()) {
				
				format.add(new Revision_No(resultSet
						.getString("first"), resultSet
						.getString("second")
						));
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
		return format;
	}
	public boolean Revision_No_Format(Revision_No revision_No) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status = false;
		try {
			con = datasource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String cmd_insert = "insert into tbl_revision_format(first,second)values('"+revision_No.getfirst()+"','"+revision_No.getsecond()+"')";
		
			statement.execute(cmd_insert);
			
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
	public boolean update_revisionformate(Revision_No revision_No) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status = false;
		try {
			con = datasource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			
			String cmd_update = "update tbl_revision_format set first='"+revision_No.getfirst()+"',second='"+revision_No.getsecond()+"' where sno='1'";
			
			System.out.println(cmd_update);
			 statement.execute(cmd_update);
			 status = true;
			
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
	public boolean change_RevisionFormat(Form form,String auto_no)
	{
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		ResultSet resultSet1 = null;
		boolean status=false;
		String revision="",decimal1="",floor1="";
		System.out.println("revision Format");
		try {
			con = datasource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
				e1.printStackTrace();
		}
		  try{
			  System.out.println("inserting");
			  resultSet1=statement.executeQuery("select tbl_form_child.revision_id,tbl_revision_format.first,tbl_revision_format.second from tbl_form_child,tbl_revision_format where tbl_form_child.auto_no='"+auto_no+"' and tbl_revision_format.sno='1'");
			 
			  while(resultSet1.next())
			  {
				revision  = resultSet1.getString("revision_id");
				decimal1  = resultSet1.getString("first");
				floor1 = resultSet1.getString("second");
			  }
			  System.out.println("decimal = "+decimal1);
			  System.out.println("floor = "+floor1);
			  System.out.println("revision = "+revision);
			  if(decimal1.equalsIgnoreCase("integer"))
			  {
				  System.out.println("integer");
				  if(floor1.equalsIgnoreCase("integer"))
				  {
					  System.out.println("floor");
					   if(revision.matches("^[0-9].[a-z]$"))
					  {
						  statement.executeUpdate("update tbl_form_child set revision_id='"+0.0+"' where auto_no='"+auto_no+"'");
						 
					  }
					  else if(revision.matches("^[a-z].[0-9]$"))
					  {
						  statement.executeUpdate("update tbl_form_child set revision_id='"+0.0+"' where auto_no='"+auto_no+"'");
					  }
					  else if(revision.matches("^[a-z].[a-z]$"))
					  {
						  statement.executeUpdate("update tbl_form_child set revision_id='"+0.0+"' where auto_no='"+auto_no+"'");
					  }
					  else if(revision.matches("^[a-z]$"))
					  {
						  statement.executeUpdate("update tbl_form_child set revision_id='"+0.0+"' where auto_no='"+auto_no+"'");
					  }
					  else if(revision.matches("^[0-9]$"))
					  {
						  statement.executeUpdate("update tbl_form_child set revision_id='"+0.0+"' where auto_no='"+auto_no+"'");
					  }
				  }
				  else if(floor1.equalsIgnoreCase("alpha"))
				  {
					  if(revision.matches("^[0-9].[0-9]$"))
					  {
						  statement.executeUpdate("update tbl_form_child set revision_id='0.a' where auto_no='"+auto_no+"'");
						 
					  }
					  else if(revision.matches("^[a-z].[0-9]$"))
					  {
						  statement.executeUpdate("update tbl_form_child set revision_id='0.a' where auto_no='"+auto_no+"'");
					  }
					  else if(revision.matches("^[a-z].[a-z]$"))
					  {
						  statement.executeUpdate("update tbl_form_child set revision_id='0.a' where auto_no='"+auto_no+"'");
					  }
					  else if(revision.matches("^[a-z]$"))
					  {
						  statement.executeUpdate("update tbl_form_child set revision_id='0.a' where auto_no='"+auto_no+"'");
					  }
					  else if(revision.matches("^[0-9]$"))
					  {
						  statement.executeUpdate("update tbl_form_child set revision_id='0.a' where auto_no='"+auto_no+"'");
					  }
				  }
				  else
				  {
					  if(revision.matches("^[0-9].[0-9]$"))
					  {
						  statement.executeUpdate("update tbl_form_child set revision_id='0' where auto_no='"+auto_no+"'");
						 
					  }
					  else  if(revision.matches("^[0-9].[a-z]$"))
					  {
						  statement.executeUpdate("update tbl_form_child set revision_id='0' where auto_no='"+auto_no+"'");
						 
					  }
					  else if(revision.matches("^[a-z].[0-9]$"))
					  {
						  statement.executeUpdate("update tbl_form_child set revision_id='0' where auto_no='"+auto_no+"'");
					  }
					  else if(revision.matches("^[a-z].[a-z]$"))
					  {
						  statement.executeUpdate("update tbl_form_child set revision_id='0' where auto_no='"+auto_no+"'");
					  }
					  else if(revision.matches("^[a-z]$"))
					  {
						  statement.executeUpdate("update tbl_form_child set revision_id='0' where auto_no='"+auto_no+"'");
					  }
					 
				  }
			  }
			  else  if(decimal1.equalsIgnoreCase("alpha"))
			  {
				  if(floor1.equalsIgnoreCase("integer"))
				  {
					  if(revision.matches("^[0-9].[0-9]$"))
					  {
						  statement.executeUpdate("update tbl_form_child set revision_id='a.0' where auto_no='"+auto_no+"'");
						 
					  }
					  else  if(revision.matches("^[0-9].[a-z]$"))
					  {
						  statement.executeUpdate("update tbl_form_child set revision_id='a.0' where auto_no='"+auto_no+"'");
						 
					  }
					  else if(revision.matches("^[a-z].[a-z]$"))
					  {
						  statement.executeUpdate("update tbl_form_child set revision_id='a.0' where auto_no='"+auto_no+"'");
					  }
					  else if(revision.matches("^[a-z]$"))
					  {
						  statement.executeUpdate("update tbl_form_child set revision_id='a.0' where auto_no='"+auto_no+"'");
					  }
					  else if(revision.matches("^[0-9]$"))
					  {
						  statement.executeUpdate("update tbl_form_child set revision_id='a.0' where auto_no='"+auto_no+"'");
					  }
					 
				  }
				  else if(floor1.equalsIgnoreCase("alpha"))
				  {
					  if(revision.matches("^[0-9].[0-9]$"))
					  {
						  statement.executeUpdate("update tbl_form_child set revision_id='a.a' where auto_no='"+auto_no+"'");
						 
					  }
					  else  if(revision.matches("^[0-9].[a-z]$"))
					  {
						  statement.executeUpdate("update tbl_form_child set revision_id='a.a' where auto_no='"+auto_no+"'");
						 
					  }
					  else if(revision.matches("^[a-z].[0-9]$"))
					  {
						  statement.executeUpdate("update tbl_form_child set revision_id='a.a' where auto_no='"+auto_no+"'");
					  }
					  else if(revision.matches("^[a-z]$"))
					  {
						  statement.executeUpdate("update tbl_form_child set revision_id='a.a' where auto_no='"+auto_no+"'");
					  }
					  else if(revision.matches("^[0-9]$"))
					  {
						  statement.executeUpdate("update tbl_form_child set revision_id='a.a' where auto_no='"+auto_no+"'");
					  }
				  }
				 /* else if(floor1.equalsIgnoreCase("romain"))
				  {
					  String intromain;	
					  intromain="insert into tbl_form_child(auto_no,effective_date,document_id,approver1,issuer,comments,revision_id) values('"+form.getAuto_no()+"','"+form.getEffective_date()+"','"+form.getForm_or_rec_id()+"','"+form.getApprover1()+"','"+form.getIssuer()+"','"+form.getComments()+"','a.i')";
						 statement.execute(intromain);
				  }*/
				  else
				  {
					  if(revision.matches("^[0-9].[0-9]$"))
					  {
						  statement.executeUpdate("update tbl_form_child set revision_id='a' where auto_no='"+auto_no+"'");
						 
					  }
					  else  if(revision.matches("^[0-9].[a-z]$"))
					  {
						  statement.executeUpdate("update tbl_form_child set revision_id='a' where auto_no='"+auto_no+"'");
						 
					  }
					  else if(revision.matches("^[a-z].[0-9]$"))
					  {
						  statement.executeUpdate("update tbl_form_child set revision_id='a' where auto_no='"+auto_no+"'");
					  }
					  else if(revision.matches("^[a-z].[a-z]$"))
					  {
						  statement.executeUpdate("update tbl_form_child set revision_id='a' where auto_no='"+auto_no+"'");
					  }
					  else if(revision.matches("^[0-9]$"))
					  {
						  statement.executeUpdate("update tbl_form_child set revision_id='a' where auto_no='"+auto_no+"'");
					  }
				  }
				  
			  }
			 /* else if(decimal1.equalsIgnoreCase("romain"))
			  {
				  if(floor1.equalsIgnoreCase("integer"))
				  {
					  String bothint;	
						 bothint="insert into tbl_form_child(auto_no,effective_date,document_id,approver1,issuer,comments,revision_id) values('"+form.getAuto_no()+"','"+form.getEffective_date()+"','"+form.getForm_or_rec_id()+"','"+form.getApprover1()+"','"+form.getIssuer()+"','"+form.getComments()+"','i.0')";
						 statement.execute(bothint);
				  }
				  else if(floor1.equalsIgnoreCase("alpha"))
				  {
					  String intalpha;	
						 intalpha="insert into tbl_form_child(auto_no,effective_date,document_id,approver1,issuer,comments,revision_id) values('"+form.getAuto_no()+"','"+form.getEffective_date()+"','"+form.getForm_or_rec_id()+"','"+form.getApprover1()+"','"+form.getIssuer()+"','"+form.getComments()+"','i.a')";
						 statement.execute(intalpha);
				  }
				  else if(floor1.equalsIgnoreCase("romain"))
				  {
					  String intromain;	
					  intromain="insert into tbl_form_child(auto_no,effective_date,document_id,approver1,issuer,comments,revision_id) values('"+form.getAuto_no()+"','"+form.getEffective_date()+"','"+form.getForm_or_rec_id()+"','"+form.getApprover1()+"','"+form.getIssuer()+"','"+form.getComments()+"','i.i')";
						 statement.execute(intromain);
				  }
				  else
				  {
					  String intonly;	
					  intonly="insert into tbl_form_child(auto_no,effective_date,document_id,approver1,issuer,comments,revision_id) values('"+form.getAuto_no()+"','"+form.getEffective_date()+"','"+form.getForm_or_rec_id()+"','"+form.getApprover1()+"','"+form.getIssuer()+"','"+form.getComments()+"','i')";
						 statement.execute(intonly);
				  }
			  }*/
				  status=true;
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