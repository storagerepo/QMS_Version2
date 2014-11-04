package qms.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import qms.model.Non_Conformance_Source;
import qms.model.Process;

public class Source_NCDAO {
	private DataSource dataSource;
	public List<Non_Conformance_Source> getSource(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Non_Conformance_Source> sources = new ArrayList<Non_Conformance_Source>();
	    try{
			resultSet = statement.executeQuery("select * from tbl_source_nc");
			while(resultSet.next()){
				sources.add(new Non_Conformance_Source(resultSet.getInt("auto_id"),resultSet.getString("source_of_nc")));
				
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
	    return sources;
		
	}
	public List<Non_Conformance_Source> getSource(String source){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Non_Conformance_Source> sources = new ArrayList<Non_Conformance_Source>();
	    try{
	    	String query="";
			if(source.equals(""))
			{
				query="select * from tbl_source_nc";
			}
			else
			{
				query="select * from tbl_source_nc where source_of_nc='"+source+"'";
			}
	    	resultSet = statement.executeQuery(query);
			while(resultSet.next()){
				sources.add(new Non_Conformance_Source(resultSet.getInt("auto_id"),resultSet.getString("source_of_nc")));
				
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
	    return sources;
		
	}
	
	public boolean insert_Source(Non_Conformance_Source source) {
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
			String cmd_insert = "insert into tbl_source_nc(source_of_nc)values('"+source.getSource_of_nc()+"')";
		
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
	public  List<Non_Conformance_Source> getlimitedsource(int page) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Non_Conformance_Source> sources = new ArrayList<Non_Conformance_Source>();
		  try {

			String cmd;
			int offset = 5 * (page - 1);
			int limit = 5;
					cmd="select * from tbl_source_nc where auto_id limit "+offset+","+limit+"" ;
			resultSet = statement.executeQuery(cmd);
			while(resultSet.next()){
			
				sources.add(new Non_Conformance_Source(resultSet.getInt("auto_id"),resultSet.getString("source_of_nc")));
				
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
		return sources;

	}
	public int getnoofsourcereport() {
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
				cmd = "select count(*) as noofrecords from tbl_source_nc";
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
	//Get request method
	public List<Non_Conformance_Source> sources(String id){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		List<Non_Conformance_Source> sources = new ArrayList<Non_Conformance_Source>();
	    try{
	    	String cmd_select = "select * from tbl_source_nc  where auto_id='"+id+"'";
			resultSet = statement.executeQuery(cmd_select);
			while(resultSet.next()){
				
				sources.add(new Non_Conformance_Source(resultSet.getInt("auto_id"),resultSet.getString("source_of_nc")));
				
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
	    return sources;
		
	}
	public boolean sourcesExit(String source,int id){
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
		
		List<Non_Conformance_Source> sources = new ArrayList<Non_Conformance_Source>();
	    try{
	    	String cmd_select = "select * from tbl_source_nc  where auto_id !='"+id+"' and source_of_nc='"+source+"'";
			resultSet = statement.executeQuery(cmd_select);
			while(resultSet.next()){
				
				sources.add(new Non_Conformance_Source(resultSet.getInt("auto_id"),resultSet.getString("source_of_nc")));
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
	//Update Operation
	public boolean update_Source(Non_Conformance_Source sources) {
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
			
			String cmd_update = "update tbl_source_nc set source_of_nc='"+sources.getSource_of_nc()+"' where auto_id='"+sources.getAuto_id()+"'";
			
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
	public boolean delete_source(String auto_id){
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
			  String cmd_delete1="delete from tbl_source_nc where auto_id='"+auto_id+"'";
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
