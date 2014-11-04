package qms.controllers;

import java.security.Principal;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import qms.dao.CustomerFeedbackDAO;
import qms.forms.*;
import qms.model.*;


@Controller
@SessionAttributes({"feedback","fromdate","todate"})
public class FeedbackReportController {

	
	@Autowired
	CustomerFeedbackDAO customerFeedbackDAO;

//report page request passing
@RequestMapping(value = { "/feedback_report" }, method = RequestMethod.GET)
	
	public String addFeedbackreport(HttpSession session,ModelMap model, Principal principal) {
	model.addAttribute("menu","customer");
	session.removeAttribute("feedback");
	session.removeAttribute("fromdate");
	session.removeAttribute("todate");
		return "feedback_report";
}

//Customer feedback report generation
@RequestMapping(value={"/feedbackreport"}, method = RequestMethod.POST)
public ModelAndView view_feedbackreport(HttpServletResponse response,HttpSession session,HttpServletRequest request, ModelMap model, Principal principal,CustomerFeedback customerFeedback ) {
	String[] fields={"date_of_feedback","type_of_feedback","feedback_recorded_by","feedback_details"};
	java.util.List<CustomerFeedback> maintenances=new ArrayList<CustomerFeedback>();
	session.setAttribute("feedback", customerFeedback.getType_of_feedback());
	System.out.println("type of feeback ="+customerFeedback.getType_of_feedback());
	String from_date=request.getParameter("from_date");
	session.setAttribute("fromdate", from_date);
	String to_date=request.getParameter("to_date");
	session.setAttribute("todate", to_date);
	System.out.println("from_date"+from_date);
	

	System.out.println("customerfeed"+customerFeedback.getType_of_feedback());
	maintenances = customerFeedbackDAO.getfeedback_report(customerFeedback.getType_of_feedback(),from_date,to_date);
	System.out.println(maintenances.size());
	System.out.println("type of report"+customerFeedback.getType_of_feedback());
	model.addAttribute("maintenances",maintenances);
	model.addAttribute("menu","customer");
	response.setHeader("Content-Disposition","attachment;filename='Customer_Report'");
	ModelAndView modelAndView =  new ModelAndView("customerfeedbackDAO","customerFeedbacks",maintenances);
	modelAndView.addObject("fields",fields);
	return modelAndView;
	//return "feedback_report";
}

//report generation request passing
@RequestMapping(value ={ "/feedbackexport" }, method = RequestMethod.GET)
public ModelAndView getExcel_view() {
java.util.List<CustomerFeedback> customerFeedbacks=new ArrayList<CustomerFeedback>();

customerFeedbacks=customerFeedbackDAO.getCustomersfeedbacks();

return new ModelAndView("customerfeedbackDAO","customerFeedbacks",customerFeedbacks);

}

}
