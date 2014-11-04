package qms.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import qms.model.InstructionMaintenance;
import qms.model.Reference;

public class InstructionMaintenanceDAO {
	
	
	private DataSource dataSource;
	
	//No of Records 19-JUNE-2014
	public int getInstructionrecords(){
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
		List<InstructionMaintenance> maintenances = new ArrayList<InstructionMaintenance>();
	    try{
	    	
	    		resultSet = statement.executeQuery("select  count(*) as noofrecords from tbl_instructionmaintenace ");
	    	
	    	
	    	
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
	//Insert Attachment 20_JUNE_2014
	public boolean insert_instruction(InstructionMaintenance maintenance)
	{
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		ResultSet resultSet1 = null;
		boolean status=false;
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
				e1.printStackTrace();
		}
		  try{
			
			  
					  String cmd_insert2;	
				 cmd_insert2="insert into tbl_instructionmaintenace(attachment_name,attachment_type,attachment_referrence) values('"+maintenance.getAttachment_name()+"','"+maintenance.getAttachment_type()+"','"+maintenance.getAttachment_referrence()+"')";
				 statement.execute(cmd_insert2);
				 status=true;
			 }  
			 
		  catch(Exception e){
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
	
	//Getting list of inserted records 20-June-2014
	public List<InstructionMaintenance> getinstruction(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<InstructionMaintenance> references = new ArrayList<InstructionMaintenance>();
	    try{
			resultSet = statement.executeQuery("select * from tbl_instructionmaintenace");
			System.out.println("came");
			while(resultSet.next()){
				System.out.println("count");
				references.add(new InstructionMaintenance(resultSet.getString("auto_id"),resultSet.getString("attachment_name"),resultSet.getString("attachment_type"),resultSet.getString("attachment_referrence")));
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
	    return references;
		
	}
	
	//Getting list of values based on the auto_id 20-JUNE-2014
	public List<InstructionMaintenance> getInstruction(String id){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<InstructionMaintenance> references = new ArrayList<InstructionMaintenance>();
	    try{
	    	System.out.println("DAO frequency = "+id);
	    	String s = "select * from tbl_instructionmaintenace where auto_id='"+id+"'";
	    	System.out.println(s);
	    	
			resultSet = statement.executeQuery("select * from tbl_instructionmaintenace where auto_id='"+id+"'");
			System.out.println("came");
			while(resultSet.next()){
				System.out.println("count");
				references.add(new InstructionMaintenance(resultSet.getString("auto_id"),resultSet.getString("attachment_name"),resultSet.getString("attachment_type"),resultSet.getString("attachment_referrence")));
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
	    return references;
		
	}
	
	//Update Reference Maintenance 20-JUNE-2014
	public boolean update_Instruction(InstructionMaintenance reference,String auto_id,String admin)
	{
		System.out.println("auto number = "+auto_id);
		System.out.println(reference.getAuto_id());
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
			
			
			 String attachment_name ="";
			  String attachment_type="",attachment_reference="";
			 
			if((reference.getAttachment_name() == null) && (reference.getAttachment_type() == null )&& (reference.getAttachment_referrence() == null))
			 {
				System.out.println("all null");
				 resultSet=statement.executeQuery("select attachment_name,attachment_type,attachment_referrence from tbl_instructionmaintenace where auto_id='"+reference.getAuto_id()+"'");
			
				 while(resultSet.next())
			  {
					
				  attachment_name=resultSet.getString("attachment_name");
				  attachment_type=resultSet.getString("attachment_type");
				   attachment_reference= resultSet.getString("attachment_referrence");
				   
			  }
			 	statement.executeUpdate("update tbl_instructionmaintenace set attachment_name='"+attachment_name+"',attachment_type='"+attachment_type+"',attachment_referrence='"+attachment_reference+"' where auto_id='"+reference.getAuto_id()+"'");
					status =true;
			 } 
		 
		else {
					 String cmd_update1 = "update tbl_instructionmaintenace set attachment_name='"+reference.getAttachment_name()+"',attachment_type='"+reference.getAttachment_type()+"',attachment_referrence='"+reference.getAttachment_referrence()+"' where auto_id='"+reference.getAuto_id()+"'";
						statement.execute(cmd_update1);
					    status =true;
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
	
	//get attachment file
	public List<String> filterInstruction(String instructionfile){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<String> instructionfiles = new ArrayList<String>();
	    try{
	    	String cmd1 = "select attachment_name from tbl_instructionmaintenace where auto_id='"+instructionfile+"'";
	    	resultSet = statement.executeQuery(cmd1);
	    	System.out.println(cmd1);
	    	while(resultSet.next()){
				
	    		instructionfiles.add(resultSet.getString("attachment_name"));
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
	    return instructionfiles;
		
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
