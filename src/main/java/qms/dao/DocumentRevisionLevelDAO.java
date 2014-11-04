package qms.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import qms.model.DocumentMain;
import qms.model.DocumentRevisionLevel;
import qms.model.RevisionDocument;
import qms.model.Revision_No;


public class DocumentRevisionLevelDAO {
	private DataSource dataSource;

	public boolean insert_Documentrevision(DocumentRevisionLevel documentRevisionLevel) {
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
			System.out.println("before executing query");
			String cmd_insert = "insert into tbl_documentrevisionlevel(revision_prefix,revision_level,input1,input2,combined_output)values('"+documentRevisionLevel.getRevision_prefix()+"','"+documentRevisionLevel.getRevision_level()+"','"+documentRevisionLevel.getInput1()+"','"+documentRevisionLevel.getInput2()+"','"+documentRevisionLevel.getCombined_output()+"')";
		
			statement.execute(cmd_insert);
			System.out.println("query executed successfully");
			
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
	
	public List<DocumentRevisionLevel> getDocumentRevisionLevels() {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status = false;
		List<DocumentRevisionLevel> documentRevisionLevels = new ArrayList<DocumentRevisionLevel>();

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String cmd_select = "select * from tbl_documentrevisionlevel";
			resultSet = statement.executeQuery(cmd_select);
			while (resultSet.next()) {
				
				documentRevisionLevels.add(new DocumentRevisionLevel(resultSet
						.getString("id"),resultSet
						.getString("revision_prefix"),resultSet
						.getString("revision_level"),resultSet
						.getString("input1"),resultSet
						.getString("input2"),resultSet
						.getString("combined_output")));
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
		return documentRevisionLevels;
	}	
	
	public  List<DocumentRevisionLevel> getlimitedrevisionlevelreport(int page) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<DocumentRevisionLevel> documentRevisionLevels = new ArrayList<DocumentRevisionLevel>();
		  try {

			String cmd;
			int offset = 5 * (page - 1);
			int limit = 5;
					cmd="select * from tbl_documentrevisionlevel where id limit " + offset + ","+ limit+"" ;
				
				//	cmd = "select * from tbl_narrativereport order by pname asc limit " + offset + ","+ limit+"" ;

			resultSet = statement.executeQuery(cmd);
			while(resultSet.next()){
				documentRevisionLevels.add(new DocumentRevisionLevel(resultSet
						.getString("id"),resultSet
						.getString("revision_prefix"),resultSet
						.getString("revision_level"),resultSet
						.getString("input1"),resultSet
						.getString("input2"),resultSet
						.getString("combined_output")));
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
		return documentRevisionLevels;

	}
	public int getnoofrevisionlevelreport() {
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
				cmd = "select count(*) as noofrecords from tbl_documentrevisionlevel";
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
	public List<DocumentRevisionLevel> getDocumentRevisionLevels(String id){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		List<DocumentRevisionLevel> documentRevisionLevels = new ArrayList<DocumentRevisionLevel>();
	    try{
	    	String cmd_select = "select * from tbl_documentrevisionlevel  where id='"+id+"'";
			resultSet = statement.executeQuery(cmd_select);
			while(resultSet.next()){

				documentRevisionLevels.add(new DocumentRevisionLevel(resultSet
						.getString("id"),resultSet
						.getString("revision_prefix"),resultSet
						.getString("revision_level"),resultSet
						.getString("input1"),resultSet
						.getString("input2"),resultSet
						.getString("combined_output")));	
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
	    return documentRevisionLevels;
		
	}
	//Update Operation
	public boolean update_documentrevisionlevel(DocumentRevisionLevel documentRevisionLevel) {
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
			
			String cmd_update = "update tbl_documentrevisionlevel set revision_prefix='"+documentRevisionLevel.getRevision_prefix()+"',revision_level='"+documentRevisionLevel.getRevision_level()+"',input1='"+documentRevisionLevel.getInput1()+"',input2='"+documentRevisionLevel.getInput2()+"',combined_output='"+documentRevisionLevel.getCombined_output()+"' where id='"+documentRevisionLevel.getId()+"'";
			
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
	public boolean delete_documentrevisionlevel(String id) {
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
			String cmd_delete = "delete from tbl_documentrevisionlevel where id='"+ id + "'";
			
			
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
			
	

	public int getFormat() {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status = false;
		int count=0;
		List<DocumentRevisionLevel> documentRevisionLevels = new ArrayList<DocumentRevisionLevel>();

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String cmd_select = "select * from tbl_documentrevisionlevel";
			resultSet = statement.executeQuery(cmd_select);
			while (resultSet.next()) {
				
				documentRevisionLevels.add(new DocumentRevisionLevel(resultSet
						.getString("id"),resultSet
						.getString("revision_prefix"),resultSet
						.getString("revision_level"),resultSet
						.getString("input1"),resultSet
						.getString("input2"),resultSet
						.getString("combined_output")));	
				}
				count=count+1;
		
			
		} catch (Exception e) {
			System.out.println(e.toString());
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		} finally {
			System.out.println("count = "+count);
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		return count;
	}
	public List<DocumentRevisionLevel> getFormattype() {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		ResultSet resultSet2 = null;
		boolean status = false;
		String prefix = "",suffix="";
		int count=0;
		List<DocumentRevisionLevel> documentRevisionLevels = new ArrayList<DocumentRevisionLevel>();

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			 resultSet2=statement.executeQuery("select tbl_documentrevisionlevel.revision_prefix,tbl_documentrevisionlevel.revision_level from tbl_documentrevisionlevel");
			 while(resultSet2.next())
			  {
				prefix  = resultSet2.getString("revision_prefix");
				suffix  = resultSet2.getString("revision_level");
				count = count+1;
			  }
			 if(count >= 1)
			 {
			String cmd_select = "select * from tbl_documentrevisionlevel order by id DESC LIMIT 1";
			resultSet = statement.executeQuery(cmd_select);
			while (resultSet.next()) {
				
				documentRevisionLevels.add(new DocumentRevisionLevel(resultSet
						.getString("id"),resultSet
						.getString("revision_prefix"),resultSet
						.getString("revision_level"),resultSet
						.getString("input1"),resultSet
						.getString("input2"),resultSet
						.getString("combined_output")));	
				}
			}	
		}
		 catch (Exception e) {
			System.out.println(e.toString());
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		} finally {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		return documentRevisionLevels;
	}
	public List<DocumentRevisionLevel> getLevelFormat() {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		ResultSet resultSet1 = null,resultSet2=null;
		boolean status = false;
		int count=0;
		String prefix = "",suffix="";
		System.out.println("level format");
		List<DocumentRevisionLevel> format = new ArrayList<DocumentRevisionLevel>();

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			/* resultSet2=statement.executeQuery("select tbl_documentrevisionlevel.revision_prefix,tbl_documentrevisionlevel.revision_level from tbl_documentrevisionlevel");
			 while(resultSet2.next())
			  {
				prefix  = resultSet2.getString("revision_prefix");
				suffix  = resultSet2.getString("revision_level");
				count = count+1;
			  }
			 if(count >= 1)
			 {*/
			resultSet1=statement.executeQuery("select tbl_documentrevisionlevel.revision_prefix,tbl_documentrevisionlevel.revision_level from tbl_documentrevisionlevel order by tbl_documentrevisionlevel.id DESC LIMIT 1");
			
			  while(resultSet1.next())
			  {
				prefix  = resultSet1.getString("revision_prefix");
				suffix  = resultSet1.getString("revision_level");
				
			  }
			
			  if(suffix.equals("Integer"))
			  {
				  System.out.println("int only");
					String cmd_select = "select * from tbl_documentrevisionlevel where combined_output REGEXP ('^[0-9]$') ";
					System.out.println(cmd_select);
					resultSet = statement.executeQuery(cmd_select);
				
				}
				else if(suffix.equals("Alphabet"))
				{
					String cmd_select = "select * from tbl_documentrevisionlevel where combined_output REGEXP ('^[a-z]$') ";
					resultSet = statement.executeQuery(cmd_select);
				}
			  
			  
			  if(prefix.equals("Integer"))
			{
				if(suffix.equals("Integer"))
				{
					System.out.println("int int");
					String cmd_select = "select * from tbl_documentrevisionlevel where combined_output REGEXP ('[0-9].[0-9]') ";
					System.out.println(cmd_select);
					resultSet = statement.executeQuery(cmd_select);
				
				}
				else if(suffix.equals("Alphabet"))
				{
					String cmd_select = "select * from tbl_documentrevisionlevel where combined_output REGEXP ('[0-9].[a-z]') ";
					resultSet = statement.executeQuery(cmd_select);
				}
				/*else if(suffix.equals("Roman"))
				{
					String cmd_select = "select * from tbl_documentrevisionlevel where combined_output like '[0-9].[a-z]' ";
					resultSet = statement.executeQuery(cmd_select);
				}*/
				else {
					String cmd_select = "select * from tbl_documentrevisionlevel where combined_output REGEXP ('^[0-9]$') ";
					resultSet = statement.executeQuery(cmd_select);
				}
			}
			else if(prefix.equals("Alphabet"))
			{
				if(suffix.equals("Integer"))
				{
					System.out.println("alpha int");
					String cmd_select = "select * from tbl_documentrevisionlevel where combined_output REGEXP ('[a-z].[0-9]') ";
					System.out.println(cmd_select);
					resultSet = statement.executeQuery(cmd_select);
				
				}
				else if(suffix.equals("Alphabet"))
				{
					String cmd_select = "select * from tbl_documentrevisionlevel where combined_output REGEXP ('[a-z].[a-z]') ";
					resultSet = statement.executeQuery(cmd_select);
				}
				/*else if(suffix.equals("Roman"))
				{
					String cmd_select = "select * from tbl_documentrevisionlevel where combined_output like '[0-9].[a-z]' ";
					resultSet = statement.executeQuery(cmd_select);
				}*/
			else{
					String cmd_select = "select * from tbl_documentrevisionlevel where combined_output REGEXP ('^[a-z]$') ";
					resultSet = statement.executeQuery(cmd_select);
				}
				
				
			}
			while (resultSet.next()) {
				
				format.add(new DocumentRevisionLevel(resultSet
						.getString("id"),resultSet
						.getString("revision_prefix"),resultSet
						.getString("revision_level"),resultSet
						.getString("input1"),resultSet
						.getString("input2"),resultSet
						.getString("combined_output")));
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
		return format;
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
