package qms.controllers;

//import java.security.Principal;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import qms.dao.JobDAO;
import qms.model.Job;

@Controller
public class JobController
{
    @Autowired
	JobDAO jobDAO;
	
    //Method for add a new job
	@RequestMapping(value="/ajax_addjob", method = RequestMethod.POST)
	public @ResponseBody String addjob(HttpServletRequest request,ModelMap model)
	{
		String ReturnText="Ajax working";
	   
		
		jobDAO.insert_job(request.getParameter("job_id"),request.getParameter("job_title"),request.getParameter("job_desc"));
		ReturnText=generate_jobs();
		return ReturnText;
 
	}
	
	//Method for getting a job
	@RequestMapping(value="/ajax_getjob", method = RequestMethod.POST)
	public @ResponseBody String getjob(HttpServletRequest request,ModelMap model)
	{
		String ReturnText="Ajax working";
	   System.out.println("came123");
		ReturnText=generate_jobs();
		return ReturnText;
 
	}
	
	//generate jobs
	public String generate_jobs()
	{
	//List<Job> jobs=new ArrayList<Job>();
	//jobs=jobDAO.getJobs();
	String returnHTML="<select id='job_title' class='input_txtbx' name='job_title'>";
	
	for (Job job : jobDAO.getJobs()) {
		System.out.println(job.getJob_title());
		returnHTML+="<option value='"+job.getJob_title()+"'>"+job.getJob_title()+"</option>";
	}
	returnHTML+="</select>";
	return returnHTML;
		
	
	}
	
}