//http://www.compuware.com/content/dam/compuware/application-development/whitepapers/wp_dataconversion.pdf
package qms.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.sql.PreparedStatement;
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


import org.joda.time.DateTimeZone;
import org.joda.time.LocalDate;
import org.joda.time.LocalTime;


import com.itextpdf.text.Document;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;


import qms.controllers.AbstractITextPdfView;
import qms.model.DocumentMain;
import qms.model.InternalAudits;
import qms.model.Maintenance;





public class MaintenanceDAO extends AbstractITextPdfView
{
	private DataSource dataSource;
	public DataSource getDataSource() {
		return dataSource;
	}
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	 // Excel Sheet Generation
	 @Override
	protected void buildPdfDocument(Map<String, Object> model, Document doc,
	PdfWriter writer, HttpServletRequest request, HttpServletResponse response)
	throws Exception {
		 @SuppressWarnings("unchecked")
		List<Maintenance> maintenances = (List<Maintenance>) model.get("maintenances");
		String[] fields=(String[])model.get("fields");
		
		int memolist = fields.length;
		System.out.println("length = "+memolist);
       PdfPTable table=new PdfPTable(memolist+1);
       float[] width= new float[memolist+1];
		table.setWidthPercentage(100);
		int i=1;
		 table.addCell(createLabelCell("SNO"));
		 width[0] = 1.0f;
		
		for (String field : fields) {
			if(field.equals("equipment_id"))
			{
				width[i] = 1.0f;
				 i++;
				 table.addCell(createLabelCell("Equipement Id"));
			
			}
			else if(field.equals("equipment_name"))
			{
				width[i] = 1.0f;
				 i++;
				 table.addCell(createLabelCell("Equipement Name"));
				
			}
			else if(field.equals("equipment_model"))
			{
				width[i] = 1.0f;
				 i++;
				 table.addCell(createLabelCell("Equipement Model"));
				
			}
			else if(field.equals("serial_number"))
			{
				width[i] = 1.0f;
				 i++;
				 table.addCell(createLabelCell("Serial Number"));
				
			}
			else if(field.equals("date_acquired"))
			{
				width[i] = 1.0f;
				 i++;
				 table.addCell(createLabelCell("Date Acquired"));
				
			}
			else if(field.equals("equipment_status"))
			{
				width[i] = 1.0f;
				 i++;
				 table.addCell(createLabelCell("Equipement Status"));
				
			}
			else if(field.equals("frequency_maintenance"))	
			{
				width[i] = 1.0f;
				 i++;
				 table.addCell(createLabelCell("Frequency Maintenance"));
				
			}else if(field.equals("calibration"))	
			{
				width[i] = 1.0f;
				 i++;
				 table.addCell(createLabelCell("Calibration"));
				
			}else if(field.equals("type_of_maintenance"))	
			{
				width[i] = 1.0f;
				 i++;
				 table.addCell(createLabelCell("Type of maintenance"));
				
			}
			else if(field.equals("maintenance_frequency"))	
			{
				width[i] = 1.0f;
				 i++;
				 table.addCell(createLabelCell("Maintenance Frequency"));
			
			}
			else if(field.equals("reference"))	
			{
				width[i] = 1.0f;
				 i++;
				 table.addCell(createLabelCell("References"));
				
			}
			/*else if(field.equals("instructions"))	
			{
				width[i] = 1.0f;
				 i++;
				 table.addCell(createLabelCell("Instructions"));
			
			}*/else if(field.equals("due_date"))	
			{
				width[i] = 1.0f;
				 i++;
				 table.addCell(createLabelCell("Due Date"));
				
			}else if(field.equals("completion_date"))	
			{
				width[i] = 1.0f;
				 i++;
				 table.addCell(createLabelCell("Completion Date"));
				
			}else if(field.equals("completed_by"))	
			{
				width[i] = 1.0f;
				 i++;
				 table.addCell(createLabelCell("Completed By"));
				
			}else if(field.equals("notes"))	
			{
				width[i] = 1.0f;
				 i++;
				 table.addCell(createLabelCell("Notes"));
				
			}
		}

		int j=1;
		for (Maintenance maintenance:maintenances){	
			
			String sno = String.valueOf(j);
			table.addCell(createValueCell(sno));
			j++;
				for (String field : fields) {
					
					if(field.equals("equipment_id"))
					{
						table.addCell(createValueCell(maintenance.getEquipment_id()));
							
					}
					else if(field.equals("equipment_name"))
					{
						table.addCell(createValueCell(maintenance.getEquipment_name()));

						
					}
					else if(field.equals("equipment_model"))
					{
						table.addCell(createValueCell(maintenance.getEquipment_model()));
							
					}
					else if(field.equals("serial_number"))	
					{
						table.addCell(createValueCell(maintenance.getSerial_number()));
						
					}else if(field.equals("date_acquired"))	
					{
						table.addCell(createValueCell(maintenance.getDate_acquired()));
					}
					else if(field.equals("equipment_status"))	
					{
						table.addCell(createValueCell(maintenance.getEquipment_status()));
				
					}
					else if(field.equals("frequency_maintenance"))
					{
						String maintances =" ";
					if(maintenance.getFrequency_maintenance_weekly().equals("Weekly"))
					{
						maintances =maintances+"Weekly"+"\r";
					}
					if(maintenance.getFrequency_maintenance_monthly().equals("Monthly")){
						maintances =maintances+"Monthly"+"\r";
					}
					if(maintenance.getFrequency_maintenance_quarterly().equals("Quarterly")){
						maintances =maintances+"Quarterly"+"\r";
					}
					if(maintenance.getFrequency_maintenance_semiannually().equals("Semi-Annually")){
						maintances =maintances+"Semi-Annually"+"\r";
					}
					if(maintenance.getFrequency_maintenance_annually().equals("Annually")){
						maintances =maintances+"Annually";
					}
					table.addCell(createValueCell(maintances));
				}	
				else if(field.equals("calibration"))	
					{
						table.addCell(createValueCell(maintenance.getCalibration()));
						
					}
					else if(field.equals("type_of_maintenance"))	
					{
						table.addCell(createValueCell(maintenance.getType_of_maintenance()));
					}
					else if(field.equals("maintenance_frequency"))	
					{
						String maintances =" ";
						
						if(maintenance.getFrequency_maintenance_list().equals("weekly"))
						{
							maintances =maintances+"Weekly"+"\r";
						}
						if(maintenance.getFrequency_maintenance_list().equals("monthly")){
							maintances =maintances+"Monthly"+"\r";
						}
						if(maintenance.getFrequency_maintenance_list().equals("quarterly")){
							maintances =maintances+"Quarterly"+"\r";
						}
						if(maintenance.getFrequency_maintenance_list().equals("semi-annually")){
							maintances =maintances+"Semi-Annually"+"\r";
						}
						if(maintenance.getFrequency_maintenance_list().equals("annually")){
							maintances =maintances+"Annually";
						}
						table.addCell(createValueCell(maintances));
						
					}else if(field.equals("reference"))	
					{
						String r1 ="";
						
						if(maintenance.getReference1().equals("null"))
							r1="";
						else
							r1 = maintenance.getReference1();
						
						String refrence = r1;
						table.addCell(createValueCell(refrence));
						
					
					}/*else if(field.equals("instructions"))	
					{
						table.addCell(createValueCell(maintenance.getInstructions()));
						
						
					}*/else if(field.equals("due_date"))	
					{
						table.addCell(createValueCell(maintenance.getDue_date()));
						
					}else if(field.equals("completion_date"))	
					{
						table.addCell(createValueCell(maintenance.getCompletion_date()));
						
					}else if(field.equals("completed_by"))	
					{
						table.addCell(createValueCell(maintenance.getCompleted_by()));
						
					}
					else if(field.equals("notes"))	
					{
						table.addCell(createValueCell(maintenance.getNotes()));
						
					}
				}
				
		}
		table.setWidths(width);
		
		doc.add(table);
	}

	

	
	//Insert operation
	public boolean insert_maintenance(Maintenance maintenance) {
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
			/*String cmd_insert = "insert into tbl_maintenance(equipment_id,equipment_name,equipment_model,serial_number,date_acquired,equipment_status,frequency_maintenance,calibration)values" +
					"('"+maintenance.getEquipment_id()+"'," +
					"'"+maintenance.getEquipment_name()+"',"+
					"'"+maintenance.getEquipment_model()+"',"+
					"'"+maintenance.getSerial_number()+"',"+
					"'"+maintenance.getDate_acquired()+"',"+
					"'"+maintenance.getEquipment_status()+"',"+
					"'"+maintenance.getFrequency_maintenance()+"',"+
					"'"+maintenance.getCalibration()+"')";
			String cmd_insert1 = "insert into tbl_maintenancechild(equipmentid,type_of_maintenance,weekly,monthly,quarterly,semiannually,annually,reference1,reference2,reference3,reference4,reference5,instructions,instructionattach,due_date,completion_date,completed_by,notes)values" +
					"('"+maintenance.getEquipmentid()+"'," +
					"'"+maintenance.getType_of_maintenance()+"'," +
					"'"+maintenance.getWeekly()+"'," +
					"'"+maintenance.getMonthly()+"'," +
					"'"+maintenance.getQuarterly()+"'," +
					"'"+maintenance.getSemiannually()+"'," +
					"'"+maintenance.getAnnually()+"'," +
					"'"+maintenance.getReference1()+"'," +
					"'"+maintenance.getReference2()+"'," +
					"'"+maintenance.getReference3()+"'," +
					"'"+maintenance.getReference4()+"'," +
					"'"+maintenance.getReference5()+"'," +
					"'"+maintenance.getInstructions()+"'," +
					"'"+maintenance.getInstructionattach()+"'," +
					"'"+maintenance.getDue_date()+"'," +
					"'"+maintenance.getCompletion_date()+"'," +
					"'"+maintenance.getCompleted_by()+"'," +
					"'"+maintenance.getNotes()+"')";
			*/
			

			PreparedStatement preparedStatement=con.prepareStatement("insert into tbl_maintenance(equipment_id,equipment_name,equipment_model,serial_number,date_acquired,equipment_status,frequency_maintenance_weekly,frequency_maintenance_monthly,frequency_maintenance_quarterly,frequency_maintenance_semiannually,frequency_maintenance_annually,calibration)values(?,?,?,?,?,?,?,?,?,?,?,?)");
						preparedStatement.setString(1,maintenance.getEquipment_id());
						preparedStatement.setString(2,maintenance.getEquipment_name());
						preparedStatement.setString(3,maintenance.getEquipment_model());
						preparedStatement.setString(4,maintenance.getSerial_number());
						preparedStatement.setString(5,maintenance.getDate_acquired());
						preparedStatement.setString(6,maintenance.getEquipment_status());
						preparedStatement.setString(7,maintenance.getFrequency_maintenance_weekly());
						preparedStatement.setString(8,maintenance.getFrequency_maintenance_monthly());
						preparedStatement.setString(9,maintenance.getFrequency_maintenance_quarterly());
						preparedStatement.setString(10,maintenance.getFrequency_maintenance_semiannually());
						preparedStatement.setString(11,maintenance.getFrequency_maintenance_annually());
						preparedStatement.setString(12,maintenance.getCalibration());
						preparedStatement.execute();
						PreparedStatement preparedStatement1=con.prepareStatement("insert into tbl_maintenancechild(equipmentid,type_of_maintenance,frequency_maintenance_list,reference1,instructions,instructionattach,due_date,completion_date,completed_by,notes)values(?,?,?,?,?,?,?,?,?,?)");
			
						preparedStatement1.setString(1,maintenance.getEquipmentid());
						preparedStatement1.setString(2,maintenance.getType_of_maintenance());
						preparedStatement1.setString(3,maintenance.getFrequency_maintenance_list());
						preparedStatement1.setString(4,maintenance.getReference1());
						preparedStatement1.setString(5,maintenance.getInstructions());
						preparedStatement1.setString(6,maintenance.getInstructionattach());
						preparedStatement1.setString(7,maintenance.getDue_date());
						preparedStatement1.setString(8,maintenance.getCompletion_date());
						preparedStatement1.setString(9,maintenance.getCompleted_by());
						preparedStatement1.setString(10,maintenance.getNotes());
						preparedStatement1.execute();
						System.out.println("inserted");
			/*statement.execute(cmd_insert);
			statement.execute(cmd_insert1);*/
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
	
	//Search operation for find a particular record
	public List<Maintenance>  search_maintenance(String equipment_id,String equipment_name,int page) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		//boolean status = false;
		System.out.println("equipment_id");
		
		
		List<Maintenance> maintenance = new ArrayList<Maintenance>();

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
			if(!equipment_id.equals("") && !equipment_name.equals(""))
			{
			resultSet = statement.executeQuery("select t1.*,t2.* from tbl_maintenance as t1 join tbl_maintenancechild as t2 on t1.equipment_id=t2.equipmentid where t1.equipment_id='"+equipment_id+"' and t1.equipment_name='"+equipment_name+"' limit " + offset + ","+ limit+"");  
			}
			else if(equipment_id.equals("") && !equipment_name.equals(""))
			{
				resultSet = statement.executeQuery("select t1.*,t2.* from tbl_maintenance as t1 join tbl_maintenancechild as t2 on t1.equipment_id=t2.equipmentid where t1.equipment_name='"+equipment_name+"' limit " + offset + ","+ limit+"");
			}
			else if(!equipment_id.equals("") && equipment_name.equals(""))
			{
				resultSet = statement.executeQuery("select t1.*,t2.* from tbl_maintenance as t1 join tbl_maintenancechild as t2 on t1.equipment_id=t2.equipmentid where t1.equipment_id='"+equipment_id+"' limit " + offset + ","+ limit+"");				
			}
			else
			{
				resultSet = statement.executeQuery("select t1.*,t2.* from tbl_maintenance as t1 join tbl_maintenancechild as t2 on t1.equipment_id=t2.equipmentid where t1.equipment_id='"+equipment_id+"' or t1.equipment_name='"+equipment_name+"' limit " + offset + ","+ limit+"");
						
			}
	    	}
			else{		
			if(!equipment_id.equals("") && !equipment_name.equals(""))
			{
			resultSet = statement.executeQuery("select t1.*,t2.* from tbl_maintenance as t1 join tbl_maintenancechild as t2 on t1.equipment_id=t2.equipmentid where t1.equipment_id='"+equipment_id+"' and t1.equipment_name='"+equipment_name+"'");  
			}
			else if(equipment_id.equals("") && !equipment_name.equals(""))
			{
				resultSet = statement.executeQuery("select t1.*,t2.* from tbl_maintenance as t1 join tbl_maintenancechild as t2 on t1.equipment_id=t2.equipmentid where t1.equipment_name='"+equipment_name+"'");
			}
			else if(!equipment_id.equals("") && equipment_name.equals(""))
			{
				resultSet = statement.executeQuery("select t1.*,t2.* from tbl_maintenance as t1 join tbl_maintenancechild as t2 on t1.equipment_id=t2.equipmentid where t1.equipment_id='"+equipment_id+"'");				
			}
			else
			{
				resultSet = statement.executeQuery("select t1.*,t2.* from tbl_maintenance as t1 join tbl_maintenancechild as t2 on t1.equipment_id=t2.equipmentid where t1.equipment_id='"+equipment_id+"' or t1.equipment_name='"+equipment_name+"'");
						
			}
			}
	    	
			
			//resultSet = statement.executeQuery(cmd_select);
			while (resultSet.next()) {
				
				maintenance.add(new Maintenance(resultSet
						.getString("equipment_id"), resultSet
						.getString("equipment_name"), resultSet
						.getString("equipment_model"), resultSet
						.getString("serial_number"), resultSet
						.getString("date_acquired"), resultSet
						.getString("equipment_status"), resultSet
						.getString("frequency_maintenance_weekly"),resultSet
						.getString("frequency_maintenance_monthly"),resultSet
						.getString("frequency_maintenance_quarterly"),resultSet
						.getString("frequency_maintenance_semiannually"),resultSet
						.getString("frequency_maintenance_annually"), resultSet
						.getString("calibration"), resultSet
						.getString("equipmentid"), resultSet
						.getString("type_of_maintenance"), resultSet
						.getString("frequency_maintenance_list"), resultSet
						.getString("reference1"),resultSet
						.getString("instructions"),resultSet
						.getString("instructionattach"), resultSet
						.getString("due_date"), resultSet
						.getString("completion_date"),resultSet
						.getString("completed_by"),
						resultSet.getString("notes")));

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
		return maintenance;
	}
	public List<Maintenance>  listallequipments() {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		//boolean status = false;
		System.out.println("equipment_id");
		
		
		List<Maintenance> maintenance = new ArrayList<Maintenance>();

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		try {
			
			
				resultSet = statement.executeQuery("select t1.*,t2.* from tbl_maintenance as t1 join tbl_maintenancechild as t2 on t1.equipment_id=t2.equipmentid ");
			
			//resultSet = statement.executeQuery(cmd_select);
			while (resultSet.next()) {
				
				maintenance.add(new Maintenance(resultSet
						.getString("equipment_id"), resultSet
						.getString("equipment_name"), resultSet
						.getString("equipment_model"), resultSet
						.getString("serial_number"), resultSet
						.getString("date_acquired"), resultSet
						.getString("equipment_status"), resultSet
						.getString("frequency_maintenance_weekly"),resultSet
						.getString("frequency_maintenance_monthly"),resultSet
						.getString("frequency_maintenance_quarterly"),resultSet
						.getString("frequency_maintenance_semiannually"),resultSet
						.getString("frequency_maintenance_annually"), resultSet
						.getString("calibration"), resultSet
						.getString("equipmentid"), resultSet
						.getString("type_of_maintenance"), resultSet
						.getString("frequency_maintenance_list"), resultSet
						.getString("reference1"),resultSet
						.getString("instructions"),resultSet
						.getString("instructionattach"), resultSet
						.getString("due_date"), resultSet
						.getString("completion_date"),resultSet
						.getString("completed_by"),
						resultSet.getString("notes")));

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
		return maintenance;
	}

	public int FindMaintenance(String equipment_id,String equipment_name){
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
		List<Maintenance> maintenance = new ArrayList<Maintenance>();
	    try{
	    	if(!equipment_id.equals("") && !equipment_name.equals(""))
			{
			resultSet = statement.executeQuery("select count(*) as noofrecords from tbl_maintenance as t1 join tbl_maintenancechild as t2 on t1.equipment_id=t2.equipmentid where t1.equipment_id='"+equipment_id+"' and t1.equipment_name='"+equipment_name+"'");  
			}
			else if(equipment_id.equals("") && !equipment_name.equals(""))
			{
				resultSet = statement.executeQuery("select count(*) as noofrecords  from tbl_maintenance as t1 join tbl_maintenancechild as t2 on t1.equipment_id=t2.equipmentid where t1.equipment_name='"+equipment_name+"'");
			}
			else if(!equipment_id.equals("") && equipment_name.equals(""))
			{
				resultSet = statement.executeQuery("select count(*) as noofrecords  from tbl_maintenance as t1 join tbl_maintenancechild as t2 on t1.equipment_id=t2.equipmentid where t1.equipment_id='"+equipment_id+"'");				
			}
			else
			{
				resultSet = statement.executeQuery("select count(*) as noofrecords  from tbl_maintenance as t1 join tbl_maintenancechild as t2 on t1.equipment_id=t2.equipmentid where t1.equipment_id='"+equipment_id+"' or t1.equipment_name='"+equipment_name+"'");
						
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
		
	//Request method
	public List<Maintenance> getmaintenance() {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status = false;
		List<Maintenance> maintenance = new ArrayList<Maintenance>();

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String cmd_select = "select t1.*,t2.* from tbl_maintenance as t1 join tbl_maintenancechild as t2 on t1.equipment_id=t2.equipmentid ";
			resultSet = statement.executeQuery(cmd_select);
			while (resultSet.next()) {
				
				maintenance.add(new Maintenance(resultSet
						.getString("equipment_id"), resultSet
						.getString("equipment_name"), resultSet
						.getString("equipment_model"), resultSet
						.getString("serial_number"), resultSet
						.getString("date_acquired"), resultSet
						.getString("equipment_status"), resultSet
						.getString("frequency_maintenance_weekly"),resultSet
						.getString("frequency_maintenance_monthly"),resultSet
						.getString("frequency_maintenance_quarterly"),resultSet
						.getString("frequency_maintenance_semiannually"),resultSet
						.getString("frequency_maintenance_annually"), resultSet
						.getString("calibration"), resultSet
						.getString("equipmentid"), resultSet
						.getString("type_of_maintenance"), resultSet
						.getString("frequency_maintenance_list"), resultSet
						.getString("reference1"),resultSet
						.getString("instructions"),resultSet
						.getString("instructionattach"), resultSet
						.getString("due_date"), resultSet
						.getString("completion_date"),resultSet
						.getString("completed_by"),
						resultSet.getString("notes")));

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
		return maintenance;
	}

	//Get request method
	public List<Maintenance> getmaintenance(String equipment_id){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		List<Maintenance> maintenance = new ArrayList<Maintenance>();
	    try{
	    	String cmd_select = "select * from tbl_maintenance as t1 join tbl_maintenancechild as t2 on t1.equipment_id=t2.equipmentid where t1.equipment_id='"+equipment_id+"'";
			resultSet = statement.executeQuery(cmd_select);
			while (resultSet.next()) {
				
				maintenance.add(new Maintenance(resultSet
						.getString("equipment_id"), resultSet
						.getString("equipment_name"), resultSet
						.getString("equipment_model"), resultSet
						.getString("serial_number"), resultSet
						.getString("date_acquired"), resultSet
						.getString("equipment_status"), resultSet
						.getString("frequency_maintenance_weekly"),resultSet
						.getString("frequency_maintenance_monthly"),resultSet
						.getString("frequency_maintenance_quarterly"),resultSet
						.getString("frequency_maintenance_semiannually"),resultSet
						.getString("frequency_maintenance_annually"), resultSet
						.getString("calibration"), resultSet
						.getString("equipmentid"), resultSet
						.getString("type_of_maintenance"), resultSet
						.getString("frequency_maintenance_list"), resultSet
						.getString("reference1"),resultSet
						.getString("instructions"),resultSet
						.getString("instructionattach"), resultSet
						.getString("due_date"), resultSet
						.getString("completion_date"),resultSet
						.getString("completed_by"),
						resultSet.getString("notes")));


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
	    return maintenance;
		
	}
	
	//Edit operation
	public boolean edit_maintenance(String equipment_id) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status = false;
		List<Maintenance> maintenance = new ArrayList<Maintenance>();

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String cmd_select = "select * from tbl_maintenance as t1 join tbl_maintenancechild as t2 on t1.equipment_id=t2.equipmentid where t1.equipment_id='"+equipment_id+"'";
			resultSet = statement.executeQuery(cmd_select);
			while (resultSet.next()) {
				
				maintenance.add(new Maintenance(resultSet
						.getString("equipment_id"), resultSet
						.getString("equipment_name"), resultSet
						.getString("equipment_model"), resultSet
						.getString("serial_number"), resultSet
						.getString("date_acquired"), resultSet
						.getString("equipment_status"), resultSet
						.getString("frequency_maintenance_weekly"),resultSet
						.getString("frequency_maintenance_monthly"),resultSet
						.getString("frequency_maintenance_quarterly"),resultSet
						.getString("frequency_maintenance_semiannually"),resultSet
						.getString("frequency_maintenance_annually"), resultSet
						.getString("calibration"), resultSet
						.getString("equipmentid"), resultSet
						.getString("type_of_maintenance"), resultSet
						.getString("frequency_maintenance_list"), resultSet
						.getString("reference1"),resultSet
						.getString("instructions"),resultSet
						.getString("instructionattach"), resultSet
						.getString("due_date"), resultSet
						.getString("completion_date"),resultSet
						.getString("completed_by"),
						resultSet.getString("notes")));
				status=true;
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

	//Update Operation
	public boolean update_maintenance(Maintenance maintenance) {
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
			String updat = "update tbl_maintenance set equipment_id='"+maintenance.getEquipment_id()+"',equipment_name='"+maintenance.getEquipment_name()+"',equipment_model='"+maintenance.getEquipment_model()+"',serial_number='"+maintenance.getSerial_number()+"',date_acquired='"+maintenance.getDate_acquired()+"',equipment_status='"+maintenance.getEquipment_status()+"',frequency_maintenance_weekly='"+maintenance.getFrequency_maintenance_weekly()+"',frequency_maintenance_monthly='"+maintenance.getFrequency_maintenance_monthly()+"',frequency_maintenance_quarterly='"+maintenance.getFrequency_maintenance_quarterly()+"',frequency_maintenance_semiannually='"+maintenance.getFrequency_maintenance_semiannually()+"',frequency_maintenance_annually='"+maintenance.getFrequency_maintenance_annually()+"',calibration='"+maintenance.getCalibration()+"' where equipment_id='"+maintenance.getEquipment_id()+"'";
			System.out.println(updat);
			String cmd_update = "update tbl_maintenance set equipment_id='"+maintenance.getEquipment_id()+"',equipment_name='"+maintenance.getEquipment_name()+"',equipment_model='"+maintenance.getEquipment_model()+"',serial_number='"+maintenance.getSerial_number()+"',date_acquired='"+maintenance.getDate_acquired()+"',equipment_status='"+maintenance.getEquipment_status()+"',frequency_maintenance_weekly='"+maintenance.getFrequency_maintenance_weekly()+"',frequency_maintenance_monthly='"+maintenance.getFrequency_maintenance_monthly()+"',frequency_maintenance_quarterly='"+maintenance.getFrequency_maintenance_quarterly()+"',frequency_maintenance_semiannually='"+maintenance.getFrequency_maintenance_semiannually()+"',frequency_maintenance_annually='"+maintenance.getFrequency_maintenance_annually()+"',calibration='"+maintenance.getCalibration()+"' where equipment_id='"+maintenance.getEquipment_id()+"'";
			String cmd_update1 = "update tbl_maintenancechild set equipmentid='"+maintenance.getEquipment_id()+"',type_of_maintenance='"+maintenance.getType_of_maintenance()+"',frequency_maintenance_list='"+maintenance.getFrequency_maintenance_list()+"',reference1='"+maintenance.getReference1()+"',instructions='"+maintenance.getInstructions()+"',instructionattach='"+maintenance.getInstructionattach()+"',due_date='"+maintenance.getDue_date()+"',completion_date='"+maintenance.getCompletion_date()+"',completed_by='"+maintenance.getCompleted_by()+"',notes='"+maintenance.getNotes()+"' where equipmentid='"+maintenance.getEquipment_id()+"'";
			System.out.println(cmd_update1);																																																																																																																																																																																																																								    				
			 statement.execute(cmd_update);
			 statement.execute(cmd_update1);
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
	
	
	//Delete Operation
	public boolean delete_maintenance(String equipment_id) {
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
			String cmd_delete = "delete from tbl_maintenance where equipment_id='"+ equipment_id + "'";
			String cmd_delete1 = "delete from tbl_maintenancechild where equipmentid='"+ equipment_id + "'";
			String admin_delete = "delete from tbl_maintenancechild where equipmentid='"+equipment_id+"'";
			
			statement.execute(cmd_delete);
			statement.execute(cmd_delete1);
			statement.execute(admin_delete);
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
	
	/*//report request passing
	public List<Maintenance> getMaintenance_bytype(String type,int no_of_days)
	{
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		List<Maintenance> maintenances = new ArrayList<Maintenance>();

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		List<Maintenance> maintenance = new ArrayList<Maintenance>();
	    try{
			String cmd_select = null;

	   if(type=="maintain_for_30")
		//resultSet = statement.executeQuery("select * from tbl_maintenance where due_date between now() and DATE_ADD(NOW(), INTERVAL 30 DAY)" );
			cmd_select= "select * from tbl_maintenancechild as t1 join tbl_maintenance as t2 on t1.equipmentid=t2.equipment_id";
		   //cmd_select="select * from tbl_maintenance";

		   else if(type=="maintain_for_ndays")
			     cmd_select = "select * from tbl_maintenancechild as t1 join tbl_maintenance as t2 on t1.equipmentid=t2.equipment_id where due_date between now() and DATE_ADD(NOW(),INTERVAL 10  DAY)";
			   //cmd_select="select * from tbl_maintenancechild as t1 join tbl_maintenance as t2 on t1.equipmentid=t2.equipment_id where due_date between now() and DATE_ADD(NOW(),INTERVAL " + no_of_days + " DAY)";
			   //cmd_select= "select * from tbl_maintenancechild as t1 join tbl_maintenance as t2 on t1.equipmentid=t2.equipment_id where due_date between now() and DATE_ADD(NOW(),INTERVAL no_of_days DAY)";
	   else if(type=="past_due_maintenance")
		   cmd_select= "select * from tbl_maintenancechild as t1 join tbl_maintenance as t2 on t1.equipmentid=t2.equipment_id where due_date<now()";
		   //cmd_select= "select * from tbl_maintenance where due_date<now()";
	   else if(type=="past_due_calibration")
			cmd_select= "select * from tbl_maintenancechild as t1 join tbl_maintenance as t2 on t1.equipmentid=t2.equipment_id where due_date<now() and calibration='yes'";
	   else
			cmd_select ="select * from tbl_maintenancechild as t1 join tbl_maintenance as t2 on t1.equipmentid=t2.equipment_id where due_date between now() and DATE_ADD(NOW())";
		 
		resultSet = statement.executeQuery(cmd_select);   
	   while(resultSet.next()){
		   
			System.out.println(maintenance.add(new Maintenance(resultSet
						.getString("equipment_id"), resultSet
						.getString("equipment_name"), resultSet
						.getString("equipment_model"), resultSet
						.getString("serial_number"), resultSet
						.getString("date_acquired"), resultSet
						.getString("equipment_status"), resultSet
						.getString("frequency_maintenance"), resultSet
						.getString("calibration"), resultSet
						.getString("equipmentid"), resultSet
						.getString("type_of_maintenance"), resultSet
						.getString("maintenance_frequency"), resultSet
						.getString("reference"), resultSet
						.getString("instructions"), resultSet
						.getString("due_date"), resultSet
						.getString("completion_date"),resultSet
						.getString("completed_by"),
						resultSet.getString("notes"))));

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
	    return maintenance;
		
	}

*/
	//Report Generation
	public List<Maintenance> getMaintenance_bytype(String type,int no_of_days)
	 {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		System.out.println("no of days = "+no_of_days);
		System.out.println("type = "+type);
		  Calendar c = Calendar.getInstance();
		  Date date = c.getTime();
		  c.setTime(date);
		    System.out.println("Day of week = "+c.get(Calendar.DAY_OF_WEEK));
		    System.out.println("first day of week = "+c.getFirstDayOfWeek());
		    int i = c.get(Calendar.DAY_OF_WEEK);
		    System.out.println("value 0f i = "+i);
		    int currentDay = c.get(Calendar.DATE);
		    int currentMonth = c.get(Calendar.MONTH) + 1;
		    int currentYear = c.get(Calendar.YEAR);
		    String currentdate = currentYear+"-"+currentMonth+"-"+currentDay;
		    
		    Date start = c.getTime();
		    c.add(Calendar.DATE, +no_of_days);
		    Date end = c.getTime();
		    System.out.println(start + " - " + end);
		    int oldDay = c.get(Calendar.DATE);
		    int oldMonth = c.get(Calendar.MONTH) + 1;
		    int oldYear = c.get(Calendar.YEAR);
		    String olddate = oldYear+"-"+oldMonth+"-"+oldDay;
		    System.out.println(olddate);
		    System.out.println(currentdate);
		List<Maintenance> maintenances = new ArrayList<Maintenance>();

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String cmd_select = null;
			
			if(type=="maintain_for_30"){
			cmd_select="select * from tbl_maintenancechild as t1 join tbl_maintenance as t2 on t1.equipmentid=t2.equipment_id where t2.calibration='No' and (t1.due_date BETWEEN NOW() AND NOW()+INTERVAL 30 DAY)";
				System.out.println(cmd_select);
			}
				else if(type=="upcoming_calibration"){
					String query = "select * from tbl_maintenancechild as t1 join tbl_maintenance as t2 on t1.equipmentid=t2.equipment_id where (t2.calibration='Yes' AND t1.due_date BETWEEN '"+currentdate+"' AND '"+olddate+"')";
					System.out.println(query);
					cmd_select= "select * from tbl_maintenancechild as t1 join tbl_maintenance as t2 on t1.equipmentid=t2.equipment_id where t2.calibration='Yes' AND t1.due_date BETWEEN NOW() AND '"+olddate+"'";
				
				}
					else if(type=="maintenance_past_due")
						cmd_select="select * from tbl_maintenancechild as t1 join tbl_maintenance as t2 on t1.equipmentid=t2.equipment_id where t2.calibration='No' and t1.due_date < NOW()";
				else if(type=="calibration_past_due")
						cmd_select="select * from tbl_maintenancechild as t1 join tbl_maintenance as t2 on t1.equipmentid=t2.equipment_id where t1.due_date < NOW() and t2.calibration='Yes'";
				
			resultSet = statement.executeQuery(cmd_select);
			while (resultSet.next()) {
				System.out.println("came");
				System.out.println(maintenances.add(new Maintenance(resultSet
						.getString("equipment_id"), resultSet
						.getString("equipment_name"), resultSet
						.getString("equipment_model"), resultSet
						.getString("serial_number"), resultSet
						.getString("date_acquired"), resultSet
						.getString("equipment_status"), resultSet
						.getString("frequency_maintenance_weekly"),resultSet
						.getString("frequency_maintenance_monthly"),resultSet
						.getString("frequency_maintenance_quarterly"),resultSet
						.getString("frequency_maintenance_semiannually"),resultSet
						.getString("frequency_maintenance_annually"), resultSet
						.getString("calibration"), resultSet
						.getString("equipmentid"), resultSet
						.getString("type_of_maintenance"), resultSet
						.getString("frequency_maintenance_list"), resultSet
						.getString("reference1"),resultSet
						.getString("instructions"),resultSet
						.getString("instructionattach"), resultSet
						.getString("due_date"), resultSet
						.getString("completion_date"),resultSet
						.getString("completed_by"),
						resultSet.getString("notes"))));

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
		return maintenances;
	}

	public  List<Maintenance> getlimitedmaintenancereport(int page) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Maintenance> maintenance = new ArrayList<Maintenance>();
		  try {

			String cmd;
			int offset = 10 * (page - 1);
			int limit = 10;
					cmd="select * from tbl_maintenancechild as t1 join tbl_maintenance as t2 on t1.equipmentid=t2.equipment_id limit " + offset + ","+ limit+"" ;
				
				//	cmd = "select * from tbl_narrativereport order by pname asc limit " + offset + ","+ limit+"" ;

			resultSet = statement.executeQuery(cmd);
			while(resultSet.next()){
				maintenance.add(new Maintenance(resultSet
						.getString("equipment_id"), resultSet
						.getString("equipment_name"), resultSet
						.getString("equipment_model"), resultSet
						.getString("serial_number"), resultSet
						.getString("date_acquired"), resultSet
						.getString("equipment_status"), resultSet
						.getString("frequency_maintenance_weekly"),resultSet
						.getString("frequency_maintenance_monthly"),resultSet
						.getString("frequency_maintenance_quarterly"),resultSet
						.getString("frequency_maintenance_semiannually"),resultSet
						.getString("frequency_maintenance_annually"), resultSet
						.getString("calibration"), resultSet
						.getString("equipmentid"), resultSet
						.getString("type_of_maintenance"), resultSet
						.getString("frequency_maintenance_list"), resultSet
						.getString("reference1"),resultSet
						.getString("instructions"),resultSet
						.getString("instructionattach"), resultSet
						.getString("due_date"), resultSet
						.getString("completion_date"),resultSet
						.getString("completed_by"),
						resultSet.getString("notes")));
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
		return maintenance;

	}
	public int getnoofmaintenancereport() {
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
		List<Maintenance> maintenance = new ArrayList<Maintenance>();
		try {

			String cmd;
				cmd = "select count(*) as noofrecords from tbl_maintenancechild as t1 join tbl_maintenance as t2 on t1.equipmentid=t2.equipment_id ";
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

	/*
	 * For Mail
	 */
	public List<Maintenance> getDetailsForWeekMail()
	{
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
			
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Maintenance> maintenance = new ArrayList<Maintenance>();
		try {
			DateTimeZone zone=DateTimeZone.forID("EST");
			LocalDate date=new LocalDate(zone);
			
			
			String cmd_details;
			cmd_details = "select equipmentid,type_of_maintenance,frequency_maintenance_list,due_date,calibration from tbl_maintenancechild as t1 join tbl_maintenance as t2 on t1.equipmentid=t2.equipment_id where due_date>'"+date+"' and due_date<'"+date.plusDays(6)+"' and t2.calibration='Yes'";
			resultSet = statement.executeQuery(cmd_details);
			while (resultSet.next()) {
				maintenance.add(new Maintenance(resultSet.getString("equipmentid"),resultSet.getString("calibration"),resultSet.getString("type_of_maintenance"),resultSet.getString("frequency_maintenance_list"),resultSet.getString("due_date")));
			}

		} catch (Exception e) {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		} finally {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		return maintenance;
	}
	
	
	/*
	 * For Monthly Mail
	 */
	public List<Maintenance> getDetailsForMonthlyMail()
	{
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
			
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Maintenance> maintenance = new ArrayList<Maintenance>();
		try {
			DateTimeZone zone=DateTimeZone.forID("EST");
			LocalDate date=new LocalDate(zone);
			
			String dateMonth=date.getYear()+"-"+date.getMonthOfYear()+"-%";
			
			String cmd_details;
			cmd_details = "select equipmentid,type_of_maintenance,frequency_maintenance_list,due_date,calibration from tbl_maintenancechild as t1 join tbl_maintenance as t2 on t1.equipmentid=t2.equipment_id where due_date like '"+dateMonth+"' and t2.calibration='Yes'";
			resultSet = statement.executeQuery(cmd_details);
			while (resultSet.next()) {
				maintenance.add(new Maintenance(resultSet.getString("equipmentid"),resultSet.getString("calibration"),resultSet.getString("type_of_maintenance"),resultSet.getString("frequency_maintenance_list"),resultSet.getString("due_date")));
			}

		} catch (Exception e) {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		} finally {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		return maintenance;
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
		