package qms.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;


import qms.model.ChildSupplier;


public class ChildSupplierDAO {
	private DataSource dataSource;
	 
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	public String get_maxid() {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		String Max_id = "CS1001";
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {

			String cmd_select = "select max(auto_id) as auto_id from tbl_childsupplier";
			resultSet = statement.executeQuery(cmd_select);
			if (resultSet.next()) {
				if (!resultSet.getString("auto_id").equals("null"))
					Max_id = "CS"
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

	
	
	public boolean delete_childsupplier(String po){
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
			  String cmd_delete="delete from tbl_childsupplier where po='"+po+"'";
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
	
	public List<ChildSupplier> getchildsupplier_byid(String po){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<ChildSupplier> childsupplier = new ArrayList<ChildSupplier>();
	    try{
			resultSet = statement.executeQuery("select * from tbl_childsupplier where po='"+po+"'");
			while(resultSet.next()){
							childsupplier.add(new ChildSupplier(resultSet.getString("po"), resultSet.getString("receipt_date"), resultSet.getString("type_of_problem"), resultSet.getString("problem_details"), resultSet.getString("problem_found_at"), resultSet.getString("request_corrective_action"), resultSet.getString("due_date_for_corrective_action"), resultSet.getString("deduction_for_issue"), resultSet.getString("recorded_by"), resultSet.getString("recording_date")));
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
	    return childsupplier;
		
	}
	

	public boolean update_childsupplier(ChildSupplier childSupplier)
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
			  String cmd_insert="update tbl_childsupplier set receipt_date='"+childSupplier.getReceipt_date()+"',type_of_problem='"+childSupplier.getType_of_problem()+"',problem_details='"+childSupplier.getProblem_details()+"',problem_found_at ='"+childSupplier.getProblem_found_at()+"',request_corrective_action='"+childSupplier.getRequest_corrective_action()+"',due_date_for_corrective_action='"+childSupplier.getDue_date_for_corrective_action()+"',deduction_for_issue='"+childSupplier.getDeduction_for_issue()+"',recorded_by='"+childSupplier.getRecorded_by()+"',recording_date='"+childSupplier.getRecording_date()+"' where po ='"+childSupplier.getPo()+"'";
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
	
	
	public boolean insert_childsupplier(ChildSupplier childsupplier)
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
			  
			  String cmd_insert="insert into tbl_childsupplier(po,receipt_date,type_of_problem,problem_details,problem_found_at,request_corrective_action,due_date_for_corrective_action,deduction_for_issue,recorded_by,recording_date) values('"+childsupplier.getPo()+"','"+childsupplier.getReceipt_date()+"','"+childsupplier.getType_of_problem()+"','"+childsupplier.getProblem_details()+"','"+childsupplier.getProblem_found_at()+"','"+childsupplier.getRequest_corrective_action()+"','"+childsupplier.getDue_date_for_corrective_action()+"','"+childsupplier.getDeduction_for_issue()+"','"+childsupplier.getRecorded_by()+"','"+childsupplier.getRecording_date()+"')"; 
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
	
	
	
	public List<ChildSupplier> getchildsupplier(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<ChildSupplier> childsupplier = new ArrayList<ChildSupplier>();
	    try{
			resultSet = statement.executeQuery("select * from tbl_childsupplier");
			System.out.println("came");
			while(resultSet.next()){
				System.out.println("count");
				childsupplier.add(new ChildSupplier(resultSet.getString("po"), resultSet.getString("receipt_date"), resultSet.getString("type_of_problem"), resultSet.getString("problem_details"), resultSet.getString("problem_found_at"), resultSet.getString("request_corrective_action"), resultSet.getString("due_date_for_corrective_action"), resultSet.getString("deduction_for_issue"), resultSet.getString("recorded_by"), resultSet.getString("recording_date")));
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
	    return childsupplier;
		
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
			resultSet = statement.executeQuery("select * from tbl_childsupplier");
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
	
	
	
	
	
	public List<ChildSupplier> getChildSuppliers(String receiptdate,
			String recordedby, String recordingdate) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<ChildSupplier> childsupplier = new ArrayList<ChildSupplier>();
		try {
			
			String cmd="";
			
			cmd = "select * from tbl_childsupplier where receipt_date='"+ receiptdate +"' or recorded_by='"+ recordedby +"' or recording_date='"+ recordingdate +"'";
			
			resultSet = statement.executeQuery(cmd);
		while (resultSet.next()) {
				childsupplier.add(new ChildSupplier(resultSet.getString("po"), resultSet.getString("receipt_date"), resultSet.getString("type_of_problem"), resultSet.getString("problem_details"), resultSet.getString("problem_found_at"), resultSet.getString("request_corrective_action"), resultSet.getString("due_date_for_corrective_action"), resultSet.getString("deduction_for_issue"), resultSet.getString("recorded_by"), resultSet.getString("recording_date")));
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
		return childsupplier;

	}



}
