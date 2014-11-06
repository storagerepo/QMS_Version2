package qms.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import qms.controllers.AbstractITextPdfView;
import qms.model.CustomerFeedback;
import qms.model.DocumentMain;
import qms.model.Employee;
import qms.model.InternalAudit_Finding;


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

import qms.model.Employee;



public class EmployeeDAO extends AbstractITextPdfView{
	private DataSource dataSource;
	 
	
	public DataSource getDataSource() {
		return dataSource;
	}


	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
			
		/**
		 * Excel Sheet Generation
		 */
		
	protected void buildPdfDocument(Map<String, Object> model, Document doc,
			PdfWriter writer, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
				 @SuppressWarnings("unchecked")
			List<Employee> employees = (List<Employee>) model.get("employees");
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
				
				if(field.equals("employee_id"))
				{
					width[i] = 1.0f;
					 i++;
					 table.addCell(createLabelCell("ID"));
					
				}
				else if(field.equals("name"))	
				{
					width[i] = 1.0f;
					 i++;
					 table.addCell(createLabelCell("Name"));
					
				}
				else if(field.equals("job_title"))	
				{
					width[i] = 1.0f;
					 i++;
					 table.addCell(createLabelCell("Job Title"));
				
				}
				else if(field.equals("date_hired"))	
				{
					width[i] = 1.0f;
					 i++;
					 table.addCell(createLabelCell("Date Hired"));
				}
					
				else if(field.equals("attachments"))	
				{
					width[i] = 1.0f;
					 i++;
					 table.addCell(createLabelCell("Attachments"));
					
				}
				
				else if(field.equals("list_of_functions_needes"))
				{
					width[i] = 1.0f;
					 i++;
					 table.addCell(createLabelCell("List Of Function Needes"));
					
				}
				else if(field.equals("qualified_by"))
				{
					width[i] = 1.0f;
					 i++;
					 table.addCell(createLabelCell("Qualified By"));
					
				}
				else if(field.equals("type_of_training"))	
				{
					width[i] = 1.0f;
					 i++;
					 table.addCell(createLabelCell("Type of Training"));
				
				}else if(field.equals("trainer"))	
				{
					width[i] = 1.0f;
					 i++;
					 table.addCell(createLabelCell("Trainer"));
				
				}else if(field.equals("training_due_date"))	
				{
					width[i] = 1.0f;
					 i++;
					 table.addCell(createLabelCell("Training Due Date"));
					
				}else if(field.equals("training_completion_date"))
				{
					width[i] = 1.0f;
					 i++;
					 table.addCell(createLabelCell("Training Completion Date"));
					
				}else if(field.equals("training_effectiveness_review_due_date"))	
				{
					width[i] = 1.0f;
					 i++;
					 table.addCell(createLabelCell("Training Effectiveness Review Due Date"));
				
				}else if(field.equals("training_effectiveness_notes"))	
				{
					width[i] = 1.0f;
					 i++;
					 table.addCell(createLabelCell("Effectiveness Notes"));
					
				}		
			}
		
		
		
		
		//End
		
		
	int j=1;
			for (Employee employee:employees){	
				String sno = String.valueOf(j);
				table.addCell(createValueCell(sno));
				j++;
					for (String field : fields) {
						
						if(field.equals("employee_id"))
						{
							table.addCell(createValueCell(
									employee.getEmployee_id()));
							
						}
						else if(field.equals("name"))
						{
							table.addCell(createValueCell(
									employee.getName()));

							
						}
						else if(field.equals("job_title"))
						{
							table.addCell(createValueCell(
									employee.getJob_title())
									);
						}
						else if(field.equals("date_hired"))	
						{
							table.addCell(createValueCell(
									employee.getDate_hired()));
							
						}else if(field.equals("attachment_name"))	
						{
							table.addCell(createValueCell(
									employee.getAttachment_name()));
						
						}else if(field.equals("attachment_type"))	
						{
							table.addCell(createValueCell(
									employee.getAttachment_type()));
							
						}else if(field.equals("attachment_referrence"))	
						{
							table.addCell(createValueCell(
									employee.getAttachment_referrence()));
							
						}
						else if(field.equals("process"))	
						{
							table.addCell(createValueCell(
									employee.getProcess()));
							
						}
						else if(field.equals("process_name"))	
						{
							table.addCell(createValueCell(
									employee.getProcess_name()));
						
						}
						else if(field.equals("doc_control"))	
						{
							table.addCell(createValueCell(
									employee.getDoc_control()));
							
						}
						else if(field.equals("management_rep"))	
						{
							table.addCell(createValueCell(
									employee.getManagement_rep()));
						
						}
						
						else if(field.equals("list_of_functions_needes"))	
						{
							table.addCell(createValueCell(
									employee.getList_of_functions_needes()));
							
						}else if(field.equals("documented_in"))
						{
							table.addCell(createValueCell(
									employee.getDocumented_in()));
						
						}else if(field.equals("qualified_by"))	
						{
							table.addCell(createValueCell(
									employee.getQualified_by()));
						
						}else if(field.equals("type_of_training"))	
						{
							table.addCell(createValueCell(
									employee.getType_of_training()));
						
						}else if(field.equals("trainer"))	
						{
							table.addCell(createValueCell(
									employee.getTrainer()));
					
						}else if(field.equals("training_due_date"))	
						{
							table.addCell(createValueCell(
									employee.getTraining_due_date()));
							
						}else if(field.equals("training_completion_date"))	
						{
							table.addCell(createValueCell(
									employee.getTraining_completion_date()));
						
						}else if(field.equals("training_effectiveness_review_due_date"))	
						{
							table.addCell(createValueCell(
									employee.getTraining_effectiveness_review_due_date()));
						
						}else if(field.equals("training_effectiveness_notes"))	
						{
							table.addCell(createValueCell(
									employee.getTraining_effectiveness_notes()));
							
						}	
					}					
					
			}
			table.setWidths(width);
			
			doc.add(table);
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
	
	
	public boolean delete_employee(String employee_id){
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
			  String cmd_delete1="delete from tbl_employee where employee_id='"+employee_id+"'";
			  String cmd_delete2="delete from tbl_employee_desc where employee_id='"+employee_id+"'";
				 
			  status=statement.execute(cmd_delete1);
			  status=statement.execute(cmd_delete2);
			
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
	
	public List<Employee> getEmployeess_byid(String employee_id){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Employee> employees = new ArrayList<Employee>();
	    try{
			resultSet = statement.executeQuery("select * from tbl_employee as t1 join tbl_employee_desc as t2 on t1.employee_id=t2.employee_id where t1.employee_id='"+employee_id+"'");
			while(resultSet.next())
			{
				System.out.println("count");
				employees.add(new Employee(resultSet.getString("employee_id"),resultSet.getString("name"), resultSet.getString("job_title"), resultSet.getString("date_hired"), resultSet.getString("attachment_name"),resultSet.getString("attachment_type"),resultSet.getString("attachment_referrence"), resultSet.getString("process"), resultSet.getString("process_name"), resultSet.getString("doc_control"), resultSet.getString("management_rep"), resultSet.getString("list_of_functions_needes"),resultSet.getString("documented_in"), resultSet.getString("qualified_by"),resultSet.getString("type_of_training"),resultSet.getString("trainer"), resultSet.getString("training_due_date"),resultSet.getString("training_completion_date"),resultSet.getString("training_effectiveness_review_due_date"),
						resultSet.getString("training_effectiveness_notes"),resultSet.getString("management"),resultSet.getString("process_owner"),resultSet.getString("document_control")));
				//				employees.add(new Employee(resultSet.getString("employee_id"),resultSet.getString("name"), resultSet.getString("job_title"), resultSet.getString("date_hired"), resultSet.getString("attachments"), resultSet.getString("list_of_functions_needes"),resultSet.getString("documented_in"), resultSet.getString("qualified_by"),resultSet.getString("type_of_training"),resultSet.getString("trainer"), resultSet.getString("training_due_date"),resultSet.getString("training_completion_date"),resultSet.getString("training_effectiveness_review_due_date"),resultSet.getString("training_effectiveness_notes")));
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
	    return employees;
		
	}
	
	//get employee job title using emaployee name
	public List<Employee> getEmployeeJob_byname(String name){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Employee> employees = new ArrayList<Employee>();
	    try{
			resultSet = statement.executeQuery("select * from tbl_employee as t1 join tbl_employee_desc as t2 on t1.employee_id=t2.employee_id where t1.name='"+name+"'");
			while(resultSet.next())
			{
				System.out.println("count");
				employees.add(new Employee(resultSet.getString("employee_id"),resultSet.getString("name"), resultSet.getString("job_title"), resultSet.getString("date_hired"), resultSet.getString("attachment_name"),resultSet.getString("attachment_type"),resultSet.getString("attachment_referrence"), resultSet.getString("process"), resultSet.getString("process_name"), resultSet.getString("doc_control"), resultSet.getString("management_rep"), resultSet.getString("list_of_functions_needes"),resultSet.getString("documented_in"), resultSet.getString("qualified_by"),resultSet.getString("type_of_training"),resultSet.getString("trainer"), resultSet.getString("training_due_date"),resultSet.getString("training_completion_date"),resultSet.getString("training_effectiveness_review_due_date"),
						resultSet.getString("training_effectiveness_notes"),resultSet.getString("management"),resultSet.getString("process_owner"),resultSet.getString("document_control")));
				//				employees.add(new Employee(resultSet.getString("employee_id"),resultSet.getString("name"), resultSet.getString("job_title"), resultSet.getString("date_hired"), resultSet.getString("attachments"), resultSet.getString("list_of_functions_needes"),resultSet.getString("documented_in"), resultSet.getString("qualified_by"),resultSet.getString("type_of_training"),resultSet.getString("trainer"), resultSet.getString("training_due_date"),resultSet.getString("training_completion_date"),resultSet.getString("training_effectiveness_review_due_date"),resultSet.getString("training_effectiveness_notes")));
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
	    return employees;
		
	}
	
	//check employee name already exist or not
	public boolean getNameExit(String name,String id) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status = false;
		List<Employee> documentTypes = new ArrayList<Employee>();

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String cmd_select = "select * from tbl_employee as t1 join tbl_employee_desc as t2 on t1.employee_id=t2.employee_id where t1.employee_id !='"+id+"' and t1.name='"+name+"'";
			System.out.println(cmd_select);
			resultSet = statement.executeQuery(cmd_select);
			while (resultSet.next()) {
				
				documentTypes.add(new Employee(resultSet.getString("employee_id"),resultSet.getString("name"), resultSet.getString("job_title"), resultSet.getString("date_hired"), resultSet.getString("attachment_name"),resultSet.getString("attachment_type"),resultSet.getString("attachment_referrence"), resultSet.getString("process"), resultSet.getString("process_name"), resultSet.getString("doc_control"), resultSet.getString("management_rep"), resultSet.getString("list_of_functions_needes"),resultSet.getString("documented_in"), resultSet.getString("qualified_by"),resultSet.getString("type_of_training"),resultSet.getString("trainer"), resultSet.getString("training_due_date"),resultSet.getString("training_completion_date"),resultSet.getString("training_effectiveness_review_due_date"),
						resultSet.getString("training_effectiveness_notes"),resultSet.getString("management"),resultSet.getString("process_owner"),resultSet.getString("document_control")));
				
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
	public List<Employee> edit_employee(String employee_id) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		List<Employee> employees = new ArrayList<Employee>();

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			resultSet = statement.executeQuery
			("select * from tbl_employee as t1 join tbl_employee_desc as t2 on t1.employee_id=t2.employee_id where t1.employee_id='"+employee_id+"'");
			//("select * from tbl_employee where employee_id='"+employee_id+"'");
			while (resultSet.next()) {

				employees.add(new Employee(resultSet.getString("employee_id"),resultSet.getString("name"), resultSet.getString("job_title"), resultSet.getString("date_hired"), resultSet.getString("attachment_name"),resultSet.getString("attachment_type"),resultSet.getString("attachment_referrence"), resultSet.getString("process"), resultSet.getString("process_name"), resultSet.getString("doc_control"), resultSet.getString("management_rep"), resultSet.getString("list_of_functions_needes"),resultSet.getString("documented_in"), resultSet.getString("qualified_by"),resultSet.getString("type_of_training"),resultSet.getString("trainer"), resultSet.getString("training_due_date"),resultSet.getString("training_completion_date"),resultSet.getString("training_effectiveness_review_due_date"),resultSet.getString("training_effectiveness_notes"),resultSet.getString("management"),resultSet.getString("process_owner"),resultSet.getString("document_control")));			
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
		return employees;
	}

	
	public boolean update_employee(Employee employee)
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
			  String attachment_name ="";
			  String attachment_type="",attachment_reference="";
			 
			 if(employee.getAttachment_name() == null || employee.getAttachment_type() == null || employee.getAttachment_referrence() == null)
			 {
				 resultSet=statement.executeQuery("select attachment_name,attachment_type,attachment_referrence from tbl_employee  where employee_id='"+employee.getEmployee_id()+"'");
			  while(resultSet.next())
			  {
				  attachment_name=resultSet.getString("attachment_name");
				  attachment_type=resultSet.getString("attachment_type");
				   attachment_reference= resultSet.getString("attachment_referrence");
			  }
			  
			  String cmd_update1="update tbl_employee set name='"+employee.getName()+"',job_title='"+employee.getJob_title()+"',date_hired='"+employee.getDate_hired()+"',attachment_name='"+attachment_name+"', attachment_type='"+attachment_type+"', attachment_referrence='"+attachment_reference+"',process='"+employee.getProcess()+"',process_name='"+employee.getProcess_name()+"',doc_control='"+employee.getDoc_control()+"',management_rep='"+employee.getManagement_rep()+"',management='"+employee.getManagement()+"',process_owner='"+employee.getProcess_owner()+"',document_control='"+employee.getDocument_control()+"' where employee_id='"+employee.getEmployee_id()+"'";
			  System.out.println("query problem");
			  String cmd_update2="update tbl_employee_desc set list_of_functions_needes='"+employee.getList_of_functions_needes()+"',documented_in='"+employee.getDocumented_in()+"',qualified_by='"+employee.getQualified_by()+"',type_of_training='"+employee.getType_of_training()+"',trainer='"+employee.getTrainer()+"',training_due_date='"+employee.getTraining_due_date()+"',training_completion_date='"+employee.getTraining_completion_date()+"',training_effectiveness_review_due_date='"+employee.getTraining_effectiveness_review_due_date()+"',training_effectiveness_notes='"+employee.getTraining_effectiveness_notes()+"' where employee_id='"+employee.getEmployee_id()+"'";
			System.out.println("query problem2");
			  statement.execute(cmd_update1);
			statement.execute(cmd_update2);
			status = true;
		  }
			 else{
				 String cmd_update1="update tbl_employee set name='"+employee.getName()+"',job_title='"+employee.getJob_title()+"',date_hired='"+employee.getDate_hired()+"',attachment_name='"+employee.getAttachment_name()+"', attachment_type='"+employee.getAttachment_type()+"', attachment_referrence='"+employee.getAttachment_referrence()+"',process='"+employee.getProcess()+"',process_name='"+employee.getProcess_name()+"',doc_control='"+employee.getDoc_control()+"',management_rep='"+employee.getManagement_rep()+"',management='"+employee.getManagement()+"',process_owner='"+employee.getProcess_owner()+"',document_control='"+employee.getDocument_control()+"' where employee_id='"+employee.getEmployee_id()+"' where employee_id='"+employee.getEmployee_id()+"'";
				  System.out.println("query problem");
				  String cmd_update2="update tbl_employee_desc set list_of_functions_needes='"+employee.getList_of_functions_needes()+"',documented_in='"+employee.getDocumented_in()+"',qualified_by='"+employee.getQualified_by()+"',type_of_training='"+employee.getType_of_training()+"',trainer='"+employee.getTrainer()+"',training_due_date='"+employee.getTraining_due_date()+"',training_completion_date='"+employee.getTraining_completion_date()+"',training_effectiveness_review_due_date='"+employee.getTraining_effectiveness_review_due_date()+"',training_effectiveness_notes='"+employee.getTraining_effectiveness_notes()+"' where employee_id='"+employee.getEmployee_id()+"'";
				System.out.println("query problem2");
				  statement.execute(cmd_update1);
				statement.execute(cmd_update2);
				status = true;
			 }
			 }
			 catch(Exception e){
	    	System.out.println("update error"+e.toString());
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
	
	
	public boolean insert_employee(Employee employee)
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
			 // String cmd_insert1="insert into tbl_employee(employee_id,name,job_title,date_hired,attachments,process,process_name,doc_control,management_rep) values('"+employee.getEmployee_id()+"','"+employee.getName()+"','"+employee.getJob_title()+"','"+employee.getDate_hired()+"','"+employee.getAttachments()+"','"+employee.getProcess()+"','"+employee.getProcess_name()+"','"+employee.getDoc_control()+"','"+employee.getManagement_rep()+"')";
			  String cmd_insert1="insert into tbl_employee(employee_id,name,job_title,date_hired,attachment_name,attachment_type,attachment_referrence,process,process_name,doc_control,management_rep,management,process_owner,document_control) values('"+employee.getEmployee_id()+"','"+employee.getName()+"','"+employee.getJob_title()+"','"+employee.getDate_hired()+"','"+employee.getAttachment_name()+"','"+employee.getAttachment_type()+"','"+employee.getAttachment_referrence()+"','"+employee.getProcess()+"','"+employee.getProcess_name()+"','"+employee.getDoc_control()+"','"+employee.getManagement_rep()+"','"+employee.getManagement()+"','"+employee.getProcess_owner()+"',+'"+employee.getDocument_control()+"')";
			  String cmd_insert2="insert into tbl_employee_desc(employee_id,list_of_functions_needes,documented_in,qualified_by,type_of_training,trainer,training_due_date,training_completion_date,training_effectiveness_review_due_date,training_effectiveness_notes) values('"+employee.getEmployee_id()+"','"+employee.getList_of_functions_needes()+"','"+employee.getDocumented_in()+"','"+employee.getQualified_by()+"','"+employee.getType_of_training()+"','"+employee.getTrainer()+"','"+employee.getTraining_due_date()+"','"+employee.getTraining_completion_date()+"','"+employee.getTraining_effectiveness_review_due_date()+"','"+employee.getTraining_effectiveness_notes()+"')";
			  statement.execute(cmd_insert1);
			  statement.execute(cmd_insert2);
			  
			/*  if(employee.getProcess().equals("yes"))
			  {
				  String cmd_insert_process="insert into tbl_process(process_id,process_name,process_owner) values('"+employee.getProcess()+"','"+employee.getProcess_name()+"','"+employee.getName()+"')";
				  statement.execute(cmd_insert_process);
			  }
			  */
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
	
	public List<Employee> getParticular_Employee(String employee_id){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Employee> employees = new ArrayList<Employee>();
	    try{
			resultSet = statement.executeQuery("select * from tbl_employee as t1 join tbl_employee_desc as t2 on t1.employee_id = '"+employee_id+"' and t2.employee_id = '"+employee_id+"'");
			//System.out.println("came");
			while(resultSet.next()){
				employees.add(new Employee(resultSet.getString("employee_id"),resultSet.getString("name"), resultSet.getString("job_title"), resultSet.getString("date_hired"), resultSet.getString("attachment_name"),resultSet.getString("attachment_type"),resultSet.getString("attachment_referrence"), resultSet.getString("process"), resultSet.getString("process_name"), resultSet.getString("doc_control"), resultSet.getString("management_rep"), resultSet.getString("list_of_functions_needes"),resultSet.getString("documented_in"), resultSet.getString("qualified_by"),resultSet.getString("type_of_training"),resultSet.getString("trainer"), resultSet.getString("training_due_date"),resultSet.getString("training_completion_date"),resultSet.getString("training_effectiveness_review_due_date"),resultSet.getString("training_effectiveness_notes"),resultSet.getString("management"),resultSet.getString("process_owner"),resultSet.getString("document_control")));
				
				
			
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
	    return employees;
		
	}
	public List<Employee> filterEmployees(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Employee> employees = new ArrayList<Employee>();
	    try{
	    	String cmd="select * from tbl_employee as t1 join tbl_employee_desc as t2 on t1.employee_id=t2.employee_id where t1.name like '%'";
			resultSet = statement.executeQuery(cmd);
			System.out.println(cmd);
			//System.out.println("came");
			while(resultSet.next()){
				System.out.println("count");
			//	employees.add(new Employee(resultSet.getString("employee_id"),resultSet.getString("name"), resultSet.getString("job_title"), resultSet.getString("date_hired"), resultSet.getString("attachments"), resultSet.getString("list_of_functions_needes"),resultSet.getString("documented_in"), resultSet.getString("qualified_by"),resultSet.getString("type_of_training"),resultSet.getString("trainer"), resultSet.getString("training_due_date"),resultSet.getString("training_completion_date"),resultSet.getString("training_effectiveness_review_due_date"),resultSet.getString("training_effectiveness_notes")));
				employees.add(new Employee(resultSet.getString("employee_id"),resultSet.getString("name"), resultSet.getString("job_title"), resultSet.getString("date_hired"), resultSet.getString("attachment_name"),resultSet.getString("attachment_type"),resultSet.getString("attachment_referrence"), resultSet.getString("process"), resultSet.getString("process_name"), resultSet.getString("doc_control"), resultSet.getString("management_rep"), resultSet.getString("list_of_functions_needes"),resultSet.getString("documented_in"), resultSet.getString("qualified_by"),resultSet.getString("type_of_training"),resultSet.getString("trainer"), resultSet.getString("training_due_date"),resultSet.getString("training_completion_date"),resultSet.getString("training_effectiveness_review_due_date"),resultSet.getString("training_effectiveness_notes"),resultSet.getString("management"),resultSet.getString("process_owner"),resultSet.getString("document_control")));
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
	    return employees;
		
	}
	public List<Employee> filterEmployees(String letter){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Employee> employees = new ArrayList<Employee>();
	    try{

	    	String cmd="select * from tbl_employee as t1 join tbl_employee_desc as t2 on t1.employee_id=t2.employee_id where t1.name  REGEXP '^["+letter+"]'";
	    	//String cmd1="select * from tbl_employee as t1 join tbl_employee_desc as t2 on t1.employee_id=t2.employee_id where t1.process_owner like '"+letter+"%'";
			resultSet = statement.executeQuery(cmd);
			System.out.println(cmd);
			//System.out.println("came");
			while(resultSet.next()){
				System.out.println("count");
			//	employees.add(new Employee(resultSet.getString("employee_id"),resultSet.getString("name"), resultSet.getString("job_title"), resultSet.getString("date_hired"), resultSet.getString("attachments"), resultSet.getString("list_of_functions_needes"),resultSet.getString("documented_in"), resultSet.getString("qualified_by"),resultSet.getString("type_of_training"),resultSet.getString("trainer"), resultSet.getString("training_due_date"),resultSet.getString("training_completion_date"),resultSet.getString("training_effectiveness_review_due_date"),resultSet.getString("training_effectiveness_notes")));
				employees.add(new Employee(resultSet.getString("employee_id"),resultSet.getString("name"), resultSet.getString("job_title"), resultSet.getString("date_hired"), resultSet.getString("attachment_name"),resultSet.getString("attachment_type"),resultSet.getString("attachment_referrence"), resultSet.getString("process"), resultSet.getString("process_name"), resultSet.getString("doc_control"), resultSet.getString("management_rep"), resultSet.getString("list_of_functions_needes"),resultSet.getString("documented_in"), resultSet.getString("qualified_by"),resultSet.getString("type_of_training"),resultSet.getString("trainer"), resultSet.getString("training_due_date"),resultSet.getString("training_completion_date"),resultSet.getString("training_effectiveness_review_due_date"),resultSet.getString("training_effectiveness_notes"),resultSet.getString("management"),resultSet.getString("process_owner"),resultSet.getString("document_control")));
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
	    return employees;
		
	}
	public List<Employee> filterProcessOwner(String letter){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Employee> employees = new ArrayList<Employee>();
	    try{
	    	
	    	String cmd="select * from tbl_employee as t1 join tbl_employee_desc as t2 on t1.employee_id=t2.employee_id where t1.name REGEXP '^["+letter+"]' and t1.process_owner like 'yes'";
			resultSet = statement.executeQuery(cmd);
			System.out.println(cmd);
			//System.out.println("came");
			while(resultSet.next()){
				System.out.println("count");
			//	employees.add(new Employee(resultSet.getString("employee_id"),resultSet.getString("name"), resultSet.getString("job_title"), resultSet.getString("date_hired"), resultSet.getString("attachments"), resultSet.getString("list_of_functions_needes"),resultSet.getString("documented_in"), resultSet.getString("qualified_by"),resultSet.getString("type_of_training"),resultSet.getString("trainer"), resultSet.getString("training_due_date"),resultSet.getString("training_completion_date"),resultSet.getString("training_effectiveness_review_due_date"),resultSet.getString("training_effectiveness_notes")));
				employees.add(new Employee(resultSet.getString("employee_id"),resultSet.getString("name"), resultSet.getString("job_title"), resultSet.getString("date_hired"), resultSet.getString("attachment_name"),resultSet.getString("attachment_type"),resultSet.getString("attachment_referrence"), resultSet.getString("process"), resultSet.getString("process_name"), resultSet.getString("doc_control"), resultSet.getString("management_rep"), resultSet.getString("list_of_functions_needes"),resultSet.getString("documented_in"), resultSet.getString("qualified_by"),resultSet.getString("type_of_training"),resultSet.getString("trainer"), resultSet.getString("training_due_date"),resultSet.getString("training_completion_date"),resultSet.getString("training_effectiveness_review_due_date"),resultSet.getString("training_effectiveness_notes"),resultSet.getString("management"),resultSet.getString("process_owner"),resultSet.getString("document_control")));
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
	    return employees;
		
	}	
	
	public List<Employee> getEmployees(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Employee> employees = new ArrayList<Employee>();
	    try{
			resultSet = statement.executeQuery("select * from tbl_employee as t1 join tbl_employee_desc as t2 on t1.employee_id=t2.employee_id;");
			//System.out.println("came");
			while(resultSet.next()){
				System.out.println("count");
//				employees.add(new Employee(resultSet.getString("employee_id"),resultSet.getString("name"), resultSet.getString("job_title"), resultSet.getString("date_hired"), resultSet.getString("attachments"), resultSet.getString("list_of_functions_needes"),resultSet.getString("documented_in"), resultSet.getString("qualified_by"),resultSet.getString("type_of_training"),resultSet.getString("trainer"), resultSet.getString("training_due_date"),resultSet.getString("training_completion_date"),resultSet.getString("training_effectiveness_review_due_date"),resultSet.getString("training_effectiveness_notes")));
				employees.add(new Employee(resultSet.getString("employee_id"),resultSet.getString("name"), resultSet.getString("job_title"), resultSet.getString("date_hired"), resultSet.getString("attachment_name"),resultSet.getString("attachment_type"),resultSet.getString("attachment_referrence"), resultSet.getString("process"), resultSet.getString("process_name"), resultSet.getString("doc_control"), resultSet.getString("management_rep"), resultSet.getString("list_of_functions_needes"),resultSet.getString("documented_in"), resultSet.getString("qualified_by"),resultSet.getString("type_of_training"),resultSet.getString("trainer"), resultSet.getString("training_due_date"),resultSet.getString("training_completion_date"),resultSet.getString("training_effectiveness_review_due_date"),resultSet.getString("training_effectiveness_notes"),resultSet.getString("management"),resultSet.getString("process_owner"),resultSet.getString("document_control")));
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
	    return employees;
		
	}
	
	
	public List<Employee> getEmployees_by_doc_control(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Employee> employees = new ArrayList<Employee>();
	    try{
			resultSet = statement.executeQuery("select * from tbl_employee as t1 join tbl_employee_desc as t2 on t1.employee_id=t2.employee_id where t1.doc_control='yes';");
			//System.out.println("came");
			while(resultSet.next()){
				System.out.println("doc_employee");
			//	employees.add(new Employee(resultSet.getString("employee_id"),resultSet.getString("name"), resultSet.getString("job_title"), resultSet.getString("date_hired"), resultSet.getString("attachments"), resultSet.getString("list_of_functions_needes"),resultSet.getString("documented_in"), resultSet.getString("qualified_by"),resultSet.getString("type_of_training"),resultSet.getString("trainer"), resultSet.getString("training_due_date"),resultSet.getString("training_completion_date"),resultSet.getString("training_effectiveness_review_due_date"),resultSet.getString("training_effectiveness_notes")));
				employees.add(new Employee(resultSet.getString("employee_id"),resultSet.getString("name"), resultSet.getString("job_title"), resultSet.getString("date_hired"), resultSet.getString("attachment_name"),resultSet.getString("attachment_type"),resultSet.getString("attachment_referrence"), resultSet.getString("process"), resultSet.getString("process_name"), resultSet.getString("doc_control"), resultSet.getString("management_rep"), resultSet.getString("list_of_functions_needes"),resultSet.getString("documented_in"), resultSet.getString("qualified_by"),resultSet.getString("type_of_training"),resultSet.getString("trainer"), resultSet.getString("training_due_date"),resultSet.getString("training_completion_date"),resultSet.getString("training_effectiveness_review_due_date"),resultSet.getString("training_effectiveness_notes"),resultSet.getString("management"),resultSet.getString("process_owner"),resultSet.getString("document_control")));
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
	    return employees;
		
	}
	public List<Employee> getEmployees_by_process_owner(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Employee> employees = new ArrayList<Employee>();
	    try{
			resultSet = statement.executeQuery("select * from tbl_employee as t1 join tbl_employee_desc as t2 on t1.employee_id=t2.employee_id where t1.process_owner='yes';");
			//System.out.println("came");
			while(resultSet.next()){
				System.out.println("doc_employee");
			//	employees.add(new Employee(resultSet.getString("employee_id"),resultSet.getString("name"), resultSet.getString("job_title"), resultSet.getString("date_hired"), resultSet.getString("attachments"), resultSet.getString("list_of_functions_needes"),resultSet.getString("documented_in"), resultSet.getString("qualified_by"),resultSet.getString("type_of_training"),resultSet.getString("trainer"), resultSet.getString("training_due_date"),resultSet.getString("training_completion_date"),resultSet.getString("training_effectiveness_review_due_date"),resultSet.getString("training_effectiveness_notes")));
				employees.add(new Employee(resultSet.getString("employee_id"),resultSet.getString("name"), resultSet.getString("job_title"), resultSet.getString("date_hired"), resultSet.getString("attachment_name"),resultSet.getString("attachment_type"),resultSet.getString("attachment_referrence"), resultSet.getString("process"), resultSet.getString("process_name"), resultSet.getString("doc_control"), resultSet.getString("management_rep"), resultSet.getString("list_of_functions_needes"),resultSet.getString("documented_in"), resultSet.getString("qualified_by"),resultSet.getString("type_of_training"),resultSet.getString("trainer"), resultSet.getString("training_due_date"),resultSet.getString("training_completion_date"),resultSet.getString("training_effectiveness_review_due_date"),resultSet.getString("training_effectiveness_notes"),resultSet.getString("management"),resultSet.getString("process_owner"),resultSet.getString("document_control")));
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
	    return employees;
	}
	public List<Employee> getEmployees_by_management_rep(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Employee> employees = new ArrayList<Employee>();
	    try{
			resultSet = statement.executeQuery("select * from tbl_employee as t1 join tbl_employee_desc as t2 on t1.employee_id=t2.employee_id where management_rep='yes';");
			//System.out.println("came");
			while(resultSet.next()){
				System.out.println("count");
				employees.add(new Employee(resultSet.getString("employee_id"),resultSet.getString("name"), resultSet.getString("job_title"), resultSet.getString("date_hired"), resultSet.getString("attachment_name"),resultSet.getString("attachment_type"),resultSet.getString("attachment_referrence"), resultSet.getString("process"), resultSet.getString("process_name"), resultSet.getString("doc_control"), resultSet.getString("management_rep"), resultSet.getString("list_of_functions_needes"),resultSet.getString("documented_in"), resultSet.getString("qualified_by"),resultSet.getString("type_of_training"),resultSet.getString("trainer"), resultSet.getString("training_due_date"),resultSet.getString("training_completion_date"),resultSet.getString("training_effectiveness_review_due_date"),resultSet.getString("training_effectiveness_notes"),resultSet.getString("management"),resultSet.getString("process_owner"),resultSet.getString("document_control")));
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
	    return employees;
		
	}
	
	public List<Employee> getEmployees_by_management(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Employee> employees = new ArrayList<Employee>();
	    try{
			resultSet = statement.executeQuery("select * from tbl_employee as t1 join tbl_employee_desc as t2 on t1.employee_id=t2.employee_id where management='yes';");
			//System.out.println("came");
			while(resultSet.next()){
				System.out.println("count");
				employees.add(new Employee(resultSet.getString("employee_id"),resultSet.getString("name"), resultSet.getString("job_title"), resultSet.getString("date_hired"), resultSet.getString("attachment_name"),resultSet.getString("attachment_type"),resultSet.getString("attachment_referrence"), resultSet.getString("process"), resultSet.getString("process_name"), resultSet.getString("doc_control"), resultSet.getString("management_rep"), resultSet.getString("list_of_functions_needes"),resultSet.getString("documented_in"), resultSet.getString("qualified_by"),resultSet.getString("type_of_training"),resultSet.getString("trainer"), resultSet.getString("training_due_date"),resultSet.getString("training_completion_date"),resultSet.getString("training_effectiveness_review_due_date"),resultSet.getString("training_effectiveness_notes"),resultSet.getString("management"),resultSet.getString("process_owner"),resultSet.getString("document_control")));
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
	    return employees;
		
	}
	//get the reported by values created on 22-june-2014(1.57pm).
	public List<String> filtermanagement(){
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
	 
	 	String cmd = "select name from tbl_employee as t1 join tbl_employee_desc as t2 on t1.employee_id=t2.employee_id where management='yes';";
	 	resultSet = statement.executeQuery(cmd);
	 
			System.out.println(cmd);
			while(resultSet.next()){
				System.out.println("count");
		
				nonConformances.add(resultSet.getString("name"));

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


	public List<Employee> getEmployee_bytype(String type){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Employee> employees = new ArrayList<Employee>();
	    try{
	    	String cmd_select="null";
	    	if(type=="trainingneeds")
	    		
						cmd_select= "select * from tbl_employee as t1 join tbl_employee_desc as t2 on t1.employee_id=t2.employee_id where t2.type_of_training='Classroom'";
			else if(type=="training_report_for_each_employee")
						cmd_select="select * from tbl_employee as t1 join tbl_employee_desc as t2 on t1.employee_id=t2.employee_id where t1.process_owner='yes'";
			else if(type=="qualification_for_each_employee")
						cmd_select="select * from tbl_employee as t1 join tbl_employee_desc as t2 on t1.employee_id=t2.employee_id where t1.process_owner='yes'";
			else if(type=="opentraining")
						cmd_select="select * from tbl_employee as t1 join tbl_employee_desc as t2 on t1.employee_id=t2.employee_id where t2.type_of_training='Hands on'";
			else if(type=="opentrainingeffectiveness")
						cmd_select="select * from tbl_employee as t1 join tbl_employee_desc as t2 on t1.employee_id=t2.employee_id where t1.process_owner='yes' and t1.document_control='yes'";
			else if(type=="past_due_training_by_trainer")
						cmd_select="select * from tbl_employee as t1 join tbl_employee_desc as t2 on t1.employee_id=t2.employee_id where t2.training_due_date < NOW()";
				resultSet = statement.executeQuery(cmd_select);
			
				
	    	
	    //	resultSet = statement.executeQuery("select * from tbl_employee as t1 join tbl_employee_desc as t2 on t1.employee_id=t2.employee_id where type_of_training='"+type+"'");
			System.out.println("came");
			while(resultSet.next()){
//				employees.add(new Employee(resultSet.getString("employee_id"),resultSet.getString("name"), resultSet.getString("job_title"), resultSet.getString("date_hired"), resultSet.getString("attachments"), resultSet.getString("list_of_functions_needes"),resultSet.getString("documented_in"), resultSet.getString("qualified_by"),resultSet.getString("type_of_training"),resultSet.getString("trainer"), resultSet.getString("training_due_date"),resultSet.getString("training_completion_date"),resultSet.getString("training_effectiveness_review_due_date"),resultSet.getString("training_effectiveness_notes")));
				employees.add(new Employee(resultSet.getString("employee_id"),resultSet.getString("name"), resultSet.getString("job_title"), resultSet.getString("date_hired"), resultSet.getString("attachment_name"),resultSet.getString("attachment_type"),resultSet.getString("attachment_referrence"), resultSet.getString("process"), resultSet.getString("process_name"), resultSet.getString("doc_control"), resultSet.getString("management_rep"), resultSet.getString("list_of_functions_needes"),resultSet.getString("documented_in"), resultSet.getString("qualified_by"),resultSet.getString("type_of_training"),resultSet.getString("trainer"), resultSet.getString("training_due_date"),resultSet.getString("training_completion_date"),resultSet.getString("training_effectiveness_review_due_date"),resultSet.getString("training_effectiveness_notes"),resultSet.getString("management"),resultSet.getString("process_owner"),resultSet.getString("document_control")));

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
	    return employees;		
	}

	public int FindEmployee(String type,String qualifiedby,String trainer){
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
		List<Employee> employees = new ArrayList<Employee>();
	    try{
	    	if(!type.equals("") && !qualifiedby.equals("") && !trainer.equals(""))
	    	{
	    		resultSet = statement.executeQuery("select count(*) as noofrecords from tbl_employee as t1 join tbl_employee_desc as t2 on t1.employee_id=t2.employee_id where t2.type_of_training='"+type+"' and t2.qualified_by='"+qualifiedby+"' and t2.trainer='"+trainer+"'");
	    	}
	    	else if(type.equals("") && !qualifiedby.equals("") && !trainer.equals(""))
	    	{
	    		resultSet = statement.executeQuery("select count(*) as noofrecords from tbl_employee as t1 join tbl_employee_desc as t2 on t1.employee_id=t2.employee_id where t2.qualified_by='"+qualifiedby+"' and t2.trainer='"+trainer+"'");
	    	}
	    	else if(!type.equals("") && !qualifiedby.equals("") && trainer.equals(""))
	    	{
	    		resultSet = statement.executeQuery("select count(*) as noofrecords from tbl_employee as t1 join tbl_employee_desc as t2 on t1.employee_id=t2.employee_id where t2.type_of_training='"+type+"' and t2.qualified_by='"+qualifiedby+"'");
	    	}
	    	else if(!type.equals("") && qualifiedby.equals("") && !trainer.equals(""))
	    	{
	    		resultSet = statement.executeQuery("select count(*) as noofrecords from tbl_employee as t1 join tbl_employee_desc as t2 on t1.employee_id=t2.employee_id where t2.type_of_training='"+type+"' and t2.trainer='"+trainer+"'");
	    	}
	    	else
	    	{
	    		resultSet = statement.executeQuery("select count(*) as noofrecords from tbl_employee as t1 join tbl_employee_desc as t2 on t1.employee_id=t2.employee_id where t2.type_of_training='"+type+"' or t2.qualified_by='"+qualifiedby+"' or t2.trainer='"+trainer+"'");
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
	

	
	public List<Employee> findemployee(String type,String qualifiedby,String trainer,int page){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Employee> employees = new ArrayList<Employee>();
	    try{

	    	if(page >= 1)
	    	{
	    	int offset = 5 * (page - 1);
			int limit = 5;
	    	
	    	if(!type.equals("") && !qualifiedby.equals("") && !trainer.equals(""))
	    	{
	    		resultSet = statement.executeQuery("select t1.*,t2.* from tbl_employee as t1 join tbl_employee_desc as t2 on t1.employee_id=t2.employee_id where t2.type_of_training='"+type+"' and t2.qualified_by='"+qualifiedby+"' and t2.trainer='"+trainer+"' limit " + offset + ","+ limit+"");
	    	}
	    	else if(type.equals("") && !qualifiedby.equals("") && !trainer.equals(""))
	    	{
	    		resultSet = statement.executeQuery("select t1.*,t2.* from tbl_employee as t1 join tbl_employee_desc as t2 on t1.employee_id=t2.employee_id where t2.qualified_by='"+qualifiedby+"' and t2.trainer='"+trainer+"' limit " + offset + ","+ limit+"");
	    	}
	    	else if(!type.equals("") && !qualifiedby.equals("") && trainer.equals(""))
	    	{
	    		resultSet = statement.executeQuery("select t1.*,t2.* from tbl_employee as t1 join tbl_employee_desc as t2 on t1.employee_id=t2.employee_id where t2.type_of_training='"+type+"' and t2.qualified_by='"+qualifiedby+"' limit " + offset + ","+ limit+"");
	    	}
	    	else if(!type.equals("") && qualifiedby.equals("") && !trainer.equals(""))
	    	{
	    		resultSet = statement.executeQuery("select t1.*,t2.* from tbl_employee as t1 join tbl_employee_desc as t2 on t1.employee_id=t2.employee_id where t2.type_of_training='"+type+"' and t2.trainer='"+trainer+"' limit " + offset + ","+ limit+"");
	    	}
	    	else
	    	{
	    		resultSet = statement.executeQuery("select t1.*,t2.* from tbl_employee as t1 join tbl_employee_desc as t2 on t1.employee_id=t2.employee_id where t2.type_of_training='"+type+"' or t2.qualified_by='"+qualifiedby+"' or t2.trainer='"+trainer+"' limit " + offset + ","+ limit+"");
	    	}
	    	}
	    	else
	    	{
	    		if(!type.equals("") && !qualifiedby.equals("") && !trainer.equals(""))
		    	{
		    		resultSet = statement.executeQuery("select t1.*,t2.* from tbl_employee as t1 join tbl_employee_desc as t2 on t1.employee_id=t2.employee_id where t2.type_of_training='"+type+"' and t2.qualified_by='"+qualifiedby+"' and t2.trainer='"+trainer+"'");
		    	}
		    	else if(type.equals("") && !qualifiedby.equals("") && !trainer.equals(""))
		    	{
		    		resultSet = statement.executeQuery("select t1.*,t2.* from tbl_employee as t1 join tbl_employee_desc as t2 on t1.employee_id=t2.employee_id where t2.qualified_by='"+qualifiedby+"' and t2.trainer='"+trainer+"'");
		    	}
		    	else if(!type.equals("") && !qualifiedby.equals("") && trainer.equals(""))
		    	{
		    		resultSet = statement.executeQuery("select t1.*,t2.* from tbl_employee as t1 join tbl_employee_desc as t2 on t1.employee_id=t2.employee_id where t2.type_of_training='"+type+"' and t2.qualified_by='"+qualifiedby+"'");
		    	}
		    	else if(!type.equals("") && qualifiedby.equals("") && !trainer.equals(""))
		    	{
		    		resultSet = statement.executeQuery("select t1.*,t2.* from tbl_employee as t1 join tbl_employee_desc as t2 on t1.employee_id=t2.employee_id where t2.type_of_training='"+type+"' and t2.trainer='"+trainer+"'");
		    	}
		    	else
		    	{
		    		resultSet = statement.executeQuery("select t1.*,t2.* from tbl_employee as t1 join tbl_employee_desc as t2 on t1.employee_id=t2.employee_id where t2.type_of_training='"+type+"' or t2.qualified_by='"+qualifiedby+"' or t2.trainer='"+trainer+"'");
		    	}
	    	}
	    		//cmd = "select * from tbl_employee_desc where type_of_training='"+type+"' or qualified_by='"+qualifiedby+"' or trainer='"+trainer+"'";
			
			
//	    	resultSet = statement.executeQuery("select * from tbl_employee as t1 join tbl_employee_desc as t2 on t1.employee_id=t2.employee_id where employee_id='"+id+"' or type_of_training='"+type+"' or qualified_by='"+qualifiedby+"'");
			//System.out.println("came");
			while(resultSet.next()){
				System.out.println("inside the search operation in database");
				employees.add(new Employee(resultSet.getString("employee_id"),resultSet.getString("name"), resultSet.getString("job_title"), resultSet.getString("date_hired"), resultSet.getString("attachment_name"),resultSet.getString("attachment_type"),resultSet.getString("attachment_referrence"), resultSet.getString("process"), resultSet.getString("process_name"), resultSet.getString("doc_control"), resultSet.getString("management_rep"), resultSet.getString("list_of_functions_needes"),resultSet.getString("documented_in"), resultSet.getString("qualified_by"),resultSet.getString("type_of_training"),resultSet.getString("trainer"), resultSet.getString("training_due_date"),resultSet.getString("training_completion_date"),resultSet.getString("training_effectiveness_review_due_date"),resultSet.getString("training_effectiveness_notes"),resultSet.getString("management"),resultSet.getString("process_owner"),resultSet.getString("document_control")));
			System.out.println("searching.....");
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
	    return employees;
		
	}
	
	public  List<Employee> getlimitedemployeereport(int page) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Employee> employees = new ArrayList<Employee>();
		try {

			String cmd;
			int offset = 5 * (page - 1);
			int limit = 5;
		//	cmd= "select * from tbl_employee as t1 join tbl_employee_desc as t2 on t1.employee_id=t2.employee_id where type_of_training='"+type+"'";
			cmd ="select * from tbl_employee as t1 join tbl_employee_desc as t2 on t1.employee_id=t2.employee_id limit " + offset + ","+ limit+"" ;
				
				//	cmd = "select * from tbl_narrativereport order by pname asc limit " + offset + ","+ limit+"" ;

			resultSet = statement.executeQuery(cmd);
			while(resultSet.next()){
				System.out.println("count");
				employees.add(new Employee(resultSet.getString("employee_id"),
						resultSet.getString("name"), 
						resultSet.getString("job_title"), 
						resultSet.getString("date_hired"), 
						resultSet.getString("attachment_name"),
						resultSet.getString("attachment_type"),
						resultSet.getString("attachment_referrence"),
						resultSet.getString("process"),
						resultSet.getString("process_name"),
						resultSet.getString("doc_control"),
						resultSet.getString("management_rep"),
						resultSet.getString("list_of_functions_needes"),
						resultSet.getString("documented_in"), 
						resultSet.getString("qualified_by"),
						resultSet.getString("type_of_training"),
						resultSet.getString("trainer"),
						resultSet.getString("training_due_date"),
						resultSet.getString("training_completion_date"),
						resultSet.getString("training_effectiveness_review_due_date"),
						resultSet.getString("training_effectiveness_notes"),resultSet.getString("management"),resultSet.getString("process_owner"),resultSet.getString("document_control")));
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
		return employees;

	}
	
	public int getnoofemployeereport() {
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
		List<Employee> employees = new ArrayList<Employee>();
		try {

			String cmd;
			
					cmd = "select count(*) as noofrecords from from tbl_employee as t1 join tbl_employee_desc as t2 on t1.employee_id=t2.employee_id ";
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
