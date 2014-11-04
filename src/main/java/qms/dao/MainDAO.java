package qms.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

import qms.forms.UserProfileForm;
import qms.model.ParticipantsDetails;
import qms.model.UserProfile;



public class MainDAO {
	private DataSource dataSource;
	 
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	public List<ParticipantsDetails> getParticipants(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<ParticipantsDetails> participants = new ArrayList<ParticipantsDetails>();
	    try{
			resultSet = statement.executeQuery("select * from participants_table");
			while(resultSet.next()){
				participants.add(new ParticipantsDetails(resultSet.getString("participants_id"),
			    		resultSet.getString("fname"),
			    		resultSet.getString("lname"),
			    		resultSet.getString("mobile_num"),
			    		resultSet.getString("gender"),
			    		resultSet.getString("city"),
			    		resultSet.getString("education"),
			    		resultSet.getString("note"),
			    		resultSet.getString("medical_details"),
			    		resultSet.getString("messaging_frequency"),
			    		resultSet.getString("group_name"),
			    		resultSet.getString("age"),
			    		resultSet.getString("date_of_join"),
			    		resultSet.getString("email_id"),
			    		resultSet.getString("created_by")));
			}
	    }catch(Exception e){
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    }finally{
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);	    	
	    }
	    return participants;
		
	}
	
	
	public int getrole()
	{
		
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet=null;
		int flag=0;
		int role=4;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = null;
		if (principal instanceof UserDetails) {
		  userDetails = (UserDetails) principal;
		}
		String userName = userDetails.getUsername();
		System.out.println("user name = "+userName);
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		//List<ParticipantsDetails> participants = new ArrayList<ParticipantsDetails>();
	    try{
	    	String cmd_role="select role from login where username='"+userName+"'";
	    	resultSet=statement.executeQuery(cmd_role);
	    	resultSet.next();
	    	role=Integer.parseInt(resultSet.getString("role"));
	    	flag=1;
	    	System.out.println(role);
	    	 
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
    		return role;
    	else
    		return 4;
	
	}
	public String getusername(String username)
	{
		
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet=null;
		int flag=0;
	 String role="";
	
				
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		//List<ParticipantsDetails> participants = new ArrayList<ParticipantsDetails>();
	    try{
	    	String cmd_role="select count(username) as count from login where username='"+username+"'";
	    	System.out.println(cmd_role);
	    	resultSet=statement.executeQuery(cmd_role);
	    	while(resultSet.next())
	    	{
	    	role=resultSet.getString("count");	    	
	    	}
	    	System.out.println(role);
	    	 
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
	   return role;
	
	}
	
	public String getemail(String username,String email)
	{
		
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet=null;
		int flag=0;
		String role="";
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		//List<ParticipantsDetails> participants = new ArrayList<ParticipantsDetails>();
	    try{
	    	String cmd_role="select count(email_id) as email from login where email_id='"+email+"'";
	    	resultSet=statement.executeQuery(cmd_role);
	    	resultSet.next();
	    	role=resultSet.getString("email");
	    	
	    	
	    	System.out.println(role);
	    	 
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
	   return role;
	
	}
	
	public List<UserProfile> getSignup(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		List<UserProfile> Signup = new ArrayList<UserProfile>();
	    try{
			resultSet = statement.executeQuery("select * from users");
			while(resultSet.next()){
				Signup.add(new UserProfile(resultSet.getString("FULLNAME"),
			    		resultSet.getString("USERNAME"),
			    		resultSet.getString("PASSWORD"),
			    		resultSet.getString("EMAIL"),
			    		resultSet.getBoolean("UPDATEBYEMAIL")
			    		
				
				));
			    		
			    		
			}
	    }catch(Exception e){
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    }finally{
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);	    	
	    }
	    return Signup;
		
	}
	
	
	public int setSignup(UserProfile signup)
	{
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		int flag=0;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		//List<ParticipantsDetails> participants = new ArrayList<ParticipantsDetails>();
	    try{
	    	 DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	    	 Date date = new Date();
	    	 //System.out.println(dateFormat.format(date));
	    	 String cmd="INSERT INTO `users` (`fullname`,`username`,`password`,`email`,`enabled`) VALUES ('"+signup.getFullName()+"','"+signup.getUsername()+"','"+signup.getPassword()+"','"+signup.getEmail()+"','"+1+"')";
	    	 System.out.println(cmd);
	    	 statement.execute(cmd);
	    	 String cmd_login="INSERT INTO login (`username`,`password`,`email_id`,`role`,`status`) VALUES ('"+signup.getUsername()+"','"+signup.getPassword()+"','"+signup.getEmail()+"','"+1+"','"+1+"')";
	    	 System.out.println(cmd_login);
	    	 statement.execute(cmd_login);
	    	 String cmd_getid="SELECT LAST_INSERT_ID() as lastid";
	    	 resultSet=statement.executeQuery(cmd_getid);
	    		resultSet.next();
	    		int lastinsertedid=Integer.parseInt(resultSet.getString("lastid"));
	    		String cmd_role="insert into user_roles(user_id,authority) values('"+lastinsertedid+"','ROLE_USER')";
		  System.out.println(cmd_role);
	    	 statement.execute(cmd_role);
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
