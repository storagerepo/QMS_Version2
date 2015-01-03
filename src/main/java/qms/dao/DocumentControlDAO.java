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

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import qms.controllers.AbstractITextPdfView;
import qms.model.DocumentMain;
import qms.model.Employee;
import qms.model.ExternalDocument;
import qms.model.Form;
import qms.model.NonConformance;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
public class DocumentControlDAO extends AbstractITextPdfView
{
	private DataSource dataSource;
	 
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	/**
	 * PDF Sheet Generation
	 */
	
	 
		@Override
		protected void buildPdfDocument(Map<String, Object> model, Document doc,
		PdfWriter writer, HttpServletRequest request, HttpServletResponse response)
		throws Exception {
		
       System.out.println("PDF REPORT");
		@SuppressWarnings("unchecked")
		List<DocumentMain> documentMains = (List<DocumentMain>) model.get("documentMains");
		String[] fields=(String[])model.get("fields");
		
		int memolist = fields.length;
		System.out.println(memolist);
       PdfPTable table=new PdfPTable(memolist+1);
       float[] width= new float[memolist+1];
		table.setWidthPercentage(100);
		int i=1;
		 table.addCell(createLabelCell("SNO"));
		 width[0] = 1.0f;
		
		for (String field : fields) {
			
			
			if(field.equals("document_id"))
			{
				width[i] = 1.0f;
				 i++;
				 table.addCell(createLabelCell("Document ID"));
				
			}
			else if(field.equals("document_title"))
			{
				width[i] = 1.0f;
				 i++;
				table.addCell(createLabelCell("Document Title"));
			}
			else if(field.equals("document_type"))
		    {
				width[i] = 1.0f;
				 i++;
				table.addCell(createLabelCell("Document Type"));
		    }
			else if(field.equals("media_type"))
		    {
				width[i] = 1.0f;
				 i++;
				table.addCell(createLabelCell("Media Type"));
		    }
			else if(field.equals("location"))
		    {
				width[i] = 1.0f;
				 i++;
				table.addCell(createLabelCell("Location"));
		    }
			else if(field.equals("process"))
		    {
				width[i] = 1.0f;
				 i++;
				table.addCell(createLabelCell("Process"));
		    }else if(field.equals("external"))
		    {
		    	width[i] = 1.0f;
				 i++;
				table.addCell(createLabelCell("External"));
		    }else if(field.equals("issuer"))
		    {
		    	width[i] = 1.0f;
				 i++;
				table.addCell(createLabelCell("Issuer"));
		    
		    }
		    else if(field.equals("revision_level"))
		    {
		    	width[i] = 1.0f;
				 i++;
				table.addCell(createLabelCell("Revision Level"));
		    }
		    else if(field.equals("date"))
		    {
		    	width[i] = 1.0f;
				 i++;
				table.addCell(createLabelCell("Date"));
		    }
		    else if(field.equals("approver1"))
		    {
		    	width[i] = 1.0f;
				 i++;
				table.addCell(createLabelCell("Approver1"));
		    }
		    else if(field.equals("approver2"))
		    {
		    	width[i] = 1.0f;
				 i++;
				table.addCell(createLabelCell("Approver2"));
		    }
		    else if(field.equals("approver3"))
		    {
		    	width[i] = 1.0f;
				 i++;
				table.addCell(createLabelCell("Approver3"));
		    }
		    else if(field.equals("status"))
		    {
		    	width[i] = 1.0f;
				 i++;
				table.addCell(createLabelCell("Status"));
		    }
		    else if(field.equals("comments"))
		    {
		    	width[i] = 1.0f;
				 i++;
				table.addCell(createLabelCell("Comments"));
		    }else if(field.equals("revision_id"))
		    {
		    	width[i] = 1.0f;
				 i++;
				table.addCell(createLabelCell("Revision Id"));
		    }
		}
		int j=1;
		for (DocumentMain documentMain:documentMains){	
			
			String sno = String.valueOf(j);
			table.addCell(createValueCell(sno));
			j++;
		for (String field : fields) {
			
			if(field.equals("document_id"))
			{
				
				
						table.addCell(createValueCell(documentMain.getDocument_id()));
					
			}      
			else if(field.equals("document_title"))
			{
				
				table.addCell(createValueCell(documentMain.getDocument_title()));
			}
			else if(field.equals("document_type"))
			{
				
				table.addCell(createValueCell(documentMain.getDocument_type()));
			}
			else if(field.equals("media_type"))	
			{
				
				table.addCell(createValueCell(documentMain.getMedia_type()));
			}
			else if(field.equals("location"))	
			{
				
				table.addCell(createValueCell(documentMain.getLocation()));
			}
			else if(field.equals("process"))	
			{
				
				table.addCell(createValueCell(documentMain.getProcess()));
			}
			else if(field.equals("external"))
			{
				
				if(documentMain.getExternal().equals("Yes"))
					table.addCell(createValueCell("Yes"));
				else
					table.addCell(createValueCell("No"));
			
			}
			else if(field.equals("issuer"))	
			{
				
				table.addCell(createValueCell(documentMain.getIssuer()));
			}
			else if(field.equals("revision_level"))	
			{
				
				table.addCell(createValueCell(documentMain.getRevision_level()));
			}
			else if(field.equals("date"))	
			{
				
				table.addCell(createValueCell(documentMain.getDate()));
			}
			else if(field.equals("approver1"))	
			{
				
				table.addCell(createValueCell(documentMain.getApprover1()));
			}
			else if(field.equals("approver2"))	
			{
			
				table.addCell(createValueCell(documentMain.getApprover2()));
			}
			else if(field.equals("approver3"))	
			{
				
				table.addCell(createValueCell(documentMain.getApprover3()));
			}
			else if(field.equals("status"))	
			{
				
				table.addCell(createValueCell(documentMain.getStatus()));
			}
			else if(field.equals("comments"))	
			{
				
				table.addCell(createValueCell(documentMain.getComments()));
			}
			else if(field.equals("revision_id"))	
			{
				
				table.addCell(createValueCell(documentMain.getRevision_id()));
			}
			

  		}
		}
		table.setWidths(width);
		
		doc.add(table);
	}
	
	
	public void setExcelHeader(HSSFSheet excelSheet,CellStyle style,String[] fields) {
		HSSFRow excelHeader = excelSheet.createRow(0);	
	//	String[] fields={"document_id","document_title","document_type","media_type","location","process","external","issuer","revision_level","date","approver1","approver2","approver3","status","comments"};
		int i=0;
		for (String field : fields) {
			
			if(field.equals("document_id"))
			{
				excelHeader.createCell(i).setCellValue("Document ID");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}
			else if(field.equals("document_title"))
			{
				excelHeader.createCell(i).setCellValue("Document Title");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}
			else if(field.equals("document_type"))
			{
				excelHeader.createCell(i).setCellValue("Document Type");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}
			else if(field.equals("media_type"))	
			{
				excelHeader.createCell(i).setCellValue("Media Type");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}else if(field.equals("location"))	
			{
				excelHeader.createCell(i).setCellValue("Location");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}else if(field.equals("process"))	
			{
				excelHeader.createCell(i).setCellValue("Process");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}else if(field.equals("external"))
			{
				excelHeader.createCell(i).setCellValue("External");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}else if(field.equals("issuer"))	
			{
				excelHeader.createCell(i).setCellValue("Issuer");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}else if(field.equals("revision_level"))	
			{
				excelHeader.createCell(i).setCellValue("Revision Level");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}else if(field.equals("date"))	
			{
				excelHeader.createCell(i).setCellValue("Date");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}else if(field.equals("approver1"))	
			{
				excelHeader.createCell(i).setCellValue("Approver 1");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}else if(field.equals("approver2"))	
			{
				excelHeader.createCell(i).setCellValue("Approver 2");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}else if(field.equals("approver3"))	
			{
				excelHeader.createCell(i).setCellValue("Approver 3");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}else if(field.equals("status"))	
			{
				excelHeader.createCell(i).setCellValue("Status");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}else if(field.equals("comments"))	
			{
				excelHeader.createCell(i).setCellValue("Comments");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}
			else if(field.equals("revision_id"))	
			{
				excelHeader.createCell(i).setCellValue("Revision No");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}
			
		}
	
	}
	
	
	//End
	
	
	public void setExcelRows(HSSFSheet excelSheet, List<DocumentMain> documentMains,String[] fields,CellStyle style2){
		int record = 1;
		int i=0;
		for (DocumentMain documentMain:documentMains){	
			HSSFRow excelRow = excelSheet.createRow(record++);
	//		excelRow.setRowStyle((HSSFCellStyle) style2);
		i=0;
				for (String field : fields) {
					
					if(field.equals("document_id"))
					{
						excelRow.createCell(i).setCellValue(
								documentMain.getDocument_id());
							i++;
					}
					else if(field.equals("document_title"))
					{
						excelRow.createCell(i).setCellValue(
								documentMain.getDocument_title());

						i++;
					}
					else if(field.equals("document_type"))
					{
						excelRow.createCell(i).setCellValue(
								documentMain.getDocument_type()
								);	i++;
					}
					else if(field.equals("media_type"))	
					{
						excelRow.createCell(i).setCellValue(
								documentMain.getMedia_type());
						i++;
					}else if(field.equals("location"))	
					{
						excelRow.createCell(i).setCellValue(
								documentMain.getLocation());
						i++;
					}else if(field.equals("process"))	
					{
						excelRow.createCell(i).setCellValue(
								documentMain.getProcess());
						i++;
					}else if(field.equals("external"))
					{
						if(documentMain.getExternal().equals("Yes"))
						excelRow.createCell(i).setCellValue("Yes");
						else
							excelRow.createCell(i).setCellValue("No");
						i++;
					}else if(field.equals("issuer"))	
					{
						excelRow.createCell(i).setCellValue(
								documentMain.getIssuer());
						i++;
					}else if(field.equals("revision_level"))	
					{
						excelRow.createCell(i).setCellValue(
								documentMain.getRevision_level());
						i++;
					}else if(field.equals("date"))	
					{
						excelRow.createCell(i).setCellValue(
								documentMain.getDate());
						i++;
					}else if(field.equals("approver1"))	
					{
						excelRow.createCell(i).setCellValue(
								documentMain.getApprover1());
						i++;
					}else if(field.equals("approver2"))	
					{
						excelRow.createCell(i).setCellValue(
								documentMain.getApprover2());
						i++;
					}else if(field.equals("approver3"))	
					{
						excelRow.createCell(i).setCellValue(
								documentMain.getApprover3());
						i++;
					}else if(field.equals("status"))	
					{
						excelRow.createCell(i).setCellValue(
								documentMain.getStatus());
						i++;
					}else if(field.equals("comments"))	
					{
						excelRow.createCell(i).setCellValue(
								documentMain.getComments());
						i++;
					}
					else if(field.equals("revision_id"))	
					{
						excelRow.createCell(i).setCellValue(
								documentMain.getRevision_id());
						i++;
					}
					
					
				}
		}
	}
	
	
	
	public String getMax_employeeID(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		String Maxid="EMP1001";
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
				e1.printStackTrace();
		}
		  try{
			  String cmd_select="select max(auto_id) as id from tbl_employee";
			resultSet = statement.executeQuery(cmd_select);
			if(resultSet.next())
			{
				if(!resultSet.getString("id").equals("null"))
				{
					Maxid="EMP"+(Integer.parseInt(resultSet.getString("id"))+1001);
				}
			}
	    }catch(Exception e){
	    	System.out.println("max"+e.toString());
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    }finally{
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);	    	
	    }
		    return Maxid;
		
	}
	
	//Getting unique id
	public String get_documentid()
	{
		 Connection con = null;
		 Statement statement = null;
		 ResultSet resultset = null;
		 String Max_id = "D1001";
		 try
		 {
			 con = dataSource.getConnection();
			 statement = con.createStatement();
		 }
		 catch(SQLException e)
		 {
			 e.printStackTrace();
		 }
		 try
		 {
			 String cmd_select = "select max(auto_id) as id from tbl_doccontrol_main";
			 resultset = statement.executeQuery(cmd_select);
			 if(resultset.next())
			 {
				 if(!resultset.getString("id").equals("null"))
				 {
					 Max_id = "D" + (Integer.parseInt(resultset.getString("id")) + 1001);
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
	
	
	public boolean delete_document(String document_id){
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
			  String cmd_delete1="delete from tbl_doccontrol_main where document_id='"+document_id+"'";
			  String cmd_delete2="delete from tbl_doccontrol_external where document_id='"+document_id+"'";
			  String revisiondocument = "delete from tbl_revisiondocument where auto_number='"+document_id+"'";
			  status=statement.execute(cmd_delete1);
			  status=statement.execute(cmd_delete2);
			  status=statement.execute(revisiondocument);
			
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
	
	public List<DocumentMain> getDocument_byid(String auto_number){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<DocumentMain> documentMains=new ArrayList<DocumentMain>();
		
	    try{
	    	System.out.println("sucess:"+auto_number);
			resultSet = statement.executeQuery("SELECT t1.*,t2.* FROM tbl_doccontrol_main  as t1 join tbl_doccontrol_external as t2 on t1.auto_number=t2.auto_no where t1.auto_number='"+auto_number+"'");
			while(resultSet.next())
			{
				documentMains.add(new DocumentMain(resultSet.getString("auto_number"),resultSet.getString("document_id"),resultSet.getString("document_title"),resultSet.getString("document_type"),resultSet.getString("media_type"),resultSet.getString("location"),resultSet.getString("process"),resultSet.getString("auto_no"),resultSet.getString("issuer"),resultSet.getString("revision_level"),resultSet.getString("date"),resultSet.getString("approver1"),resultSet.getString("approver2"),resultSet.getString("approver3"),resultSet.getString("comments"),resultSet.getString("status"),resultSet.getString("external"),resultSet.getString("attachment_name"),resultSet.getString("attachment_type"),resultSet.getString("attachment_referrence"),resultSet.getString("revision_id")));
				
					
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
	    return documentMains;
		
	}
	
	public List<String> getDocument_prefix(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<String> prefix = new ArrayList<String>();
		//int i=0;
	    try{
	    	resultSet = statement.executeQuery("select * from tbl_document_type_prefix");
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
	
	
	//Update Operation
	public boolean update_document(DocumentMain documentMain,String auto_number,String admin)
	{
		System.out.println("auto number = "+auto_number);
		System.out.println(documentMain.getAuto_no());
		System.out.println(documentMain.getAuto_number());
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status = false;
		try
		{
			con= dataSource.getConnection();
			statement = con.createStatement();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		try
		{	
			String doc_id = new String(documentMain.getDocument_id());
			System.out.println("document_id="+doc_id);
			String[] strings = doc_id.split(",");
			String documentid="";
			String id_nochange = "";
			 String approver1 = new String(documentMain.getApprover1());
			  String[] split = approver1.split(",");
			  String approver = split[0];
			if(strings.length >1)
			
			 documentid = strings[2];
			id_nochange= strings[0];
			
			System.out.println("document id = "+documentid);
			
			 String attachment_name ="";
			  String attachment_type="",attachment_reference="",document_id="";
			  System.out.println("revision_id= "+documentMain.getRevision_id());
			  String revision_id = "";/*Integer.parseInt(form.getRevision_id());*/
			  System.out.println(revision_id);
			 
			if((documentMain.getAttachment_name() == null && documentMain.getDocument_id().equals(id_nochange+","+id_nochange)) || (documentMain.getAttachment_type() == null && documentMain.getDocument_id().equals(id_nochange+","+id_nochange)) || (documentMain.getAttachment_referrence() == null && documentMain.getDocument_id().equals(id_nochange+","+id_nochange)))
			 {
				System.out.println("all null");
				 resultSet=statement.executeQuery("select tbl_doccontrol_main.attachment_name,tbl_doccontrol_main.attachment_type,tbl_doccontrol_main.attachment_referrence,tbl_doccontrol_external.revision_id from tbl_doccontrol_main,tbl_doccontrol_external where tbl_doccontrol_main.auto_number='"+documentMain.getAuto_number()+"'");
			
				 while(resultSet.next())
			  {
					 /*document_id=resultSet.getString("document_id");*/
				  attachment_name=resultSet.getString("attachment_name");
				  attachment_type=resultSet.getString("attachment_type");
				   attachment_reference= resultSet.getString("attachment_referrence");
				   
				   revision_id = resultSet.getString("revision_id");
				   System.out.println("revision id ="+revision_id);
			  }
			 if(documentMain.getRevision_id().equals(""))
			 {
				 statement.executeUpdate("update tbl_doccontrol_main set document_id='"+id_nochange+"',document_title='"+documentMain.getDocument_title()+"',document_type='"+documentMain.getDocument_type()+"',media_type='"+documentMain.getMedia_type()+"',location='"+documentMain.getLocation()+"',process='"+documentMain.getProcess()+"',external='"+documentMain.getExternal()+"',attachment_name='"+attachment_name+"',attachment_type='"+attachment_type+"',attachment_referrence='"+attachment_reference+"' where auto_number='"+documentMain.getAuto_number()+"'");
					statement.executeUpdate("update tbl_doccontrol_external set document_id='"+id_nochange+"',issuer='"+documentMain.getIssuer()+"',revision_level='"+documentMain.getRevision_level()+"',date='"+documentMain.getDate()+"',approver1='"+approver+"',approver2='"+documentMain.getApprover2()+"',approver3='"+documentMain.getApprover3()+"',comments='"+documentMain.getComments()+"',status='"+documentMain.getStatus()+"',revision_id='"+revision_id+"' where auto_no='"+documentMain.getAuto_number()+"'");
					status =true;
			 }
			 else{
			  	statement.executeUpdate("update tbl_doccontrol_main set document_id='"+id_nochange+"',document_title='"+documentMain.getDocument_title()+"',document_type='"+documentMain.getDocument_type()+"',media_type='"+documentMain.getMedia_type()+"',location='"+documentMain.getLocation()+"',process='"+documentMain.getProcess()+"',external='"+documentMain.getExternal()+"',attachment_name='"+attachment_name+"',attachment_type='"+attachment_type+"',attachment_referrence='"+attachment_reference+"' where auto_number='"+documentMain.getAuto_number()+"'");
					statement.executeUpdate("update tbl_doccontrol_external set document_id='"+id_nochange+"',issuer='"+documentMain.getIssuer()+"',revision_level='"+documentMain.getRevision_level()+"',date='"+documentMain.getDate()+"',approver1='"+approver+"',approver2='"+documentMain.getApprover2()+"',approver3='"+documentMain.getApprover3()+"',comments='"+documentMain.getComments()+"',status='"+documentMain.getStatus()+"',revision_id='"+documentMain.getRevision_id()+"' where auto_no='"+documentMain.getAuto_number()+"'");
					status =true;
			 } 
		 }
		else if(documentMain.getDocument_id().equals(id_nochange+","+id_nochange))
			{
				System.out.println("document id null");
				 resultSet=statement.executeQuery("select  tbl_doccontrol_external.revision_id from tbl_doccontrol_main,tbl_doccontrol_external where tbl_doccontrol_main.auto_number='"+documentMain.getAuto_number()+"'");
				
 
				 while(resultSet.next())
				  {
					 /*document_id=resultSet.getString("document_id");*/
					   revision_id = resultSet.getString("revision_id");
					   System.out.println("revision id ="+revision_id);	
				  }
				 if(documentMain.getRevision_id().equals(""))
				 {
					 String cmd_update1 = "update tbl_doccontrol_main set document_id='"+id_nochange+"', document_title='"+documentMain.getDocument_title()+"',document_type='"+documentMain.getDocument_type()+"',media_type='"+documentMain.getMedia_type()+"',location='"+documentMain.getLocation()+"',process='"+documentMain.getProcess()+"',external='"+documentMain.getExternal()+"',attachment_name='"+documentMain.getAttachment_name()+"',attachment_type='"+documentMain.getAttachment_type()+"',attachment_referrence='"+documentMain.getAttachment_referrence()+"' where auto_number='"+documentMain.getAuto_number()+"'";
						statement.execute(cmd_update1);
						String cmd_update2="update tbl_doccontrol_external set document_id='"+id_nochange+"',issuer='"+documentMain.getIssuer()+"',revision_level='"+documentMain.getRevision_level()+"',date='"+documentMain.getDate()+"',approver1='"+approver+"',approver2='"+documentMain.getApprover2()+"',approver3='"+documentMain.getApprover3()+"',comments='"+documentMain.getComments()+"',status='"+documentMain.getStatus()+"',revision_id='"+revision_id+"', where auto_no='"+documentMain.getAuto_number()+"'";
					    statement.execute(cmd_update2);
					    status =true;
				 }
				 else{
				  String cmd_update1 = "update tbl_doccontrol_main set document_id='"+id_nochange+"', document_title='"+documentMain.getDocument_title()+"',document_type='"+documentMain.getDocument_type()+"',media_type='"+documentMain.getMedia_type()+"',location='"+documentMain.getLocation()+"',process='"+documentMain.getProcess()+"',external='"+documentMain.getExternal()+"',attachment_name='"+documentMain.getAttachment_name()+"',attachment_type='"+documentMain.getAttachment_type()+"',attachment_referrence='"+documentMain.getAttachment_referrence()+"' where auto_number='"+documentMain.getAuto_number()+"'";
					statement.execute(cmd_update1);
					String cmd_update2="update tbl_doccontrol_external set document_id='"+id_nochange+"',issuer='"+documentMain.getIssuer()+"',revision_level='"+documentMain.getRevision_level()+"',date='"+documentMain.getDate()+"',approver1='"+approver+"',approver2='"+documentMain.getApprover2()+"',approver3='"+documentMain.getApprover3()+"',comments='"+documentMain.getComments()+"',status='"+documentMain.getStatus()+"',revision_id='"+documentMain.getRevision_id()+"', where auto_no='"+documentMain.getAuto_number()+"'";
				    statement.execute(cmd_update2);
				    status =true;
				 }
		}
			else if(documentMain.getAttachment_name() == null || documentMain.getAttachment_type() == null || documentMain.getAttachment_referrence() == null)
			 {
				System.out.println("attachment null");
				 resultSet=statement.executeQuery("select tbl_doccontrol_main.attachment_name,tbl_doccontrol_main.attachment_type,tbl_doccontrol_main.attachment_referrence,tbl_doccontrol_external.revision_id from tbl_doccontrol_main,tbl_doccontrol_external where tbl_doccontrol_main.auto_number='"+documentMain.getAuto_number()+"'");
				

				 while(resultSet.next())
			  {
				 
				  attachment_name=resultSet.getString("attachment_name");
				  attachment_type=resultSet.getString("attachment_type");
				   attachment_reference= resultSet.getString("attachment_referrence");
				   revision_id = resultSet.getString("revision_id");
				   System.out.println("revision id ="+revision_id);
			  }
				 if(documentMain.getRevision_id().equals(""))
				 {
			  statement.executeUpdate("update tbl_doccontrol_main set document_id='"+documentid+"',document_title='"+documentMain.getDocument_title()+"',document_type='"+documentMain.getDocument_type()+"',media_type='"+documentMain.getMedia_type()+"',location='"+documentMain.getLocation()+"',process='"+documentMain.getProcess()+"',external='"+documentMain.getExternal()+"',attachment_name='"+attachment_name+"',attachment_type='"+attachment_type+"',attachment_referrence='"+attachment_reference+"' where auto_number='"+documentMain.getAuto_number()+"'");
			  statement.executeUpdate("update tbl_doccontrol_external set document_id='"+documentid+"',issuer='"+documentMain.getIssuer()+"',revision_level='"+documentMain.getRevision_level()+"',date='"+documentMain.getDate()+"',approver1='"+approver+"',approver2='"+documentMain.getApprover2()+"',approver3='"+documentMain.getApprover3()+"',comments='"+documentMain.getComments()+"',status='"+documentMain.getStatus()+"',revision_id='"+revision_id+"' where auto_no='"+documentMain.getAuto_number()+"'");	
			  status =true;
			 } 
				 else{
					 statement.executeUpdate("update tbl_doccontrol_main set document_id='"+documentid+"',document_title='"+documentMain.getDocument_title()+"',document_type='"+documentMain.getDocument_type()+"',media_type='"+documentMain.getMedia_type()+"',location='"+documentMain.getLocation()+"',process='"+documentMain.getProcess()+"',external='"+documentMain.getExternal()+"',attachment_name='"+attachment_name+"',attachment_type='"+attachment_type+"',attachment_referrence='"+attachment_reference+"' where auto_number='"+documentMain.getAuto_number()+"'");
					  statement.executeUpdate("update tbl_doccontrol_external set document_id='"+documentid+"',issuer='"+documentMain.getIssuer()+"',revision_level='"+documentMain.getRevision_level()+"',date='"+documentMain.getDate()+"',approver1='"+approver+"',approver2='"+documentMain.getApprover2()+"',approver3='"+documentMain.getApprover3()+"',comments='"+documentMain.getComments()+"',status='"+documentMain.getStatus()+"',revision_id='"+documentMain.getRevision_id()+"' where auto_no='"+documentMain.getAuto_number()+"'");	
					  status =true;
				 }
			 }		 
			else{
				System.out.println("not null");
				 resultSet=statement.executeQuery("select revision_id from tbl_doccontrol_external where auto_no='"+documentMain.getAuto_no()+"'");
				 while(resultSet.next())
				  {
					   revision_id = resultSet.getString("revision_id");
					   System.out.println("revision id ="+revision_id);
				  }
				 if(documentMain.getRevision_id().equals(""))
				 {
			String cmd_update1 = "update tbl_doccontrol_main set document_id='"+documentid+"',document_title='"+documentMain.getDocument_title()+"',document_type='"+documentMain.getDocument_type()+"',media_type='"+documentMain.getMedia_type()+"',location='"+documentMain.getLocation()+"',process='"+documentMain.getProcess()+"',external='"+documentMain.getExternal()+"',attachment_name='"+documentMain.getAttachment_name()+"',attachment_type='"+documentMain.getAttachment_type()+"',attachment_referrence='"+documentMain.getAttachment_referrence()+"' where auto_number='"+documentMain.getAuto_number()+"'";
			statement.execute(cmd_update1);
			String cmd_update2="update tbl_doccontrol_external set document_id='"+documentid+"',issuer='"+documentMain.getIssuer()+"',revision_level='"+documentMain.getRevision_level()+"',date='"+documentMain.getDate()+"',approver1='"+approver+"',approver2='"+documentMain.getApprover2()+"',approver3='"+documentMain.getApprover3()+"',comments='"+documentMain.getComments()+"',status='"+documentMain.getStatus()+"',revision_id='"+revision_id+"' where auto_no='"+documentMain.getAuto_number()+"'";
		    statement.execute(cmd_update2);
		    status =true;
				 }
				 else{
					 String cmd_update1 = "update tbl_doccontrol_main set document_id='"+documentid+"',document_title='"+documentMain.getDocument_title()+"',document_type='"+documentMain.getDocument_type()+"',media_type='"+documentMain.getMedia_type()+"',location='"+documentMain.getLocation()+"',process='"+documentMain.getProcess()+"',external='"+documentMain.getExternal()+"',attachment_name='"+documentMain.getAttachment_name()+"',attachment_type='"+documentMain.getAttachment_type()+"',attachment_referrence='"+documentMain.getAttachment_referrence()+"' where auto_number='"+documentMain.getAuto_number()+"'";
						statement.execute(cmd_update1);
						String cmd_update2="update tbl_doccontrol_external set document_id='"+documentid+"',issuer='"+documentMain.getIssuer()+"',revision_level='"+documentMain.getRevision_level()+"',date='"+documentMain.getDate()+"',approver1='"+approver+"',approver2='"+documentMain.getApprover2()+"',approver3='"+documentMain.getApprover3()+"',comments='"+documentMain.getComments()+"',status='"+documentMain.getStatus()+"',revision_id='"+documentMain.getRevision_id()+"' where auto_no='"+documentMain.getAuto_number()+"'";
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
	
	public boolean insert_document(DocumentMain documentMain)
	{
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		ResultSet resultSet1 = null;
		boolean status=false;
		String decimal1 = "",floor1 = "";
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
				e1.printStackTrace();
		}
		  try{
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
					 
					  String cmd_insert2;	
				 cmd_insert2="insert into tbl_doccontrol_external(auto_no,document_id,issuer,revision_level,date,approver1,approver2,approver3,comments,status,revision_id) values('"+documentMain.getAuto_number()+"','"+documentMain.getDocument_id()+"','"+documentMain.getIssuer()+"','"+documentMain.getRevision_level()+"','"+documentMain.getDate()+"','"+documentMain.getApprover1()+"','"+documentMain.getApprover2()+"','"+documentMain.getApprover3()+"','"+documentMain.getComments()+"','"+documentMain.getStatus()+"','0.0')";
				 statement.execute(cmd_insert2);
				  }
				  else if(floor1.equalsIgnoreCase("alpha"))
				  {
					  String cmd_insert2;	
						 cmd_insert2="insert into tbl_doccontrol_external(auto_no,document_id,issuer,revision_level,date,approver1,approver2,approver3,comments,status,revision_id) values('"+documentMain.getAuto_number()+"','"+documentMain.getDocument_id()+"','"+documentMain.getIssuer()+"','"+documentMain.getRevision_level()+"','"+documentMain.getDate()+"','"+documentMain.getApprover1()+"','"+documentMain.getApprover2()+"','"+documentMain.getApprover3()+"','"+documentMain.getComments()+"','"+documentMain.getStatus()+"','0.a')";
						 statement.execute(cmd_insert2);
				  }
				  else{
					  String cmd_insert2;	
						 cmd_insert2="insert into tbl_doccontrol_external(auto_no,document_id,issuer,revision_level,date,approver1,approver2,approver3,comments,status,revision_id) values('"+documentMain.getAuto_number()+"','"+documentMain.getDocument_id()+"','"+documentMain.getIssuer()+"','"+documentMain.getRevision_level()+"','"+documentMain.getDate()+"','"+documentMain.getApprover1()+"','"+documentMain.getApprover2()+"','"+documentMain.getApprover3()+"','"+documentMain.getComments()+"','"+documentMain.getStatus()+"','0')";
						 statement.execute(cmd_insert2);
				  }
			  }
			  else if(decimal1.equalsIgnoreCase("alpha"))
			  {
				  if(floor1.equalsIgnoreCase("integer"))
				  {
					  String cmd_insert2;	
						 cmd_insert2="insert into tbl_doccontrol_external(auto_no,document_id,issuer,revision_level,date,approver1,approver2,approver3,comments,status,revision_id) values('"+documentMain.getAuto_number()+"','"+documentMain.getDocument_id()+"','"+documentMain.getIssuer()+"','"+documentMain.getRevision_level()+"','"+documentMain.getDate()+"','"+documentMain.getApprover1()+"','"+documentMain.getApprover2()+"','"+documentMain.getApprover3()+"','"+documentMain.getComments()+"','"+documentMain.getStatus()+"','a.0')";
						 statement.execute(cmd_insert2);
				  }
				  else if(floor1.equalsIgnoreCase("alpha"))
				  {
					  String cmd_insert2;	
						 cmd_insert2="insert into tbl_doccontrol_external(auto_no,document_id,issuer,revision_level,date,approver1,approver2,approver3,comments,status,revision_id) values('"+documentMain.getAuto_number()+"','"+documentMain.getDocument_id()+"','"+documentMain.getIssuer()+"','"+documentMain.getRevision_level()+"','"+documentMain.getDate()+"','"+documentMain.getApprover1()+"','"+documentMain.getApprover2()+"','"+documentMain.getApprover3()+"','"+documentMain.getComments()+"','"+documentMain.getStatus()+"','a.a')";
						 statement.execute(cmd_insert2);
				  }
				  else
				  {
					  String cmd_insert2;	
						 cmd_insert2="insert into tbl_doccontrol_external(auto_no,document_id,issuer,revision_level,date,approver1,approver2,approver3,comments,status,revision_id) values('"+documentMain.getAuto_number()+"','"+documentMain.getDocument_id()+"','"+documentMain.getIssuer()+"','"+documentMain.getRevision_level()+"','"+documentMain.getDate()+"','"+documentMain.getApprover1()+"','"+documentMain.getApprover2()+"','"+documentMain.getApprover3()+"','"+documentMain.getComments()+"','"+documentMain.getStatus()+"','a')";
						 statement.execute(cmd_insert2);
				  }
			  }
				 String cmd_insert1="insert into tbl_doccontrol_main(auto_number,document_id,document_title,document_type,media_type,location,process,external,attachment_name,attachment_type,attachment_referrence) values('"+documentMain.getAuto_number()+"','"+documentMain.getDocument_id()+"','"+documentMain.getDocument_title()+"','"+documentMain.getDocument_type()+"','"+documentMain.getMedia_type()+"','"+documentMain.getLocation()+"','"+documentMain.getProcess()+"','"+documentMain.getExternal()+"','"+documentMain.getAttachment_name()+"','"+documentMain.getAttachment_type()+"','"+documentMain.getAttachment_referrence()+"')";
				  statement.execute(cmd_insert1);
			 status=true;
			  
			 
		  }catch(Exception e){
	    	System.out.println(e.toString());
	    	status=false;
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
	
	
	public List<DocumentMain> getDocuments(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<DocumentMain> documentMains = new ArrayList<DocumentMain>();
	    try{
			resultSet = statement.executeQuery("select * from tbl_doccontrol_main");
			System.out.println("came");
			while(resultSet.next()){
				System.out.println("count");
				documentMains.add(new DocumentMain(resultSet.getString("auto_number"),resultSet.getString("document_id"),resultSet.getString("document_title"),resultSet.getString("document_type"),resultSet.getString("media_type"),resultSet.getString("location"),resultSet.getString("process"),resultSet.getString("external"), resultSet.getString("attachment_name"),resultSet.getString("attachment_type"),resultSet.getString("attachment_referrence")));
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
	    return documentMains;
		
	}
	
	public List<DocumentMain> insert_prefix(String prefix){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		int flag=0;
		List<DocumentMain> documentMains = new ArrayList<DocumentMain>();
	    try{
	    	String cmd_available="Select * from tbl_document_type_prefix where prefix='"+prefix+"'";
	    	System.out.println(cmd_available);
	    	resultSet=statement.executeQuery(cmd_available);	    	
	    	if(resultSet.next())
	    	{
	    	 flag=1;
	    	}
	    	if(flag==0)
	    	{
	    	statement.execute("insert into tbl_document_type_prefix(document_type,prefix) values('Userdefined','"+prefix+"')");
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
	    return documentMains;
		
	}
	
	public List<DocumentMain> getDocuments(String id){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<DocumentMain> documentMains = new ArrayList<DocumentMain>();
	    try{
	    	String s = "select * from tbl_doccontrol_main where document_id='"+id+"'";
	    	System.out.println(s);
			resultSet = statement.executeQuery("select * from tbl_doccontrol_main where document_id='"+id+"'");
			System.out.println("came");
			while(resultSet.next()){
				System.out.println("count");
				documentMains.add(new DocumentMain(resultSet.getString("auto_number"),resultSet.getString("document_id"),resultSet.getString("document_title"),resultSet.getString("document_type"),resultSet.getString("media_type"),resultSet.getString("location"),resultSet.getString("process"),resultSet.getString("external"), resultSet.getString("attachment_name"),resultSet.getString("attachment_type"),resultSet.getString("attachment_referrence")));
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
	    return documentMains;
		
	}
	public boolean getDocumentsExit(String id){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean exit = false;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<DocumentMain> documentMains = new ArrayList<DocumentMain>();
	    try{
	    	String s = "select * from tbl_doccontrol_main where document_id='"+id+"'";
	    	System.out.println(s);
			resultSet = statement.executeQuery("select * from tbl_doccontrol_main where document_id='"+id+"'");
			System.out.println("came");
			while(resultSet.next()){
				System.out.println("count");
				documentMains.add(new DocumentMain(resultSet.getString("auto_number"),resultSet.getString("document_id"),resultSet.getString("document_title"),resultSet.getString("document_type"),resultSet.getString("media_type"),resultSet.getString("location"),resultSet.getString("process"),resultSet.getString("external"), resultSet.getString("attachment_name"),resultSet.getString("attachment_type"),resultSet.getString("attachment_referrence")));
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
	    return exit;
		
	}
	public int getDocumentsexit(String id,String autonumber){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		int exit = 0;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<DocumentMain> documentMains = new ArrayList<DocumentMain>();
	    try{
	    	String s = "select * from tbl_doccontrol_main where document_id='"+id+"'and auto_number!='"+autonumber+"'";
	    	System.out.println(s);
			resultSet = statement.executeQuery("select * from tbl_doccontrol_main where document_id='"+id+"' and auto_number!='"+autonumber+"'");
			System.out.println("came");
			while(resultSet.next()){
				System.out.println("count");
				documentMains.add(new DocumentMain(resultSet.getString("auto_number"),resultSet.getString("document_id"),resultSet.getString("document_title"),resultSet.getString("document_type"),resultSet.getString("media_type"),resultSet.getString("location"),resultSet.getString("process"),resultSet.getString("external"), resultSet.getString("attachment_name"),resultSet.getString("attachment_type"),resultSet.getString("attachment_referrence")));
			
				exit = exit+1;
				
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
	    return exit;
		
	}
	public List<DocumentMain> getDocuments_bytype(String type){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<DocumentMain> documentMains = new ArrayList<DocumentMain>();
	    try{
			resultSet = statement.executeQuery("select t1.*,t2.* from tbl_doccontrol_main as t1 join tbl_doccontrol_external as t2 on t1.document_id=t2.document_id where document_type='"+type+"'");
			System.out.println("came");
			int i=0,j=0;
			while(resultSet.next()){
				
								documentMains.add(new DocumentMain(resultSet.getString("document_id"),
										resultSet.getString("document_title"),
										resultSet.getString("document_type"),
										resultSet.getString("media_type"),
										resultSet.getString("location"), 
										resultSet.getString("process"),
										resultSet.getString("external"),
										resultSet.getString("issuer"),
										resultSet.getString("revision_level"),
										resultSet.getString("date"),
										resultSet.getString("approver1"),
										resultSet.getString("approver2"),
										resultSet.getString("approver3"),
										resultSet.getString("status"),
										resultSet.getString("comments"),
										resultSet.getString("revision_id")));
								if(i==j)
								{
									
								System.out.println("external value record no "+i+" "+documentMains.get(i).getExternal());
								i++;
								j++;
								}
			
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
	    return documentMains;
		
	}
	
	public List<DocumentMain> getDocuments_byExternal(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<DocumentMain> documentMains = new ArrayList<DocumentMain>();
	    try{
			resultSet = statement.executeQuery("select t1.*,t2.* from tbl_doccontrol_main as t1 join tbl_doccontrol_external as t2 on t1.document_id=t2.document_id where external='Yes'");
			System.out.println("came");
			while(resultSet.next()){
				documentMains.add(new DocumentMain(
						resultSet.getString("auto_number"),resultSet.getString("document_id"), 
						resultSet.getString("document_title"), resultSet.getString("document_type"),
						resultSet.getString("media_type"),resultSet.getString("location"),
						resultSet.getString("process"),resultSet.getString("auto_no"), 
						resultSet.getString("issuer"),
						resultSet.getString("revision_level"),
						resultSet.getString("date"),
						resultSet.getString("approver1"),resultSet.getString("approver2"),
						resultSet.getString("approver3"),resultSet.getString("comments"),
						resultSet.getString("status"),
						resultSet.getString("external"),resultSet.getString("attachment_name"),
						resultSet.getString("attachment_type"),resultSet.getString("attachment_referrence"),resultSet.getString("revision_id")));
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
	    return documentMains;
		
	}
	
	public List<DocumentMain> findDocuments(String search_document_type,String search_process,int page){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<DocumentMain> documentMains = new ArrayList<DocumentMain>();
	    try{
	    	if(page >= 1)
	    	{
	    	int offset = 5 * (page - 1);
			int limit = 5;
	    	if(!search_document_type.equals("") && !search_process.equals(""))
	    	{
	    		resultSet = statement.executeQuery("select * from tbl_doccontrol_main where document_type = '"+search_document_type+"' and process = '"+search_process+"' limit " + offset + ","+ limit+"");
	    	}
	    	else if(!search_document_type.equals("") || !search_process.equals(""))
	    	{
	    		resultSet = statement.executeQuery("select * from tbl_doccontrol_main where document_type = '"+search_document_type+"' or process = '"+search_process+"' limit " + offset + ","+ limit+"");
	    	}
	    	}
	    	else
	    	{
	    		if(!search_document_type.equals("") && !search_process.equals(""))
		    	{
		    		resultSet = statement.executeQuery("select * from tbl_doccontrol_main where document_type = '"+search_document_type+"' and process = '"+search_process+"' ");
		    	}
		    	else if(!search_document_type.equals("") || !search_process.equals(""))
		    	{
		    		resultSet = statement.executeQuery("select * from tbl_doccontrol_main where document_type = '"+search_document_type+"' or process = '"+search_process+"'");
		    	}
	    		
	    	}
	    	
	    		System.out.println("came");
			while(resultSet.next()){
				System.out.println("count");
				documentMains.add(new DocumentMain(resultSet.getString("auto_number"),resultSet.getString("document_id"),resultSet.getString("document_title"),resultSet.getString("document_type"),resultSet.getString("media_type"),resultSet.getString("location"),resultSet.getString("process"),resultSet.getString("external"), resultSet.getString("attachment_name"),resultSet.getString("attachment_type"),resultSet.getString("attachment_referrence")));
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
	    return documentMains;
		
	}
	
	
	public List<DocumentMain> findDocumentsdetails(int page){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<DocumentMain> documentMains = new ArrayList<DocumentMain>();
	    try{
	    	if(page >= 1)
	    	{
	    	int offset = 10 * (page - 1);
			int limit = 10;
	    		resultSet = statement.executeQuery("select * from tbl_doccontrol_main  limit " + offset + ","+ limit+"");
	    	
	    	}
	    	
	    	
	    		System.out.println("came");
			while(resultSet.next()){
				System.out.println("count");
				documentMains.add(new DocumentMain(resultSet.getString("auto_number"),resultSet.getString("document_id"),resultSet.getString("document_title"),resultSet.getString("document_type"),resultSet.getString("media_type"),resultSet.getString("location"),resultSet.getString("process"),resultSet.getString("external"), resultSet.getString("attachment_name"),resultSet.getString("attachment_type"),resultSet.getString("attachment_referrence")));
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
	    return documentMains;
		
	}
	
	public List<DocumentMain> view_documents(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<DocumentMain> documentMains = new ArrayList<DocumentMain>();
	    try{
	    	
	    	
	    		resultSet = statement.executeQuery("select * from tbl_doccontrol_main ");
	    	
	    	
	    		System.out.println("came");
			while(resultSet.next()){
				System.out.println("count");
				documentMains.add(new DocumentMain(resultSet.getString("auto_number"),resultSet.getString("document_id"),resultSet.getString("document_title"),resultSet.getString("document_type"),resultSet.getString("media_type"),resultSet.getString("location"),resultSet.getString("process"),resultSet.getString("external"), resultSet.getString("attachment_name"),resultSet.getString("attachment_type"),resultSet.getString("attachment_referrence")));
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
	    return documentMains;
		
	}
	
	public List<DocumentMain> viewdocuments(int page){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<DocumentMain> documentMains = new ArrayList<DocumentMain>();
	    try{
	    	if(page >= 1)
	    	{
	    	int offset = 10 * (page - 1);
			int limit = 10;
	    	
	    		resultSet = statement.executeQuery("select * from tbl_doccontrol_main ");
	    	
	    	
	    		System.out.println("came");
			while(resultSet.next()){
				System.out.println("count");
				documentMains.add(new DocumentMain(resultSet.getString("auto_number"),resultSet.getString("document_id"),resultSet.getString("document_title"),resultSet.getString("document_type"),resultSet.getString("media_type"),resultSet.getString("location"),resultSet.getString("process"),resultSet.getString("external"), resultSet.getString("attachment_name"),resultSet.getString("attachment_type"),resultSet.getString("attachment_referrence")));
			}
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
	    return documentMains;
		
	}
	
	public List<DocumentMain> getallforms(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<DocumentMain> documentMains = new ArrayList<DocumentMain>();
	    try{
	    	
	    		resultSet = statement.executeQuery("select * from tbl_doccontrol_main ");
	    	
	    	
	    		System.out.println("came");
			while(resultSet.next()){
				System.out.println("count");
				documentMains.add(new DocumentMain(resultSet.getString("auto_number"),resultSet.getString("document_id"),resultSet.getString("document_title"),resultSet.getString("document_type"),resultSet.getString("media_type"),resultSet.getString("location"),resultSet.getString("process"),resultSet.getString("external"), resultSet.getString("attachment_name"),resultSet.getString("attachment_type"),resultSet.getString("attachment_referrence")));
			
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
	    return documentMains;
		
	}
	
	
	public int FindDocuments(String search_document_type,String search_process){
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
		List<DocumentMain> documentMains = new ArrayList<DocumentMain>();
	    try{
	    	if(!search_document_type.equals("") && !search_process.equals(""))
	    	{
	    		resultSet = statement.executeQuery("select  count(*) as noofrecords from tbl_doccontrol_main where document_type = '"+search_document_type+"' and process = '"+search_process+"'");
	    	}
	    	else if(!search_document_type.equals("") || !search_process.equals(""))
	    	{
	    		resultSet = statement.executeQuery("select count(*) as noofrecords from tbl_doccontrol_main where document_type = '"+search_document_type+"' or process = '"+search_process+"'");
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
	public int viewDocuments(){
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
		List<DocumentMain> documentMains = new ArrayList<DocumentMain>();
	    try{
	    	
	    		resultSet = statement.executeQuery("select  count(*) as noofrecords from tbl_doccontrol_main ");
	    	
	    	
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
	


	public List<DocumentMain> list_documents(String document_id){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<DocumentMain> documentMains = new ArrayList<DocumentMain>();
	    try{
			resultSet = statement.executeQuery("select t1.*,t2.* from tbl_doccontrol_main as t1 join tbl_doccontrol_external as t2 on t1.document_id='"+document_id+"' and t2.document_id='"+document_id+"'");
			System.out.println("came");
			while(resultSet.next()){
								documentMains.add(new DocumentMain(resultSet.getString("auto_number"),resultSet.getString("document_id"), resultSet.getString("document_title"), resultSet.getString("document_type"),resultSet.getString("media_type"),resultSet.getString("location"), resultSet.getString("process"), resultSet.getString("auto_no"),resultSet.getString("issuer"),resultSet.getString("revision_level"),resultSet.getString("date"), resultSet.getString("approver1"),resultSet.getString("approver2"),resultSet.getString("approver3"),resultSet.getString("comments"),resultSet.getString("status"),resultSet.getString("external"),resultSet.getString("attachment_name"),resultSet.getString("attachment_type"),resultSet.getString("attachment_referrence"),resultSet.getString("revision_id")));
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
	    return documentMains;
		
	}
	public  List<DocumentMain> getlimiteddocumentreport(int page) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<DocumentMain> documentMains = new ArrayList<DocumentMain>();
		try {

			String cmd;
			int offset = 5 * (page - 1);
			int limit = 5;
					cmd="select * from tbl_doccontrol_main limit " + offset + ","+ limit+"" ;
				
				//	cmd = "select * from tbl_narrativereport order by pname asc limit " + offset + ","+ limit+"" ;

			resultSet = statement.executeQuery(cmd);
			while(resultSet.next()){
				System.out.println("count");
				documentMains.add(new DocumentMain(
						resultSet.getString("auto_number"),
						resultSet.getString("document_id"),
						resultSet.getString("document_title"),
						resultSet.getString("document_type"),
						resultSet.getString("media_type"),
						resultSet.getString("location"),
						resultSet.getString("process"),
						resultSet.getString("external"), 
						resultSet.getString("attachment_name"),
						resultSet.getString("attachment_type"),
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
		return documentMains;

	}
	
	public  List<DocumentMain> getlimiteddocument(int page) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<DocumentMain> documentMains = new ArrayList<DocumentMain>();
		try {

			String cmd;
			int offset = 10 * (page - 1);
			int limit = 10;
					cmd="select * from tbl_doccontrol_main limit " + offset + ","+ limit+"" ;
				
				//	cmd = "select * from tbl_narrativereport order by pname asc limit " + offset + ","+ limit+"" ;

			resultSet = statement.executeQuery(cmd);
			while(resultSet.next()){
				System.out.println("count");
				documentMains.add(new DocumentMain(
						resultSet.getString("auto_number"),
						resultSet.getString("document_id"),
						resultSet.getString("document_title"),
						resultSet.getString("document_type"),
						resultSet.getString("media_type"),
						resultSet.getString("location"),
						resultSet.getString("process"),
						resultSet.getString("external"), 
						resultSet.getString("attachment_name"),
						resultSet.getString("attachment_type"),
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
		return documentMains;

	}
	public int getnoofdocumentreport() {
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
		List<DocumentMain> documentMains = new ArrayList<DocumentMain>();
		try {

			String cmd;
			
					cmd = "select count(*) as noofrecords from tbl_doccontrol_main ";
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
	
	public boolean changeRevisionFormat(String auto_no)
	{
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		ResultSet resultSet1 = null;
		boolean status=false;
		String revision="",decimal1="",floor1="";
		System.out.println("revision Format");
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
				e1.printStackTrace();
		}
		  try{
			  System.out.println("inserting");
			  resultSet1=statement.executeQuery("select tbl_doccontrol_external.revision_id,tbl_revision_format.first,tbl_revision_format.second from tbl_doccontrol_external,tbl_revision_format where tbl_doccontrol_external.auto_no='"+auto_no+"' and tbl_revision_format.sno='1'");
				 
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
						  statement.executeUpdate("update tbl_doccontrol_external set revision_id='"+0.0+"' where auto_no='"+auto_no+"'");
						 
					  }
					  else if(revision.matches("^[a-z].[0-9]$"))
					  {
						  statement.executeUpdate("update tbl_doccontrol_external set revision_id='"+0.0+"' where auto_no='"+auto_no+"'");
					  }
					  else if(revision.matches("^[a-z].[a-z]$"))
					  {
						  statement.executeUpdate("update tbl_doccontrol_external set revision_id='"+0.0+"' where auto_no='"+auto_no+"'");
					  }
					  else if(revision.matches("^[a-z]$"))
					  {
						  statement.executeUpdate("update tbl_doccontrol_external set revision_id='"+0.0+"' where auto_no='"+auto_no+"'");
					  }
					  else if(revision.matches("^[0-9]$"))
					  {
						  statement.executeUpdate("update tbl_doccontrol_external set revision_id='"+0.0+"' where auto_no='"+auto_no+"'");
					  }
				  }
				  else if(floor1.equalsIgnoreCase("alpha"))
				  {
					  if(revision.matches("^[0-9].[0-9]$"))
					  {
						  statement.executeUpdate("update tbl_doccontrol_external set revision_id='0.a' where auto_no='"+auto_no+"'");
						 
					  }
					  else if(revision.matches("^[a-z].[0-9]$"))
					  {
						  statement.executeUpdate("update tbl_doccontrol_external set revision_id='0.a' where auto_no='"+auto_no+"'");
					  }
					  else if(revision.matches("^[a-z].[a-z]$"))
					  {
						  statement.executeUpdate("update tbl_doccontrol_external set revision_id='0.a' where auto_no='"+auto_no+"'");
					  }
					  else if(revision.matches("^[a-z]$"))
					  {
						  statement.executeUpdate("update tbl_doccontrol_external set revision_id='0.a' where auto_no='"+auto_no+"'");
					  }
					  else if(revision.matches("^[0-9]$"))
					  {
						  statement.executeUpdate("update tbl_doccontrol_external set revision_id='0.a' where auto_no='"+auto_no+"'");
					  }
				  }
				  else
				  {
					  if(revision.matches("^[0-9].[0-9]$"))
					  {
						  statement.executeUpdate("update tbl_doccontrol_external set revision_id='0' where auto_no='"+auto_no+"'");
						 
					  }
					  else  if(revision.matches("^[0-9].[a-z]$"))
					  {
						  statement.executeUpdate("update tbl_doccontrol_external set revision_id='0' where auto_no='"+auto_no+"'");
						 
					  }
					  else if(revision.matches("^[a-z].[0-9]$"))
					  {
						  statement.executeUpdate("update tbl_doccontrol_external set revision_id='0' where auto_no='"+auto_no+"'");
					  }
					  else if(revision.matches("^[a-z].[a-z]$"))
					  {
						  statement.executeUpdate("update tbl_doccontrol_external set revision_id='0' where auto_no='"+auto_no+"'");
					  }
					  else if(revision.matches("^[a-z]$"))
					  {
						  statement.executeUpdate("update tbl_doccontrol_external set revision_id='0' where auto_no='"+auto_no+"'");
					  }
					 
				  }
			  }
			  else  if(decimal1.equalsIgnoreCase("alpha"))
			  {
				  if(floor1.equalsIgnoreCase("integer"))
				  {
					  if(revision.matches("^[0-9].[0-9]$"))
					  {
						  statement.executeUpdate("update tbl_doccontrol_external set revision_id='a.0' where auto_no='"+auto_no+"'");
						 
					  }
					  else  if(revision.matches("^[0-9].[a-z]$"))
					  {
						  statement.executeUpdate("update tbl_doccontrol_external set revision_id='a.0' where auto_no='"+auto_no+"'");
						 
					  }
					  else if(revision.matches("^[a-z].[a-z]$"))
					  {
						  statement.executeUpdate("update tbl_doccontrol_external set revision_id='a.0' where auto_no='"+auto_no+"'");
					  }
					  else if(revision.matches("^[a-z]$"))
					  {
						  statement.executeUpdate("update tbl_doccontrol_external set revision_id='a.0' where auto_no='"+auto_no+"'");
					  }
					  else if(revision.matches("^[0-9]$"))
					  {
						  statement.executeUpdate("update tbl_doccontrol_external set revision_id='a.0' where auto_no='"+auto_no+"'");
					  }
					 
				  }
				  else if(floor1.equalsIgnoreCase("alpha"))
				  {
					  if(revision.matches("^[0-9].[0-9]$"))
					  {
						  statement.executeUpdate("update tbl_doccontrol_external set revision_id='a.a' where auto_no='"+auto_no+"'");
						 
					  }
					  else  if(revision.matches("^[0-9].[a-z]$"))
					  {
						  statement.executeUpdate("update tbl_doccontrol_external set revision_id='a.a' where auto_no='"+auto_no+"'");
						 
					  }
					  else if(revision.matches("^[a-z].[0-9]$"))
					  {
						  statement.executeUpdate("update tbl_doccontrol_external set revision_id='a.a' where auto_no='"+auto_no+"'");
					  }
					  else if(revision.matches("^[a-z]$"))
					  {
						  statement.executeUpdate("update tbl_doccontrol_external set revision_id='a.a' where auto_no='"+auto_no+"'");
					  }
					  else if(revision.matches("^[0-9]$"))
					  {
						  statement.executeUpdate("update tbl_doccontrol_external set revision_id='a.a' where auto_no='"+auto_no+"'");
					  }
				  }
				 /* else if(floor1.equalsIgnoreCase("romain"))
				  {
					  String intromain;	
					  intromain="insert into tbl_doccontrol_external(auto_no,effective_date,document_id,approver1,issuer,comments,revision_id) values('"+form.getAuto_no()+"','"+form.getEffective_date()+"','"+form.getForm_or_rec_id()+"','"+form.getApprover1()+"','"+form.getIssuer()+"','"+form.getComments()+"','a.i')";
						 statement.execute(intromain);
				  }*/
				  else
				  {
					  if(revision.matches("^[0-9].[0-9]$"))
					  {
						  statement.executeUpdate("update tbl_doccontrol_external set revision_id='a' where auto_no='"+auto_no+"'");
						 
					  }
					  else  if(revision.matches("^[0-9].[a-z]$"))
					  {
						  statement.executeUpdate("update tbl_doccontrol_external set revision_id='a' where auto_no='"+auto_no+"'");
						 
					  }
					  else if(revision.matches("^[a-z].[0-9]$"))
					  {
						  statement.executeUpdate("update tbl_doccontrol_external set revision_id='a' where auto_no='"+auto_no+"'");
					  }
					  else if(revision.matches("^[a-z].[a-z]$"))
					  {
						  statement.executeUpdate("update tbl_doccontrol_external set revision_id='a' where auto_no='"+auto_no+"'");
					  }
					  else if(revision.matches("^[0-9]$"))
					  {
						  statement.executeUpdate("update tbl_doccontrol_external set revision_id='a' where auto_no='"+auto_no+"'");
					  }
				  }
				  
			  }
			
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