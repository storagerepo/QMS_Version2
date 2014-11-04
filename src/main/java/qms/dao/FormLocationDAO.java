package qms.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import qms.model.FormLocation;
import qms.model.FormPrefix;

public class FormLocationDAO {
	
	
	private DataSource dataSource;

	
	public boolean insert_LocationForm(FormLocation formLocation) {
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
			String cmd_insert = "insert into tb_formlocation(form_location)values('"+formLocation.getForm_location()+"')";
		
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
	
	public List<FormLocation> getlocation() {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status = false;
		List<FormLocation> locations = new ArrayList<FormLocation>();

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String cmd_select = "select * from tb_formlocation";
			resultSet = statement.executeQuery(cmd_select);
			while (resultSet.next()) {
				
				locations.add(new FormLocation(resultSet
						.getString("location_id"), resultSet
						.getString("form_location")
						));
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
		return locations;
	}	
	public List<FormLocation> getlocation(String location) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status = false;
		List<FormLocation> locations = new ArrayList<FormLocation>();

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String cmd_select = "";
			if(location.equals(""))
			{
				cmd_select = "select * from tb_formlocation";
			}
			else
			{
				cmd_select = "select * from tb_formlocation where form_location='"+location+"'";
			}
			
			resultSet = statement.executeQuery(cmd_select);
			while (resultSet.next()) {
				
				locations.add(new FormLocation(resultSet
						.getString("location_id"), resultSet
						.getString("form_location")
						));
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
		return locations;
	}	
	public boolean getlocationexit(String location,String id) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status = false;
		List<FormLocation> locations = new ArrayList<FormLocation>();

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String cmd_select = "select * from tb_formlocation where location_id!='"+id+"' and form_location= '"+location+"'";
			resultSet = statement.executeQuery(cmd_select);
			while (resultSet.next()) {
				
				locations.add(new FormLocation(resultSet
						.getString("location_id"), resultSet
						.getString("form_location")
						));
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
	//Get request method
	public List<FormLocation> getformLocations(String location_id){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		List<FormLocation> formLocations = new ArrayList<FormLocation>();
	    try{
	    	String cmd_select = "select * from tb_formlocation  where location_id='"+location_id+"'";
			resultSet = statement.executeQuery(cmd_select);
			while(resultSet.next()){
				formLocations.add(new FormLocation(resultSet
						.getString("location_id"), resultSet
						.getString("form_location")));
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
	    return formLocations;
		
	}
	public  List<FormLocation> getlimitedlocationreport(int page) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<FormLocation> formLocations = new ArrayList<FormLocation>();
		  try {

			String cmd;
			int offset = 5 * (page - 1);
			int limit = 5;
					cmd="select * from tb_formlocation where location_id limit " + offset + ","+ limit+"" ;
				

			resultSet = statement.executeQuery(cmd);
			while(resultSet.next()){
				formLocations.add(new FormLocation(resultSet
						.getString("location_id"), resultSet
						.getString("form_location")));
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
		return formLocations;

	}
	
	public int getnooflocationreport() {
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
		List<FormLocation> formLocations = new ArrayList<FormLocation>();
		try {

			String cmd;
				cmd = "select count(*) as noofrecords from tb_formlocation";
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
	
	
	//Update Operation
	public boolean update_formlocation(FormLocation formLocation) {
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
			
			String cmd_update = "update tb_formlocation set form_location='"+formLocation.getForm_location()+"' where location_id='"+formLocation.getLocation_id()+"'";
			
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
	
	//Delete Operation
	public boolean delete_formlocation(String id) {
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
			String cmd_delete = "delete from tb_formlocation where location_id='"+ id + "'";
			
			
			statement.execute(cmd_delete);
			
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
