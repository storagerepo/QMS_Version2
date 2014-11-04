package qms.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import qms.model.Form;
import qms.model.Process;
import qms.model.RevisionForm;

public class RevisionFormDAO {
	private DataSource dataSource;
	public List<RevisionForm> getRevision(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<RevisionForm> revisionForms = new ArrayList<RevisionForm>();
	    try{
			resultSet = statement.executeQuery("select * from tbl_revisionform");
			while(resultSet.next()){
				revisionForms.add(new RevisionForm(resultSet.getString("auto_no"),resultSet.getString("document_id"),resultSet.getString("effective_date"),resultSet.getString("approver1"),
						resultSet.getString("issuer"),resultSet.getString("comments"),resultSet.getString("revision_id")));
				
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
	    return revisionForms;
		
	}
	public List<RevisionForm> getRevision(String revision_id,String document_id){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		System.out.println();
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<RevisionForm> revisionForms = new ArrayList<RevisionForm>();
	    try{
	    	System.out.println("select * from tbl_revisionform where document_id='"+document_id+"' and revision_id='"+revision_id+"'");
			resultSet = statement.executeQuery("select * from tbl_revisionform where document_id='"+document_id+"'AND revision_id='"+revision_id+"'");
			while(resultSet.next()){
				revisionForms.add(new RevisionForm(resultSet.getString("auto_no"),resultSet.getString("document_id"),resultSet.getString("effective_date"),resultSet.getString("approver1"),
						resultSet.getString("issuer"),resultSet.getString("comments"),resultSet.getString("revision_id")));
				
			}
			System.out.println("revision_id"+revisionForms.get(0).getRevision_id());
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
	    return revisionForms;
		
	}
	public List<RevisionForm> getRevision(String auto_no){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		System.out.println();
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<RevisionForm> revisionForms = new ArrayList<RevisionForm>();
	    try{
	    	System.out.println("select * from tbl_revisionform where auto_no='"+auto_no+"'");
			resultSet = statement.executeQuery("select * from tbl_revisionform where auto_no='"+auto_no+"' ORDER BY revision_id DESC ");
			while(resultSet.next()){
				revisionForms.add(new RevisionForm(resultSet.getString("auto_no"),resultSet.getString("document_id"),resultSet.getString("effective_date"),resultSet.getString("approver1"),
						resultSet.getString("issuer"),resultSet.getString("comments"),resultSet.getString("revision_id")));
				
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
	    return revisionForms;
		
	}
	public boolean insert_revision(RevisionForm form,String auto_id)
	{
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status=false;
		System.out.println("auto_id = "+auto_id);
		System.out.println("document_id =" +form.getDocument_id());
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
				e1.printStackTrace();
		}
		  try{
			  System.out.println("inserting into revision table");
			  String revision_id ="";
			  String approver1 = new String(form.getApprover1());
			  String[] split = approver1.split(",");
			  String approver = split[0];
			  resultSet=statement.executeQuery("select revision_id from tbl_form_child where auto_no='"+auto_id+"'");
				 while(resultSet.next())
				  {
					   revision_id = resultSet.getString("revision_id");
					   System.out.println("revision id ="+revision_id);
				  }
			  
			  String cmd_insert2;	
				 cmd_insert2="insert into tbl_revisionform(auto_no,document_id,effective_date,approver1,issuer,comments,revision_id) values('"+form.getAuto_no()+"','"+form.getDocument_id()+"','"+form.getEffective_date()+"','"+approver+"','"+form.getIssuer()+"','"+form.getComments()+"','"+revision_id+"')";
				 statement.execute(cmd_insert2);
		
			 status=true;
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
	public boolean insert_revision(RevisionForm form,String auto_id, Form forms)
	{
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		ResultSet resultSet1 = null;
		boolean status=false;
		System.out.println("auto_id = "+auto_id);
		System.out.println("document_id =" +form.getDocument_id());
		 String revision_no="",effectivedate="",documentid="",Approver="",issuer="",comments="",revision_number="";
		 int update=0;
		  form.getRevision_id();
		  form.getEffective_date();
		  form.getDocument_id();
		  form.getApprover1();
		  form.getIssuer();
		  form.getComments();
		  
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
				e1.printStackTrace();
		}
		  try{
			  System.out.println("inserting into revision table");
			  int revision_id =0;
			  String approver1 = new String(forms.getApprover1());
			  String[] split = approver1.split(",");
			  String approver = split[0];
			 /* resultSet=statement.executeQuery("select revision_id from tbl_form_child where auto_no='"+auto_id+"'");*/
			  
			  resultSet=statement.executeQuery("select tbl_form_child.revision_id,tbl_form_child.effective_date,tbl_form_child.document_id,tbl_form_child.approver1,tbl_form_child.issuer,tbl_form_child.comments from tbl_form_child where tbl_form_child.auto_no='"+auto_id+"'");
				
				 while(resultSet.next())
			  {
					 revision_no=resultSet.getString("revision_id");
					 System.out.println(revision_no+ forms.getRevision_id());
					 effectivedate=resultSet.getString("effective_date");
					 System.out.println(effectivedate+" "+forms.getEffective_date());
					 documentid=resultSet.getString("document_id");
					 System.out.println(documentid+" "+forms.getDocument_id());
					 Approver= resultSet.getString("approver1");
					 System.out.println(Approver+" "+forms.getApprover1());
					 issuer= resultSet.getString("issuer"); 
					 System.out.println(issuer+" "+forms.getIssuer());
					 comments= resultSet.getString("comments"); 
					 System.out.println(comments+" "+forms.getComments());
			  }
				 resultSet1 =statement.executeQuery("select revision_id from tbl_revisionform where auto_no='"+auto_id+"'");
				while(resultSet1.next())
				{
					revision_number = resultSet1.getString("revision_id");
					System.out.println("revision numnergfgdfgdfgd  = "+revision_number);
					System.out.println("edit revision id"+form.getRevision_id());
					if(revision_number.equals(form.getRevision_id()))
					{
						System.out.println("updte befor= "+update);
						System.out.println("updte after= "+update);
					}
				}
				  if((!forms.getRevision_id().equals(revision_no))|| (!forms.getEffective_date().equals(effectivedate))||(!forms.getDocument_id().equals(documentid))|| (!forms.getApprover1().equals(Approver))||(!forms.getIssuer().equals(issuer))|| (!forms.getComments().equals(comments)))
			  {	
					  if((!forms.getApprover1().equals(Approver)) || (!form.getEffective_date().equals(effectivedate) ) )
					  {
						  if(form.getRevision_id().equals(""))
						  {
							  String cmd_insert3;
							  cmd_insert3="insert into tbl_revisionform(auto_no,document_id,effective_date,approver1,issuer,comments,revision_id) values('"+form.getAuto_no()+"','"+form.getDocument_id()+"','"+form.getEffective_date()+"','"+approver+"','"+form.getIssuer()+"','"+form.getComments()+"','"+revision_no+"')";
								 statement.execute(cmd_insert3);
						  }
						  else{
						  String cmd_insert3;
						  cmd_insert3="insert into tbl_revisionform(auto_no,document_id,effective_date,approver1,issuer,comments,revision_id) values('"+form.getAuto_no()+"','"+form.getDocument_id()+"','"+form.getEffective_date()+"','"+approver+"','"+form.getIssuer()+"','"+form.getComments()+"','"+form.getRevision_id()+"')";
							 statement.execute(cmd_insert3);
						  }
					  }
					 /* else  if(update == 1)
						{
							statement.executeUpdate("update tbl_revisionform set document_id='"+form.getDocument_id()+"',effective_date='"+form.getEffective_date()+"',approver1='"+approver+"',issuer='"+form.getIssuer()+"',comments='"+form.getComments()+"' where auto_no='"+auto_id+"' and revision_id='"+form.getRevision_id()+"'");
						}*/
					  else{
						  if(form.getRevision_id().equals(""))
						  {
							  statement.executeUpdate("update tbl_revisionform set document_id='"+form.getDocument_id()+"',effective_date='"+form.getEffective_date()+"',approver1='"+approver+"',issuer='"+form.getIssuer()+"',comments='"+form.getComments()+"' where auto_no='"+auto_id+"' and revision_id='"+revision_no+"'");
								
							  /*String cmd_insert2;	
								 cmd_insert2="insert into tbl_revisionform(auto_no,document_id,effective_date,approver1,issuer,comments,revision_id) values('"+form.getAuto_no()+"','"+form.getDocument_id()+"','"+form.getEffective_date()+"','"+approver+"','"+form.getIssuer()+"','"+form.getComments()+"','"+revision_no+"')";
								 statement.execute(cmd_insert2);*/
								 status=true;
						  }
						  else{
			 String cmd_insert2;	
				 cmd_insert2="insert into tbl_revisionform(auto_no,document_id,effective_date,approver1,issuer,comments,revision_id) values('"+form.getAuto_no()+"','"+form.getDocument_id()+"','"+form.getEffective_date()+"','"+approver+"','"+form.getIssuer()+"','"+form.getComments()+"','"+form.getRevision_id()+"')";
				 statement.execute(cmd_insert2);
				 status=true;
						  }
				 }
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
