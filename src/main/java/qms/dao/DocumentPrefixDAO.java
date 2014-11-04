package qms.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import qms.model.DocumentPrefix;
import qms.model.FormPrefix;
import qms.model.ProductIDNC;

import java.sql.PreparedStatement;
public class DocumentPrefixDAO {
	private DataSource dataSource;
	
	
	public boolean insert_PrefixDocument(DocumentPrefix documentPrefix) {
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
			PreparedStatement preparedStatement=con.prepareStatement("insert into tbl_documentprefix(doc_prefix,document_id)values(?,?)");
			preparedStatement.setString(1,documentPrefix.getDoc_prefix());
			preparedStatement.setString(2,documentPrefix.getDocument_id());
			preparedStatement.execute();
			/*String cmd_insert = "insert into tbl_documentprefix(doc_prefix,document_id)values('"+documentPrefix.getDoc_prefix()+"','"+documentPrefix.getDocument_id()+"')";
		
			statement.execute(cmd_insert);*/
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

	
	
	
	
	public List<DocumentPrefix> getprefix() {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status = false;
		List<DocumentPrefix> documentPrefixs = new ArrayList<DocumentPrefix>();

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String cmd_select = "select * from tbl_documentprefix";
			resultSet = statement.executeQuery(cmd_select);
			while (resultSet.next()) {
				
				documentPrefixs.add(new DocumentPrefix(resultSet
						.getString("id"), resultSet
						.getString("doc_prefix"), resultSet
						.getString("document_id")));
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
		return documentPrefixs;
	}	
	
	public List<DocumentPrefix> getprefix(String prefix) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status = false;
		List<DocumentPrefix> documentPrefixs = new ArrayList<DocumentPrefix>();

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String cmd_select="";
			if(prefix.equals(""))
			{
				cmd_select = "select * from tbl_documentprefix";	
			}
			else
			{
				cmd_select = "select * from tbl_documentprefix where doc_prefix='"+prefix+"'";	
			}
		
			resultSet = statement.executeQuery(cmd_select);
			while (resultSet.next()) {
				
				documentPrefixs.add(new DocumentPrefix(resultSet
						.getString("id"), resultSet
						.getString("doc_prefix"), resultSet
						.getString("document_id")));
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
		return documentPrefixs;
	}	
	
	public  List<DocumentPrefix> getlimitedprefixreport(int page) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<DocumentPrefix> documentPrefixs = new ArrayList<DocumentPrefix>();
		  try {

			String cmd;
			int offset = 5 * (page - 1);
			int limit = 5;
					cmd="select * from tbl_documentprefix where id limit " + offset + ","+ limit+"" ;
				
				//	cmd = "select * from tbl_narrativereport order by pname asc limit " + offset + ","+ limit+"" ;

			resultSet = statement.executeQuery(cmd);
			while(resultSet.next()){
				documentPrefixs.add(new DocumentPrefix(resultSet
						.getString("id"), resultSet
						.getString("doc_prefix"), resultSet
						.getString("document_id")));
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
		return documentPrefixs;

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
				cmd = "select count(*) as noofrecords from tbl_documentprefix";
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
	public List<DocumentPrefix> getdocumentPrefixs(String id){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		List<DocumentPrefix> documentPrefixs = new ArrayList<DocumentPrefix>();
	    try{
	    	String cmd_select = "select * from tbl_documentprefix  where id='"+id+"'";
			resultSet = statement.executeQuery(cmd_select);
			while(resultSet.next()){
				documentPrefixs.add(new DocumentPrefix(resultSet
						.getString("id"), resultSet
						.getString("doc_prefix"), resultSet
						.getString("document_id")));
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
	    return documentPrefixs;
		
	}
	//Update Operation
	public boolean update_documentprefix(DocumentPrefix documentPrefix) {
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
			
			String cmd_update = "update tbl_documentprefix set doc_prefix='"+documentPrefix.getDoc_prefix()+"',document_id='"+documentPrefix.getDocument_id()+"' where id='"+documentPrefix.getId()+"'";
			
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
	
	public boolean getPrefixExit(String id,String doc_prefix){
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
		List<DocumentPrefix> documentPrefixs = new ArrayList<DocumentPrefix>();
	    try{
			resultSet = statement.executeQuery("select * from tbl_documentprefix where id != '"+id+"' and doc_prefix='"+doc_prefix+"'");
			while(resultSet.next()){
				documentPrefixs.add(new DocumentPrefix(resultSet
						.getString("id"), resultSet
						.getString("doc_prefix"), resultSet
						.getString("document_id")));
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
	public boolean delete_documentprefix(String id) {
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
			String cmd_delete = "delete from tbl_documentprefix where id='"+ id + "'";
			
			
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
