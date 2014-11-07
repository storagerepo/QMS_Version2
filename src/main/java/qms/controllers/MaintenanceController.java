package qms.controllers;

import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;

import qms.dao.FileHandlingDAO;
import qms.dao.HRandTrainingDAO;
import qms.dao.InstructionMaintenanceDAO;
import qms.dao.MaintenanceDAO;
import qms.dao.ReferenceMaintenanceDAO;
import qms.forms.DocumentMainForm;
import qms.forms.DocumentTypeForm;
import qms.forms.HRandTrainingForm;
import qms.forms.MaintenanceForm;
import qms.forms.ProcessForm;
import qms.forms.ReferenceMaintenance_Form;
import qms.model.*;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


@Controller
@SessionAttributes({"maintenances","equipid","equipname","id","name"})
public class MaintenanceController {
	@Autowired
	MaintenanceDAO maintenanceDAO;
	@Autowired
	ReferenceMaintenanceDAO referenceMaintenanceDAO;
	@Autowired
	InstructionMaintenanceDAO instructionMaintenanceDAO;
	@Autowired
	HRandTrainingDAO hRandTrainingDAO;
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@RequestMapping(value = { "/add_maintenance" }, method = RequestMethod.GET)
	
	public String addMaintenance(HttpSession session,ModelMap model,Maintenance maintenance, Principal principal) {
		
		session.setAttribute("maintenances", maintenance);
		HRandTrainingForm hRandTrainingForm = new HRandTrainingForm();
		hRandTrainingForm.sethRandTrainings(hRandTrainingDAO.getNameCalibration());
		model.addAttribute("hRandTrainingForm",hRandTrainingForm);
		
		session.removeAttribute("maintenances");
		model.addAttribute("menu","maintenance");
		return "add_maintenance";
	}
	
	
	

	//search for record in view 
	@RequestMapping(value={"/search_maintenance"}, method = RequestMethod.GET)
	
	public String search_maintenance(@RequestParam("equipment_id") String equipment_id,@RequestParam("equipment_name") String equipment_name,ModelMap model,HttpSession session, Principal principal)
{
	System.out.println(equipment_id);
	session.setAttribute("equipid",equipment_id);
	session.setAttribute("equipname",equipment_name);
	
	
    
    	MaintenanceForm maintenanceForm=new MaintenanceForm();
    	maintenanceForm.setMaintenance(maintenanceDAO.search_maintenance(equipment_id,equipment_name,1));
		model.addAttribute("noofpages",(int) Math.ceil(maintenanceDAO.FindMaintenance(equipment_id, equipment_name) * 1.0 / 5));	 
		model.addAttribute("button","viewall");
		model.addAttribute("success","false");
		model.addAttribute("currentpage",1);
    	model.addAttribute("maintenanceForm",maintenanceForm);
    	model.addAttribute("menu","maintenance");
		
	//return "view_maintenance";
return "maintenance_list";
}
	
	//Search operation for admin setup
	@RequestMapping(value = "/search_maintenances", method = RequestMethod.GET)
	public String search_maintenances(@RequestParam("equipment_id") String equipment_id,@RequestParam("equipment_name") String equipment_name,ModelMap model, Principal principal,HttpSession session)
	{
		System.out.println("equip id====" +equipment_id);
		System.out.println("equip name==="+equipment_name);
		System.out.println(equipment_id);
		session.setAttribute("equipid",equipment_id);
		session.setAttribute("equipname",equipment_name);
		
		
	    
	    	MaintenanceForm maintenanceForm=new MaintenanceForm();
	    	maintenanceForm.setMaintenance(maintenanceDAO.search_maintenance(equipment_id,equipment_name,1));
			model.addAttribute("noofpages",(int) Math.ceil(maintenanceDAO.FindMaintenance(equipment_id, equipment_name) * 1.0 / 5));	 
			model.addAttribute("button","viewall");
			model.addAttribute("success","false");
			model.addAttribute("currentpage",1);
	    	model.addAttribute("maintenanceForm",maintenanceForm);
	    	model.addAttribute("menu","admin");	
		return "maintenancedelete";
		}

	//Search operation results pagination created on 28-june-2014.
	@RequestMapping(value="/viewdeletemaintenancereport_page", method=RequestMethod.GET)
	public String viewdeletemaintenancereport_page(HttpServletRequest request,HttpSession session,@RequestParam("page") int page,@RequestParam("equipment_id") String equipment_id,@RequestParam("equipment_name") String equipment_name,ModelMap model) {	
		
		session.setAttribute("equipid",equipment_id);
		session.setAttribute("equipname",equipment_name);
		MaintenanceForm maintenanceForm=new MaintenanceForm();
    	maintenanceForm.setMaintenance(maintenanceDAO.search_maintenance(equipment_id,equipment_name,page));
		model.addAttribute("noofpages",(int) Math.ceil(maintenanceDAO.FindMaintenance(equipment_id, equipment_name) * 1.0 / 5));	 
    	model.addAttribute("maintenanceForm",maintenanceForm);
	  	model.addAttribute("noofrows",5);   
	    model.addAttribute("currentpage",page);
	    model.addAttribute("menu","admin");
	    model.addAttribute("button","viewall");
	    
	    return "maintenancedelete";
		
	}


	@RequestMapping(value={"/viewalldeletemaintenancereport"}, method = RequestMethod.GET)
	public String viewalldeletemaintenancereport(HttpServletRequest request,HttpSession session,@RequestParam("equipment_id") String equipment_id,@RequestParam("equipment_name") String equipment_name,ModelMap model, Principal principal ) {
		
		session.setAttribute("equipid",equipment_id);
		session.setAttribute("equipname",equipment_name);
		MaintenanceForm maintenanceForm=new MaintenanceForm();
    	maintenanceForm.setMaintenance(maintenanceDAO.search_maintenance(equipment_id,equipment_name,0));
		model.addAttribute("maintenanceForm",maintenanceForm);
	    model.addAttribute("menu","admin");
	    model.addAttribute("button","close");
	      
	    	model.addAttribute("menu","admin");
	        model.addAttribute("success","false");
	        model.addAttribute("button","close");
	        return "maintenancedelete";

	}
	@RequestMapping(value = { "/ajax_existerror" }, method = RequestMethod.POST)
	public @ResponseBody String insert_external_correctiveactionserror(HttpSession session,HttpServletResponse response,
			HttpServletRequest request, @RequestParam("equipment_id") String equipmentid,ModelMap model, Principal principal,Maintenance maintenance) 
			{
		String returntext="";
		if(maintenanceDAO.edit_maintenance(maintenance.getEquipment_id()))
		{		
			
			returntext="Equipment ID already exist";			
	        return returntext;
		}
		
		return "";
			}
	
	
	//Insert a record
	@RequestMapping(value = "/add_maintenance", method = RequestMethod.POST)
	public String postMaintenance(HttpSession session,@ModelAttribute("Maintenance") @Valid Maintenance maintenance,BindingResult result, ModelMap model) {

		session.setAttribute("maintenances",maintenance);
		HRandTrainingForm hRandTrainingForm = new HRandTrainingForm();
		hRandTrainingForm.sethRandTrainings(hRandTrainingDAO.getNameCalibration());
		model.addAttribute("hRandTrainingForm",hRandTrainingForm);
		
		String weekly="",monthly="",quarterly,semiannualy,annualy;
		
		/*if (result.hasErrors())
			{
				MaintenanceForm maintenanceForm= new MaintenanceForm();
				maintenanceForm.setMaintenance(maintenanceDAO.getmaintenance());
				model.addAttribute("maintenanceForm",maintenanceForm);
				
		        return "add_maintenance";
			}*/
			MaintenanceForm maintenanceForm= new MaintenanceForm();
			
			if(maintenanceDAO.edit_maintenance(maintenance.getEquipment_id()))
			{
				
				maintenanceForm.setMaintenance(maintenanceDAO.getmaintenance());
				model.addAttribute("maintenanceForm",maintenanceForm);
				model.addAttribute("success","exist");
		        return "add_maintenance";
			}
			
			
		maintenanceDAO.insert_maintenance(maintenance);
		
		maintenanceForm.setMaintenance(maintenanceDAO.getmaintenance());
	//	model.addAttribute("maintenanceForm",maintenanceForm);
		model.addAttribute("menu","maintenance");
		model.addAttribute("success","true");
		model.addAttribute("justcame",false);
		session.removeAttribute("equipid");
		session.removeAttribute("equipname");
		return "maintenance_list";
	}
	
	//maintenance report list page
	@RequestMapping(value="/maintenance_list", method=RequestMethod.GET)
	public String maintenancelist(HttpSession session,HttpServletRequest request,ModelMap model, Principal principal) {
		session.removeAttribute("equipid");
		session.removeAttribute("equipname");
		
		MaintenanceForm maintenanceForm= new MaintenanceForm(); 
		model.addAttribute("menu","maintenance");
		model.addAttribute("justcame",false);
		
	  	//model.addAttribute("noofrows",5);
		
		
		maintenanceForm.setMaintenance(maintenanceDAO.getlimitedmaintenancereport(1));
		//model.addAttribute("noofpages",(int) Math.ceil(maintenanceDAO.getnoofmaintenancereport() * 1.0 / 5));	 
      //  model.addAttribute("button","viewall");
      //  model.addAttribute("success","false");
      //  model.addAttribute("currentpage",1);
		//model.addAttribute("maintenanceForm",maintenanceForm);
		
		return "maintenance_list";
	}
	
	//maintenance report list page
	@RequestMapping(value="/equipment_list", method=RequestMethod.GET)
	public String equipmentlist(HttpSession session,HttpServletRequest request,ModelMap model, Principal principal) {
		session.removeAttribute("equipid");
		session.removeAttribute("equipname");
		
		MaintenanceForm maintenanceForm= new MaintenanceForm(); 
		model.addAttribute("menu","maintenance");
		model.addAttribute("justcame",false);
		
	  	//model.addAttribute("noofrows",10);
		
		
		maintenanceForm.setMaintenance(maintenanceDAO.getlimitedmaintenancereport(1));
		model.addAttribute("noofpages",(int) Math.ceil(maintenanceDAO.getnoofmaintenancereport() * 1.0 /10));	 
		model.addAttribute("button","viewall");
        model.addAttribute("success","false");
        model.addAttribute("currentpage",1);
		model.addAttribute("maintenanceForm",maintenanceForm);
		
		return "equipment_list";
	}



	@RequestMapping(value="/viewmaintenancereport_page", method=RequestMethod.GET)
	public String viewmaintenancereport_page(HttpServletRequest request,HttpSession session,@RequestParam("page") int page,@RequestParam("equipment_id") String equipment_id,@RequestParam("equipment_name") String equipment_name,ModelMap model) {	
		
		session.setAttribute("equipid",equipment_id);
		session.setAttribute("equipname",equipment_name);
		MaintenanceForm maintenanceForm=new MaintenanceForm();
    	maintenanceForm.setMaintenance(maintenanceDAO.search_maintenance(equipment_id,equipment_name,page));
		model.addAttribute("noofpages",(int) Math.ceil(maintenanceDAO.FindMaintenance(equipment_id, equipment_name) * 1.0 / 5));	 
    	model.addAttribute("maintenanceForm",maintenanceForm);
	  	model.addAttribute("noofrows",5);   
	    model.addAttribute("currentpage",page);
	    model.addAttribute("menu","maintenance");
	    model.addAttribute("button","viewall");
	    
	    return "maintenance_list";
		
	}
	//list view equipments 
	@RequestMapping(value="/viewequipmentreport_page", method=RequestMethod.GET)
	public String viewequipmentreport_page(HttpServletRequest request,HttpSession session,@RequestParam("page") int page,ModelMap model) {	
		
		
		MaintenanceForm maintenanceForm=new MaintenanceForm();
    	maintenanceForm.setMaintenance(maintenanceDAO.getlimitedmaintenancereport(page));
		model.addAttribute("noofpages",(int) Math.ceil(maintenanceDAO.getnoofmaintenancereport() * 1.0 / 10));	 
    	model.addAttribute("maintenanceForm",maintenanceForm);
	  	model.addAttribute("noofrows",10);   
	    model.addAttribute("currentpage",page);
	    model.addAttribute("menu","maintenance");
	    model.addAttribute("button","viewall");
	    
	    return "equipment_list";
		
	}


	@RequestMapping(value={"/viewallmaintenancereport"}, method = RequestMethod.GET)
	public String viewallmaintenancereport(HttpServletRequest request,HttpSession session,@RequestParam("equipment_id") String equipment_id,@RequestParam("equipment_name") String equipment_name,ModelMap model, Principal principal ) {
		
		session.setAttribute("equipid",equipment_id);
		session.setAttribute("equipname",equipment_name);
		MaintenanceForm maintenanceForm=new MaintenanceForm();
    	maintenanceForm.setMaintenance(maintenanceDAO.search_maintenance(equipment_id,equipment_name,0));
		model.addAttribute("maintenanceForm",maintenanceForm);
	    model.addAttribute("menu","maintenance");
	    model.addAttribute("button","close");
	      
	    	model.addAttribute("menu","maintenance");
	        model.addAttribute("success","false");
	        model.addAttribute("button","close");
	        return "maintenance_list";

	}
	//view all equipments
	@RequestMapping(value={"/viewallequipmentreport"}, method = RequestMethod.GET)
	public String viewallequipmentreport(HttpServletRequest request,HttpSession session,ModelMap model, Principal principal ) {
		
		MaintenanceForm maintenanceForm=new MaintenanceForm();
    	maintenanceForm.setMaintenance(maintenanceDAO.listallequipments());
		model.addAttribute("maintenanceForm",maintenanceForm);
	    model.addAttribute("menu","maintenance");
	    model.addAttribute("button","close");
	      
	    	model.addAttribute("menu","maintenance");
	        model.addAttribute("success","false");
	        model.addAttribute("button","close");
	        return "equipment_list";

	}


	//view records
	@RequestMapping(value="/view_maintenance", method=RequestMethod.GET)
	public String viewmaintenance(HttpServletRequest request,@RequestParam("equipment_id") String equipment_id,ModelMap model,Maintenance maintenance)
	{
		MaintenanceForm maintenanceForm= new MaintenanceForm();
		maintenanceForm.setMaintenance(maintenanceDAO.getmaintenance(equipment_id));
		model.addAttribute("maintenanceForm",maintenanceForm);
		model.addAttribute("menu","maintenance");
		return "view_maintenance";
	}
	
	//Edit a record
	@RequestMapping(value = "/edit_maintenance", method = RequestMethod.GET)
	public String editmaintenance_get(HttpServletResponse response,HttpServletRequest request,@RequestParam("equipment_id") String equipment_id,Maintenance maintenance,ModelMap model) {

		MaintenanceForm maintenanceForm= new MaintenanceForm();
		maintenanceForm.setMaintenance(maintenanceDAO.getmaintenance(equipment_id));
		model.addAttribute("maintenanceForm",maintenanceForm);
		
		HRandTrainingForm hRandTrainingForm = new HRandTrainingForm();
		hRandTrainingForm.sethRandTrainings(hRandTrainingDAO.getNameCalibration());
		model.addAttribute("hRandTrainingForm",hRandTrainingForm);
		String value = maintenanceForm.getMaintenance().get(0).getFrequency_maintenance_weekly();
		request.setAttribute("frequency", value);
		model.addAttribute("menu","maintenance");
	    return "edit_maintenance";
	}
	
	//Update a record
	@RequestMapping(value = "/update_maintenance", method = RequestMethod.POST)
	public String update_maintenance(HttpSession session,ModelMap model,HttpServletRequest request,@ModelAttribute("Maintenance") @Valid Maintenance maintenance,BindingResult result,@RequestParam("equipment_id") String equipment_id) throws IOException {

		session.removeAttribute("equipid");
		session.removeAttribute("equipname");
		if (result.hasErrors())
		{
			
			/*MaintenanceForm maintenanceForm= new MaintenanceForm();
			maintenanceForm.setMaintenance(maintenanceDAO.getmaintenance(maintenance.getEquipment_id()));
			model.addAttribute("maintenanceForm",maintenanceForm);*/
			MaintenanceForm maintenanceForm= new MaintenanceForm();
			maintenanceForm.setMaintenance(maintenanceDAO.getmaintenance(equipment_id));
			model.addAttribute("maintenanceForm",maintenanceForm);
			
			HRandTrainingForm hRandTrainingForm = new HRandTrainingForm();
			hRandTrainingForm.sethRandTrainings(hRandTrainingDAO.getNameCalibration());
			model.addAttribute("hRandTrainingForm",hRandTrainingForm);
			String value = maintenanceForm.getMaintenance().get(0).getFrequency_maintenance_weekly();
			request.setAttribute("frequency", value);
			model.addAttribute("menu","maintenance");
            return "edit_maintenance";
		}
		
		
		maintenanceDAO.update_maintenance(maintenance);
	    MaintenanceForm maintenanceForm= new MaintenanceForm();
		maintenanceForm.setMaintenance(maintenanceDAO.getmaintenance());
		//model.addAttribute("maintenanceForm",maintenanceForm);
		model.addAttribute("menu","maintenance");
		model.addAttribute("success","update");
		model.addAttribute("justcame",false);
	    return "maintenance_list";
	}
	
	
	//This is used for downloading Excel Sheet
	@RequestMapping(value ={ "/maintenancereport" }, method = RequestMethod.GET)
	  public ModelAndView getExcel_view() {
	java.util.List<Maintenance> maintenances=new ArrayList<Maintenance>();
	
	maintenances=maintenanceDAO.getmaintenance();
	
	return new ModelAndView("maintenanceDAO","maintenances",maintenances);
	
	}
	//report page request passing
	@RequestMapping(value = "/maintenance_report", method = RequestMethod.GET)
	public String reportnonconformance(ModelMap model) {
		  model.addAttribute("menu","maintenance");
		return "report_maintenance";

	}
	
	//Nonconformance Report Generation
	@RequestMapping(value = "/generate_maintenance_report", method = RequestMethod.POST)
	public ModelAndView generatemaintenance_Report(HttpServletRequest request,ModelMap model, HttpServletResponse response)
	{
		int no_of_days=0;
		String[] fields={"equipment_id","equipment_name","equipment_model","serial_number","date_acquired","equipment_status","frequency_maintenance","calibration","type_of_maintenance","maintenance_frequency","reference","due_date","completion_date","completed_by","notes"};
		System.out.println(request.getParameter("type_of_report"));
		System.out.println("switch = "+Integer.parseInt(request.getParameter("doc_type"))+"doc_type= "+request.getParameter("doc_type"));
		java.util.List<Maintenance> maintenances=new ArrayList<Maintenance>();
			switch(Integer.parseInt(request.getParameter("doc_type")))
				  {
		  case 0:
			  maintenances=maintenanceDAO.getMaintenance_bytype("maintain_for_30", no_of_days);
			  break;
		  case 1:
			  no_of_days = Integer.parseInt(request.getParameter("no_of_days"));
			  System.out.println("no_of_days controller="+no_of_days);
			  maintenances=maintenanceDAO.getMaintenance_bytype("upcoming_calibration",no_of_days);
			  break;
		  case 2:
			 
			  maintenances=maintenanceDAO.getMaintenance_bytype("maintenance_past_due",no_of_days);
			  break;
		  case 3:
				 
			  maintenances=maintenanceDAO.getMaintenance_bytype("calibration_past_due",no_of_days);
			  break;
		  default:
			  break;
				  
				
		}
		if(Integer.parseInt(request.getParameter("report_type"))==1)
		{
		
				System.out.println("now ok");
				 response.setHeader("Content-Disposition","attachment;filename='"+request.getParameter("name_of_disposition_responsibility")+"'");
					
				fields=request.getParameterValues("report_field[]");
			
		}
		else
			
		response.setHeader("Content-Disposition","attachment;filename='Maintenance_Report'");
		
		
		ModelAndView modelAndView=new ModelAndView("maintenanceDAO","maintenances",maintenances);
		
		modelAndView.addObject("fields",fields);
		
		System.out.println("now ok::::");
		return modelAndView ;
	}

	
	//delete a record
	@RequestMapping(value = "/delete_maintenance", method = RequestMethod.GET)
	public String deletemaintenance(@RequestParam("equipment_id") String equipment_id,Maintenance maintenance,ModelMap model) {

		maintenanceDAO.delete_maintenance(equipment_id);
		MaintenanceForm maintenanceForm= new MaintenanceForm();
		maintenanceForm.setMaintenance(maintenanceDAO.getmaintenance());
		model.addAttribute("maintenanceForm",maintenanceForm);
		model.addAttribute("menu","maintenance");
		model.addAttribute("justcame","false");
		return "/maintenance_list";
	}
	

	//delete a record for admin setup
	@RequestMapping(value = { "/maintenancedelete" }, method = RequestMethod.GET)
	public String delete_maintenance(ModelMap model, Principal principal, HttpSession session) {
	
		session.removeAttribute("equipid");
		session.removeAttribute("equipname");
		MaintenanceForm maintenanceForm= new MaintenanceForm();
		maintenanceForm.setMaintenance(maintenanceDAO.getmaintenance());
		//model.addAttribute("maintenanceForm",maintenanceForm);
		model.addAttribute("menu","maintenance");
		model.addAttribute("justcame",false);
		return "maintenancedelete";
		
	}
	
	@RequestMapping(value={"/deletemaintenance"}, method = RequestMethod.POST)
	public String deleteSelectedmaintenance(HttpServletRequest request,ModelMap model,Principal principal,HttpSession session) 
	{	

		model.addAttribute("justcame",false);
		session.removeAttribute("equipid");
		session.removeAttribute("equipname");
		
		String[] SelectedIDs=new String[100];
		SelectedIDs=request.getParameterValues("chkUser");
		for(String id:SelectedIDs)
		{
		System.out.println(id);
		
		//formDAO.deleteParticipant(id,principal.getName());
		maintenanceDAO.delete_maintenance(id);
		}
		MaintenanceForm maintenanceForm = new MaintenanceForm();
		maintenanceForm.setMaintenance(maintenanceDAO.getmaintenance());
	//	model.addAttribute("maintenanceForm",maintenanceForm);
        
		model.addAttribute("menu","maintenance");
		model.addAttribute("success","delete");
		return "maintenancedelete";
		
	}
	//ajax get attachment post method
	@RequestMapping(value = { "/ajax_getAttach" }, method = RequestMethod.POST)
	public @ResponseBody String insert_external_correctiveactions(HttpSession session,HttpServletResponse response,
			HttpServletRequest request, @RequestParam("weekly") String weekly,@RequestParam("monthly") String monthly,@RequestParam("quarterly") String quarterly,@RequestParam("semiannually") String semiannually,@RequestParam("annually") String annually,ModelMap model, Principal principal,Reference reference) 
			{
		String returnText="";
		ReferenceMaintenance_Form referenceMaintenance_Form = new ReferenceMaintenance_Form();
		
if(weekly !="")
{
			List <String> referencemain=new ArrayList<String>();
			referencemain=referenceMaintenanceDAO.filterReference(weekly);
			/*referenceMaintenance_Form.setReferences(referenceMaintenanceDAO.getReference(weekly));
			try {
				FileHandlingDAO.filedownload(response, referenceMaintenance_Form.getReferences()
						.get(0).getAttachment_referrence(),  referenceMaintenance_Form.getReferences().get(0).getAttachment_name());
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
*/
			for(String weeklyinstr:referencemain)
			{
				System.out.println("frequency maintenane = "+weekly);
				returnText=returnText+"<a  href='downloadFrequencyFile?id=weekly''>"+weeklyinstr+"</a><input type='hidden' class='input_txtbx' id='reference' name='reference1' value='"+weeklyinstr+"'>";

			}			
			System.out.println(" source of nc:::: "+returnText);
			returnText=returnText+"<split>";
}
if(monthly !="")
{
List <String> referencemain=new ArrayList<String>();
referencemain=referenceMaintenanceDAO.filterReference(monthly);
for(String weeklyinstr:referencemain)
{
	returnText=returnText+"<a  href='downloadFrequencyFile?id=monthly''>"+weeklyinstr+"</a><input type='hidden' class='input_txtbx' id='reference' name='reference1' value='"+weeklyinstr+"'>";

}			
System.out.println(" source of nc:::: "+returnText);
returnText=returnText+"<split>";
}
if(quarterly !="")
{
List <String> referencemain=new ArrayList<String>();
referencemain=referenceMaintenanceDAO.filterReference(quarterly);
for(String weeklyinstr:referencemain)
{
	returnText=returnText+"<a  href='downloadFrequencyFile?id=quarterly''>"+weeklyinstr+"</a><input type='hidden' class='input_txtbx' id='reference' name='reference1' value='"+weeklyinstr+"'>";

}			
System.out.println(" source of nc:::: "+returnText);
returnText=returnText+"<split>";
}
if(semiannually !="")
{
List <String> referencemain=new ArrayList<String>();
referencemain=referenceMaintenanceDAO.filterReference(semiannually);
for(String weeklyinstr:referencemain)
{
	returnText=returnText+"<a  href='downloadFrequencyFile?id=semi-annually''>"+weeklyinstr+"</a><input type='hidden' class='input_txtbx' id='reference' name='reference1' value='"+weeklyinstr+"'>";

}			
System.out.println(" source of nc:::: "+returnText);
returnText=returnText+"<split>";
}
if(annually !="")
{
List <String> referencemain=new ArrayList<String>();
referencemain=referenceMaintenanceDAO.filterReference(annually);
for(String weeklyinstr:referencemain)
{
	returnText=returnText+"<a  href='downloadFrequencyFile?id=annually''>"+weeklyinstr+"</a><input type='hidden' class='input_txtbx' id='reference' name='reference1' value='"+weeklyinstr+"'>";

}			
System.out.println(" source of nc:::: "+returnText);
returnText=returnText+"<split>";
}
System.out.println("Result string = "+returnText);
return returnText;
			}	
	
	@RequestMapping(value = { "/ajax_getAttach1" }, method = RequestMethod.POST)
	public @ResponseBody String insert_external_correctiveactions(HttpSession session,HttpServletResponse response,
			HttpServletRequest request, @RequestParam("weekly") String weekly,ModelMap model, Principal principal,Reference reference) 
			{
		String returnText="";
		ReferenceMaintenance_Form referenceMaintenance_Form = new ReferenceMaintenance_Form();
		
if(weekly !="")
{
			List <String> referencemain=new ArrayList<String>();
			referencemain=referenceMaintenanceDAO.filterReference(weekly);
			/*referenceMaintenance_Form.setReferences(referenceMaintenanceDAO.getReference(weekly));
			try {
				FileHandlingDAO.filedownload(response, referenceMaintenance_Form.getReferences()
						.get(0).getAttachment_referrence(),  referenceMaintenance_Form.getReferences().get(0).getAttachment_name());
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
*/
			for(String weeklyinstr:referencemain)
			{
				System.out.println("frequency maintenane = "+weekly);
				returnText=returnText+"<a  href='downloadFrequencyFile?id=weekly''>"+weeklyinstr+"</a><input type='hidden' class='input_txtbx' id='reference' name='reference1' value='"+weeklyinstr+"'>";

			}			
}
return returnText;
			}
	@RequestMapping(value = { "/ajax_getAttach2" }, method = RequestMethod.POST)
	public @ResponseBody String insert_external_correctiveactions2(HttpSession session,HttpServletResponse response,
			HttpServletRequest request, @RequestParam("monthly") String monthly,ModelMap model, Principal principal,Reference reference) 
			{
		String returnText="";
		ReferenceMaintenance_Form referenceMaintenance_Form = new ReferenceMaintenance_Form();
		if(monthly !="")
		{
		List <String> referencemain=new ArrayList<String>();
		referencemain=referenceMaintenanceDAO.filterReference(monthly);
		for(String weeklyinstr:referencemain)
		{
			returnText=returnText+"<a  href='downloadFrequencyFile?id=monthly''>"+weeklyinstr+"</a><input type='hidden' class='input_txtbx' id='reference' name='reference1' value='"+weeklyinstr+"'>";

		}			
		
		
		}

return returnText;
			}
	
	
	@RequestMapping(value = { "/ajax_getAttach3" }, method = RequestMethod.POST)
	public @ResponseBody String insert_external_correctiveactions3(HttpSession session,HttpServletResponse response,
			HttpServletRequest request, @RequestParam("quarterly") String quarterly,ModelMap model, Principal principal,Reference reference) 
			{
		String returnText="";
		ReferenceMaintenance_Form referenceMaintenance_Form = new ReferenceMaintenance_Form();
		if(quarterly !="")
		{
		List <String> referencemain=new ArrayList<String>();
		referencemain=referenceMaintenanceDAO.filterReference(quarterly);
		for(String weeklyinstr:referencemain)
		{
			returnText=returnText+"<a  href='downloadFrequencyFile?id=quarterly''>"+weeklyinstr+"</a><input type='hidden' class='input_txtbx' id='reference' name='reference1' value='"+weeklyinstr+"'>";

		}			
		
		
		}

return returnText;
			}
	
	
	@RequestMapping(value = { "/ajax_getAttach4" }, method = RequestMethod.POST)
	public @ResponseBody String insert_external_correctiveactions4(HttpSession session,HttpServletResponse response,
			HttpServletRequest request, @RequestParam("semiannually") String semiannually,ModelMap model, Principal principal,Reference reference) 
			{
		String returnText="";
		ReferenceMaintenance_Form referenceMaintenance_Form = new ReferenceMaintenance_Form();
		if(semiannually !="")
		{
		List <String> referencemain=new ArrayList<String>();
		referencemain=referenceMaintenanceDAO.filterReference(semiannually);
		for(String weeklyinstr:referencemain)
		{
			returnText=returnText+"<a  href='downloadFrequencyFile?id=semi-annually''>"+weeklyinstr+"</a><input type='hidden' class='input_txtbx' id='reference' name='reference1' value='"+weeklyinstr+"'>";

		}	
		}

return returnText;
			}
	
	@RequestMapping(value = { "/ajax_getAttach5" }, method = RequestMethod.POST)
	public @ResponseBody String insert_external_correctiveactions5(HttpSession session,HttpServletResponse response,
			HttpServletRequest request, @RequestParam("annually") String annually,ModelMap model, Principal principal,Reference reference) 
			{
		String returnText="";
		ReferenceMaintenance_Form referenceMaintenance_Form = new ReferenceMaintenance_Form();
		if(annually !="")
		{
		List <String> referencemain=new ArrayList<String>();
		referencemain=referenceMaintenanceDAO.filterReference(annually);
		for(String weeklyinstr:referencemain)
		{
			returnText=returnText+"<a  href='downloadFrequencyFile?id=annually''>"+weeklyinstr+"</a><input type='hidden' class='input_txtbx' id='reference' name='reference1' value='"+weeklyinstr+"'>";

		}		
		}

return returnText;
			}
			/*System.out.println(" source of nc:::: "+returnText);
			returnText=returnText+"<split>";
}
			/*
}
if(monthly !="")
{
List <String> referencemain=new ArrayList<String>();
referencemain=referenceMaintenanceDAO.filterReference(monthly);
for(String weeklyinstr:referencemain)
{
	returnText=returnText+"<a  href='downloadFrequencyFile?id=monthly''>"+weeklyinstr+"</a><input type='hidden' class='input_txtbx' id='reference' name='reference2' value='"+weeklyinstr+"'>";

}			
System.out.println(" source of nc:::: "+returnText);
returnText=returnText+"<split>";
}

if(quarterly !="")
{
List <String> referencemain=new ArrayList<String>();
referencemain=referenceMaintenanceDAO.filterReference(quarterly);
for(String weeklyinstr:referencemain)
{
	returnText=returnText+"<a  href='downloadFrequencyFile?id=quarterly''>"+weeklyinstr+"</a><input type='hidden' class='input_txtbx' id='reference' name='reference3' value='"+weeklyinstr+"'>";

}			
System.out.println(" source of nc:::: "+returnText);
returnText=returnText+"<split>";
}
if(semiannually !="")
{
List <String> referencemain=new ArrayList<String>();
referencemain=referenceMaintenanceDAO.filterReference(semiannually);
for(String weeklyinstr:referencemain)
{
	returnText=returnText+"<a  href='downloadFrequencyFile?id=semi-annually''>"+weeklyinstr+"</a><input type='hidden' class='input_txtbx' id='reference' name='reference4' value='"+weeklyinstr+"'>";

}			
System.out.println(" source of nc:::: "+returnText);
returnText=returnText+"<split>";
}
if(annually !="")
{
List <String> referencemain=new ArrayList<String>();
referencemain=referenceMaintenanceDAO.filterReference(annually);
for(String weeklyinstr:referencemain)
{
	returnText=returnText+"<a  href='downloadFrequencyFile?id=annually''>"+weeklyinstr+"</a><input type='hidden' class='input_txtbx' id='reference' name='reference5' value='"+weeklyinstr+"'>";

}			
System.out.println(" source of nc:::: "+returnText);
returnText=returnText+"<split>";
}
System.out.println("Result string = "+returnText);
*/


	
	
	
	//download the Instruction file 19-JUNE-2014 
	@RequestMapping(value = "/downloadFrequencyFile", method = RequestMethod.GET)
	public String downloadFile(HttpServletResponse response,
			@RequestParam("id") String auto_id, ModelMap model)
			throws IOException {
			System.out.println("ajax attachement comes here");
			System.out.println("frequency = "+auto_id);
	    	ReferenceMaintenance_Form referenceMaintenance_Form = new ReferenceMaintenance_Form();
	    	referenceMaintenance_Form.setReferences(referenceMaintenanceDAO.getReference(auto_id));
		

		    FileHandlingDAO.filedownload(response, referenceMaintenance_Form.getReferences()
						.get(0).getAttachment_referrence(),  referenceMaintenance_Form.getReferences().get(0).getAttachment_name());

		    return "add_maintenance";

	}
	@RequestMapping(value = { "/ajax_getinstruction" }, method = RequestMethod.POST)
	public @ResponseBody String getInstructionAttachment(HttpSession session,HttpServletResponse response,
			HttpServletRequest request,ModelMap model, Principal principal,Reference reference) 
			{
		String returnText="";
	
			List <String> instructionmain=new ArrayList<String>();
			String id = "1";
			instructionmain= instructionMaintenanceDAO.filterInstruction(id);
			System.out.println("attachment name"+instructionmain);
			for(String weeklyinstr : instructionmain)
			{
				
				returnText=returnText+"<a  href='downloadFileDown?id=1''><input type='hidden' class='input_txtbx' id='reference' name='instructionattach' value='"+weeklyinstr+"'>"+weeklyinstr+"</input></a>";

			}			
			System.out.println("Result string = "+returnText);
			return returnText;
			}	
	
}