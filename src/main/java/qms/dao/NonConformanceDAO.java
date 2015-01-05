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
import qms.model.NonConformance;
import qms.model.CorrectiveAndPreventiveActions;

public class NonConformanceDAO extends AbstractITextPdfView {
	private DataSource dataSource;

	public DataSource getDataSource() {
		return dataSource;
	}

	/**
	 * Excel Sheet Generation
	 */
	
	@Override
	protected void buildPdfDocument(Map<String, Object> model, Document doc,
	PdfWriter writer, HttpServletRequest request, HttpServletResponse response)
	throws Exception {
		

		  
	

		@SuppressWarnings("unchecked")
		List<NonConformance> nonConformances = (List<NonConformance>) model.get("nonConformances");
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
			
			if(field.equals("id"))
			{
				width[i] = 1.0f;
				 i++;
				 table.addCell(createLabelCell("ID"));
				
			}
			else if(field.equals("source_of_nonconformance"))
			{
				width[i] = 1.0f;
				 i++;
				 table.addCell(createLabelCell("Source Of NonConformance"));
			
			}
			else if(field.equals("external_id"))
			{
				width[i] = 1.0f;
				 i++;
				 table.addCell(createLabelCell("External Id"));
				
			}
			else if(field.equals("type_of_nonconformance"))
			{
				width[i] = 1.0f;
				 i++;
				 table.addCell(createLabelCell("Type of NonConformance"));
			
			}
			else if(field.equals("product_id"))
			{
				width[i] = 1.0f;
				 i++;
				 table.addCell(createLabelCell("Product Id"));
				
			}
			else if(field.equals("quantity_suspect"))
			{
				width[i] = 1.0f;
				 i++;
				 table.addCell(createLabelCell("Quantity Suspect"));
				
			}
			else if(field.equals("nature_of_nonconformance"))	
			{
				width[i] = 1.0f;
				 i++;
				 table.addCell(createLabelCell("Nature of NonConformance"));
				
			}else if(field.equals("date_found"))	
			{
				width[i] = 1.0f;
				 i++;
				 table.addCell(createLabelCell("Date Found"));
				
			}else if(field.equals("reported_by"))	
			{
				width[i] = 1.0f;
				 i++;
				 table.addCell(createLabelCell("Reported By"));
				
			}else if(field.equals("temporary_action"))
			{
				width[i] = 1.0f;
				 i++;
				 table.addCell(createLabelCell("Temporary Action"));
				
			}else if(field.equals("corrective_action_required"))	
			{
				width[i] = 1.0f;
				 i++;
				 table.addCell(createLabelCell("Corrective Action Required"));
				
			}else if(field.equals("disposition_required"))	
			{
				width[i] = 1.0f;
				 i++;
				 table.addCell(createLabelCell("Disposition Required"));
			
			}else if(field.equals("disposition1"))	
			{
				width[i] = 1.0f;
				 i++;
				 table.addCell(createLabelCell("Disposition"));
				
			}else if(field.equals("disposition_complete_date"))	
			{
				width[i] = 1.0f;
				 i++;
				 table.addCell(createLabelCell("Disposition Complete Date"));
			
			}
			else if(field.equals("name_of_disposition_responsibility"))	
			{
				width[i] = 1.0f;
				 i++;
				 table.addCell(createLabelCell("Name of Disposition Responsibility"));
				
			}else if(field.equals("cost_of_nonconformance"))	
			{
				width[i] = 1.0f;
				 i++;
				 table.addCell(createLabelCell("Cost of NonConformance"));
				
			}
		}
	
		int j=1;
		for (NonConformance nonConformance:nonConformances){	
			String sno = String.valueOf(j);
			table.addCell(createValueCell(sno));
			System.out.println("j value = "+j);
			j++;
	
		
				for (String field : fields) {
					
					if(field.equals("id"))
					{
						table.addCell(createValueCell(
								nonConformance.getId()));
						
					}
					else if(field.equals("source_of_nonconformance"))
					{
						table.addCell(createValueCell(
								nonConformance.getSource_of_nonconformance()));

					}
					else if(field.equals("external_id"))
					{
						table.addCell(createValueCell(
								nonConformance.getExternal_id()));
								
					}
					else if(field.equals("type_of_nonconformance"))	
					{
						table.addCell(createValueCell(
								nonConformance.getType_of_nonconformance()));
					
					}
					else if(field.equals("product_id"))	
					{
						table.addCell(createValueCell(
								nonConformance.getProduct_id()));
						
					}else if(field.equals("quantity_suspect"))	
					{
						table.addCell(createValueCell(
								nonConformance.getQuantity_suspect()));
						
					}else if(field.equals("nature_of_nonconformance"))
					{
						table.addCell(createValueCell(
								nonConformance.getNature_of_nonconformance()));
					
					}else if(field.equals("date_found"))	
					{
						table.addCell(createValueCell(
								nonConformance.getDate_found()));
						
					}else if(field.equals("reported_by"))	
					{
						table.addCell(createValueCell(
								nonConformance.getReported_by()));
					
					}else if(field.equals("temporary_action"))	
					{
						table.addCell(createValueCell(
								nonConformance.getTemporary_action()));
					
					}else if(field.equals("corrective_action_required"))	
					{
						if(nonConformance.getCorrective_action_required().equals("Yes"))
							table.addCell(createValueCell("Yes"));
							else
								table.addCell(createValueCell("No"));
							
					
					}else if(field.equals("disposition_required"))	
					{
						if(nonConformance.getDisposition_required().equals("Yes"))
							table.addCell(createValueCell("Yes"));
					else
						table.addCell(createValueCell("No"));
					
					}
					else if(field.equals("disposition1"))	
					{
						String dispositions = "";
						dispositions += nonConformance.getDisposition1()+"  - "+nonConformance.getQuality1();
						dispositions += "  \r  ";
						dispositions += nonConformance.getDisposition2()+"  - "+nonConformance.getQuality2();
						dispositions += "  \r  ";
						dispositions += nonConformance.getDisposition3()+"  - "+nonConformance.getQuality3();
						table.addCell(createValueCell(
								dispositions));
						
					}else if(field.equals("disposition_complete_date"))	
					{
						table.addCell(createValueCell(
								nonConformance.getDisposition_complete_date()));
						
					}else if(field.equals("name_of_disposition_responsibility"))	
					{
						table.addCell(createValueCell(
								nonConformance.getName_of_disposition_responsibility()));
					
					}
					else if(field.equals("cost_of_nonconformance"))	
					{
						table.addCell(createValueCell(
								nonConformance.getCost_of_nonconformance()));
					
					}
				}
				
		}
		table.setWidths(width);
		
		doc.add(table);
	}
	
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	//Insert the records into the database
	public boolean insert_nonconformance(NonConformance nonConformance,CorrectiveAndPreventiveActions correctiveAndPreventiveActions) {
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
			if(nonConformance.getSource_of_nonconformance() !="")
			{
				String cmd_select = "insert into tbl_external_nc(id,external_id) values('"+nonConformance.getId()+"','"+nonConformance.getExternal_id()+"')";
			status = statement.execute(cmd_select);
			System.out.println("insert external query executed" + cmd_select);
			}
			
			String cmd_insert_nonconformance = "insert into tbl_nonconformance(id,source_of_nonconformance,external_id,type_of_nonconformance,product_id,quantity_suspect,nature_of_nonconformance,date_found,reported_by,temporary_action,corrective_action_required,disposition_required,disposition1,quality1,disposition2,quality2,disposition3,quality3,disposition_complete_date,name_of_disposition_responsibility,cost_of_nonconformance) values('"
					+ nonConformance.getId()
					+ "','"
					+ nonConformance.getSource_of_nonconformance()
					+ "','"
					+ nonConformance.getExternal_id()
					+ "','"
					+ nonConformance.getType_of_nonconformance()
					+ "','"
					+ nonConformance.getProduct_id()
					+ "','"
					+ nonConformance.getQuantity_suspect()
					+ "','"
					+ nonConformance.getNature_of_nonconformance()
					+ "','"
					+ nonConformance.getDate_found()
					+ "','"
					+ nonConformance.getReported_by()
					+ "','"
					+ nonConformance.getTemporary_action()
					+ "','"
					+ nonConformance.getCorrective_action_required()
					+ "','"
					+ nonConformance.getDisposition_required()
					+ "','"
					+ nonConformance.getDisposition1()
					+ "','"
					+ nonConformance.getQuality1()
					+ "','"
					+ nonConformance.getDisposition2()
					+ "','"
					+ nonConformance.getQuality2()
					+ "','"+ nonConformance.getDisposition3()
					+ "','"
					+ nonConformance.getQuality3()
					+ "','"
					+ nonConformance.getDisposition_complete_date()
					+ "','"
					+ nonConformance.getName_of_disposition_responsibility()
					+ "','"
					+ nonConformance.getCost_of_nonconformance() + "')";
			status = statement.execute(cmd_insert_nonconformance);
			
			String cmd_insert_corrective="INSERT INTO tbl_corrective_and_preventive_actions(nc_id,capa_requestor,request_date,capa_due_date,assigned_team_leader,team_members,root_cause_analysis_file,use_5_why_in_system,why,root_cause_statement,upload_external_analysis,action,responsibility,due_date,completion_date,verified_by,verification_date) values('"+nonConformance.getId()+"','"+correctiveAndPreventiveActions.getCapa_requestor()+"','"+correctiveAndPreventiveActions.getRequest_date()+"','"+correctiveAndPreventiveActions.getCapa_due_date()+"','"+correctiveAndPreventiveActions.getAssigned_team_leader()+"','"+correctiveAndPreventiveActions.getTeam_members()+"','"+correctiveAndPreventiveActions.getRoot_cause_analysis_file()+"','"+correctiveAndPreventiveActions.getUse_5_why_in_system()+"','"+correctiveAndPreventiveActions.getWhy()+"','"+correctiveAndPreventiveActions.getRoot_cause_statement()+"','"+correctiveAndPreventiveActions.getUpload_external_analysis()+"','"+correctiveAndPreventiveActions.getAction()+"','"+correctiveAndPreventiveActions.getResponsibility()+"','"+correctiveAndPreventiveActions.getDue_date()+"','"+correctiveAndPreventiveActions.getCompletion_date()+"','"+correctiveAndPreventiveActions.getVerified_by()+"','"+correctiveAndPreventiveActions.getVerification_date()+"')";
			status=statement.execute(cmd_insert_corrective);
			
				
		
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

	//Update the values
	public boolean update_nonconformance(NonConformance nonConformance) {
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
			System.out.println("check");
			String cmd_update = "update tbl_nonconformance set source_of_nonconformance='"+nonConformance.getSource_of_nonconformance()+"',external_id='"+nonConformance.getExternal_id()+"',type_of_nonconformance='"+nonConformance.getType_of_nonconformance()+"',product_id='"+nonConformance.getProduct_id()+"',quantity_suspect='"+nonConformance.getQuantity_suspect()+"',nature_of_nonconformance='"+nonConformance.getNature_of_nonconformance()+"',date_found='"+nonConformance.getDate_found()+"',reported_by='"+nonConformance.getReported_by()+"',temporary_action='"+nonConformance.getTemporary_action()+"',corrective_action_required='"+nonConformance.getCorrective_action_required()+"',disposition_required='"+nonConformance.getDisposition_required()+"',disposition1='"+nonConformance.getDisposition1()+"',quality1='"+nonConformance.getQuality1()+"',disposition2='"+nonConformance.getDisposition2()+"',quality2='"+nonConformance.getQuality2()+"',disposition3='"+nonConformance.getDisposition3()+"',quality3='"+nonConformance.getQuality3()+"',disposition_complete_date='"+nonConformance.getDisposition_complete_date()+"',name_of_disposition_responsibility='"+nonConformance.getName_of_disposition_responsibility()+"',cost_of_nonconformance='"+nonConformance.getCost_of_nonconformance()+"' where id='"+nonConformance.getId()+"'";
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
	
	
	//Delete the values from database
	public boolean delete_nonconformance(String nonConformance_id) {
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
			String cmd_delete = "delete from tbl_nonconformance where id='"
					+ nonConformance_id + "'";
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
	
	//Edit the Database values
	public List<NonConformance> edit_nonconformance(String nonConformanceid) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		List<NonConformance> nonConformances = new ArrayList<NonConformance>();

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String cmd_select = "select * from tbl_nonconformance where id='"+nonConformanceid+"'";
			resultSet = statement.executeQuery(cmd_select);
			while (resultSet.next()) {
				System.out.println("came");
				nonConformances.add(new NonConformance(resultSet
						.getString("id"), resultSet
						.getString("source_of_nonconformance"), resultSet
						.getString("external_id"), resultSet
						.getString("type_of_nonconformance"), resultSet
						.getString("product_id"), resultSet
						.getString("quantity_suspect"), resultSet
						.getString("nature_of_nonconformance"), resultSet
						.getString("date_found"), resultSet
						.getString("reported_by"), resultSet
						.getString("temporary_action"), resultSet
						.getString("corrective_action_required"), resultSet
						.getString("disposition_required"), resultSet
						.getString("disposition1"),resultSet
						.getString("quality1"),resultSet
						.getString("disposition2"),resultSet
						.getString("quality2"),resultSet
						.getString("disposition3"),resultSet
						.getString("quality3"), resultSet
						.getString("disposition_complete_date"), resultSet
						.getString("name_of_disposition_responsibility"),
						resultSet.getString("cost_of_nonconformance")));

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
		return nonConformances;
	}

	//This method is used for getting the nonconformance record's list
	public List<NonConformance> list_nonconformance(String id) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		List<NonConformance> nonConformances = new ArrayList<NonConformance>();

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String cmd_select = "select * from tbl_nonconformance where id='"+id+"'";
			resultSet = statement.executeQuery(cmd_select);
			while (resultSet.next()) {
				System.out.println("came");
				nonConformances.add(new NonConformance(resultSet
						.getString("id"), resultSet
						.getString("source_of_nonconformance"), resultSet
						.getString("external_id"), resultSet
						.getString("type_of_nonconformance"), resultSet
						.getString("product_id"), resultSet
						.getString("quantity_suspect"), resultSet
						.getString("nature_of_nonconformance"), resultSet
						.getString("date_found"), resultSet
						.getString("reported_by"), resultSet
						.getString("temporary_action"), resultSet
						.getString("corrective_action_required"), resultSet
						.getString("disposition_required"), resultSet
						.getString("disposition1"),resultSet
						.getString("quality1"),resultSet
						.getString("disposition2"),resultSet
						.getString("quality2"),resultSet
						.getString("disposition3"),resultSet
						.getString("quality3"), resultSet
						.getString("disposition_complete_date"), resultSet
						.getString("name_of_disposition_responsibility"),
						resultSet.getString("cost_of_nonconformance")));

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
		return nonConformances;
	}

	//Getting the Maximum Id
	public String get_maxid() {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		String Max_id = "NC1001";
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {

			String cmd_select = "select max(auto_id) as auto_id from tbl_nonconformance";
			resultSet = statement.executeQuery(cmd_select);
			if (resultSet.next()) {
				if (!resultSet.getString("auto_id").equals("null"))
					Max_id = "NC"
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

	// Searching the values
	public List<NonConformance> findnonconformance(String id,String type_of_nonconformance,int page) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		List<NonConformance> nonConformances = new ArrayList<NonConformance>();

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			if(page >= 1)
	    	{
	    	int offset = 5 * (page - 1);
			int limit = 5;
			
			if(!id.equals("") && !type_of_nonconformance.equals(""))
			{
				resultSet = statement.executeQuery("select * from tbl_nonconformance where id='"+id+"' and type_of_nonconformance='"+type_of_nonconformance+"' limit " + offset + ","+ limit+"");
			}
			else if(!id.equals("") && type_of_nonconformance.equals(""))
			{
				resultSet = statement.executeQuery("select * from tbl_nonconformance where id='"+id+"' limit " + offset + ","+ limit+"");
			}
			else if(id.equals("") && !type_of_nonconformance.equals(""))
			{
				resultSet = statement.executeQuery("select * from tbl_nonconformance where type_of_nonconformance='"+type_of_nonconformance+"' limit " + offset + ","+ limit+"");
			}
			else
			{
				resultSet = statement.executeQuery("select * from tbl_nonconformance where id='"+id+"' or type_of_nonconformance='"+type_of_nonconformance+"' limit " + offset + ","+ limit+"");
			}
	    	}
			else
			{
				if(!id.equals("") && !type_of_nonconformance.equals(""))
				{
					resultSet = statement.executeQuery("select * from tbl_nonconformance where id='"+id+"' and type_of_nonconformance='"+type_of_nonconformance+"'");
				}
				else if(!id.equals("") && type_of_nonconformance.equals(""))
				{
					resultSet = statement.executeQuery("select * from tbl_nonconformance where id='"+id+"'");
				}
				else if(id.equals("") && !type_of_nonconformance.equals(""))
				{
					resultSet = statement.executeQuery("select * from tbl_nonconformance where type_of_nonconformance='"+type_of_nonconformance+"'");
				}
				else
				{
					resultSet = statement.executeQuery("select * from tbl_nonconformance where id='"+id+"' or type_of_nonconformance='"+type_of_nonconformance+"'");
				}
			}
			while (resultSet.next()) {
				System.out.println("came");
				nonConformances.add(new NonConformance(resultSet
						.getString("id"), resultSet
						.getString("source_of_nonconformance"), resultSet
						.getString("external_id"), resultSet
						.getString("type_of_nonconformance"), resultSet
						.getString("product_id"), resultSet
						.getString("quantity_suspect"), resultSet
						.getString("nature_of_nonconformance"), resultSet
						.getString("date_found"), resultSet
						.getString("reported_by"), resultSet
						.getString("temporary_action"), resultSet
						.getString("corrective_action_required"), resultSet
						.getString("disposition_required"), resultSet
						.getString("disposition1"),resultSet
						.getString("quality1"),resultSet
						.getString("disposition2"),resultSet
						.getString("quality2"),resultSet
						.getString("disposition3"),resultSet
						.getString("quality3"), resultSet
						.getString("disposition_complete_date"), resultSet
						.getString("name_of_disposition_responsibility"),
						resultSet.getString("cost_of_nonconformance")));

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
		return nonConformances;
	}

	// Searching the values
		public int FindNonconformance(String id,String type_of_nonconformance) {
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
			List<NonConformance> nonConformances = new ArrayList<NonConformance>();
			try {
					if(!id.equals("") && !type_of_nonconformance.equals(""))
					{
						resultSet = statement.executeQuery("select count(*) as noofrecords from tbl_nonconformance where id='"+id+"' and type_of_nonconformance='"+type_of_nonconformance+"'");
					}
					else if(!id.equals("") && type_of_nonconformance.equals(""))
					{
						resultSet = statement.executeQuery("select count(*) as noofrecords from tbl_nonconformance where id='"+id+"'");
					}
					else if(id.equals("") && !type_of_nonconformance.equals(""))
					{
						resultSet = statement.executeQuery("select count(*) as noofrecords from tbl_nonconformance where type_of_nonconformance='"+type_of_nonconformance+"'");
					}
					else
					{
						resultSet = statement.executeQuery("select count(*) as noofrecords from tbl_nonconformance where id='"+id+"' or type_of_nonconformance='"+type_of_nonconformance+"'");
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

	
	
	//Report Generation
	public List<NonConformance> get_nonconformance_type(String type,String start,String end)
	 {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		List<NonConformance> nonConformances = new ArrayList<NonConformance>();

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String cmd_select = null;
			
			if(type=="opennonconformance")
				cmd_select= "select * from tbl_nonconformance" ;
			//cmd_select= "select * from tbl_nonconformance where disposition==0 AND disposition_complete_date==NULL" ;
			
				else if(type=="nodispositionover30days")
				//	cmd_select="select * from tbl_nonconformance where disposition_complete_date between now() and DATE_ADDNOW(), INTERVAL 30 DAYS";
					cmd_select="select * from tbl_nonconformance  WHERE disposition_complete_date BETWEEN NOW() AND NOW() + INTERVAL 30 DAY";
					else if(type=="betweendates")
					{
						
						System.out.println("two dates");
						cmd_select="select * from tbl_nonconformance where disposition_complete_date between '"+start+"' AND '"+end+"'";
					}
			resultSet = statement.executeQuery(cmd_select);
			System.out.println("query = "+cmd_select);
			while (resultSet.next()) {
				System.out.println("came");
				nonConformances.add(new NonConformance(resultSet
						.getString("id"), resultSet
						.getString("source_of_nonconformance"), resultSet
						.getString("external_id"), resultSet
						.getString("type_of_nonconformance"), resultSet
						.getString("product_id"), resultSet
						.getString("quantity_suspect"), resultSet
						.getString("nature_of_nonconformance"), resultSet
						.getString("date_found"), resultSet
						.getString("reported_by"), resultSet
						.getString("temporary_action"), resultSet
						.getString("corrective_action_required"), resultSet
						.getString("disposition_required"), resultSet
						.getString("disposition1"),resultSet
						.getString("quality1"),resultSet
						.getString("disposition2"),resultSet
						.getString("quality2"),resultSet
						.getString("disposition3"),resultSet
						.getString("quality3"), resultSet
						.getString("disposition_complete_date"), resultSet
						.getString("name_of_disposition_responsibility"),
						resultSet.getString("cost_of_nonconformance")));

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
		return nonConformances;
	}

	
	
	
	//Get Method for Nonconformance
	public List<NonConformance> get_nonconformance() {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		List<NonConformance> nonConformances = new ArrayList<NonConformance>();

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String cmd_select = "select * from tbl_nonconformance";
			resultSet = statement.executeQuery(cmd_select);
			while (resultSet.next()) {
				System.out.println("came");
				nonConformances.add(new NonConformance(resultSet
						.getString("id"), resultSet
						.getString("source_of_nonconformance"), resultSet
						.getString("external_id"), resultSet
						.getString("type_of_nonconformance"), resultSet
						.getString("product_id"), resultSet
						.getString("quantity_suspect"), resultSet
						.getString("nature_of_nonconformance"), resultSet
						.getString("date_found"), resultSet
						.getString("reported_by"), resultSet
						.getString("temporary_action"), resultSet
						.getString("corrective_action_required"), resultSet
						.getString("disposition_required"), resultSet
						.getString("disposition1"),resultSet
						.getString("quality1"),resultSet
						.getString("disposition2"),resultSet
						.getString("quality2"),resultSet
						.getString("disposition3"),resultSet
						.getString("quality3"), resultSet
						.getString("disposition_complete_date"), resultSet
						.getString("name_of_disposition_responsibility"),
						resultSet.getString("cost_of_nonconformance")));

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
		return nonConformances;
	}
	//get Dates for corrective and preventive action module
	public List<String> getDates()
	{
		
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet=null;
		int flag=0;
		String date="";
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<String> list = new ArrayList<String>();
	    try{
	    	String cmd_role="select distinct(date_found) as date from tbl_nonconformance order by date_found;";
	    	resultSet=statement.executeQuery(cmd_role);
	    	while(resultSet.next()){
	    	date=resultSet.getString("date");
	    	list.add(date);
	    	}
	    	
	    	System.out.println("date = "+date);
	    	 
	 }
	    catch(Exception e){
	    	System.out.println(e.toString());
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    	flag=0;
	    	//return 0;
	    }finally{
	     	releaseStatement(statement);
	    	releaseConnection(con);	    
	    	
	    }
	   return list;
	
	}
	
	//Get Method for corrective and preventive actions form
	public List<CorrectiveAndPreventiveActions> get_corrective() {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
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
				/*correctiveAndPreventiveActions.add(new CorrectiveAndPreventiveActions (resultSet
						.getString("capa_id"),resultSet
						.getString("nc_id"), resultSet
						.getString("capa_requestor"), resultSet
						.getString("request_date"), resultSet
						.getString("capa_due_date"), resultSet
						.getString("assigned_team_leader"), resultSet
						.getString("team_members"), resultSet
						.getString("root_cause_analysis_file"), resultSet
						.getString("use_5_why_in_system"), resultSet
						.getString("why"), resultSet
						.getString("root_cause_statement"), resultSet
						.getString("upload_external_analysis"), resultSet
						.getString("action"), resultSet
						.getString("responsibility"), resultSet
						.getString("due_date"),resultSet
						.getString("completion_date"),resultSet
						.getString("verified_by"),
						resultSet.getString("verification_date")));*/

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
	
	//Edit operation for corrective and preventive actions form
	public List<CorrectiveAndPreventiveActions> edit_corrective(String nc_id) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
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
				/*correctiveAndPreventiveActions.add(new CorrectiveAndPreventiveActions (resultSet
						.getString("capa_id"),resultSet
						.getString("nc_id"), resultSet
						.getString("capa_requestor"), resultSet
						.getString("request_date"), resultSet
						.getString("capa_due_date"), resultSet
						.getString("assigned_team_leader"), resultSet
						.getString("team_members"), resultSet
						.getString("root_cause_analysis_file"), resultSet
						.getString("use_5_why_in_system"), resultSet
						.getString("why"), resultSet
						.getString("root_cause_statement"), resultSet
						.getString("upload_external_analysis"), resultSet
						.getString("action"), resultSet
						.getString("responsibility"), resultSet
						.getString("due_date"),resultSet
						.getString("completion_date"),resultSet
						.getString("verified_by"),
						resultSet.getString("verification_date")));*/

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
	
	//Update operation for corrective and preventive actions form
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
	public  List<NonConformance> getlimitednonconformancereport(int page) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<NonConformance> nonConformances = new ArrayList<NonConformance>();
		try {

			String cmd;
			int offset = 5 * (page - 1);
			int limit = 5;
					cmd="select * from tbl_nonconformance limit " + offset + ","+ limit+"" ;
				
				//	cmd = "select * from tbl_narrativereport order by pname asc limit " + offset + ","+ limit+"" ;

			resultSet = statement.executeQuery(cmd);
			while (resultSet.next()) {
				System.out.println("came");
				nonConformances.add(new NonConformance(resultSet
						.getString("id"), resultSet
						.getString("source_of_nonconformance"), resultSet
						.getString("external_id"), resultSet
						.getString("type_of_nonconformance"), resultSet
						.getString("product_id"), resultSet
						.getString("quantity_suspect"), resultSet
						.getString("nature_of_nonconformance"), resultSet
						.getString("date_found"), resultSet
						.getString("reported_by"), resultSet
						.getString("temporary_action"), resultSet
						.getString("corrective_action_required"), resultSet
						.getString("disposition_required"),  resultSet
						.getString("disposition1"),resultSet
						.getString("quality1"),resultSet
						.getString("disposition2"),resultSet
						.getString("quality2"),resultSet
						.getString("disposition3"),resultSet
						.getString("quality3"), resultSet
						.getString("disposition_complete_date"), resultSet
						.getString("name_of_disposition_responsibility"),
						resultSet.getString("cost_of_nonconformance")));

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
		return nonConformances;

	}
	public int getnoofnonconformancereport() {
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
		List<NonConformance> nonConformances = new ArrayList<NonConformance>();
		try {

			String cmd;
				cmd = "select count(*) as noofrecords from tbl_nonconformance";
			System.out.println("command"+cmd);			
			resultSet = statement.executeQuery(cmd);
			if (resultSet.next())
				noofRecords = resultSet.getInt("noofrecords");
			System.out.println("NOof Records="+noofRecords);
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

	public List<String> filtersourceofnc(String nc_id){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<String> nonConformances = new ArrayList<String>();
	    try{
	    	/*String cmd="select source_of_nonconformance from tbl_nonconformance where id='"+nc_id+"'";*/
	    	String cmd = "select source_of_nonconformance from tbl_nonconformance where id='"+nc_id+"'";
	    /*	String cmd1 = "select type_of_nonconformance from tbl_nonconformance where id='"+nc_id+"'";
	    	String cmd2 = "select nature_of_nonconformance from tbl_nonconformance where id='"+nc_id+"'";
	    */	resultSet = statement.executeQuery(cmd);
	    /*	resultSet = statement.executeQuery(cmd1);
	    	resultSet = statement.executeQuery(cmd2);
		*/	System.out.println(cmd);
		/*	System.out.println(cmd1);
			System.out.println(cmd2);
		*/	
			//System.out.println("came");
			while(resultSet.next()){
				System.out.println("count");
			//	employees.add(new Employee(resultSet.getString("employee_id"),resultSet.getString("name"), resultSet.getString("job_title"), resultSet.getString("date_hired"), resultSet.getString("attachments"), resultSet.getString("list_of_functions_needes"),resultSet.getString("documented_in"), resultSet.getString("qualified_by"),resultSet.getString("type_of_training"),resultSet.getString("trainer"), resultSet.getString("training_due_date"),resultSet.getString("training_completion_date"),resultSet.getString("training_effectiveness_review_due_date"),resultSet.getString("training_effectiveness_notes")));
				nonConformances.add(resultSet.getString("source_of_nonconformance"));

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
	    return nonConformances;
		
	}

	
	public List<String> filternatureofnc(String nc_id){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<String> nonConformances = new ArrayList<String>();
	    try{
	    	String cmd = "select nature_of_nonconformance from tbl_nonconformance where id='"+nc_id+"'";
	    	resultSet = statement.executeQuery(cmd);
	    	System.out.println(cmd);
			while(resultSet.next()){
				System.out.println("count");
				nonConformances.add(resultSet.getString("nature_of_nonconformance"));

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
	    return nonConformances;
		
	}

	
	public List<String> filtertypeofnc(String nc_id){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<String> nonConformances = new ArrayList<String>();
	    try{
	    	String cmd1 = "select type_of_nonconformance from tbl_nonconformance where id='"+nc_id+"'";
	    	resultSet = statement.executeQuery(cmd1);
	    	System.out.println(cmd1);
			while(resultSet.next()){
				System.out.println("count");
				nonConformances.add(resultSet.getString("type_of_nonconformance"));

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
	    return nonConformances;
		
	}
	
	
	public List<String> filteraction(String nc_id)
	{
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try
		{
			con = dataSource.getConnection();
			statement = con.createStatement();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		List<String> nonConformances = new ArrayList<String>();
		try
		{
			String cmd = "select temporary_action from tbl_nonconformance where id='"+nc_id+"'";
			resultSet = statement.executeQuery(cmd);
			while(resultSet.next())
			{
				nonConformances.add(resultSet.getString("temporary_action"));
			}
		}
		catch(Exception e){
	    	System.out.println(e.toString());
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    }finally{
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);	    	
	    }
	    return nonConformances;
	}

//getting the reportedby names from nonconformance created on 23-june-2014(12.23).
	public List<String> filterreported(String type_of_nonconformance){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<String> nonConformances = new ArrayList<String>();
	    try{
	    	
	    	String cmd = "select reported_by from tbl_nonconformance where type_of_nonconformance='"+type_of_nonconformance+"'";
	    	resultSet = statement.executeQuery(cmd);
	    	System.out.println(cmd);
			while(resultSet.next()){
				System.out.println("count");
				nonConformances.add(resultSet.getString("source_of_nonconformance"));

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
	    return nonConformances;
		
	}


	public void releaseConnection(Connection con) {
		try {
			if (con != null)
				con.close();
		} catch (Exception e) {
		}
	}

	public void releaseResultSet(ResultSet rs) {
		try {
			if (rs != null)
				rs.close();
		} catch (Exception e) {
		}
	}

	public void releaseStatement(Statement stmt) {
		try {
			if (stmt != null)
				stmt.close();
		} catch (Exception e) {
		}
	}

}
