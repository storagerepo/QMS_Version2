package qms.dao;

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

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

import qms.controllers.AbstractITextPdfView;
import qms.model.CorrectiveAndPreventiveActions;
import qms.model.DocumentMain;



public class CorrectiveAndPreventiveActionsDAO extends AbstractITextPdfView
{
	private DataSource dataSource;
	 
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	

	@Override
	protected void buildPdfDocument(Map<String, Object> model, Document doc,
	PdfWriter writer, HttpServletRequest request, HttpServletResponse response)
	throws Exception {
		
		
	        
	        @SuppressWarnings("unchecked")
			List<CorrectiveAndPreventiveActions> correctiveAndPreventiveActions=(List<CorrectiveAndPreventiveActions>)model.get("correctiveAndPreventiveActions");
			String[] fields=(String[])model.get("fields");
			System.out.println(fields[0]);
			HttpSession session = request.getSession();
	       
			int memolist = fields.length;
			System.out.println(memolist);
	       PdfPTable table=new PdfPTable(memolist+1);
	       float[] width= new float[memolist+1];
			table.setWidthPercentage(100);
			int i=1;
			 table.addCell(createLabelCell("SNO"));
			 width[0] = 1.0f;
			
			
	
		String value= (String) session.getAttribute("option");
		System.out.println("session option = "+value);
		
		if(value == "0" || value == "1")
		{
			for(String field:fields)
			{
			 if (field.equals("nc_id")) {
				 width[i] = 1.0f;
				 i++;
				 table.addCell(createLabelCell(
							"NON CONFORMANCE ID"));

					
					
					}
				else if (field.equals("source_of_nonconformance")) {
					width[i] = 1.0f;
					 i++;
					 table.addCell(createLabelCell(
							"SOURCE OF NON CONFORMANCE"));
				}
				else if (field.equals("root_cause_statement")) {
					width[i] = 1.0f;
					 i++;
					 table.addCell(createLabelCell("ROOT CAUSE STATEMENT"));
				
					}
			

			}
		}
		if(value == "2")
		{
			System.out.println("sdfsdf");
			for(String field:fields)
			{
				if (field.equals("capa_id")) 
				{
					
					width[i] = 1.0f;
					 i++;
					 table.addCell(createLabelCell("CORRECTIVE AND PREVENTIVE ACTIONS ID"));
					
				}
				else if (field.equals("nc_id")) {
					width[i] = 1.0f;
					 i++;
					}
				else if (field.equals("source_of_nonconformance")) {
					width[i] = 1.0f;
					 i++;
					 table.addCell(createLabelCell("SOURCE OF NON CONFORMANCE"));
					} 
				else if (field.equals("external_id")) {
					width[i] = 1.0f;
					 i++;
					 table.addCell(createLabelCell("EXTERNAL ID"));
					}
				else if (field.equals("type_of_nonconformance")) {
					width[i] = 1.0f;
					 i++;
					 table.addCell(createLabelCell("TYPE OF NC"));
					}
				else if (field.equals("date_found")) {
					width[i] = 1.0f;
					 i++;
					 table.addCell(createLabelCell("DATE FOUND"));
					}
				else if (field.equals("temporary_action")) {
					width[i] = 1.0f;
					 i++;
					 table.addCell(createLabelCell("TEMPORARY ACTION"));
					}
				
				else if (field.equals("nature_of_nc")) {
					width[i] = 1.0f;
					 i++;
					 table.addCell(createLabelCell("NATURE OF NC"));
					}
				else if (field.equals("capa_requestor")) {
					width[i] = 1.0f;
					 i++;
					 table.addCell(createLabelCell("CAPA REQUESTOR"));
					}
				
				else if (field.equals("request_date")) {
					width[i] = 1.0f;
					 i++;
					 table.addCell(createLabelCell("REQUEST DATE"));
					}
				else if (field.equals("capa_due_date")) {
					width[i] = 1.0f;
					 i++;
					 table.addCell(createLabelCell(
							"CAPA DUE DATE"));

					}
				else if (field.equals("assigned_team_leader")) {
					width[i] = 1.0f;
					 i++;
					 table.addCell(createLabelCell(
							"ASSIGNED TEAM LEADER"));
				}
				else if (field.equals("team_members")) {
					width[i] = 1.0f;
					 i++;
					 table.addCell(createLabelCell(
							"TEAM MEMBERS"));

					}
				else if (field.equals("root_cause_analysis_file")) {
					width[i] = 1.0f;
					 i++;
					 table.addCell(createLabelCell(
							"ROOT CAUSE ANALYSIS FILE"));
					
					}
				else if (field.equals("use_5_why_in_system")) {
					width[i] = 1.0f;
					 i++;
					 table.addCell(createLabelCell(
							"USE 5 WHY IN SYSTEM"));
					
					}
				else if (field.equals("why")) {
					width[i] = 1.0f;
					 i++;
					 table.addCell(createLabelCell(
							"WHY"));
				
					}
				else if (field.equals("root_cause_statement")) {
					width[i] = 1.0f;
					 i++;
					 table.addCell(createLabelCell(
							"ROOT CAUSE STATEMENT"));
					
					}
				else if (field.equals("upload_external_analysis")) {
					width[i] = 1.0f;
					 i++;
					 table.addCell(createLabelCell(
							"UPLOAD EXTERNAL ANALYSIS"));
					
					}
				
				
				else if (field.equals("action")) {
					width[i] = 1.0f;
					 i++;
					 table.addCell(createLabelCell(
							"ACTION"));
					
					}
				else if (field.equals("responsibility")) {
					width[i] = 1.0f;
					 i++;
					 table.addCell(createLabelCell(
							"RESPONSIBILITY"));
				
					}
				else if (field.equals("due_date")) {
					width[i] = 1.0f;
					 i++;
					 table.addCell(createLabelCell(
							"DUE DATE"));
				
					}
				else if (field.equals("completion_date")) {
					width[i] = 1.0f;
					 i++;
					 table.addCell(createLabelCell(
							"COMPLETION DATE"));
	
					}
				else if (field.equals("verified_by")) {
					width[i] = 1.0f;
					 i++;
					 table.addCell(createLabelCell(
							"VERIFIED BY"));

				
					}
				else if (field.equals("verification_date")) {
					width[i] = 1.0f;
					 i++;
					 table.addCell(createLabelCell(
							"VERIFICATION DATE"));

				
					}
			}
		}
	
		int j= 1;
		System.out.println("session option = "+value);
	
	    for (CorrectiveAndPreventiveActions correctiveandpreventiveactions :correctiveAndPreventiveActions)
	    {	
		System.out.println("dsgfdsfsd");
	    	String sno = String.valueOf(j);
			table.addCell(createValueCell(sno));
			j++;
	    if(value == "0" || value == "1")
		{
			for (String field : fields) {
				if (field.equals("nc_id")) {

					table.addCell(createValueCell(
							correctiveandpreventiveactions.getNc_id()));
					
					}
				else if (field.equals("source_of_nonconformance")) {
					table.addCell(createValueCell(
							correctiveandpreventiveactions.getSource_of_nonconformance()));
					}

				else if (field.equals("root_cause_statement")) {
					table.addCell(createValueCell(
							correctiveandpreventiveactions.getRoot_cause_statement()));
					}
				}
		}
	    if(value == "2")
	    {
	    	System.out.println("data");
			for(String field:fields)
			{
				if (field.equals("capa_id")) 
				{
					

					table.addCell(createValueCell(
							correctiveandpreventiveactions.getCapa_id()));
					
				}
				else if (field.equals("nc_id")) {

					table.addCell(createValueCell(
							correctiveandpreventiveactions.getNc_id()));
					}
				else if (field.equals("source_of_nonconformance")) {
					table.addCell(createValueCell(
							correctiveandpreventiveactions.getSource_of_nonconformance()));
					} 
				else if (field.equals("external_id")) {
					table.addCell(createValueCell(
							correctiveandpreventiveactions.getExternal_id()));
					}
				else if (field.equals("type_of_nonconformance")) {
					table.addCell(createValueCell(
							correctiveandpreventiveactions.getType_of_nonconformance()));
					}
				else if (field.equals("date_found")) {
					table.addCell(createValueCell(
							correctiveandpreventiveactions.getDate_found()));
					}
				else if (field.equals("temporary_action")) {
					table.addCell(createValueCell(
							correctiveandpreventiveactions.getTemporary_action()));
					}
				
				else if (field.equals("nature_of_nc")) {
					table.addCell(createValueCell(
							correctiveandpreventiveactions.getNature_of_nc()));
					}
				else if (field.equals("capa_requestor")) {

					table.addCell(createValueCell(
							correctiveandpreventiveactions.getCapa_requestor()));
					}
				else if (field.equals("request_date")) {

					table.addCell(createValueCell(
							correctiveandpreventiveactions.getRequest_date()));
					}
				else if (field.equals("capa_due_date")) {

					table.addCell(createValueCell(
							correctiveandpreventiveactions.getCapa_due_date()));
					}
				else if (field.equals("assigned_team_leader")) {

					table.addCell(createValueCell(
							correctiveandpreventiveactions.getAssigned_team_leader()));
					}
				else if (field.equals("team_members")) {

					table.addCell(createValueCell(
							correctiveandpreventiveactions.getTeam_members()));
					}
				else if (field.equals("root_cause_analysis_file")) {

					table.addCell(createValueCell(
							correctiveandpreventiveactions.getRoot_cause_analysis_file()));
					}
				else if (field.equals("use_5_why_in_system")) {

					table.addCell(createValueCell(
							correctiveandpreventiveactions.getUse_5_why_in_system()));
					}
				else if (field.equals("why")) {
					table.addCell(createValueCell(
							correctiveandpreventiveactions.getWhy()));
					}
				else if (field.equals("root_cause_statement")) {
					table.addCell(createValueCell(
							correctiveandpreventiveactions.getRoot_cause_statement()));
					}
				else if (field.equals("upload_external_analysis")) {

					table.addCell(createValueCell(
							correctiveandpreventiveactions.getUpload_external_analysis()));
					}
				
				else if (field.equals("action")) {

					table.addCell(createValueCell(
							correctiveandpreventiveactions.getAction()));
					}
				else if (field.equals("responsibility")) {

					table.addCell(createValueCell(
							correctiveandpreventiveactions.getResponsibility()));
					}
				else if (field.equals("due_date")) {

					table.addCell(createValueCell(
							correctiveandpreventiveactions.getDue_date()));
					}
				else if (field.equals("completion_date")) {

					table.addCell(createValueCell(
							correctiveandpreventiveactions.getCompletion_date()));
					}
				else if (field.equals("verified_by")) {

					table.addCell(createValueCell(
							correctiveandpreventiveactions.getVerified_by()));
					}
				else if (field.equals("verification_date")) {

					table.addCell(createValueCell(
							correctiveandpreventiveactions.getVerification_date()));
					}
			}
	    }
			
			}
	    table.setWidths(width);
		
		doc.add(table);
	}	
	
	
	public boolean insert_correctiveAndPreventiveActions(CorrectiveAndPreventiveActions correctiveAndPreventiveActions) {
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
			String cmd_insert = "insert into tbl_corrective_and_preventive_main(nc_id,source_of_nonconformance,external_id,type_of_nonconformance,date_found,temporary_action,nature_of_nc,capa_requestor,request_date,capa_due_date,assigned_team_leader,team_members,root_cause_analysis_file,use_5_why_in_system,why,root_cause_statement,upload_external_analysis,attachment_name,attachment_type,attachment_referrence)values('"+correctiveAndPreventiveActions.getNc_id()+"','"+correctiveAndPreventiveActions.getSource_of_nonconformance()+"','"+correctiveAndPreventiveActions.getExternal_id()+"','"+correctiveAndPreventiveActions.getType_of_nonconformance()+"','"+correctiveAndPreventiveActions.getDate_found()+"','"+correctiveAndPreventiveActions.getTemporary_action()+"','"+correctiveAndPreventiveActions.getNature_of_nc()+"','"+correctiveAndPreventiveActions.getCapa_requestor()+"','"+correctiveAndPreventiveActions.getRequest_date()+"','"+correctiveAndPreventiveActions.getCapa_due_date()+"','"+correctiveAndPreventiveActions.getAssigned_team_leader()+"','"+correctiveAndPreventiveActions.getTeam_members()+"','"+correctiveAndPreventiveActions.getRoot_cause_analysis_file()+"','"+correctiveAndPreventiveActions.getUse_5_why_in_system()+"','"+correctiveAndPreventiveActions.getWhy()+"','"+correctiveAndPreventiveActions.getRoot_cause_statement()+"','"+correctiveAndPreventiveActions.getUpload_external_analysis()+"','"+correctiveAndPreventiveActions.getAttachment_name()+"','"+correctiveAndPreventiveActions.getAttachment_type()+"','"+correctiveAndPreventiveActions.getAttachment_referrence()+"')";
			String cmd_insert1 = "insert into tbl_corrective_and_preventive_child(action,responsibility,due_date,completion_date,verified_by,verification_date)values('"+correctiveAndPreventiveActions.getAction()+"','"+correctiveAndPreventiveActions.getResponsibility()+"','"+correctiveAndPreventiveActions.getDue_date()+"','"+correctiveAndPreventiveActions.getCompletion_date()+"','"+correctiveAndPreventiveActions.getVerified_by()+"','"+correctiveAndPreventiveActions.getVerification_date()+"')";
			statement.execute(cmd_insert);
			statement.execute(cmd_insert1);
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
	
	public List<CorrectiveAndPreventiveActions> getCorrectiveAndPreventiveActions() {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status = false;
		List<CorrectiveAndPreventiveActions> correctiveAndPreventiveActions = new ArrayList<CorrectiveAndPreventiveActions>();

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String cmd_select = "select t1.*,t2.* from tbl_corrective_and_preventive_main as t1 join tbl_corrective_and_preventive_child as t2 on t1.capa_id=t2.capa_id ";
			resultSet = statement.executeQuery(cmd_select);
			while (resultSet.next()) {
				
				correctiveAndPreventiveActions.add(new CorrectiveAndPreventiveActions(
						resultSet.getString("capa_id"),resultSet.getString("nc_id"), resultSet
						.getString("source_of_nonconformance"), resultSet
						.getString("external_id"), resultSet
						.getString("type_of_nonconformance"), resultSet
						.getString("date_found"), resultSet
						.getString("temporary_action"), resultSet
						.getString("nature_of_nc"), resultSet
						.getString("capa_requestor"), resultSet
						.getString("request_date"),resultSet
						.getString("capa_due_date"), resultSet
						.getString("assigned_team_leader"), resultSet
						.getString("team_members"), resultSet
						.getString("root_cause_analysis_file"), resultSet
						.getString("use_5_why_in_system"), resultSet
						.getString("why"), resultSet
						.getString("root_cause_statement"),resultSet
						.getString("upload_external_analysis"),
			resultSet.getString("action"),resultSet.getString("responsibility"),resultSet.getString("due_date"),resultSet.getString("completion_date"),resultSet.getString("verified_by"),resultSet.getString("verification_date"), resultSet.getString("attachment_name"),resultSet.getString("attachment_type"),resultSet.getString("attachment_referrence")));

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
		return correctiveAndPreventiveActions;
	}

	public List<CorrectiveAndPreventiveActions> getCorrectiveAndPreventiveActions(String capa_id){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		List<CorrectiveAndPreventiveActions> correctiveAndPreventiveActions = new ArrayList<CorrectiveAndPreventiveActions>();
	    try{
	    	String cmd_select = "select * from tbl_corrective_and_preventive_main as t1 join tbl_corrective_and_preventive_child as t2 on t1.capa_id=t2.capa_id where t1.capa_id='"+capa_id+"'";
			resultSet = statement.executeQuery(cmd_select);
			while (resultSet.next()) {
				
				correctiveAndPreventiveActions.add(new CorrectiveAndPreventiveActions(resultSet.getString("capa_id"),resultSet.getString("nc_id"), resultSet
						.getString("source_of_nonconformance"), resultSet
						.getString("external_id"), resultSet
						.getString("type_of_nonconformance"), resultSet
						.getString("date_found"), resultSet
						.getString("temporary_action"), resultSet
						.getString("nature_of_nc"), resultSet
						.getString("capa_requestor"), resultSet
						.getString("request_date"),resultSet
						.getString("capa_due_date"), resultSet
						.getString("assigned_team_leader"), resultSet
						.getString("team_members"), resultSet
						.getString("root_cause_analysis_file"), resultSet
						.getString("use_5_why_in_system"), resultSet
						.getString("why"), resultSet
						.getString("root_cause_statement"),resultSet
						.getString("upload_external_analysis"),
					resultSet.getString("action"),resultSet.getString("responsibility"),resultSet.getString("due_date"),resultSet.getString("completion_date"),resultSet.getString("verified_by"),resultSet.getString("verification_date"), resultSet.getString("attachment_name"),resultSet.getString("attachment_type"),resultSet.getString("attachment_referrence")));
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
	    return correctiveAndPreventiveActions;
		
	}
	
	public List<CorrectiveAndPreventiveActions> edit_CorrectiveAndPreventiveActions(String capa_id) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status = false;
		List<CorrectiveAndPreventiveActions> correctiveAndPreventiveActions = new ArrayList<CorrectiveAndPreventiveActions>();

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		

		//List<CorrectiveAndPreventiveActions> correctiveAndPreventiveActions = new ArrayList<CorrectiveAndPreventiveActions>();
	    try{
	    	String cmd_select = "select t1.*,t2.* from tbl_corrective_and_preventive_main as t1 join tbl_corrective_and_preventive_child as t2 on t1.capa_id=t2.capa_id where t1.capa_id='"+capa_id+"'";
			resultSet = statement.executeQuery(cmd_select);
			while (resultSet.next()) {
				System.out.println(resultSet.getString("capa_id"));
				correctiveAndPreventiveActions.add(new CorrectiveAndPreventiveActions(resultSet.getString("capa_id"),resultSet.getString("nc_id"), resultSet
						.getString("source_of_nonconformance"), resultSet
						.getString("external_id"), resultSet
						.getString("type_of_nonconformance"), resultSet
						.getString("date_found"), resultSet
						.getString("temporary_action"), resultSet
						.getString("nature_of_nc"), resultSet
						.getString("capa_requestor"), resultSet
						.getString("request_date"),resultSet
						.getString("capa_due_date"), resultSet
						.getString("assigned_team_leader"), resultSet
						.getString("team_members"), resultSet
						.getString("root_cause_analysis_file"), resultSet
						.getString("use_5_why_in_system"), resultSet
						.getString("why"), resultSet
						.getString("root_cause_statement"),resultSet
						.getString("upload_external_analysis"),
						resultSet.getString("action"),resultSet.getString("responsibility"),resultSet.getString("due_date"),resultSet.getString("completion_date"),resultSet.getString("verified_by"),resultSet.getString("verification_date"), resultSet.getString("attachment_name"),resultSet.getString("attachment_type"),resultSet.getString("attachment_referrence")));
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
		return correctiveAndPreventiveActions;
	}

	
	public boolean update_correctiveAndPreventiveActions(CorrectiveAndPreventiveActions correctiveAndPreventiveActions) {
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
			 
			 if(correctiveAndPreventiveActions.getAttachment_name() == null || correctiveAndPreventiveActions.getAttachment_type() == null || correctiveAndPreventiveActions.getAttachment_referrence() == null)
			 {
				 resultSet=statement.executeQuery("select attachment_name,attachment_type,attachment_referrence from tbl_corrective_and_preventive_main where capa_id='"+correctiveAndPreventiveActions.getCapa_id()+"'");
			  while(resultSet.next())
			  {
				  attachment_name=resultSet.getString("attachment_name");
				  attachment_type=resultSet.getString("attachment_type");
				   attachment_reference= resultSet.getString("attachment_referrence");
			  }
			  System.out.println("action value from DAO1::::"+correctiveAndPreventiveActions.getAction());
			  String cmd_update = "update tbl_corrective_and_preventive_main set capa_id='"+correctiveAndPreventiveActions.getCapa_id()+"',nc_id='"+correctiveAndPreventiveActions.getNc_id()+"',source_of_nonconformance='"+correctiveAndPreventiveActions.getSource_of_nonconformance()+"',external_id='"+correctiveAndPreventiveActions.getExternal_id()+"',type_of_nonconformance='"+correctiveAndPreventiveActions.getType_of_nonconformance()+"',date_found='"+correctiveAndPreventiveActions.getDate_found()+"',temporary_action='"+correctiveAndPreventiveActions.getTemporary_action()+"',nature_of_nc='"+correctiveAndPreventiveActions.getNature_of_nc()+"',capa_requestor='"+correctiveAndPreventiveActions.getCapa_requestor()+"',request_date='"+correctiveAndPreventiveActions.getRequest_date()+"',capa_due_date='"+correctiveAndPreventiveActions.getCapa_due_date()+"',assigned_team_leader='"+correctiveAndPreventiveActions.getAssigned_team_leader()+"',team_members='"+correctiveAndPreventiveActions.getTeam_members()+"',root_cause_analysis_file='"+correctiveAndPreventiveActions.getRoot_cause_analysis_file()+"',use_5_why_in_system='"+correctiveAndPreventiveActions.getUse_5_why_in_system()+"',why='"+correctiveAndPreventiveActions.getWhy()+"',root_cause_statement='"+correctiveAndPreventiveActions.getRoot_cause_statement()+"',upload_external_analysis='"+correctiveAndPreventiveActions.getUpload_external_analysis()+"',attachment_name='"+attachment_name+"',attachment_type='"+attachment_type+"',attachment_referrence='"+attachment_reference+"' where capa_id='"+correctiveAndPreventiveActions.getCapa_id()+"'";
				String cmd_update1 = "update tbl_corrective_and_preventive_child set capa_id='"+correctiveAndPreventiveActions.getCapa_id()+"',action='"+correctiveAndPreventiveActions.getAction()+"',responsibility='"+correctiveAndPreventiveActions.getResponsibility()+"',due_date='"+correctiveAndPreventiveActions.getDue_date()+"',completion_date='"+correctiveAndPreventiveActions.getCompletion_date()+"',verified_by='"+correctiveAndPreventiveActions.getVerified_by()+"',verification_date='"+correctiveAndPreventiveActions.getVerification_date()+"' where capa_id='"+correctiveAndPreventiveActions.getCapa_id()+"'";
				 statement.execute(cmd_update);
				 System.out.println("action value from DAO2::::"+correctiveAndPreventiveActions.getAction());
				 
				 System.out.println(cmd_update);
				 System.out.println(cmd_update1);
				 System.out.println("status1 = "+statement.execute(cmd_update));
				 statement.execute(cmd_update1);
				 System.out.println("status2 ="+statement.execute(cmd_update1));
				 status  = true;
			 } 
			 else
				 {
				 System.out.println("action value from DAO3::::"+correctiveAndPreventiveActions.getAction());
				 String cmd_update = "update tbl_corrective_and_preventive_main set nc_id='"+correctiveAndPreventiveActions.getNc_id()+"',source_of_nonconformance='"+correctiveAndPreventiveActions.getSource_of_nonconformance()+"',external_id='"+correctiveAndPreventiveActions.getExternal_id()+"',type_of_nonconformance='"+correctiveAndPreventiveActions.getType_of_nonconformance()+"',date_found='"+correctiveAndPreventiveActions.getDate_found()+"',temporary_action='"+correctiveAndPreventiveActions.getTemporary_action()+"',nature_of_nc='"+correctiveAndPreventiveActions.getNature_of_nc()+"',capa_requestor='"+correctiveAndPreventiveActions.getCapa_requestor()+"',request_date='"+correctiveAndPreventiveActions.getRequest_date()+"',capa_due_date='"+correctiveAndPreventiveActions.getCapa_due_date()+"',assigned_team_leader='"+correctiveAndPreventiveActions.getAssigned_team_leader()+"',team_members='"+correctiveAndPreventiveActions.getTeam_members()+"',root_cause_analysis_file='"+correctiveAndPreventiveActions.getRoot_cause_analysis_file()+"',use_5_why_in_system='"+correctiveAndPreventiveActions.getUse_5_why_in_system()+"',why='"+correctiveAndPreventiveActions.getWhy()+"',root_cause_statement='"+correctiveAndPreventiveActions.getRoot_cause_statement()+"',upload_external_analysis='"+correctiveAndPreventiveActions.getUpload_external_analysis()+"',attachment_name='"+correctiveAndPreventiveActions.getAttachment_name()+"',attachment_type='"+correctiveAndPreventiveActions.getAttachment_type()+"',attachment_referrence='"+correctiveAndPreventiveActions.getAttachment_referrence()+"' where capa_id='"+correctiveAndPreventiveActions.getCapa_id()+"'";
					String cmd_update1 = "update tbl_corrective_and_preventive_child set action='"+correctiveAndPreventiveActions.getAction()+"',responsibility='"+correctiveAndPreventiveActions.getResponsibility()+"',due_date='"+correctiveAndPreventiveActions.getDue_date()+"',completion_date='"+correctiveAndPreventiveActions.getCompletion_date()+"',verified_by='"+correctiveAndPreventiveActions.getVerified_by()+"',verification_date='"+correctiveAndPreventiveActions.getVerification_date()+"' where capa_id='"+correctiveAndPreventiveActions.getCapa_id()+"'";
				System.out.println("action value from DAO4::::"+correctiveAndPreventiveActions.getAction());
					 statement.execute(cmd_update);
					 System.out.println("status = "+statement.execute(cmd_update));
					 statement.execute(cmd_update1);
					 status  = true;
				 }
		 }
			 catch (Exception e) {
				 
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
	
	public int get_maxid() {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		int Max_id = 1001;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {

			String cmd_select = "select max(capa_id) as capa_id from tbl_corrective_and_preventive_main";
			
			resultSet = statement.executeQuery(cmd_select);
			if (resultSet.next()) {
				//if (!resultSet.getString("capa_id").equals("null"))
					Max_id = resultSet.getInt("capa_id") + 1;

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

	public int Search_Correctiveactions(String capa_id,String request_date,String action) {
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
		
		List<CorrectiveAndPreventiveActions> correctiveAndPreventiveActions = new ArrayList<CorrectiveAndPreventiveActions>();
	    try{
	    	if(!capa_id.equals("") && !request_date.equals("") && !action.equals(""))
	    	{
	    		resultSet = statement.executeQuery("select count(*) as noofrecords from tbl_corrective_and_preventive_main as t1 join tbl_corrective_and_preventive_child as t2 on t1.capa_id=t2.capa_id where t1.capa_id='"+capa_id+"' and t2.action='"+action+"' and t1.request_date='"+request_date+"' ");
	    	}
	    	else if(!capa_id.equals("") && !request_date.equals("") && action.equals(""))
	    	{
	    		resultSet = statement.executeQuery("select count(*) as noofrecords from tbl_corrective_and_preventive_main as t1 join tbl_corrective_and_preventive_child as t2 on t1.capa_id=t2.capa_id where t1.capa_id='"+capa_id+"' and t1.request_date='"+request_date+"' ");
	    	}
	    	else if(!capa_id.equals("") && request_date.equals("") && !action.equals(""))
	    	{
	    		resultSet = statement.executeQuery("select count(*) as noofrecords from tbl_corrective_and_preventive_main as t1 join tbl_corrective_and_preventive_child as t2 on t1.capa_id=t2.capa_id where t1.capa_id='"+capa_id+"'and t2.action='"+action+"'");
	    	}
	    	else if(capa_id.equals("") && !request_date.equals("") && !action.equals(""))
	    	{
	    		resultSet = statement.executeQuery("select count(*) as noofrecords from tbl_corrective_and_preventive_main as t1 join tbl_corrective_and_preventive_child as t2 on t1.capa_id=t2.capa_id where t2.action='"+action+"' and t1.request_date='"+request_date+"' ");
	    	}
	    	else
	    	{	   
	    		resultSet = statement.executeQuery("select count(*) as noofrecords from tbl_corrective_and_preventive_main as t1 join tbl_corrective_and_preventive_child as t2 on t1.capa_id=t2.capa_id where t1.capa_id='"+capa_id+"' or t2.action='"+action+"' or t1.request_date='"+request_date+"' ");
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
		
	public List<CorrectiveAndPreventiveActions> search_correctiveactions(String capa_id,String request_date,String action,int page) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		List<CorrectiveAndPreventiveActions> correctiveAndPreventiveActions = new ArrayList<CorrectiveAndPreventiveActions>();
	    try{
	    	if(page >= 1)
	    	{
	    	int offset = 5 * (page - 1);
			int limit = 5;
	
	    	if(!capa_id.equals("") && !request_date.equals("") && !action.equals(""))
	    	{
	    		resultSet = statement.executeQuery("select * from tbl_corrective_and_preventive_main as t1 join tbl_corrective_and_preventive_child as t2 on t1.capa_id=t2.capa_id where t1.capa_id='"+capa_id+"' and t2.action='"+action+"' and t1.request_date='"+request_date+"' limit " + offset + ","+ limit+"");
	    	}
	    	else if(!capa_id.equals("") && !request_date.equals("") && action.equals(""))
	    	{
	    		resultSet = statement.executeQuery("select * from tbl_corrective_and_preventive_main as t1 join tbl_corrective_and_preventive_child as t2 on t1.capa_id=t2.capa_id where t1.capa_id='"+capa_id+"' and t1.request_date='"+request_date+"' limit " + offset + ","+ limit+"");
	    	}
	    	else if(!capa_id.equals("") && request_date.equals("") && !action.equals(""))
	    	{
	    		resultSet = statement.executeQuery("select * from tbl_corrective_and_preventive_main as t1 join tbl_corrective_and_preventive_child as t2 on t1.capa_id=t2.capa_id where t1.capa_id='"+capa_id+"'and t2.action='"+action+"' limit " + offset + ","+ limit+"");
	    	}
	    	else if(capa_id.equals("") && !request_date.equals("") && !action.equals(""))
	    	{
	    		resultSet = statement.executeQuery("select * from tbl_corrective_and_preventive_main as t1 join tbl_corrective_and_preventive_child as t2 on t1.capa_id=t2.capa_id where t2.action='"+action+"' and t1.request_date='"+request_date+"' limit " + offset + ","+ limit+"");
	    	}
	    	else
	    	{	   
	    		resultSet = statement.executeQuery("select * from tbl_corrective_and_preventive_main as t1 join tbl_corrective_and_preventive_child as t2 on t1.capa_id=t2.capa_id where t1.capa_id='"+capa_id+"' or t2.action='"+action+"' or t1.request_date='"+request_date+"' limit " + offset + ","+ limit+"");
	    	}
	    	}
	    	else
	    	{
	        	if(!capa_id.equals("") && !request_date.equals("") && !action.equals(""))
		    	{
		    		resultSet = statement.executeQuery("select * from tbl_corrective_and_preventive_main as t1 join tbl_corrective_and_preventive_child as t2 on t1.capa_id=t2.capa_id where t1.capa_id='"+capa_id+"' and t2.action='"+action+"' and t1.request_date='"+request_date+"'");
		    	}
		    	else if(!capa_id.equals("") && !request_date.equals("") && action.equals(""))
		    	{
		    		resultSet = statement.executeQuery("select * from tbl_corrective_and_preventive_main as t1 join tbl_corrective_and_preventive_child as t2 on t1.capa_id=t2.capa_id where t1.capa_id='"+capa_id+"' and t1.request_date='"+request_date+"'");
		    	}
		    	else if(!capa_id.equals("") && request_date.equals("") && !action.equals(""))
		    	{
		    		resultSet = statement.executeQuery("select * from tbl_corrective_and_preventive_main as t1 join tbl_corrective_and_preventive_child as t2 on t1.capa_id=t2.capa_id where t1.capa_id='"+capa_id+"'and t2.action='"+action+"'");
		    	}
		    	else if(capa_id.equals("") && !request_date.equals("") && !action.equals(""))
		    	{
		    		resultSet = statement.executeQuery("select * from tbl_corrective_and_preventive_main as t1 join tbl_corrective_and_preventive_child as t2 on t1.capa_id=t2.capa_id where t2.action='"+action+"' and t1.request_date='"+request_date+"' ");
		    	}
		    	else
		    	{	   
		    		resultSet = statement.executeQuery("select * from tbl_corrective_and_preventive_main as t1 join tbl_corrective_and_preventive_child as t2 on t1.capa_id=t2.capa_id where t1.capa_id='"+capa_id+"' or t2.action='"+action+"' or t1.request_date='"+request_date+"' ");
		    	}
		    	
		
	    	}
	    	
	   while(resultSet.next()){
		   
		   correctiveAndPreventiveActions.add(new CorrectiveAndPreventiveActions(resultSet.getString("capa_id"),resultSet.getString("nc_id"), resultSet
					.getString("source_of_nonconformance"), resultSet
					.getString("external_id"), resultSet
					.getString("type_of_nonconformance"), resultSet
					.getString("date_found"), resultSet
					.getString("temporary_action"), resultSet
					.getString("nature_of_nc"), resultSet
					.getString("capa_requestor"), resultSet
					.getString("request_date"),resultSet
					.getString("capa_due_date"), resultSet
					.getString("assigned_team_leader"), resultSet
					.getString("team_members"), resultSet
					.getString("root_cause_analysis_file"), resultSet
					.getString("use_5_why_in_system"), resultSet
					.getString("why"), resultSet
					.getString("root_cause_statement"),resultSet
					.getString("upload_external_analysis"),
					resultSet.getString("action"),resultSet.getString("responsibility"),resultSet.getString("due_date"),resultSet.getString("completion_date"),resultSet.getString("verified_by"),resultSet.getString("verification_date"), resultSet.getString("attachment_name"),resultSet.getString("attachment_type"),resultSet.getString("attachment_referrence")));
	
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
	    return correctiveAndPreventiveActions;
		
	}
	
	
// pagination created on 24-june-2014(7.22pm).	
	public  List<CorrectiveAndPreventiveActions> getlimitedcorrectivereport(int page) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<CorrectiveAndPreventiveActions> correctiveAndPreventiveActions = new ArrayList<CorrectiveAndPreventiveActions>();
		try {

			String cmd;
			int offset = 5 * (page - 1);
			int limit = 5;
					cmd="select * from tbl_corrective_and_preventive_main limit " + offset + ","+ limit+"" ;
				
				//	cmd = "select * from tbl_narrativereport order by pname asc limit " + offset + ","+ limit+"" ;

			resultSet = statement.executeQuery(cmd);
			while(resultSet.next()){
				System.out.println("count");

				   correctiveAndPreventiveActions.add(new CorrectiveAndPreventiveActions(resultSet.getString("capa_id"),resultSet.getString("nc_id"), resultSet
							.getString("source_of_nonconformance"), resultSet
							.getString("external_id"), resultSet
							.getString("type_of_nonconformance"), resultSet
							.getString("date_found"), resultSet
							.getString("temporary_action"), resultSet
							.getString("nature_of_nc"), resultSet
							.getString("capa_requestor"), resultSet
							.getString("request_date"),resultSet
							.getString("capa_due_date"), resultSet
							.getString("assigned_team_leader"), resultSet
							.getString("team_members"), resultSet
							.getString("root_cause_analysis_file"), resultSet
							.getString("use_5_why_in_system"), resultSet
							.getString("why"), resultSet
							.getString("root_cause_statement"),resultSet
							.getString("upload_external_analysis"),
							resultSet.getString("action"),resultSet.getString("responsibility"),resultSet.getString("due_date"),resultSet.getString("completion_date"),resultSet.getString("verified_by"),resultSet.getString("verification_date"), resultSet.getString("attachment_name"),resultSet.getString("attachment_type"),resultSet.getString("attachment_referrence")));
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
		return correctiveAndPreventiveActions;

	}

		
		
	
	public boolean delete_correctiveAndPreventiveActions(String capa_id) {
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
			String cmd_delete = "delete from tbl_corrective_and_preventive_main where capa_id='"+ capa_id + "'";
			String cmd_delete1 = "delete from tbl_corrective_and_preventive_child where capa_id='"+ capa_id + "'";
			
			statement.execute(cmd_delete);
			statement.execute(cmd_delete1);
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
	
	public List<CorrectiveAndPreventiveActions> getCorrectiveAndPreventiveActions_bytype(String type,String start,String end)
	{
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		List<CorrectiveAndPreventiveActions> correctiveAndPreventiveActions = new ArrayList<CorrectiveAndPreventiveActions>();
		/*Date date = new Date();
	    Calendar c = Calendar.getInstance();
	    c.setTime(date);
	    System.out.println("Day of week = "+c.get(Calendar.DAY_OF_WEEK));
	    System.out.println("first day of week = "+c.getFirstDayOfWeek());
	    int i = c.get(Calendar.DAY_OF_WEEK);
	    System.out.println("value 0f i = "+i);
	    int currentDay = c.get(Calendar.DATE);
	    int currentMonth = c.get(Calendar.MONTH) + 1;
	    int currentYear = c.get(Calendar.YEAR);
	    String currentdate = currentYear+"-0"+currentMonth+"-0"+currentDay;
	    
	    Date start = c.getTime();
	    c.add(Calendar.DATE, -13);
	    Date end = c.getTime();
	    System.out.println(start + " - " + end);
	    int oldDay = c.get(Calendar.DATE);
	    int oldMonth = c.get(Calendar.MONTH) + 1;
	    int oldYear = c.get(Calendar.YEAR);
	    String olddate = oldYear+"-0"+oldMonth+"-"+oldDay;
	    System.out.println(olddate);
	    System.out.println(currentdate);
		*/
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		
	    try{
	    	
	    	
	   if(type.equals("Open_Corrective_Actions"))
		   	resultSet = statement.executeQuery("select * from qms.tbl_corrective_and_preventive_main as t1 join tbl_corrective_and_preventive_child as t2 on t1.capa_id=t2.capa_id where t2.completion_date< NOW()");
	   else if(type.equals("Open_Corrective_Actions_for_Over_30_Days"))
	   {
		   resultSet = statement.executeQuery("select * from qms.tbl_corrective_and_preventive_main as t1 join tbl_corrective_and_preventive_child as t2 on t1.capa_id=t2.capa_id where CURDATE() and DATE_SUB(CURDATE(),INTERVAL 30 DAY)");
	   }
	   else if(type.equals("Corrective_Actions_for_A_Certain_Period"))
	   {
		   resultSet = statement.executeQuery("select * from qms.tbl_corrective_and_preventive_main as t1 join tbl_corrective_and_preventive_child as t2 on t1.capa_id=t2.capa_id where ( t2.completion_date BETWEEN '"+start+"' AND '"+end+"')");
	   }
	   
	   else
		   System.out.println("choose any one of the above");
		 
		   
	   while(resultSet.next()){
		   
		   correctiveAndPreventiveActions.add(new CorrectiveAndPreventiveActions(resultSet.getString("capa_id"),resultSet.getString("nc_id"), resultSet
					.getString("source_of_nonconformance"), resultSet
					.getString("external_id"), resultSet
					.getString("type_of_nonconformance"), resultSet
					.getString("date_found"), resultSet
					.getString("temporary_action"), resultSet
					.getString("nature_of_nc"), resultSet
					.getString("capa_requestor"), resultSet
					.getString("request_date"),resultSet
					.getString("capa_due_date"), resultSet
					.getString("assigned_team_leader"), resultSet
					.getString("team_members"), resultSet
					.getString("root_cause_analysis_file"), resultSet
					.getString("use_5_why_in_system"), resultSet
					.getString("why"), resultSet
					.getString("root_cause_statement"),resultSet
					.getString("upload_external_analysis"),
					resultSet.getString("action"),resultSet.getString("responsibility"),resultSet.getString("due_date"),resultSet.getString("completion_date"),resultSet.getString("verified_by"),resultSet.getString("verification_date"), resultSet.getString("attachment_name"),resultSet.getString("attachment_type"),resultSet.getString("attachment_referrence")));
	
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
	    return correctiveAndPreventiveActions;
		
	}

	public List<CorrectiveAndPreventiveActions> get_corrective() {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status = false;
		List<CorrectiveAndPreventiveActions> correctiveAndPreventiveActions = new ArrayList<CorrectiveAndPreventiveActions>();

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String cmd_select = "select * from tbl_corrective_and_preventive_actions";
			resultSet = statement.executeQuery(cmd_select);
			while (resultSet.next()) {
				System.out.println("correct");
				 correctiveAndPreventiveActions.add(new CorrectiveAndPreventiveActions(resultSet.getString("capa_id"),resultSet.getString("nc_id"), resultSet
							.getString("source_of_nonconformance"), resultSet
							.getString("external_id"), resultSet
							.getString("type_of_nonconformance"), resultSet
							.getString("date_found"), resultSet
							.getString("temporary_action"), resultSet
							.getString("nature_of_nc"), resultSet
							.getString("capa_requestor"), resultSet
							.getString("request_date"),resultSet
							.getString("capa_due_date"), resultSet
							.getString("assigned_team_leader"), resultSet
							.getString("team_members"), resultSet
							.getString("root_cause_analysis_file"), resultSet
							.getString("use_5_why_in_system"), resultSet
							.getString("why"), resultSet
							.getString("root_cause_statement"),resultSet
							.getString("upload_external_analysis"),
						resultSet.getString("action"),resultSet.getString("responsibility"),resultSet.getString("due_date"),resultSet.getString("completion_date"),resultSet.getString("verified_by"),resultSet.getString("verification_date"), resultSet.getString("attachment_name"),resultSet.getString("attachment_type"),resultSet.getString("attachment_referrence")));
			
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
		return correctiveAndPreventiveActions;
	}
	
	public List<CorrectiveAndPreventiveActions> edit_corrective(String nc_id) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status = false;
		List<CorrectiveAndPreventiveActions> correctiveAndPreventiveActions = new ArrayList<CorrectiveAndPreventiveActions>();

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String cmd_select = "select * from tbl_corrective_and_preventive_actions where nc_id='"+nc_id+"'";
			resultSet = statement.executeQuery(cmd_select);
			while (resultSet.next()) {
				System.out.println("came");
				 correctiveAndPreventiveActions.add(new CorrectiveAndPreventiveActions(resultSet.getString("capa_id"),resultSet.getString("nc_id"), resultSet
							.getString("source_of_nonconformance"), resultSet
							.getString("external_id"), resultSet
							.getString("type_of_nonconformance"), resultSet
							.getString("date_found"), resultSet
							.getString("temporary_action"), resultSet
							.getString("nature_of_nc"), resultSet
							.getString("capa_requestor"), resultSet
							.getString("request_date"),resultSet
							.getString("capa_due_date"), resultSet
							.getString("assigned_team_leader"), resultSet
							.getString("team_members"), resultSet
							.getString("root_cause_analysis_file"), resultSet
							.getString("use_5_why_in_system"), resultSet
							.getString("why"), resultSet
							.getString("root_cause_statement"),resultSet
							.getString("upload_external_analysis"),
				resultSet.getString("action"),resultSet.getString("responsibility"),resultSet.getString("due_date"),resultSet.getString("completion_date"),resultSet.getString("verified_by"),resultSet.getString("verification_date"), resultSet.getString("attachment_name"),resultSet.getString("attachment_type"),resultSet.getString("attachment_referrence")));
			
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
		return correctiveAndPreventiveActions;
	}
	
	
	public boolean update_corrective(CorrectiveAndPreventiveActions correctiveAndPreventiveActions) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status1 = false;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			System.out.println("update");
			String cmd_update = "update tbl_corrective_and_preventive_actions set capa_requestor='"+correctiveAndPreventiveActions.getCapa_requestor()+"',request_date='"+correctiveAndPreventiveActions.getRequest_date()+"',capa_due_date='"+correctiveAndPreventiveActions.getCapa_due_date()+"',assigned_team_leader='"+correctiveAndPreventiveActions.getAssigned_team_leader()+"',team_members='"+correctiveAndPreventiveActions.getTeam_members()+"',root_cause_analysis_file='"+correctiveAndPreventiveActions.getRoot_cause_analysis_file()+"',use_5_why_in_system='"+correctiveAndPreventiveActions.getUse_5_why_in_system()+"',why='"+correctiveAndPreventiveActions.getWhy()+"',root_cause_statement='"+correctiveAndPreventiveActions.getRoot_cause_statement()+"',upload_external_analysis='"+correctiveAndPreventiveActions.getUpload_external_analysis()+"',action='"+correctiveAndPreventiveActions.getAction()+"',responsibility='"+correctiveAndPreventiveActions.getResponsibility()+"',due_date='"+correctiveAndPreventiveActions.getDue_date()+"',completion_date='"+correctiveAndPreventiveActions.getCompletion_date()+"',verified_by='"+correctiveAndPreventiveActions.getVerified_by()+"',verification_date='"+correctiveAndPreventiveActions.getVerification_date()+"' where nc_id='"+correctiveAndPreventiveActions.getNc_id()+"'";
			System.out.println(cmd_update);
			status1 = statement.execute(cmd_update);
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
		return status1;

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