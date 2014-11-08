package qms.dao;

import java.security.Principal;
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
import qms.forms.InternalAuditFindingForm;
import qms.model.DocumentMain;
import qms.model.DocumentType;
import qms.model.InternalAudit_Finding;
import qms.model.InternalAudits;



	

	public class InternalAuditsDAO extends AbstractITextPdfView
	{
		private DataSource dataSource;
		
		
		public DataSource getDataSource() {
			return dataSource;
		}

		public void setDataSource(DataSource dataSource) {
			this.dataSource = dataSource;
		}

		
		/*
		 * Excel Sheet Generation
		 */
		@Override
		protected void buildPdfDocument(Map<String, Object> model, Document doc,
		PdfWriter writer, HttpServletRequest request, HttpServletResponse response)
		throws Exception {
			
		
			
			@SuppressWarnings("unchecked")
			List<InternalAudits> internalAudits=(List<InternalAudits>) model.get("internalAudits");
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
					if (field.equals("report_id")) 
					{
						
						width[i] = 1.0f;
						 i++;
						 table.addCell(createLabelCell("ID"));
					
						
					}
					else if (field.equals("process")) {
						width[i] = 1.0f;
						 i++;
						 table.addCell(createLabelCell("PROCESS"));
						
						}
					else if(field.equals("auditee_name")){
						width[i] = 1.0f;
						 i++;
						 table.addCell(createLabelCell("AUDITEE NAME"));
						
					}
					else if (field.equals("audit_start_date")) {
						width[i] = 1.0f;
						 i++;
						 table.addCell(createLabelCell("AUDIT START DATE"));
					
						}
					else if (field.equals("audit_due_date")) {
						width[i] = 1.0f;
						 i++;
						 table.addCell(createLabelCell("AUDIT DUE DATE"));
					
						}
					
					else if (field.equals("auditor")) {
						width[i] = 1.0f;
						 i++;
						 table.addCell(createLabelCell("AUDITOR"));
					
						}
					else if (field.equals("audit_notes")) {
						width[i] = 1.0f;
						 i++;
						 table.addCell(createLabelCell("AUDIT NOTES"));
					
						}
					else if (field.equals("finding")) {
						width[i] = 1.0f;
						 i++;
						 table.addCell(createLabelCell("FINDING"));
					
						}
					else if (field.equals("completion_date")) {
						width[i] = 1.0f;
						 i++;
						 table.addCell(createLabelCell("COMPLETION DATE"));
						
						}
					else if (field.equals("auditors_initial")) {
						width[i] = 1.0f;
						 i++;
						 table.addCell(createLabelCell("AUDITOR'S INITIALS"));
					
						}
				
			}
				
			int j=1;
			
			for (InternalAudits internalAudit:internalAudits ){	
				String sno = String.valueOf(j);
				table.addCell(createValueCell(sno));
				j++;
				for(String field:fields)
				{
					if (field.equals("report_id")) 
					{						
						table.addCell(createValueCell(
								internalAudit.getId()));
							
						
					}
					else if (field.equals("process")) {
						
						table.addCell(createValueCell(
								internalAudit.getProcess()));
							
							}
					else if (field.equals("auditee_name")) {
						
						table.addCell(createValueCell(
								internalAudit.getAuditee_name()));
							
							}
				 
					else if (field.equals("audit_start_date")) {
						
						table.addCell(createValueCell(
								internalAudit.getAudit_start_date()));
							
						}
					else if (field.equals("audit_due_date")) {
						
						table.addCell(createValueCell(
								internalAudit.getAudit_due_date()));
							
						}
					else if (field.equals("auditor")) {
						
						table.addCell(createValueCell(
								internalAudit.getAuditor()));
							
						}
					else if (field.equals("audit_notes")) {
						
						table.addCell(createValueCell(
								internalAudit.getAuditor_notes()));
						}
					else if (field.equals("finding")) {
						
						table.addCell(createValueCell(
								internalAudit.getFinding()));
						
						}
					else if (field.equals("completion_date")) {
						
						table.addCell(createValueCell(
								internalAudit.getCompletion_date()));
							
							}
					else if (field.equals("auditors_initial")) {
						
						table.addCell(createValueCell(
								internalAudit.getAuditors_initials()));
						
							}
					
								}
			}
			table.setWidths(width);
			
			doc.add(table);
		}
		
	//getting maximum+1 id for inserting
	public String get_maxid() {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		String Max_id = "AI1001";
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {

			String cmd_select = "select max(auto_id) as auto_id from tb1_internalaudits";
			
			resultSet = statement.executeQuery(cmd_select);
			if (resultSet.next()) {
				if (!resultSet.getString("auto_id").equals("null"))
					Max_id = "IA"+ (Integer.parseInt(resultSet.getString("auto_id")) + 1001);

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
//inserting
	public boolean insert_internalAudits(InternalAudits internalAudits){
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
			String cmd_insert = "insert into tb1_internalaudits(process,id,audit_start_date,audit_due_date,auditor,auditor_notes,finding,completion_date,auditors_initials,auditee_name)values ('"+internalAudits.getProcess()+"','"+internalAudits.getId()+"','"+internalAudits.getAudit_start_date()+"','"+internalAudits.getAudit_due_date()+"','"+internalAudits.getAuditor()+"','"+internalAudits.getAuditor_notes()+"','"+internalAudits.getFinding()+"','"+internalAudits.getCompletion_date()+"','"+internalAudits.getAuditors_initials()+"','"+internalAudits.getAuditee_name()+"')";;
			
			//System.out.println(statement.execute(cmd_insert));
			
			status = statement.execute(cmd_insert);
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

	//Edit operation
	public List<InternalAudits> edit_internalaudit(String id) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		List<InternalAudits> internalAudits = new ArrayList<InternalAudits>();

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			resultSet = statement.executeQuery("select * from tb1_internalaudits where id='"+id+"'");
			while (resultSet.next()) {
							
								
				internalAudits.add(new InternalAudits(resultSet
						.getString("id"), resultSet
						.getString("process"), resultSet
						.getString("audit_start_date"), resultSet
						.getString("audit_due_date"), resultSet
						.getString("auditor"), resultSet
						.getString("auditor_notes"), resultSet
						.getString("finding"), resultSet
						.getString("completion_date"), resultSet
						.getString("auditors_initials"), resultSet
						.getString("auditee_name")));
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
		return internalAudits;
	}
	
	//Update Operation
	public boolean update_internalaudits(InternalAudits internalAudits) {
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
			String cmd_update = "update tb1_internalaudits set process='"+internalAudits.getProcess()+"',audit_start_date='"+internalAudits.getAudit_start_date()+"',audit_due_date='"+internalAudits.getAudit_due_date()+"',auditor='"+internalAudits.getAuditor()+"',auditor_notes='"+internalAudits.getAuditor_notes()+"',finding='"+internalAudits.getFinding()+"',completion_date='"+internalAudits.getCompletion_date()+"',auditors_initials='"+internalAudits.getAuditors_initials()+"',auditee_name='"+internalAudits.getAuditee_name()+"' where id='"+internalAudits.getId()+"'"; 
			status = statement.execute(cmd_update);
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
	
	
	//deletion
		public boolean delete_internalAudits(String id) {
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
			String cmd_delete = "delete from tb1_internalaudits where id='" + id + "'";
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

	//To view Internal Audits records
	public List<InternalAudits> get_internalaudits(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		List<InternalAudits> internalAudits = new ArrayList<InternalAudits>();

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String cmd_select = "select * from tb1_internalaudits";
			resultSet = statement.executeQuery(cmd_select);
			while (resultSet.next()) {			
				internalAudits.add(new InternalAudits(resultSet
						.getString("id"), resultSet
						.getString("process"), resultSet
						.getString("audit_start_date"), resultSet
						.getString("audit_due_date"), resultSet
						.getString("auditor"), resultSet
						.getString("auditor_notes"), resultSet
						.getString("finding"), resultSet
						.getString("completion_date"), resultSet
						.getString("auditors_initials"), resultSet
						.getString("auditee_name")));
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
		return internalAudits;
	}
	//REPORT GENERATION
	
	public  List<InternalAudits> getAudit_bytype(String type){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		System.out.println("type"+type);
		List<InternalAudits> internalAudits = new ArrayList<InternalAudits>();

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
		/*	String cmd_select = "select * from tb1_internalaudits";
			
			if(type.equals("past_due_audits"))
				cmd_select="select * from tb1_internalaudits where audit_due_date>now()";			
			
			else if (type.equals("audits_with_nonconformance")) {
				cmd_select="select * from tb1_internalaudits where finding='nonconformance'";				
			}
			
			else if (type.equals("area_of_improvements")) {
				cmd_select="select * from tb1_internalaudits";//doubts
			}
			
			else if (type.equals("past_due_audits_by_auditor")) {
				cmd_select="select * from tb1_internalaudits where audit_due_date<completion_date";
			}
		
			else if (type.equals("audit_schedule")) {
				cmd_select="select * from tb1_internalaudits";
			}*/
			String cmd_select = "select * from tb1_internalaudits";
			//	String cmd_select;
				if(type.equals("past_due_audits")){
					//cmd_select="select * from tb1_internalaudits where audit_due_date > NOW() and completion_date < NOW";
					String query ="select * from tb1_internalaudits where audit_due_date>now()";
					System.out.println(query);
					cmd_select="select * from tb1_internalaudits where audit_due_date>now()";
				}
				else if (type.equals("audits_with_nonconformance")) {
					//cmd_select="select * from tb1_internalaudits where finding='nonconformance'";
					String query ="select * from tb1_internalaudits where audit_start_date < NOW() AND completion_date > NOW()";
					System.out.println(query);
					cmd_select="select * from tb1_internalaudits where audit_start_date < NOW() AND completion_date > NOW()";
				}
				
				else if (type.equals("area_of_improvements")) {
					cmd_select="select * from tb1_internalaudits where audit_start_date < NOW() AND completion_date > NOW()";//doubts
				}
				
				else if (type.equals("past_due_audits_by_auditor")) {
					//cmd_select="select * from tb1_internalaudits where audit_due_date<completion_date";
					cmd_select = "select * from tb1_internalaudits where audit_start_date < NOW() AND completion_date > NOW()";
				}
			
				else if (type.equals("audit_schedule")) {
					cmd_select="select * from tb1_internalaudits where audit_start_date < now() AND completion_date > now()";
				}
			System.out.println(cmd_select);
			resultSet = statement.executeQuery(cmd_select);
			while (resultSet.next()) {			
				internalAudits.add(new InternalAudits(resultSet
						.getString("id"), resultSet
						.getString("process"), resultSet
						.getString("audit_start_date"), resultSet
						.getString("audit_due_date"), resultSet
						.getString("auditor"), resultSet
						.getString("auditor_notes"), resultSet
						.getString("finding"), resultSet
						.getString("completion_date"), resultSet
						.getString("auditors_initials"), resultSet
						.getString("auditee_name")));
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
		return internalAudits;
	}
	
		//Search operation for find a particular record
	public List<InternalAudits> search_internalaudit(String id,String process,String auditee_name,int page,Principal principal) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		//boolean status = false;
		System.out.println("id");
		List<InternalAudits> internalAudits = new ArrayList<InternalAudits>();

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String roles="";
			String role="select role from login where username='"+principal.getName()+"'";
			resultSet=statement.executeQuery(role);
			while(resultSet.next())
			{
				roles=resultSet.getString("role");
			}
			
			if(page >= 1)
	    	{
	    	int offset = 5 * (page - 1);
			int limit = 5;
			if(!id.equals("") && !process.equals("") && !auditee_name.equals(""))
			{				
			if(roles.equals("2"))
			{
				resultSet = statement.executeQuery("select * from tb1_internalaudits where (id='"+id+"'and process='"+process+"' and auditee_name='"+auditee_name+"') limit " + offset + ","+ limit+"");	
			}
			else
			{
				resultSet = statement.executeQuery("select * from tb1_internalaudits where (id='"+id+"'and process='"+process+"' and auditee_name='"+auditee_name+"') and audit_start_date <= NOW() limit " + offset + ","+ limit+"");	
			}
			}
			else if(id.equals("") && !process.equals("") && !auditee_name.equals(""))
			{
			
				if(roles.equals("2"))
				{
					resultSet = statement.executeQuery("select * from tb1_internalaudits where (process='"+process+"' and auditee_name='"+auditee_name+"') limit " + offset + ","+ limit+"");	
				}
				else
				{
					resultSet = statement.executeQuery("select * from tb1_internalaudits where (process='"+process+"' and auditee_name='"+auditee_name+"') and audit_start_date <= NOW() limit " + offset + ","+ limit+"");
				}
			}
			else if(!id.equals("") && process.equals("") && !auditee_name.equals(""))
			{
			
				if(roles.equals("2"))
				{
					resultSet = statement.executeQuery("select * from tb1_internalaudits where (id='"+id+"' and auditee_name='"+auditee_name+"') limit " + offset + ","+ limit+"");	
				}
				else
				{
					resultSet = statement.executeQuery("select * from tb1_internalaudits where (id='"+id+"' and auditee_name='"+auditee_name+"') and audit_start_date <= NOW() limit " + offset + ","+ limit+"");
				}
			}
			else if(!id.equals("") && !process.equals("") && auditee_name.equals(""))
			{
			
				if(roles.equals("2"))
				{
					resultSet = statement.executeQuery("select * from tb1_internalaudits where (id='"+id+"' and process='"+process+"') limit " + offset + ","+ limit+"");	
				}
				else
				{
					resultSet = statement.executeQuery("select * from tb1_internalaudits where (id='"+id+"' and process='"+process+"') and audit_start_date <= NOW() limit " + offset + ","+ limit+"");
				}
			}
			else
			{
			
				if(roles.equals("2"))
				{
					resultSet = statement.executeQuery("select * from tb1_internalaudits where (id='"+id+"'or process='"+process+"' or auditee_name='"+auditee_name+"') limit " + offset + ","+ limit+"");	
				}
				else
				{
					resultSet = statement.executeQuery("select * from tb1_internalaudits where (id='"+id+"'or process='"+process+"' or auditee_name='"+auditee_name+"') and audit_start_date <= NOW() limit " + offset + ","+ limit+"");
				}
			}
	    	}
			else
			{
				if(!id.equals("") && !process.equals("") && !auditee_name.equals(""))
				{
				
					if(roles.equals("2"))
					{
						resultSet = statement.executeQuery("select * from tb1_internalaudits where (id='"+id+"'and process='"+process+"' and auditee_name='"+auditee_name+"')");	
					}
					else
					{
						resultSet = statement.executeQuery("select * from tb1_internalaudits where (id='"+id+"'and process='"+process+"' and auditee_name='"+auditee_name+"') and audit_start_date <= NOW()");
					}
				}
				else if(id.equals("") && !process.equals("") && !auditee_name.equals(""))
				{
				
					if(roles.equals("2"))
					{
						resultSet = statement.executeQuery("select * from tb1_internalaudits where (process='"+process+"' and auditee_name='"+auditee_name+"')");	
					}
					else
					{
						resultSet = statement.executeQuery("select * from tb1_internalaudits where (process='"+process+"' and auditee_name='"+auditee_name+"') and audit_start_date <= NOW()");
					}
				}
				else if(!id.equals("") && process.equals("") && !auditee_name.equals(""))
				{
				
					if(roles.equals("2"))
					{
						resultSet = statement.executeQuery("select * from tb1_internalaudits where (id='"+id+"' and auditee_name='"+auditee_name+"')");	
					}
					else
					{
						resultSet = statement.executeQuery("select * from tb1_internalaudits where (id='"+id+"' and auditee_name='"+auditee_name+"') and audit_start_date <= NOW()");
					}
				}
				else if(!id.equals("") && !process.equals("") && auditee_name.equals(""))
				{
				
					if(roles.equals("2"))
					{
						resultSet = statement.executeQuery("select * from tb1_internalaudits where (id='"+id+"' and process='"+process+"')");	
					}
					else
					{
						resultSet = statement.executeQuery("select * from tb1_internalaudits where (id='"+id+"' and process='"+process+"') and audit_start_date <= NOW()");
					}
				}
				else
				{
				
					if(roles.equals("2"))
					{
						resultSet = statement.executeQuery("select * from tb1_internalaudits where (id='"+id+"'or process='"+process+"' or auditee_name='"+auditee_name+"')");	
					}
					else{
						resultSet = statement.executeQuery("select * from tb1_internalaudits where (id='"+id+"'or process='"+process+"' or auditee_name='"+auditee_name+"') and audit_start_date <= NOW() ");
					}
				}
			}
			while (resultSet.next()) {
							
								
				internalAudits.add(new InternalAudits(resultSet
						.getString("id"), resultSet
						.getString("process"), resultSet
						.getString("audit_start_date"), resultSet
						.getString("audit_due_date"), resultSet
						.getString("auditor"), resultSet
						.getString("auditor_notes"), resultSet
						.getString("finding"), resultSet
						.getString("completion_date"), resultSet
						.getString("auditors_initials"), resultSet
						.getString("auditee_name")));
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
		return internalAudits;
	}


	public int FindAudits(String id,String process,String auditee_name){
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
	    	if(!id.equals("") && !process.equals("") && !auditee_name.equals(""))
			{
				resultSet = statement.executeQuery("select count(*) as noofrecords from tb1_internalaudits where id='"+id+"'and process='"+process+"' and auditee_name='"+auditee_name+"'");
			}
			else if(id.equals("") && !process.equals("") && !auditee_name.equals(""))
			{
				resultSet = statement.executeQuery("select count(*) as noofrecords from tb1_internalaudits where process='"+process+"' and auditee_name='"+auditee_name+"'");
			}
			else if(!id.equals("") && process.equals("") && !auditee_name.equals(""))
			{
				resultSet = statement.executeQuery("select count(*) as noofrecords from tb1_internalaudits where id='"+id+"' and auditee_name='"+auditee_name+"'");
			}
			else if(!id.equals("") && !process.equals("") && auditee_name.equals(""))
			{
				resultSet = statement.executeQuery("select count(*) as noofrecords from tb1_internalaudits where id='"+id+"' and process='"+process+"'");
			}
			else
			{
				resultSet = statement.executeQuery("select count(*) as noofrecords from tb1_internalaudits where id='"+id+"'or process='"+process+"' or auditee_name='"+auditee_name+"'");
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
	

	
	public  List<InternalAudits> getlimitedinternalreport(int page) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<InternalAudits> internalAudits = new ArrayList<InternalAudits>();
		try {

			String cmd;
			int offset = 5 * (page - 1);
			int limit = 5;
					cmd="select * from tb1_internalaudits limit " + offset + ","+ limit+"" ;
				
				//	cmd = "select * from tbl_narrativereport order by pname asc limit " + offset + ","+ limit+"" ;

			resultSet = statement.executeQuery(cmd);
			while (resultSet.next()) {
				
				
				internalAudits.add(new InternalAudits(resultSet
						.getString("id"), resultSet
						.getString("process"), resultSet
						.getString("audit_start_date"), resultSet
						.getString("audit_due_date"), resultSet
						.getString("auditor"), resultSet
						.getString("auditor_notes"), resultSet
						.getString("finding"), resultSet
						.getString("completion_date"), resultSet
						.getString("auditors_initials"), resultSet
						.getString("auditee_name")));
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
		return internalAudits;

	}
	public int getnoofinternalreport() {
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
		List<InternalAudits> internalAudits = new ArrayList<InternalAudits>();
		try {

			String cmd;
			
					cmd = "select count(*) as noofrecords from tb1_internalaudits ";
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
	//get findings
	public List<InternalAudit_Finding> getauditfindings() {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status = false;
		List<InternalAudit_Finding> finding = new ArrayList<InternalAudit_Finding>();

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String cmd_select = "select * from tbl_auditfinding";
			resultSet = statement.executeQuery(cmd_select);
			while (resultSet.next()) {
				
				finding.add(new InternalAudit_Finding(resultSet
						.getString("id"), resultSet
						.getString("finding")
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
		return finding;
	}	

	//check already exist or not
	public boolean getfindingExit(String document,String id) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status = false;
		List<InternalAudit_Finding> documentTypes = new ArrayList<InternalAudit_Finding>();

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String cmd_select = "select * from tbl_auditfinding where id !='"+id+"' and finding='"+document+"'";
			System.out.println(cmd_select);
			resultSet = statement.executeQuery(cmd_select);
			while (resultSet.next()) {
				
				documentTypes.add(new InternalAudit_Finding(resultSet
						.getString("id"), resultSet
						.getString("finding")
						));
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
	
	//insert finding
	public boolean insert_Finding(InternalAudit_Finding finding) {
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
			System.out.println("before executing query");
			String cmd_insert = "insert into tbl_auditfinding(finding)values('"+finding.getFinding()+"')";
		
			System.out.println("query executed successfully");
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
	
	//listing finding 
	public  List<InternalAudit_Finding> getlimitedfindingreport(int page) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<InternalAudit_Finding> documentTypes = new ArrayList<InternalAudit_Finding>();
		  try {

			String cmd;
			int offset = 5 * (page - 1);
			int limit = 5;
					cmd="select * from tbl_auditfinding where id limit " + offset + ","+ limit+"" ;
				

			resultSet = statement.executeQuery(cmd);
			while(resultSet.next()){
			documentTypes.add(new InternalAudit_Finding(resultSet
						.getString("id"), resultSet
						.getString("finding")));
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
		return documentTypes;

	}
	
	//finding pagination
	public int getnooffindingreport() {
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
		List<InternalAudit_Finding> documentTypes = new ArrayList<InternalAudit_Finding>();
		try {

			String cmd;
				cmd = "select count(*) as noofrecords from tbl_auditfinding";
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
	
	//get finding by name
	public List<InternalAudit_Finding> getfinding(String doctype) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status = false;
		List<InternalAudit_Finding> documentTypes = new ArrayList<InternalAudit_Finding>();

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String cmd_select = "";
			if(doctype.equals(""))
			{
				cmd_select = "select * from tbl_auditfinding";
			}
			else
			{
				cmd_select = "select * from tbl_auditfinding where finding='"+doctype+"'";	
			}
			
			resultSet = statement.executeQuery(cmd_select);
			while (resultSet.next()) {
				
				documentTypes.add(new InternalAudit_Finding(resultSet
						.getString("id"), resultSet
						.getString("finding")
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
		return documentTypes;
	}	
	
	//Get request record by id
	public List<InternalAudit_Finding> getFinding(String id){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		List<InternalAudit_Finding> documentTypes = new ArrayList<InternalAudit_Finding>();
	    try{
	    	String cmd_select = "select * from tbl_auditfinding  where id='"+id+"'";

			resultSet = statement.executeQuery(cmd_select);
			while(resultSet.next()){
				documentTypes.add(new InternalAudit_Finding(resultSet
						.getString("id"), resultSet
						.getString("finding")));
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
	    return documentTypes;
		
	}
	
	//Update finding Operation
	public boolean update_finding(InternalAudit_Finding documentType) {
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
			
			String cmd_update = "update tbl_auditfinding set finding='"+documentType.getFinding()+"' where id='"+documentType.getId()+"'";
			
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
	
	//Delete finding Operation
	public boolean delete_finding(String id) {
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
			String cmd_delete = "delete from tbl_auditfinding where id='"+ id + "'";
			
			
			statement.execute(cmd_delete);
			
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
