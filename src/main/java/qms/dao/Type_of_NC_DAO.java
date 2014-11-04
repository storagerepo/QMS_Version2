package qms.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import qms.model.Non_Conformance_Source;
import qms.model.Type_of_NC;
public class Type_of_NC_DAO {
	private DataSource dataSource;
	public List<Type_of_NC> getType(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Type_of_NC> types = new ArrayList<Type_of_NC>();
	    try{
			resultSet = statement.executeQuery("select * from tbl_type_nc");
			while(resultSet.next()){
				types.add(new Type_of_NC(resultSet.getInt("auto_id"),resultSet.getString("type_of_nc")));
				
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
	    return types;
		
	}
	public List<Type_of_NC> getType(String type){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Type_of_NC> types = new ArrayList<Type_of_NC>();
	    try{
	    	String query="";
	    	if(type.equals(""))
	    	{
	    		query="select * from tbl_type_nc";
	    	}
	    	else
	    	{
	    		query="select * from tbl_type_nc where type_of_nc='"+type+"'";
	    	}
			resultSet = statement.executeQuery(query);
			while(resultSet.next()){
				types.add(new Type_of_NC(resultSet.getInt("auto_id"),resultSet.getString("type_of_nc")));
				
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
	    return types;
		
	}
	
	public boolean NcExit(String nc,int id){
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
		
		List<Type_of_NC> types = new ArrayList<Type_of_NC>();
	    try{
	    	String cmd_select = "select * from tbl_type_nc  where auto_id !='"+id+"' and type_of_nc='"+nc+"'";
			resultSet = statement.executeQuery(cmd_select);
			while(resultSet.next()){
				
				types.add(new Type_of_NC(resultSet.getInt("auto_id"),resultSet.getString("type_of_nc")));
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
	public boolean insert_Type(Type_of_NC types) {
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
			String cmd_insert = "insert into tbl_type_nc(type_of_nc)values('"+types.getType_of_nc()+"')";
		
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
	public  List<Type_of_NC> getlimitedtype(int page) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Type_of_NC> sources = new ArrayList<Type_of_NC>();
		  try {

			String cmd;
			int offset = 5 * (page - 1);
			int limit = 5;
					cmd="select * from tbl_type_nc where auto_id limit " + offset + ","+ limit+"" ;
			resultSet = statement.executeQuery(cmd);
			while(resultSet.next()){
			
				sources.add(new Type_of_NC(resultSet.getInt("auto_id"),resultSet.getString("type_of_nc")));
				
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
	public int getnooftypereport() {
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
				cmd = "select count(*) as noofrecords from tbl_type_nc";
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
	public List<Type_of_NC> types(String id){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		List<Type_of_NC> types = new ArrayList<Type_of_NC>();
	    try{
	    	String cmd_select = "select * from tbl_type_nc  where auto_id='"+id+"'";
			resultSet = statement.executeQuery(cmd_select);
			while(resultSet.next()){
				
				types.add(new Type_of_NC(resultSet.getInt("auto_id"),resultSet.getString("type_of_nc")));
				
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
	    return types;
		
	}
	//Update Operation
	public boolean update_Type(Type_of_NC types) {
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
			
			String cmd_update = "update tbl_type_nc set type_of_nc='"+types.getType_of_nc()+"' where auto_id='"+types.getAuto_id()+"'";
			
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
	public boolean delete_type(String auto_id){
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
			  String cmd_delete1="delete from tbl_type_nc where auto_id='"+auto_id+"'";
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
