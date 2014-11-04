package qms.controllers;
 
 

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;

import qms.dao.MainDAO;
import qms.forms.ParticipantsDetailsForm;
import qms.forms.UserProfileForm;
import qms.model.*;

//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;

 
 
@Controller
@SessionAttributes({"role"})
public class MainController {
	
	@Autowired  
	MainDAO mainDAO; 
	@Autowired  
	EmailSender emailSender;
	@Autowired  
	TwilioSMS messageSender;
	
	//private static final Logger logger = LoggerFactory.getLogger(MainController.class); //Logger
	
 
	@RequestMapping(value={"/", "/welcome"}, method = RequestMethod.GET)
	//TODO Change to Dashboard
	public String printWelcome(HttpSession session,HttpServletRequest request,ModelMap model, Principal principal ) {
		
		
		int role;
			
		role =	mainDAO.getrole();
		model.addAttribute("role",role);
	    session.setAttribute("role", role);
		
		ParticipantsDetailsForm participantsDetailsForm = new ParticipantsDetailsForm();
		participantsDetailsForm.setParticipantsDetails(mainDAO.getParticipants());
        model.addAttribute("participantsDetailsForm", participantsDetailsForm);
        model.addAttribute("menu","dashboard");
		return "dashboard";
 
	}
	
	//user login request passing
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String login(ModelMap model) {
		return "login";
 
	}
	
	//Request passing method for failed the user login
	@RequestMapping(value="/loginfailed", method = RequestMethod.GET)
	public String loginerror(ModelMap model) {
		model.addAttribute("error", "true");
		return "login";
 
	}
	
	//Request method for logout operation 
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logout(ModelMap model) {
		return "login";
 
	}
	
	//Request method for creating a new user
	@RequestMapping(value="/createuser", method=RequestMethod.GET)
	public String createSpitterProfile(Model model) {
		model.addAttribute(new UserProfile());
	return "edit";
	}
	
	//submit the user login
	/*@RequestMapping(value="/submituser", method=RequestMethod.POST)
	public String addUserProfileFromForm(UserProfile userProfile) {
		
		System.out.println("Save User" + userProfile.getFullName());
		return "/dashboard";
	}*/
	
	
	@RequestMapping(value = { "/ajax_createuserexisterror" }, method = RequestMethod.POST)
	public @ResponseBody String insert_external_correctiveactionserror(HttpSession session,HttpServletResponse response,
			HttpServletRequest request, @RequestParam("username") String username,@RequestParam("email") String email,ModelMap model, Principal principal,UserProfile signup) 
			{
		String returntext="";
		String count=mainDAO.getusername(signup.getUsername());
		int ucount=Integer.parseInt(count);
		String emilcount=mainDAO.getemail(signup.getUsername(),signup.getEmail());
		int ecount=Integer.parseInt(emilcount);
		if(ucount>0)
		{
			model.addAttribute("username","exist");
			return "username";
		}
		if(ecount>0)
		{
			model.addAttribute("email","exist");
			return "email";
		}
		
		return "";
			}
	@RequestMapping(value="/submituser", method = RequestMethod.POST)
	public String insert_signup(HttpSession session,@ModelAttribute("UserProfile")  @Valid UserProfile signup,BindingResult result,ModelMap model) {
		session.setAttribute("signup",signup);
		String count=mainDAO.getusername(signup.getUsername());
		int ucount=Integer.parseInt(count);
		String emilcount=mainDAO.getemail(signup.getUsername(),signup.getEmail());
		int ecount=Integer.parseInt(emilcount);
		if(ucount>0)
		{
			model.addAttribute("username","exist");
			return "edit";
		}
		if(ecount>0)
		{
			model.addAttribute("email","exist");
			return "edit";
		}
		if(result.hasErrors())
		{
			//SignupForm signupForm= new SignupForm();
			UserProfileForm userProfileForm = new UserProfileForm();
			userProfileForm.setUserProfiles(mainDAO.getSignup());
	    	
			model.addAttribute("userProfileForm",userProfileForm);
			model.addAttribute("Success","true");
			return "createuser";
		}
		
		
    	//int h =signDAO.setSignup(signup);
		int h = mainDAO.setSignup(signup);
		UserProfileForm userProfileForm = new UserProfileForm();
		userProfileForm.setUserProfiles(mainDAO.getSignup());
    	model.addAttribute("success","true");
		model.addAttribute("userProfileForm",userProfileForm);

		
		return "login";
	}
	
	
	
	
	
	//this method for show the inserted records
	@RequestMapping(value="/showaddparticipants", method=RequestMethod.GET)
	public String showAddParticipants(ModelMap model) {
		//model.addAttribute(new UserProfile());
		return "addparticipants";
	}
	
	//insert the records
	@RequestMapping(value="/addparticipants", method=RequestMethod.POST)
	public String addParticipants(ModelMap model) {
		//model.addAttribute(new UserProfile());
		return "addparticipants";
	}
	
	//view page request method
	@RequestMapping(value="/viewparticipants", method=RequestMethod.GET)
	public String viewParticipants(ModelMap model) {
		
		return "viewparticipants";
	}
	
	//Request method for Insert the participants group records
	@RequestMapping(value="/showaddparticipantgroups", method=RequestMethod.GET)
	public String showAddParticipantGroups(ModelMap model) {
		
		return "addparticipantgroups";
	}
	
	//Get method for view the participant groups
	@RequestMapping(value="/viewparticipantgroups", method=RequestMethod.GET)
	public String viewParticipantGroups(ModelMap model) {
		
		return "viewparticipantgroups";
	}
	
	//Admin user insertion
	@RequestMapping(value="/showaddadminuser", method=RequestMethod.GET)
	public String showAddadminUser(ModelMap model) {
		
		return "addadminuser";
	}
	
	//view the admin user page
	@RequestMapping(value="/viewadminuser", method=RequestMethod.GET)
	public String viewAdminUser(ModelMap model) {
		
		return "viewadminuser";
	}
	
	//Request method for admin activity
	@RequestMapping(value="/activityofadmin", method=RequestMethod.GET)
	public String activityOfAdmin(ModelMap model) {
		
		return "activityofadmin";
	}
	
	//Request method for message settings
	@RequestMapping(value="/textmsgsettings", method=RequestMethod.GET)
	public String textMsgSettings(ModelMap model) {
		
		return "sample_modal";
	}
  }