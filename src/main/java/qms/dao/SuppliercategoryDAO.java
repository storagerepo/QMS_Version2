package qms.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import qms.model.DocumentPrefix;
import qms.model.DocumentType;
import qms.model.FormPrefix;
import qms.model.ProductIDNC;
import qms.model.SuppilerCategory;
import qms.model.Certified_To;
import qms.forms.*;


import java.sql.PreparedStatement;
public class SuppliercategoryDAO {
	private DataSource dataSource;
	
	
	
	
	/*
	 * Insert category 
	 */
	public int insert_suppliercategory(SuppilerCategory SuppilerCategory){
		Connection con=null;
		Statement stmt=null;
		ResultSet rs=null;
		int flag=0;
		try{
			con = dataSource.getConnection();
			stmt = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		try{
			
		System.out.println("Inserting");
			PreparedStatement preparedStatement=con.prepareStatement("Insert into tbl_suppliercategory(category) values(?)");
			
			
			preparedStatement.setString(1,SuppilerCategory.getCategory());
			
			
			preparedStatement.execute();
			
			
			
			
			
			
			flag=1;
			System.out.println("Done");
		}
		catch(Exception e){
	    	System.out.println(e.toString());
	    	releaseStatement(stmt);
	    	releaseConnection(con);
	    	flag=0;
	    }
		finally{
	    	
	    	releaseStatement(stmt);
	    	releaseConnection(con);	    	
	    }
		if(flag==1)
    		return 1;
    	else
    		return 0;
	    }
	
	
	/*
	 * Insert category 
	 */
	public int insert_certifiedto(Certified_To certified_to){
		Connection con=null;
		Statement stmt=null;
		ResultSet rs=null;
		int flag=0;
		try{
			con = dataSource.getConnection();
			stmt = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		try{
			
		System.out.println("Inserting");
			PreparedStatement preparedStatement=con.prepareStatement("Insert into tbl_certifiedto(certified_to) values(?)");
			
			
			preparedStatement.setString(1,certified_to.getCertified_to());
			
			
			preparedStatement.execute();
			
			
			
			
			
			
			flag=1;
			System.out.println("Done");
		}
		catch(Exception e){
	    	System.out.println(e.toString());
	    	releaseStatement(stmt);
	    	releaseConnection(con);
	    	flag=0;
	    }
		finally{
	    	
	    	releaseStatement(stmt);
	    	releaseConnection(con);	    	
	    }
		if(flag==1)
    		return 1;
    	else
    		return 0;
	    }
	
	public  List<SuppilerCategory> getlimiteddocumenttypereport(int page) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<SuppilerCategory> documentTypes = new ArrayList<SuppilerCategory>();
		  try {

			String cmd;
			int offset = 5 * (page - 1);
			int limit = 5;
					cmd="select * from tbl_suppliercategory where id limit " + offset + ","+ limit+"" ;
				

			resultSet = statement.executeQuery(cmd);
			while(resultSet.next()){
			documentTypes.add(new SuppilerCategory(
					resultSet.getString("id"), 
						resultSet.getString("category")
					
						));
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
		return documentTypes;

	}
	
	public  List<Certified_To> getlimitedcertificatetypereport(int page) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Certified_To> documentTypes = new ArrayList<Certified_To>();
		  try {

			String cmd;
			int offset = 5 * (page - 1);
			int limit = 5;
					cmd="select * from tbl_certifiedto where id limit " + offset + ","+ limit+"" ;
				

			resultSet = statement.executeQuery(cmd);
			while(resultSet.next()){
			documentTypes.add(new Certified_To(
					resultSet.getString("id"), 
						resultSet.getString("certified_to")
					
						));
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
		return documentTypes;

	}
	public int getnoofdocumenttypereport() {
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
		List<SuppilerCategory> documentTypes = new ArrayList<SuppilerCategory>();
		try {

			String cmd;
				cmd = "select count(*) as noofrecords from tbl_suppliercategory";
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
	
	public int getnoofcertificatetypereport() {
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
		List<Certified_To> documentTypes = new ArrayList<Certified_To>();
		try {

			String cmd;
				cmd = "select count(*) as noofrecords from tbl_certifiedto";
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
	//fetching
	
	
	public List<SuppilerCategory> getsuppliercategory(String id){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<SuppilerCategory> addsuppilercategory = new ArrayList<SuppilerCategory>();
		try{
			
			resultSet = statement.executeQuery("SELECT * from tbl_suppliercategory   where id='"+id+"'");
			while(resultSet.next()){
				addsuppilercategory.add(new SuppilerCategory(
						resultSet.getString("id"), 
						resultSet.getString("category")
						
						));
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
	    return addsuppilercategory;
		
	}
	public List<Certified_To> getsuppliercertificate(String id){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Certified_To> addsuppilercategory = new ArrayList<Certified_To>();
		try{
			
			resultSet = statement.executeQuery("SELECT * from tbl_certifiedto   where id='"+id+"'");
			while(resultSet.next()){
				addsuppilercategory.add(new Certified_To(
						resultSet.getString("id"), 
						resultSet.getString("certified_to")
						
						));
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
	    return addsuppilercategory;
		
	}
	
	public List<Certified_To> getsuppliercerticate(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Certified_To> certified_to = new ArrayList<Certified_To>();
		try{
			
			resultSet = statement.executeQuery("SELECT * from tbl_certifiedto  ");
			while(resultSet.next()){
				certified_to.add(new Certified_To(
						resultSet.getString("id"), 
						resultSet.getString("certified_to")
						
						));
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
	    return certified_to;
		
	}
	
	//Update
	
	public boolean update_suppliercategory(SuppilerCategory SuppilerCategory)
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
			  String cmd_insert="update tbl_suppliercategory set category='"+SuppilerCategory.getCategory()+"' where id='"+SuppilerCategory.getId()+"'";
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
	public boolean deletesuppliercategory(String id){
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
			  String cmd_delete="delete from tbl_suppliercategory where id='"+id+"'";
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
			public int update_suppliercertificate(Certified_To certified_to)
			{
				Connection con = null;
				Statement statement = null;
				
				int flag=0;
				try {
					con = dataSource.getConnection();
					statement = con.createStatement();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			    try{
			    	String cmd="UPDATE tbl_certifiedto SET certiifcate='"+certified_to.getCertified_to()+"' WHERE id ='"+certified_to.getId()+"'";
			    	 PreparedStatement ps1 = con.prepareStatement("UPDATE tbl_suppliercategory SET category=?");
					 	
					 	ps1.setString(1,certified_to.getCertified_to());
					 	
					 	ps1.executeUpdate();
					 	ps1.close();	
			    
			    	System.out.println(cmd);
			    	flag=1;
			    }
			    	 catch(Exception e){
			 	    	System.out.println(e.toString());
			 	    	releaseStatement(statement);
			 	    	releaseConnection(con);
			 	    	flag=0;
			 	    	//return 0;
			 	    }finally{
			 	     	releaseStatement(statement);
			 	    	releaseConnection(con);	    
			 	    	
			 	    }
			 	    if(flag==1)
			     		return 1;
			     	else
			     		return 0;
			}
			
	//Update Operation
	
	
	public List<SuppilerCategory> getsuppliertype() {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status = false;
		List<SuppilerCategory> documentTypes = new ArrayList<SuppilerCategory>();

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String cmd_select = "select * from tbl_suppliercategory";
			resultSet = statement.executeQuery(cmd_select);
			while (resultSet.next()) {
				
				documentTypes.add(new SuppilerCategory(
						resultSet.getString("id"), 
						resultSet.getString("category")
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
		return documentTypes;
	}	
	
	
	public List<Certified_To> getsuppliercertificate() {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status = false;
		List<Certified_To> documentTypes = new ArrayList<Certified_To>();

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String cmd_select = "select * from tbl_certifiedto";
			resultSet = statement.executeQuery(cmd_select);
			while (resultSet.next()) {
				
				documentTypes.add(new Certified_To(
						resultSet.getString("id"), 
						resultSet.getString("certified_to")
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
		return documentTypes;
	}	
	//Delete Operation
	public boolean delete_suppliercategory(String id) {
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
			String cmd_delete = "delete from tbl_suppliercategory where id='"+ id + "'";
			
			
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
		
	//Delete Operation
		public boolean delete_suppliercertificate(String id) {
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
				String cmd_delete = "delete from tbl_certifiedto where id='"+ id + "'";
				
				
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
	
			
		public List<SuppilerCategory> getcategory(String category) {
			Connection con = null;
			Statement statement = null;
			ResultSet resultSet = null;
			boolean status = false;
			List<SuppilerCategory> documentPrefixs = new ArrayList<SuppilerCategory>();

			try {
				con = dataSource.getConnection();
				statement = con.createStatement();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			try {
				String cmd_select="";
				if(category.equals(""))
				{
					cmd_select = "select * from tbl_suppliercategory";	
				}
				else
				{
					cmd_select = "select * from tbl_suppliercategory where category='"+category+"'";	
				}
			
				resultSet = statement.executeQuery(cmd_select);
				while (resultSet.next()) {
					
					documentPrefixs.add(new SuppilerCategory(resultSet
							.getString("id"), resultSet
							.getString("category")
							
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
			return documentPrefixs;
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
