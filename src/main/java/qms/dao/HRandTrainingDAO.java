package qms.dao;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import qms.model.Employee;
import qms.model.HRandTraining;

import javax.sql.DataSource;

public class HRandTrainingDAO {
	private DataSource dataSource;

	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
//Getting maximum Id created on 18-jun-14	
	public String getMax_HRID(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		String Max_id = "HR1001";
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {

			String cmd_select = "select max(auto_id) as auto_id from tbl_hr_and_training_main";
			resultSet = statement.executeQuery(cmd_select);
			if (resultSet.next()) {
				if (!resultSet.getString("auto_id").equals("null"))
					Max_id = "HR"
							+ (Integer.parseInt(resultSet.getString("auto_id")) + 1000 + 1);

			}
		}
			catch(Exception e){
	    	System.out.println("max"+e.toString());
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    }finally{
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);	    	
	    }
		    return Max_id;
		
	}

	//Delete opertion created on 18-jun-14.
	public boolean delete_hr(String id){
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
			  String cmd_delete1="delete from tbl_hr_and_training_main where id='"+id+"'";
			  String cmd_delete2="delete from tbl_hr_and_training_child where id='"+id+"'";
				 
			  status=statement.execute(cmd_delete1);
			  status=statement.execute(cmd_delete2);
			
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
	
	//List opertion created on 18-jun-14.
	public List<HRandTraining> getHr_byid(String id){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<HRandTraining> hRandTrainings = new ArrayList<HRandTraining>();
	    try{
			resultSet = statement.executeQuery("select * from tbl_hr_and_training_main as t1 join tbl_hr_and_training_child as t2 on t1.id=t2.id where t1.id='"+id+"'");
			while(resultSet.next())
			{
				System.out.println("count");
				hRandTrainings.add(new HRandTraining(
						
						resultSet.getString("id"),
						resultSet.getString("name"), 
						resultSet.getString("job_title"), 
						resultSet.getString("date_hired"), 
						resultSet.getString("attachment_name"),
						resultSet.getString("attachment_type"),
						resultSet.getString("attachment_referrence"), 
						resultSet.getString("calibration"),
						resultSet.getString("responsibility"),
						resultSet.getString("disposition"),
						resultSet.getString("documented_in"), 
						resultSet.getString("qualified_by"),
						resultSet.getString("type_of_training"),
						resultSet.getString("trainer"), 
						resultSet.getString("training_due_date"),
						resultSet.getString("training_completion_date"),
						resultSet.getString("training_effectiveness_review_due_date"),
						resultSet.getString("training_effectiveness_notes")));
				//				employees.add(new Employee(resultSet.getString("employee_id"),resultSet.getString("name"), resultSet.getString("job_title"), resultSet.getString("date_hired"), resultSet.getString("attachments"), resultSet.getString("list_of_functions_needes"),resultSet.getString("documented_in"), resultSet.getString("qualified_by"),resultSet.getString("type_of_training"),resultSet.getString("trainer"), resultSet.getString("training_due_date"),resultSet.getString("training_completion_date"),resultSet.getString("training_effectiveness_review_due_date"),resultSet.getString("training_effectiveness_notes")));
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
	    return hRandTrainings;
		
	}
	
	//Edit opertion created on 18-jun-14.
	public List<HRandTraining> edit_hr(String id) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		List<HRandTraining> hRandTrainings = new ArrayList<HRandTraining>();

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			resultSet = statement.executeQuery
			("select * from tbl_hr_and_training_main as t1 join tbl_hr_and_training_child as t2 on t1.id=t2.id where t1.id='"+id+"'");
			
			while (resultSet.next()) {

				hRandTrainings.add(new HRandTraining(
						
						resultSet.getString("id"),
						resultSet.getString("name"), 
						resultSet.getString("job_title"), 
						resultSet.getString("date_hired"), 
						resultSet.getString("attachment_name"),
						resultSet.getString("attachment_type"),
						resultSet.getString("attachment_referrence"), 
						resultSet.getString("calibration"),
						resultSet.getString("responsibility"),
						resultSet.getString("disposition"),
						resultSet.getString("documented_in"), 
						resultSet.getString("qualified_by"),
						resultSet.getString("type_of_training"),
						resultSet.getString("trainer"), 
						resultSet.getString("training_due_date"),
						resultSet.getString("training_completion_date"),
						resultSet.getString("training_effectiveness_review_due_date"),
						resultSet.getString("training_effectiveness_notes")));			
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
		return hRandTrainings;
	}

	//Update opertion created on 18-jun-14.
	public boolean update_hr(HRandTraining hRandTraining)
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
			  String attachment_name ="";
			  String attachment_type="",attachment_reference="";
			 
			 if(hRandTraining.getAttachment_name() == null || hRandTraining.getAttachment_type() == null || hRandTraining.getAttachment_referrence() == null)
			 {
				 resultSet=statement.executeQuery("select attachment_name,attachment_type,attachment_referrence from tbl_hr_and_training_main  where id='"+hRandTraining.getId()+"'");
			  while(resultSet.next())
			  {
				  attachment_name=resultSet.getString("attachment_name");
				  attachment_type=resultSet.getString("attachment_type");
				  attachment_reference= resultSet.getString("attachment_referrence");
			  }
			  
			  String cmd_update1="update tbl_hr_and_training_main set name='"+hRandTraining.getName()+"',job_title='"+hRandTraining.getJob_title()+"',date_hired='"+hRandTraining.getDate_hired()+"',attachment_name='"+attachment_name+"', attachment_type='"+attachment_type+"', attachment_referrence='"+attachment_reference+"',calibration='"+hRandTraining.getCalibration()+"',responsibility='"+hRandTraining.getResponsibility()+"',disposition='"+hRandTraining.getDisposition()+"' where id='"+hRandTraining.getId()+"'";
			  System.out.println("query problem");
			  String cmd_update2="update tbl_hr_and_training_child set name='"+hRandTraining.getName()+"',job_title='"+hRandTraining.getJob_title()+"',date_hired='"+hRandTraining.getDate_hired()+"',documented_in='"+hRandTraining.getDocumented_in()+"',qualified_by='"+hRandTraining.getQualified_by()+"',type_of_training='"+hRandTraining.getType_of_training()+"',trainer='"+hRandTraining.getTrainer()+"',training_due_date='"+hRandTraining.getTraining_due_date()+"',training_completion_date='"+hRandTraining.getTraining_completion_date()+"',training_effectiveness_review_due_date='"+hRandTraining.getTraining_effectiveness_review_due_date()+"',training_effectiveness_notes='"+hRandTraining.getTraining_effectiveness_notes()+"' where id='"+hRandTraining.getId()+"'";
			System.out.println("query problem2");
			  statement.execute(cmd_update1);
			statement.execute(cmd_update2);
			status = true;
		  }
			 else{
				 String cmd_update1="update tbl_hr_and_training_main set name='"+hRandTraining.getName()+"',job_title='"+hRandTraining.getJob_title()+"',date_hired='"+hRandTraining.getDate_hired()+"',attachment_name='"+hRandTraining.getAttachment_name()+"', attachment_type='"+hRandTraining.getAttachment_type()+"', attachment_referrence='"+hRandTraining.getAttachment_referrence()+"',calibration='"+hRandTraining.getCalibration()+"',responsibility='"+hRandTraining.getResponsibility()+"',disposition='"+hRandTraining.getDisposition()+"' where id='"+hRandTraining.getId()+"'";
				  System.out.println("query problem");
				  String cmd_update2="update tbl_hr_and_training_child set name='"+hRandTraining.getName()+"',job_title='"+hRandTraining.getJob_title()+"',date_hired='"+hRandTraining.getDate_hired()+"',documented_in='"+hRandTraining.getDocumented_in()+"',qualified_by='"+hRandTraining.getQualified_by()+"',type_of_training='"+hRandTraining.getType_of_training()+"',trainer='"+hRandTraining.getTrainer()+"',training_due_date='"+hRandTraining.getTraining_due_date()+"',training_completion_date='"+hRandTraining.getTraining_completion_date()+"',training_effectiveness_review_due_date='"+hRandTraining.getTraining_effectiveness_review_due_date()+"',training_effectiveness_notes='"+hRandTraining.getTraining_effectiveness_notes()+"' where id='"+hRandTraining.getId()+"'";
				System.out.println("query problem2");
				  statement.execute(cmd_update1);
				statement.execute(cmd_update2);
				status = true;
			 }
			 }
			 catch(Exception e){
	    	System.out.println("update error"+e.toString());
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

//	Insert opertion created on 18-jun-14.
	public boolean insert_hr(HRandTraining hRandTraining)
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
			
			  System.out.println("Hello");
			  String cmd_insert1="insert into tbl_hr_and_training_main(id,name,job_title,date_hired,attachment_name,attachment_type,attachment_referrence,calibration,responsibility,disposition) values('"+hRandTraining.getId()+"','"+hRandTraining.getName()+"','"+hRandTraining.getJob_title()+"','"+hRandTraining.getDate_hired()+"','"+hRandTraining.getAttachment_name()+"','"+hRandTraining.getAttachment_type()+"','"+hRandTraining.getAttachment_referrence()+"','"+hRandTraining.getCalibration()+"','"+hRandTraining.getResponsibility()+"','"+hRandTraining.getDisposition()+"')";
			  System.out.println("hiiii");
			  String cmd_insert2="insert into tbl_hr_and_training_child(id,name,job_title,date_hired,documented_in,qualified_by,type_of_training,trainer,training_due_date,training_completion_date,training_effectiveness_review_due_date,training_effectiveness_notes) values('"+hRandTraining.getId()+"','"+hRandTraining.getName()+"','"+hRandTraining.getJob_title()+"','"+hRandTraining.getDate_hired()+"','"+hRandTraining.getDocumented_in()+"','"+hRandTraining.getQualified_by()+"','"+hRandTraining.getType_of_training()+"','"+hRandTraining.getTrainer()+"','"+hRandTraining.getTraining_due_date()+"','"+hRandTraining.getTraining_completion_date()+"','"+hRandTraining.getTraining_effectiveness_review_due_date()+"','"+hRandTraining.getTraining_effectiveness_notes()+"')";
			 System.out.println("hi");
			  statement.execute(cmd_insert1);
			  statement.execute(cmd_insert2);
			  status = true;
			
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
	
	//Getting the list of values created on 18-June-14.
	public List<HRandTraining> getHRandTrainings(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<HRandTraining> hRandTrainings = new ArrayList<HRandTraining>();
	    try{
			resultSet = statement.executeQuery("select * from tbl_hr_and_training_main as t1 join tbl_hr_and_training_child as t2 on t1.id=t2.id");
			//System.out.println("came");
			while(resultSet.next()){
				System.out.println("count");
//				
				hRandTrainings.add(new HRandTraining(
						
						resultSet.getString("id"),
						resultSet.getString("name"), 
						resultSet.getString("job_title"), 
						resultSet.getString("date_hired"), 
						resultSet.getString("attachment_name"),
						resultSet.getString("attachment_type"),
						resultSet.getString("attachment_referrence"), 
						resultSet.getString("calibration"),
						resultSet.getString("responsibility"),
						resultSet.getString("disposition"),
						resultSet.getString("documented_in"), 
						resultSet.getString("qualified_by"),
						resultSet.getString("type_of_training"),
						resultSet.getString("trainer"), 
						resultSet.getString("training_due_date"),
						resultSet.getString("training_completion_date"),
						resultSet.getString("training_effectiveness_review_due_date"),
						resultSet.getString("training_effectiveness_notes")));
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
	    return hRandTrainings;
		
	}
	public List<HRandTraining> getHRResposible(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		System.out.println("responsible");
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<HRandTraining> hRandTrainings = new ArrayList<HRandTraining>();
	    try{
	    	String res = "select * from tbl_hr_and_training_main  where responsibility ='yes'";
	    	System.out.println(res);
			resultSet = statement.executeQuery("select * from tbl_hr_and_training_main where responsibility ='yes'");
			//System.out.println("came");
			while(resultSet.next()){
				
//				
				hRandTrainings.add(new HRandTraining(
						
						resultSet.getString("id"),
						resultSet.getString("name"), 
						resultSet.getString("job_title"), 
						resultSet.getString("date_hired"), 
						resultSet.getString("attachment_name"),
						resultSet.getString("attachment_type"),
						resultSet.getString("attachment_referrence"), 
						resultSet.getString("calibration"),
						resultSet.getString("responsibility"),
						resultSet.getString("disposition")
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
	    return hRandTrainings;
		
	}
	//Getting the list of values created on 18-June-14.
	public List<HRandTraining> getNameCalibration(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<HRandTraining> hRandTrainings = new ArrayList<HRandTraining>();
	    try{
			resultSet = statement.executeQuery("select * from tbl_hr_and_training_main as t1 join tbl_hr_and_training_child as t2 on t1.id=t2.id where t1.calibration='yes' ");
			//System.out.println("came");
			while(resultSet.next()){
				System.out.println("count");
//				
				hRandTrainings.add(new HRandTraining(
						
						resultSet.getString("id"),
						resultSet.getString("name"), 
						resultSet.getString("job_title"), 
						resultSet.getString("date_hired"), 
						resultSet.getString("attachment_name"),
						resultSet.getString("attachment_type"),
						resultSet.getString("attachment_referrence"), 
						resultSet.getString("calibration"),
						resultSet.getString("responsibility"),
						resultSet.getString("disposition"),
						resultSet.getString("documented_in"), 
						resultSet.getString("qualified_by"),
						resultSet.getString("type_of_training"),
						resultSet.getString("trainer"), 
						resultSet.getString("training_due_date"),
						resultSet.getString("training_completion_date"),
						resultSet.getString("training_effectiveness_review_due_date"),
						resultSet.getString("training_effectiveness_notes")));
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
	    return hRandTrainings;
		
	}
	
	

//	pagination for search operation results created on 25-jun-14(12.43pm)
	public List<HRandTraining> findhr(String type,String qualifiedby,String trainer,int page){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<HRandTraining> hRandTrainings = new ArrayList<HRandTraining>();
	    try{
	    	if(page >= 1)
	    	{
	    	int offset = 5 * (page - 1);
			int limit = 5;
	    	if(!type.equals("") && !qualifiedby.equals("") && !trainer.equals(""))
	    	{
	    		resultSet = statement.executeQuery("select t1.*,t2.* from tbl_hr_and_training_main as t1 join tbl_hr_and_training_child as t2 on t1.id=t2.id where t2.type_of_training='"+type+"' and t2.qualified_by='"+qualifiedby+"' and t2.trainer='"+trainer+"' limit " + offset + ","+ limit+"");
	    	}
	    	else if(type.equals("") && !qualifiedby.equals("") && !trainer.equals(""))
	    	{
	    		resultSet = statement.executeQuery("select t1.*,t2.* from tbl_hr_and_training_main as t1 join tbl_hr_and_training_child as t2 on t1.id=t2.id where t2.qualified_by='"+qualifiedby+"' and t2.trainer='"+trainer+"' limit " + offset + ","+ limit+"");
	    	}
	    	else if(!type.equals("") && !qualifiedby.equals("") && trainer.equals(""))
	    	{
	    		resultSet = statement.executeQuery("select t1.*,t2.* from tbl_hr_and_training_main as t1 join tbl_hr_and_training_child as t2 on t1.id=t2.id where t2.type_of_training='"+type+"' and t2.qualified_by='"+qualifiedby+"' limit " + offset + ","+ limit+"");
	    	}
	    	else if(!type.equals("") && qualifiedby.equals("") && !trainer.equals(""))
	    	{
	    		resultSet = statement.executeQuery("select t1.*,t2.* from tbl_hr_and_training_main as t1 join tbl_hr_and_training_child as t2 on t1.id=t2.id where t2.type_of_training='"+type+"' and t2.trainer='"+trainer+"' limit " + offset + ","+ limit+"");
	    	}
	    	else
	    	{
	    		resultSet = statement.executeQuery("select t1.*,t2.* from tbl_hr_and_training_main as t1 join tbl_hr_and_training_child as t2 on t1.id=t2.id where t2.type_of_training='"+type+"' or t2.qualified_by='"+qualifiedby+"' or t2.trainer='"+trainer+"' limit " + offset + ","+ limit+"");
	    	}
	    	}
	    	else
	    	{
	    		if(!type.equals("") && !qualifiedby.equals("") && !trainer.equals(""))
		    	{
		    		resultSet = statement.executeQuery("select t1.*,t2.* from tbl_hr_and_training_main as t1 join tbl_hr_and_training_child as t2 on t1.id=t2.id where t2.type_of_training='"+type+"' and t2.qualified_by='"+qualifiedby+"' and t2.trainer='"+trainer+"'");
		    	}
		    	else if(type.equals("") && !qualifiedby.equals("") && !trainer.equals(""))
		    	{
		    		resultSet = statement.executeQuery("select t1.*,t2.* from tbl_hr_and_training_main as t1 join tbl_hr_and_training_child as t2 on t1.id=t2.id where t2.qualified_by='"+qualifiedby+"' and t2.trainer='"+trainer+"'");
		    	}
		    	else if(!type.equals("") && !qualifiedby.equals("") && trainer.equals(""))
		    	{
		    		resultSet = statement.executeQuery("select t1.*,t2.* from tbl_hr_and_training_main as t1 join tbl_hr_and_training_child as t2 on t1.id=t2.id where t2.type_of_training='"+type+"' and t2.qualified_by='"+qualifiedby+"'");
		    	}
		    	else if(!type.equals("") && qualifiedby.equals("") && !trainer.equals(""))
		    	{
		    		resultSet = statement.executeQuery("select t1.*,t2.* from tbl_hr_and_training_main as t1 join tbl_hr_and_training_child as t2 on t1.id=t2.id where t2.type_of_training='"+type+"' and t2.trainer='"+trainer+"'");
		    	}
		    	else
		    	{
		    		resultSet = statement.executeQuery("select t1.*,t2.* from tbl_hr_and_training_main as t1 join tbl_hr_and_training_child as t2 on t1.id=t2.id where t2.type_of_training='"+type+"' or t2.qualified_by='"+qualifiedby+"' or t2.trainer='"+trainer+"'");
		    	}
	    	}
	    	while(resultSet.next()){
				System.out.println("inside the search operation in database");
				hRandTrainings.add(new HRandTraining(
						resultSet.getString("id"),
						resultSet.getString("name"), 
						resultSet.getString("job_title"), 
						resultSet.getString("date_hired"), 
						resultSet.getString("attachment_name"),
						resultSet.getString("attachment_type"),
						resultSet.getString("attachment_referrence"), 
						resultSet.getString("calibration"),
						resultSet.getString("responsibility"),
						resultSet.getString("disposition"),
						resultSet.getString("documented_in"), 
						resultSet.getString("qualified_by"),
						resultSet.getString("type_of_training"),
						resultSet.getString("trainer"), 
						resultSet.getString("training_due_date"),
						resultSet.getString("training_completion_date"),
						resultSet.getString("training_effectiveness_review_due_date"),
						resultSet.getString("training_effectiveness_notes")));
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
	    return hRandTrainings;
		
	}

//	pagination for search operation results created on 25-jun-14(12.55pm).
	public int FindHR(String type,String qualifiedby,String trainer){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		int noofRecords=0;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<HRandTraining> hRandTrainings = new ArrayList<HRandTraining>();
	    try{
	    	
	    	if(!type.equals("") && !qualifiedby.equals("") && !trainer.equals(""))
	    	{
	    		resultSet = statement.executeQuery("select count(*) as noofrecords from tbl_hr_and_training_main as t1 join tbl_hr_and_training_child as t2 on t1.id=t2.id where t2.type_of_training='"+type+"' and t2.qualified_by='"+qualifiedby+"' and t2.trainer='"+trainer+"'");
	    	}
	    	else if(type.equals("") && !qualifiedby.equals("") && !trainer.equals(""))
	    	{
	    		resultSet = statement.executeQuery("select count(*) as noofrecords from tbl_hr_and_training_main as t1 join tbl_hr_and_training_child as t2 on t1.id=t2.id where t2.qualified_by='"+qualifiedby+"' and t2.trainer='"+trainer+"'");
	    	}
	    	else if(!type.equals("") && !qualifiedby.equals("") && trainer.equals(""))
	    	{
	    		resultSet = statement.executeQuery("select count(*) as noofrecords from tbl_hr_and_training_main as t1 join tbl_hr_and_training_child as t2 on t1.id=t2.id where t2.type_of_training='"+type+"' and t2.qualified_by='"+qualifiedby+"'");
	    	}
	    	else if(!type.equals("") && qualifiedby.equals("") && !trainer.equals(""))
	    	{
	    		resultSet = statement.executeQuery("select count(*) as noofrecords from tbl_hr_and_training_main as t1 join tbl_hr_and_training_child as t2 on t1.id=t2.id where t2.type_of_training='"+type+"' and t2.trainer='"+trainer+"'");
	    	}
	    	else
	    	{
	    		resultSet = statement.executeQuery("select count(*) as noofrecords from tbl_hr_and_training_main as t1 join tbl_hr_and_training_child as t2 on t1.id=t2.id where t2.type_of_training='"+type+"' or t2.qualified_by='"+qualifiedby+"' or t2.trainer='"+trainer+"'");
	    	}
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

	public  List<HRandTraining> getlimitedhrreport(int page) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		List<HRandTraining> hRandTrainings = new ArrayList<HRandTraining>();
		try {

			String cmd;
			int offset = 5 * (page - 1);
			int limit = 5;
			cmd ="select * from tbl_hr_and_training_main as t1 join tbl_hr_and_training_child as t2 on t1.id=t2.id limit " + offset + ","+ limit+"" ;
			resultSet = statement.executeQuery(cmd);
			while(resultSet.next()){
				System.out.println("count");
			hRandTrainings.add(new HRandTraining(
						resultSet.getString("id"),
						resultSet.getString("name"), 
						resultSet.getString("job_title"), 
						resultSet.getString("date_hired"), 
						resultSet.getString("attachment_name"),
						resultSet.getString("attachment_type"),
						resultSet.getString("attachment_referrence"), 
						resultSet.getString("calibration"),
						resultSet.getString("responsibility"),
						resultSet.getString("disposition"),
						resultSet.getString("documented_in"), 
						resultSet.getString("qualified_by"),
						resultSet.getString("type_of_training"),
						resultSet.getString("trainer"), 
						resultSet.getString("training_due_date"),
						resultSet.getString("training_completion_date"),
						resultSet.getString("training_effectiveness_review_due_date"),
						resultSet.getString("training_effectiveness_notes")));
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
		return hRandTrainings;

	}
	
	public int getnoofhrreport() {
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
		List<Employee> employees = new ArrayList<Employee>();
		try {

			String cmd;
			
					cmd = "select count(*) as noofrecords from from tbl_hr_and_training_main as t1 join tbl_hr_and_training_child as t2 on t1.employee_id=t2.employee_id ";
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
	public List<HRandTraining> getParticular_HR(String id){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<HRandTraining> hRandTrainings = new ArrayList<HRandTraining>();
	    try{
			resultSet = statement.executeQuery("select * from tbl_hr_and_training_main as t1 join tbl_hr_and_training_child as t2 on t1.id = '"+id+"' and t2.id = '"+id+"'");
			//System.out.println("came");
			while(resultSet.next()){
				hRandTrainings.add(new HRandTraining(
						resultSet.getString("id"),
						resultSet.getString("name"), 
						resultSet.getString("job_title"), 
						resultSet.getString("date_hired"), 
						resultSet.getString("attachment_name"),
						resultSet.getString("attachment_type"),
						resultSet.getString("attachment_referrence"), 
						resultSet.getString("calibration"),
						resultSet.getString("responsibility"),
						resultSet.getString("disposition"),
						resultSet.getString("documented_in"), 
						resultSet.getString("qualified_by"),
						resultSet.getString("type_of_training"),
						resultSet.getString("trainer"), 
						resultSet.getString("training_due_date"),
						resultSet.getString("training_completion_date"),
						resultSet.getString("training_effectiveness_review_due_date"),
						resultSet.getString("training_effectiveness_notes")));
				
					
			
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
	    return hRandTrainings;
	}
	
	// getting the disposition responsibility persons created on 21-june-2014 (6.19pm).
		public List<HRandTraining> getnameList(){
			Connection con = null;
			Statement statement = null;
			ResultSet resultSet = null;
			try {
				con = dataSource.getConnection();
				statement = con.createStatement();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		List<HRandTraining> hRandTrainings = new ArrayList<HRandTraining>();
	    try{
			resultSet = statement.executeQuery("select * from tbl_hr_and_training_main as t1 join tbl_hr_and_training_child as t2 on t1.id=t2.id where t1.disposition='yes'");
			//System.out.println("came");
			while(resultSet.next()){
				System.out.println("count");
//				
				hRandTrainings.add(new HRandTraining(
						
						resultSet.getString("id"),
						resultSet.getString("name"), 
						resultSet.getString("job_title"), 
						resultSet.getString("date_hired"), 
						resultSet.getString("attachment_name"),
						resultSet.getString("attachment_type"),
						resultSet.getString("attachment_referrence"), 
						resultSet.getString("calibration"),
						resultSet.getString("responsibility"),
						resultSet.getString("disposition"),
						resultSet.getString("documented_in"), 
						resultSet.getString("qualified_by"),
						resultSet.getString("type_of_training"),
						resultSet.getString("trainer"), 
						resultSet.getString("training_due_date"),
						resultSet.getString("training_completion_date"),
						resultSet.getString("training_effectiveness_review_due_date"),
						resultSet.getString("training_effectiveness_notes")));
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
	    return hRandTrainings;

		}
	public void releaseConnection(Connection con){
		try{if(con != null)
			con.close();
		}catch(Exception e){}
	}
	public void releaseResultSet(ResultSet rs){
		try{if(rs != null)
			rs.close();
	}catch(Exception e){}
	}
	public void releaseStatement(Statement stmt){
		try{if(stmt != null)
			stmt.close();
	}catch(Exception e){}
	}

}

	


