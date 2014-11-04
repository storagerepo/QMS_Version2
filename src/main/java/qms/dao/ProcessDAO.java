package qms.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.apache.tomcat.jni.Proc;

import qms.model.DocumentMain;
import qms.model.FormPrefix;
import qms.model.ParticipantsDetails;
import qms.model.ProductIDNC;

import qms.model.Process;

public class ProcessDAO
{
	private DataSource dataSource;
	 
	
	
	public boolean insert_Process(Process process) {
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
			String cmd_insert = "insert into tbl_process(process_id,process_name,process_owner)values('"+process.getProcess_id()+"','"+process.getProcess_name()+"','"+process.getProcess_owner()+"')";
		
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
	public  List<Process> getlimitedprocessreport(int page) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Process> processes = new ArrayList<Process>();
		  try {

			String cmd;
			int offset = 5 * (page - 1);
			int limit = 5;
					cmd="select * from tbl_process where auto_id limit " + offset + ","+ limit+"" ;
				
				//	cmd = "select * from tbl_narrativereport order by pname asc limit " + offset + ","+ limit+"" ;

			resultSet = statement.executeQuery(cmd);
			while(resultSet.next()){
					processes.add(new Process(resultSet.
							getString("auto_id"),resultSet
							.getString("process_id"), resultSet
							.getString("process_name"), resultSet
							.getString("process_owner")));
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
		return processes;

	}
	
	public int getnoofprocessreport() {
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
		
		try {

			String cmd;
				cmd = "select count(*) as noofrecords from tbl_process";
			System.out.println("command"+cmd);			
			resultSet = statement.executeQuery(cmd);
			int i=0;
			if (resultSet.next())
			{
				noofRecords = resultSet.getInt("noofrecords");
				i++;
				System.out.println(i);
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
		return noofRecords;

	}
	
	//Get request method
	public List<Process> processes(String id){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		List<Process> processes = new ArrayList<Process>();
	    try{
	    	String cmd_select = "select * from tbl_process  where process_id='"+id+"'";
			resultSet = statement.executeQuery(cmd_select);
			while(resultSet.next()){
				
						processes.add(new Process(resultSet.
								getString("auto_id"),resultSet
								.getString("process_id"), resultSet
								.getString("process_name"), resultSet
								.getString("process_owner")));
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
	    return processes;
		
	}
	
	
	//Update Operation
	public boolean update_Process(Process process) {
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
			
			String cmd_update = "update tbl_process set process_name='"+process.getProcess_name()+"',process_owner='"+process.getProcess_owner()+"' where process_id='"+process.getProcess_id()+"'";
			
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
	
	public List<Process> getProcess(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Process> processes = new ArrayList<Process>();
	    try{
			resultSet = statement.executeQuery("select * from tbl_process");
			while(resultSet.next()){
				processes.add(new Process(resultSet.
						getString("auto_id"),resultSet
						.getString("process_id"), resultSet
						.getString("process_name"), resultSet
						.getString("process_owner")));
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
	    return processes;
		
	}
	public List<Process> getProcess(String process){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Process> processes = new ArrayList<Process>();
	    try{
	    	String query="";
	    	if(process.equals(""))
	    	{
	    		query="select * from tbl_process";
	    	}
	    	else
	    	{
	    		query="select * from tbl_process where process_name='"+process+"'";
	    	}
			resultSet = statement.executeQuery(query);
			while(resultSet.next()){
				processes.add(new Process(resultSet.
						getString("auto_id"),resultSet
						.getString("process_id"), resultSet
						.getString("process_name"), resultSet
						.getString("process_owner")));
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
	    return processes;
		
	}
	
	public boolean getProcessIdExit(String id,String process){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean exit =false;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Process> processes = new ArrayList<Process>();
	    try{
	    	System.out.println("select * from tbl_process where auto_id != '"+id+"' and process_id='"+process+"'");
			resultSet = statement.executeQuery("select * from tbl_process where auto_id != '"+id+"' and process_id='"+process+"'");
//			resultSet = statement.executeQuery("select * from tbl_process where auto_id !='"+id+"' and process_name='"+process_name+"'");
			while(resultSet.next()){

				processes.add(new Process(resultSet.
						getString("auto_id"),resultSet
						.getString("process_id"), resultSet
						.getString("process_name"), resultSet
						.getString("process_owner")));
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


	public boolean getProcessnameExit(String id,String process_name){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean exit =false;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Process> processes = new ArrayList<Process>();
	    try{
			resultSet = statement.executeQuery("select * from tbl_process where auto_id != '"+id+"' and process_name='"+process_name+"'");
			
			while(resultSet.next()){

				processes.add(new Process(resultSet.
						getString("auto_id"),resultSet
						.getString("process_id"), resultSet
						.getString("process_name"), resultSet
						.getString("process_owner")));
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

	
	public List<Process> getProcess_owner(String process_name){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Process> processes = new ArrayList<Process>();
	    try{
			resultSet = statement.executeQuery("select * from tbl_process where process_name='"+process_name+"'");
			while(resultSet.next()){
				processes.add(new Process(resultSet.
						getString("auto_id"),resultSet
						.getString("process_id"), resultSet
						.getString("process_name"), resultSet
						.getString("process_owner")));
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
	    return processes;
		
	}
	public boolean delete_process(String process_id){
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
			  String cmd_delete1="delete from tbl_process where process_id='"+process_id+"'";
			  System.out.println(cmd_delete1);
				 
			  status=statement.execute(cmd_delete1);
			
			
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
	
	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
}