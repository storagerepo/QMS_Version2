package qms.dao;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import qms.model.HRandTraining;
import qms.model.ReportedByNC;
import qms.model.Type_of_NC;

public class ReportedByNCDAO {
private DataSource dataSource;

public DataSource getDataSource() {
	return dataSource;
}

public void setDataSource(DataSource dataSource) {
	this.dataSource = dataSource;
}

//Insert Operation created on 19-jun-2014.
public boolean insert_nc(ReportedByNC reportedByNC)
{
	Connection con = null;
	Statement statement = null;
	ResultSet resultSet = null;
	boolean status=false;
	try
	{
		con = dataSource.getConnection();
		statement = con.createStatement();
	}
	catch(Exception e1)
	{
		e1.printStackTrace();
	}
	try
	{
		String cmd_select = "insert into tbl_reportedby_nc(type_of_nc,group_person) values('"+reportedByNC.getType_of_nc()+"','"+reportedByNC.getGroup_person()+"')";
		statement.execute(cmd_select);
		status = true;
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

//Update Operation created on 19-jun14.
public boolean update_nc(ReportedByNC reportedByNC)
{
	Connection con = null;
	Statement statement = null;
	ResultSet resultSet = null;
	boolean status = false;
	try
	{
		con = dataSource.getConnection();
		statement = con.createStatement();
	}
	catch(SQLException e1)
	{
		e1.printStackTrace();
	}
	try
	{
		String cmd_select = "update tbl_reportedby_nc set type_of_nc='"+reportedByNC.getType_of_nc()+"',group_person='"+reportedByNC.getGroup_person()+"' where auto_id = '"+reportedByNC.getAuto_id()+"'";
		
		statement.execute(cmd_select);
		System.out.println("update query executed successfully"+cmd_select);
	}
	catch(Exception e)
	{
		releaseConnection(con);
		releaseStatement(statement);
		releaseResultSet(resultSet);
	}
	finally
	{
		releaseConnection(con);
		releaseStatement(statement);
		releaseResultSet(resultSet);
	}
	return status;
}
public List<ReportedByNC> getReportedByNCs(){
	Connection con = null;
	Statement statement = null;
	ResultSet resultSet = null;
	try {
		con = dataSource.getConnection();
		statement = con.createStatement();
	} catch (SQLException e1) {
		e1.printStackTrace();
	}
	List<ReportedByNC> reportedByNCs = new ArrayList<ReportedByNC>();
    try{
		resultSet = statement.executeQuery("select * from tbl_reportedby_nc");
		while(resultSet.next()){
			reportedByNCs.add(new ReportedByNC(resultSet.getInt("auto_id"),resultSet.getString("type_of_nc"),resultSet.getString("group_person")));
			
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
    return reportedByNCs;
	
}
public List<ReportedByNC> getReportedByNCs(String report){
	Connection con = null;
	Statement statement = null;
	ResultSet resultSet = null;
	try {
		con = dataSource.getConnection();
		statement = con.createStatement();
	} catch (SQLException e1) {
		e1.printStackTrace();
	}
	List<ReportedByNC> reportedByNCs = new ArrayList<ReportedByNC>();
    try{
    	String query="";
    	if(report.equals(""))
    	{
    		
    		query="select * from tbl_reportedby_nc";
    	}
    	else
    	{
    		query="select * from tbl_reportedby_nc where group_person='"+report+"'";
    	}
		resultSet = statement.executeQuery(query);
		while(resultSet.next()){
			reportedByNCs.add(new ReportedByNC(resultSet.getInt("auto_id"),resultSet.getString("type_of_nc"),resultSet.getString("group_person")));
			
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
    return reportedByNCs;
	
}
public boolean getReportedByNCsexit(String typenc,String person,int auto_id){
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
	List<ReportedByNC> reportedByNCs = new ArrayList<ReportedByNC>();
    try{
		resultSet = statement.executeQuery("select * from tbl_reportedby_nc where auto_id !='"+auto_id+"' and type_of_nc ='"+typenc+"' and group_person='"+person+"'");
		while(resultSet.next()){
			reportedByNCs.add(new ReportedByNC(resultSet.getInt("auto_id"),resultSet.getString("type_of_nc"),resultSet.getString("group_person")));
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

public  List<ReportedByNC> getlimitedNC(int page) {
	Connection con = null;
	Statement statement = null;
	ResultSet resultSet = null;
	
	
	try {
		con = dataSource.getConnection();
		statement = con.createStatement();
	} catch (SQLException e1) {
		e1.printStackTrace();
	}
	List<ReportedByNC> reportedByNCs = new ArrayList<ReportedByNC>();
	  try {

		String cmd;
		int offset = 5 * (page - 1);
		int limit = 5;
				cmd="select * from tbl_reportedby_nc where auto_id limit " + offset + ","+ limit+"" ;
		resultSet = statement.executeQuery(cmd);
		while(resultSet.next()){
		
			reportedByNCs.add(new ReportedByNC(resultSet.getInt("auto_id"),resultSet.getString("type_of_nc"),resultSet.getString("group_person")));
			
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
	return reportedByNCs;

}
public int getnoofncreport() {
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
			cmd = "select count(*) as noofrecords from tbl_reportedby_nc";
		System.out.println("command"+cmd);			
		resultSet = statement.executeQuery(cmd);
		int i =0;
		if (resultSet.next()){
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
public List<ReportedByNC> reportedByNCs(String auto_id){
	Connection con = null;
	Statement statement = null;
	ResultSet resultSet = null;
	try {
		con = dataSource.getConnection();
		statement = con.createStatement();
	} catch (SQLException e1) {
		e1.printStackTrace();
	}
	
	List<ReportedByNC> reportedByNCs = new ArrayList<ReportedByNC>();
    try{
    	String cmd_select = "select * from tbl_reportedby_nc  where auto_id='"+auto_id+"'";
		resultSet = statement.executeQuery(cmd_select);
		while(resultSet.next()){
			
			reportedByNCs.add(new ReportedByNC(resultSet.getInt("auto_id"),resultSet.getString("type_of_nc"),resultSet.getString("group_person")));
			
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
    return reportedByNCs;
	
}
public boolean delete_nc(String auto_id){
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
		  String cmd_delete1="delete from tbl_reportedby_nc where auto_id='"+auto_id+"'";
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

//Find opertion created on 20-june-14.
public List<ReportedByNC> findreportnc(String type_of_nc){
	Connection con = null;
	Statement statement = null;
	ResultSet resultSet = null;
	try {
		con = dataSource.getConnection();
		statement = con.createStatement();
	} catch (SQLException e1) {
		e1.printStackTrace();
	}
	List<ReportedByNC> reportedByNCs = new ArrayList<ReportedByNC>();
    try{
    	
    	if(!type_of_nc.equals(""))
    	{
    		resultSet = statement.executeQuery("select * from tbl_reportedby_nc where type_of_nc='"+type_of_nc+"'");
    	}
    
    	while(resultSet.next()){
			System.out.println("inside the search operation in database");
			reportedByNCs.add(new ReportedByNC(
					resultSet.getInt("auto_id"),
					resultSet.getString("type_of_nc"), 
					resultSet.getString("group_person")));
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
    return reportedByNCs;
	
}

//get the reported by values created on 22-june-2014(1.57pm).
public List<String> filtertypeofnc(String type_of_nonconformance){
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
 
 	String cmd = "select group_person from tbl_reportedby_nc where type_of_nc='"+type_of_nonconformance+"'";
 	resultSet = statement.executeQuery(cmd);
 
		System.out.println(cmd);
		while(resultSet.next()){
			System.out.println("count");
	
			nonConformances.add(resultSet.getString("group_person"));

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
