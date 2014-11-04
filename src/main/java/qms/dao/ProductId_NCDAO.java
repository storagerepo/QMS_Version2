package qms.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import qms.model.ProductIDNC;
import qms.model.Type_of_NC;

public class ProductId_NCDAO {
	private DataSource dataSource;
	
		public List<ProductIDNC> getProductId(){
			Connection con = null;
			Statement statement = null;
			ResultSet resultSet = null;
			try {
				con = dataSource.getConnection();
				statement = con.createStatement();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			List<ProductIDNC> products = new ArrayList<ProductIDNC>();
		    try{
				resultSet = statement.executeQuery("select * from tbl_productid_nc");
				while(resultSet.next()){
					products.add(new ProductIDNC(resultSet.getInt("auto_id"),resultSet.getString("productid_nc")));
					
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
		    return products;
			
		}
		public List<ProductIDNC> getProductId(String productid){
			Connection con = null;
			Statement statement = null;
			ResultSet resultSet = null;
			try {
				con = dataSource.getConnection();
				statement = con.createStatement();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			List<ProductIDNC> products = new ArrayList<ProductIDNC>();
		    try{
		    	String query="";
		    	if(productid.equals(""))
		    	{
		    		query="select * from tbl_productid_nc";
		    	}
		    	else
		    	{
		    		query="select * from tbl_productid_nc where productid_nc='"+productid+"'";
		    	}
				resultSet = statement.executeQuery(query);
				while(resultSet.next()){
					products.add(new ProductIDNC(resultSet.getInt("auto_id"),resultSet.getString("productid_nc")));
					
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
		    return products;
			
		}
		public boolean getProductIdExit(String product,int id){
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
			List<ProductIDNC> products = new ArrayList<ProductIDNC>();
		    try{
				resultSet = statement.executeQuery("select * from tbl_productid_nc where auto_id != '"+id+"' and productid_nc='"+product+"'");
				while(resultSet.next()){
					products.add(new ProductIDNC(resultSet.getInt("auto_id"),resultSet.getString("productid_nc")));
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
		public boolean insert_Type(ProductIDNC products) {
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
				String cmd_insert = "insert into tbl_productid_nc(productid_nc)values('"+products.getProductid_nc()+"')";
			
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
		public  List<ProductIDNC> getlimitedproductid(int page) {
			Connection con = null;
			Statement statement = null;
			ResultSet resultSet = null;
			
			
			try {
				con = dataSource.getConnection();
				statement = con.createStatement();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			List<ProductIDNC> products = new ArrayList<ProductIDNC>();
			  try {

				String cmd;
				int offset = 5 * (page - 1);
				int limit = 5;
						cmd="select * from tbl_productid_nc where auto_id limit " + offset + ","+ limit+"" ;
				resultSet = statement.executeQuery(cmd);
				while(resultSet.next()){
				
					products.add(new ProductIDNC(resultSet.getInt("auto_id"),resultSet.getString("productid_nc")));
					
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
			return products;

		}
		public int getnoofproductidreport() {
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
					cmd = "select count(*) as noofrecords from tbl_productid_nc";
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
		public List<ProductIDNC> products(String id){
			Connection con = null;
			Statement statement = null;
			ResultSet resultSet = null;
			try {
				con = dataSource.getConnection();
				statement = con.createStatement();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			
			List<ProductIDNC> products = new ArrayList<ProductIDNC>();
		    try{
		    	String cmd_select = "select * from tbl_productid_nc  where auto_id='"+id+"'";
				resultSet = statement.executeQuery(cmd_select);
				while(resultSet.next()){
					
					products.add(new ProductIDNC(resultSet.getInt("auto_id"),resultSet.getString("productid_nc")));
					
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
		    return products;
			
		}
		//Update Operation
		public boolean update_ProductId(ProductIDNC products) {
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
				
				String cmd_update = "update tbl_productid_nc set productid_nc='"+products.getProductid_nc()+"' where auto_id='"+products.getAuto_id()+"'";
				
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
		public boolean delete_productid(String auto_id){
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
				  String cmd_delete1="delete from tbl_productid_nc where auto_id='"+auto_id+"'";
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
