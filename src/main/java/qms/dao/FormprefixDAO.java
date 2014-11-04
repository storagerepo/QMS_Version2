package qms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import qms.model.DocumentPrefix;
import qms.model.FormPrefix;

public class FormprefixDAO {
	private DataSource dataSource;
	
	
	public boolean insert_PrefixForm(FormPrefix formPrefix) {
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
			PreparedStatement preparedStatement=con.prepareStatement("insert into tb_formprefix(form_name,form_prefix)values(?,?)");
			preparedStatement.setString(1,formPrefix.getForm_name());
			preparedStatement.setString(2,formPrefix.getForm_prefix());
			preparedStatement.execute();
	
			
		
			//statement.execute(cmd_insert);
			
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

	
	
	
	
	public List<FormPrefix> getprefix() {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status = false;
		List<FormPrefix> prefix = new ArrayList<FormPrefix>();

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String cmd_select = "select * from tb_formprefix";
			resultSet = statement.executeQuery(cmd_select);
			while (resultSet.next()) {
				
				prefix.add(new FormPrefix(resultSet
						.getString("id"), resultSet
						.getString("form_name"), resultSet
						.getString("form_prefix")
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
		return prefix;
	}	
	public List<FormPrefix> getprefix(String prefix1) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status = false;
		List<FormPrefix> prefix = new ArrayList<FormPrefix>();

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String cmd_select = "";
			if(prefix1.equals(""))
			{
				cmd_select = "select * from tb_formprefix";
			}
			else
			{
				cmd_select = "select * from tb_formprefix where form_prefix='"+prefix1+"'";
			}
			resultSet = statement.executeQuery(cmd_select);
			while (resultSet.next()) {
				
				prefix.add(new FormPrefix(resultSet
						.getString("id"), resultSet
						.getString("form_name"), resultSet
						.getString("form_prefix")
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
		return prefix;
	}	
	
	public  List<FormPrefix> getlimitedprefixreport(int page) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<FormPrefix> formPrefixs = new ArrayList<FormPrefix>();
		  try {

			String cmd;
			int offset = 5 * (page - 1);
			int limit = 5;
					cmd="select * from tb_formprefix where id limit " + offset + ","+ limit+"" ;
				
				//	cmd = "select * from tbl_narrativereport order by pname asc limit " + offset + ","+ limit+"" ;

			resultSet = statement.executeQuery(cmd);
			while(resultSet.next()){
				formPrefixs.add(new FormPrefix(resultSet
						.getString("id"), resultSet
						.getString("form_name"), resultSet
						.getString("form_prefix")));
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
		return formPrefixs;

	}
	public int getnoofprefixreport() {
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
				cmd = "select count(*) as noofrecords from tb_formprefix";
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
	//Get request method
	public List<FormPrefix> getformPrefixs(String id){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		List<FormPrefix> formPrefixs = new ArrayList<FormPrefix>();
	    try{
	    	String cmd_select = "select * from tb_formprefix  where id='"+id+"'";
			resultSet = statement.executeQuery(cmd_select);
			while(resultSet.next()){
				formPrefixs.add(new FormPrefix(resultSet
						.getString("id"), resultSet
						.getString("form_name"), resultSet
						.getString("form_prefix")));
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
	    return formPrefixs;
		
	}
	//Update Operation
	public boolean update_formprefix(FormPrefix formPrefix) {
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
			
			String cmd_update = "update tb_formprefix set form_name='"+formPrefix.getForm_name()+"',form_prefix='"+formPrefix.getForm_prefix()+"' where id='"+formPrefix.getId()+"'";
			
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
	
	public boolean getPrefixExit(String id,String form_prefix){
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
		List<FormPrefix> formPrefixs = new ArrayList<FormPrefix>();
	    try{
			resultSet = statement.executeQuery("select * from tb_formprefix where id != '"+id+"' and form_prefix='"+form_prefix+"'");
			while(resultSet.next()){
				formPrefixs.add(new FormPrefix(resultSet
					.getString("id"), resultSet
					.getString("form_name"), resultSet
					.getString("form_prefix")));
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
	
	
	
	//Delete Operation
	public boolean delete_formprefix(String id) {
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
			String cmd_delete = "delete from tb_formprefix where id='"+ id + "'";
			
			
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
