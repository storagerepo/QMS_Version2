package qms.controllers;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;
/* import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;*/

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import qms.dao.ManagementReviewDAO;

//import qms.forms.InternalAuditsForm;
import qms.forms.EmployeeForm;
import qms.forms.MaintenanceForm;
import qms.forms.ManagementReviewForm;
import qms.forms.NonConformanceForm;
//import qms.forms.ManagementReviewChildForm;
//import qms.model.InternalAudits;
//import qms.model.InternalAudits;
import qms.model.InternalAudits;
import qms.model.Maintenance;
import qms.model.ManagementReview;
@Controller
@SessionAttributes({"managementreview"})
public class ManagementReviewController
{
	
	@Autowired
	ManagementReviewDAO managementreviewDAO;
	

@RequestMapping(value={"/addmanagementreview"}, method = RequestMethod.GET)
	
	public String add_managementreview(ModelMap model, Principal principal)  {
	
	model.addAttribute("id", managementreviewDAO.getMax_reviewid());
	model.addAttribute("menu","managementreview");
	return "add_managementreview";

}




@RequestMapping(value="/addmanagementreview", method = RequestMethod.POST)
public String insert_managementreview(HttpSession session,@ModelAttribute("ManagementReview") @Valid ManagementReview managementReview, BindingResult result,ModelMap model, Principal principal)
{
	session.removeAttribute("categoryvalue");
	session.removeAttribute("reviewid");
	session.removeAttribute("managementreviewdate");
	
	session.setAttribute("managementreview",managementReview);
	if(result.hasErrors())
	{
		System.out.println("Errors found");
		model.addAttribute("id", managementreviewDAO.getMax_reviewid());
		model.addAttribute("menu","managementreview");
		return "add_managementreview";
	}
	else
	{
	
	if(!managementreviewDAO.insert_managementreview(managementReview))
	{
		session.removeAttribute("managementreview");
	}
	}
	ManagementReviewForm managementreviewform= new ManagementReviewForm();
	managementreviewform.setManagementreviewdetails(managementreviewDAO.get_managementreview());
	//model.addAttribute("managementreviewform", managementreviewform);
	  model.addAttribute("success","true");
	  model.addAttribute("justcame",false);
		model.addAttribute("menu","managementreview");
	return "view_managementreview";
}



@RequestMapping(value="/view_review", method=RequestMethod.GET)
public String viewmaintenance(HttpServletRequest request,@RequestParam("review_id") String review_id ,ModelMap model,ManagementReview managementreview)
{
	ManagementReviewForm managementreviewform= new ManagementReviewForm();
	managementreviewform.setManagementreviewdetails(managementreviewDAO.get_managementreview());
	model.addAttribute("managementreviewform", managementreviewform);
	model.addAttribute("menu","managementreview");
	return "view_review";
}
  //for EDITING REVIEW 
@RequestMapping(value = "/edit_managementreview", method = RequestMethod.GET)
public String edit_review(@RequestParam("review_id") String review_id,ModelMap model,Principal principal) {
	
	
	ManagementReviewForm managementreviewForm= new ManagementReviewForm();
	managementreviewForm.setManagementreviewdetails(managementreviewDAO.edit_managementreview(review_id));
	model.addAttribute("managementreviewForm", managementreviewForm);
	model.addAttribute("menu","managementreview");
    return "edit_managementreview";
}



//For view review

@RequestMapping(value = "/viewmanagementreview", method = RequestMethod.GET)
public String view_review(HttpSession session,ModelMap model, Principal principal) {
		ManagementReviewForm managementreviewform= new ManagementReviewForm();
		session.removeAttribute("categoryvalue");
		session.removeAttribute("reviewid");
		session.removeAttribute("managementreviewdate");
		model.addAttribute("justcame",false);
	/*managementreviewform.setManagementreviewdetails(managementreviewDAO.get_managementreview());*/	
	model.addAttribute("menu","managementreview");
//	model.addAttribute("noofrows",5);     
	managementreviewform.setManagementreviewdetails(managementreviewDAO.getlimitedmanagementreport(1));
/*	    model.addAttribute("noofpages",(int) Math.ceil(managementreviewDAO.getnoofmanagementreport() * 1.0 / 5));	 
	        model.addAttribute("button","viewall");
	        model.addAttribute("success","false");
	     
	        model.addAttribute("currentpage",1);
*/
	       // model.addAttribute("managementreviewform", managementreviewform);

	return "view_managementreview";
}



@RequestMapping(value="/viewmanagementreport_page", method=RequestMethod.GET)
public String viewmanagementreport_page(HttpServletRequest request,
		@RequestParam("review_id") String review_id,@RequestParam("category") String category,
		@RequestParam("management_review_date") String management_review_date,
		@RequestParam("page") int page,
		ModelMap model,Principal principal) {	
	ManagementReviewForm managementreviewform= new ManagementReviewForm();
	managementreviewform.setManagementreviewdetails(managementreviewDAO.search_managementreviews(review_id, category, management_review_date, page));
	model.addAttribute("noofpages",(int) Math.ceil(managementreviewDAO.Search_Managementreviews(review_id, category, management_review_date) * 1.0 /5));
	model.addAttribute("managementreviewform",managementreviewform);	
	model.addAttribute("noofrows",5);   
 model.addAttribute("currentpage",page);
 model.addAttribute("menu","managementreview");
 model.addAttribute("button","viewall");
 model.addAttribute("success","true");
 return "view_managementreview";
 
	
}


@RequestMapping(value={"/viewallmanagementreport"}, method = RequestMethod.GET)
public String viewallmanagementreport(HttpSession session,HttpServletRequest request,ModelMap model, Principal principal,
		@RequestParam("review_id") String review_id,@RequestParam("category") String category,
		@RequestParam("management_review_date") String management_review_date) {
	session.setAttribute("reviewid",review_id);
	session.setAttribute("categoryvalue",category);
	session.setAttribute("managementreviewdate",management_review_date);
	ManagementReviewForm managementreviewform= new ManagementReviewForm();
	managementreviewform.setManagementreviewdetails(managementreviewDAO.search_managementreviews(review_id, category, management_review_date, 0));
	
	model.addAttribute("managementreviewform", managementreviewform);

	model.addAttribute("noofrows",5);    
//narrativereportForm.getNarrativereport().size()
 model.addAttribute("menu","managementreview");
 model.addAttribute("button","close");
   
 	model.addAttribute("menu","managementreview");
     model.addAttribute("success","false");
     model.addAttribute("button","close");
     return "view_managementreview";

}

//for UPDATING REVIEW 
@RequestMapping(value = "/updatemanagementreview", method = RequestMethod.POST)
public String update_review(HttpSession session,@ModelAttribute("ManagementReview") @Valid ManagementReview managementreview,BindingResult result,ModelMap model,Principal principal) {
	
	session.removeAttribute("categoryvalue");
	session.removeAttribute("reviewid");
	session.removeAttribute("managementreviewdate");
	System.out.println(managementreview.review_id);
	session.setAttribute("managementreview",managementreview);
	session.removeAttribute("categoryvalue");
	session.removeAttribute("reviewid");
	session.removeAttribute("managementreviewdate");
	model.addAttribute("menu","managementreview");
	
	if(result.hasErrors())
	{
		ManagementReviewForm managementreviewForm= new ManagementReviewForm();
		managementreviewForm.setManagementreviewdetails(managementreviewDAO.edit_managementreview(managementreview.review_id));
		model.addAttribute("managementreviewForm", managementreviewForm);
		return "edit_managementreview";

	}
	/*else
	{
		
	    	
	if(!managementreviewDAO.update_managementreview(managementreview))
	{
		System.out.println("success");
		session.invalidate();	

	}
	}
	*/
	managementreviewDAO.update_managementreview(managementreview);
	model.addAttribute("menu", "managementreview");
	ManagementReviewForm managementreviewform= new ManagementReviewForm();
	managementreviewform.setManagementreviewdetails(managementreviewDAO.get_managementreview());
	//model.addAttribute("managementreviewform", managementreviewform);
	 model.addAttribute("success","update");
	model.addAttribute("menu","managementreview");
	 model.addAttribute("justcame",false);
	return "view_managementreview";
}

// for DELETING REVIEW 
	@RequestMapping(value="/delete_managementreview", method = RequestMethod.GET)
	public String delete_review(@RequestParam("review_id") String review_id,ModelMap model, Principal principal )
	{
    
		
		model.addAttribute("justcame","false");
		managementreviewDAO.delete_managementreview(review_id);
		ManagementReviewForm managementreviewform= new ManagementReviewForm();
		managementreviewform.setManagementreviewdetails(managementreviewDAO.get_managementreview());
		model.addAttribute("managementreviewform", managementreviewform);
		model.addAttribute("menu","managementreview");
		 model.addAttribute("success","true");
		return "view_managementreview";
		
 	}
	
   

	
	//This is used for downloading Excel Sheet
	@RequestMapping(value ={ "/managementreviewreport" }, method = RequestMethod.GET)
	  public ModelAndView getExcel_view1() {
	java.util.List<ManagementReview> managementReviews=new ArrayList<ManagementReview>();
	
	managementReviews=managementreviewDAO.get_managementreview();
	
	return new ModelAndView("managementreviewDAO","managementReviews",managementReviews);
	
	}
	//report page request passing
	@RequestMapping(value = "/managementreview_report", method = RequestMethod.GET)
	public String reportmanagementreview(ModelMap model) {
		  model.addAttribute("menu","managementreview");
		return "report_managementreview";

	}
	
	//ManagementReview Report Generation
	@RequestMapping(value = "/generate_managementreview_report", method = RequestMethod.POST)
	public ModelAndView generatemanagementreview_Report(HttpServletRequest request,ModelMap model, HttpServletResponse response,HttpSession session) 
	{
		String start = null,end = null;
		String option = "";
		int i=0;
		String[] fields={"review_id","management_review_date","attendee_list_with_titles","next_management_review_by","category","assessment","report_link","action_needed","action_detail","action_due_date","responsibility","completion_date","continuous_improvement_project"};
		String[] option0 = {"management_review_date","attendee_list_with_titles"};
		String[] option2 = {"responsibility","action_due_date","completion_date"};
		System.out.println(request.getParameter("type_of_report"));
		System.out.println(request.getParameter("start_date"));
		System.out.println(request.getParameter("end_date"));
		String startdate  =request.getParameter("start_date");
		String enddate = request.getParameter("end_date");
		java.util.List<ManagementReview> managementReviews=new ArrayList<ManagementReview>();
			switch(Integer.parseInt(request.getParameter("management_report_type")))
			  {
				  case 0:
					  managementReviews=managementreviewDAO.getmanagement_bytype("management_review_minutes");
					  int len = managementReviews.size();
					  System.out.println("length = "+len);
					  option ="0";
					  //title="management_review_minutes";
					  break;
				  case 1:
					  managementReviews=managementreviewDAO.getmanagement_bytype("upcoming_management_review_memo");
					  int len1 = managementReviews.size();
					  System.out.println("length = "+len1);
					  //title="upcoming_management_review_memo";
					  option ="1";
					  break;
				  case 2:
					  managementReviews=managementreviewDAO.getmanagement_bytype("action_list_beween_dates",startdate,enddate);
					  int len2 = managementReviews.size();
					  System.out.println("length = "+len2);
					  //title="action_list_beween_dates";
					  option ="2";
					  break;
				  case 3:
					  managementReviews=managementreviewDAO.getmanagement_bytype("past_due_action_list");
					  int len3 = managementReviews.size();
					  System.out.println("length = "+len3);
					  //title="past_due_action_list";
					  option ="3";
					  break;
				  case 4:
					  managementReviews=managementreviewDAO.getmanagement_bytype("list_of_continuous_improv_projects");
					  int len4 = managementReviews.size();
					  System.out.println("length = "+len4);
					  //title="list_of_continuous_improv_projects";
					  option ="4";
					  System.out.println("case :"+option);
					  break;
				  default:
					  break;
		}
		if(Integer.parseInt(request.getParameter("report_type"))==1)
		{
		
				System.out.println("now ok");
				 response.setHeader("Content-Disposition","attachment;filename='"+request.getParameter("report_title")+"'");
					i=1;
				fields=request.getParameterValues("report_field[]");
			
		}
		else
			
		response.setHeader("Content-Disposition","attachment;filename='ManagementReview_Report'");
		if(option == "0")
		{
			ModelAndView modelAndView=new ModelAndView("managementreviewDAO","managementReviews",managementReviews);
			
			if(i == 1)
				modelAndView.addObject("fields",fields);
			else{
				session.setAttribute("option",option);
				modelAndView.addObject("fields",option0);
			}
			return modelAndView ;
			
		}
		/*if(option == "1")
		{
			System.out.println("case1  :"+option);
			ModelAndView modelAndView=new ModelAndView("managementreviewDAO","managementReviews",managementReviews);
			if(i == 1)
			modelAndView.addObject("fields",fields);
			else
			{
				session.setAttribute("option",option);
				modelAndView.addObject("fields",option2);
			}
			return modelAndView ;
		}*/
		if(option == "2")
		{
			ModelAndView modelAndView=new ModelAndView("managementreviewDAO","managementReviews",managementReviews);
			System.out.println("case2   :"+option);
			if(i == 1)
				modelAndView.addObject("fields",fields);
			else{
				session.setAttribute("option",option);
			modelAndView.addObject("fields",option2);
			}
			return modelAndView ;
		}
		else{
		ModelAndView modelAndView=new ModelAndView("managementreviewDAO","managementReviews",managementReviews);
		session.setAttribute("option",option);
		modelAndView.addObject("fields",fields);
		return modelAndView ;
		}
		
		
	}
	
	
	//search for record in view 

@RequestMapping(value={"/search_review"}, method = RequestMethod.GET)
public String searchmanagementreviews(HttpSession session,@RequestParam("review_id") String review_id,@RequestParam("category") String category,@RequestParam("management_review_date") String management_review_date,ModelMap model, Principal principal)
{
	System.out.println(review_id);
	
	session.setAttribute("reviewid",review_id);
	session.setAttribute("categoryvalue",category);
	session.setAttribute("managementreviewdate",management_review_date);
	ManagementReviewForm managementreviewform= new ManagementReviewForm();
	managementreviewform.setManagementreviewdetails(managementreviewDAO.search_managementreviews(review_id, category, management_review_date,1));
	model.addAttribute("noofpages",(int) Math.ceil(managementreviewDAO.Search_Managementreviews(review_id, category, management_review_date) * 1.0 /5));
	model.addAttribute("button","viewall");
	model.addAttribute("success","false");
	model.addAttribute("currentpage",1);
	model.addAttribute("managementreviewform",managementreviewform);
	model.addAttribute("menu","managementreview");
	return "view_managementreview";

}
	
//delete a record for admin setup
@RequestMapping(value={"/managementdelete"}, method = RequestMethod.GET)
public String delete_management(ModelMap model, Principal principal,HttpSession session )
{
	model.addAttribute("justcame","false");
	session.removeAttribute("reviewid");
	session.removeAttribute("categoryvalue");
	session.removeAttribute("managementreviewdate");
	ManagementReviewForm managementreviewform= new ManagementReviewForm();
	managementreviewform.setManagementreviewdetails(managementreviewDAO.get_managementreview());
	//model.addAttribute("managementreviewform", managementreviewform);
			
  	model.addAttribute("noofrows",5);    
   //narrativereportForm.getNarrativereport().size()
    model.addAttribute("menu","managementreview");
    model.addAttribute("button","close");
    model.addAttribute("justcame",false);
   // model.addAttribute("success","true");
    return "managementdelete";
}

//Search Operation for Admin's Setup created on 28-june-2014.

@RequestMapping(value={"/search_reviews"}, method = RequestMethod.GET)
public String searchreviews(HttpSession session,@RequestParam("review_id") String review_id,@RequestParam("category") String category,@RequestParam("management_review_date") String management_review_date,ModelMap model, Principal principal)
{
	System.out.println(review_id);
	
	session.setAttribute("reviewid",review_id);
	session.setAttribute("categoryvalue",category);
	session.setAttribute("managementreviewdate",management_review_date);
	ManagementReviewForm managementreviewform= new ManagementReviewForm();
	managementreviewform.setManagementreviewdetails(managementreviewDAO.search_managementreviews(review_id, category, management_review_date,1));
	model.addAttribute("noofpages",(int) Math.ceil(managementreviewDAO.Search_Managementreviews(review_id, category, management_review_date) * 1.0 /5));
	model.addAttribute("button","viewall");
	model.addAttribute("success","false");
	model.addAttribute("currentpage",1);
	model.addAttribute("managementreviewform",managementreviewform);
	model.addAttribute("menu","managementreview");
	return "managementdelete";

}
//Search Operation Results Pagination for Admin's Setup created on 28-june-2014.
@RequestMapping(value="/viewdeletemanagementreport_page", method=RequestMethod.GET)
public String viewdeletemanagementreport_page(HttpServletRequest request,
		@RequestParam("review_id") String review_id,@RequestParam("category") String category,
		@RequestParam("management_review_date") String management_review_date,
		@RequestParam("page") int page,
		ModelMap model,Principal principal) {	
	ManagementReviewForm managementreviewform= new ManagementReviewForm();
	managementreviewform.setManagementreviewdetails(managementreviewDAO.search_managementreviews(review_id, category, management_review_date, page));
	model.addAttribute("noofpages",(int) Math.ceil(managementreviewDAO.Search_Managementreviews(review_id, category, management_review_date) * 1.0 /5));
	model.addAttribute("managementreviewform",managementreviewform);	
	model.addAttribute("noofrows",5);   
 model.addAttribute("currentpage",page);
 model.addAttribute("menu","managementreview");
 model.addAttribute("button","viewall");
 model.addAttribute("success","true");
 return "managementdelete";
 
	
}

//Search Operation Results Pagination for Admin's Setup created on 28-june-2014.
@RequestMapping(value={"/viewalldeletemanagementreport"}, method = RequestMethod.GET)
public String viewalldeletemanagementreport(HttpSession session,HttpServletRequest request,ModelMap model, Principal principal,
		@RequestParam("review_id") String review_id,@RequestParam("category") String category,
		@RequestParam("management_review_date") String management_review_date) {
	session.setAttribute("reviewid",review_id);
	session.setAttribute("categoryvalue",category);
	session.setAttribute("managementreviewdate",management_review_date);
	ManagementReviewForm managementreviewform= new ManagementReviewForm();
	managementreviewform.setManagementreviewdetails(managementreviewDAO.search_managementreviews(review_id, category, management_review_date, 0));
	
	model.addAttribute("managementreviewform", managementreviewform);

	model.addAttribute("noofrows",5);    
//narrativereportForm.getNarrativereport().size()
 model.addAttribute("menu","admin");
 model.addAttribute("button","close");
   
 	model.addAttribute("menu","managementreview");
     model.addAttribute("success","false");
     model.addAttribute("button","close");
     return "managementdelete";

}


	@RequestMapping(value={"/deletemanagement"}, method = RequestMethod.POST)
public String deleteSelectedmanagement(HttpServletRequest request,ModelMap model,Principal principal,HttpSession session) 
{	
		model.addAttribute("justcame","false");
		session.removeAttribute("reviewid");
		session.removeAttribute("categoryvalue");
		session.removeAttribute("managementreviewdate");
	String[] SelectedIDs=new String[100];
	SelectedIDs=request.getParameterValues("chkUser");
	for(String id:SelectedIDs)
	{
	System.out.println(id);
	
	//formDAO.deleteParticipant(id,principal.getName());
	managementreviewDAO.delete_managementreview(id);
	}
	ManagementReviewForm managementreviewform= new ManagementReviewForm();
	managementreviewform.setManagementreviewdetails(managementreviewDAO.get_managementreview());
//	model.addAttribute("managementreviewform", managementreviewform);
	
	model.addAttribute("menu","managementreview");
	model.addAttribute("success","delete");
	return "managementdelete";
	
}	

	}
