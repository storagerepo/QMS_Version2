package qms.controllers;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.poi.hssf.util.HSSFColor.GOLD;
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

import qms.dao.CorrectiveAndPreventiveActionsDAO;
import qms.dao.FileHandlingDAO;
import qms.dao.HRandTrainingDAO;
import qms.dao.MainDAO;
import qms.dao.NonConformanceDAO;
import qms.dao.ProductId_NCDAO;
import qms.dao.ReferenceMaintenanceDAO;
import qms.dao.ReportedByNCDAO;
import qms.dao.Source_NCDAO;
import qms.dao.Type_of_NC_DAO;
import qms.forms.CorrectiveAndPreventiveActionsForm;
import qms.forms.HRandTrainingForm;
import qms.forms.MaintenanceForm;
import qms.forms.Non_Conformance_SourceForm;
import qms.forms.ProductId_NC_Form;
import qms.forms.Type_of_NC_Form;

import qms.forms.NonConformanceForm;
import qms.model.*;

//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;

@Controller
@SessionAttributes({"nonconformance","id","type"})
public class NonConformanceController {
	@Autowired
	NonConformanceDAO nonConformanceDAO;
	
	@Autowired
	FileHandlingDAO fileHandlingDAO;
	//private static final Logger logger = LoggerFactory.getLogger(MainController.class); // Logger
	@Autowired
	Source_NCDAO sourceNCDAO;
	
	@Autowired
	Type_of_NC_DAO typeNCDAO;
	
	@Autowired
	ProductId_NCDAO productId_NCDAO;
	
	@Autowired
	ReferenceMaintenanceDAO referenceMaintenanceDAO;
	
	@Autowired
	HRandTrainingDAO hRandTrainingDAO;
	
	@Autowired
	ReportedByNCDAO reportedByNCDAO;
	
	@Autowired
	MainDAO mainDAO;
	@Autowired  
	EmailSender emailSender;
	// Request Method for view page
	@RequestMapping(value = { "/view_nonconformance" }, method = RequestMethod.GET)
	public String showNonconformance(HttpSession session, ModelMap model, Principal principal) {
		
		session.removeAttribute("nc");
		session.removeAttribute("typenc");
		
		//model.addAttribute("success","false");
	NonConformanceForm nonConformanceForm = new NonConformanceForm();
		model.addAttribute("menu","nonconformance");
	//	model.addAttribute("noofrows",5);
		nonConformanceForm.setNonconformance(nonConformanceDAO.getlimitednonconformancereport(1));
		/*model.addAttribute("noofpages",(int) Math.ceil(nonConformanceDAO.getnoofnonconformancereport() * 1.0 /5));
		model.addAttribute("button","viewall");
	    model.addAttribute("success","false");
	    model.addAttribute("currentpage",1);
	    */
	    Type_of_NC_Form type_of_NC_Form= new Type_of_NC_Form();
		type_of_NC_Form.setType_of_NCs(typeNCDAO.getType());
		model.addAttribute("type_of_NC_Form",type_of_NC_Form);
		model.addAttribute("justcame",false);
		
		return "view_nonconformance";
	}
	
	

	
	

	@RequestMapping(value="/viewnonconformancereport_page", method=RequestMethod.GET)
	public String viewnonconformancereport_page(HttpServletRequest request,HttpSession session,@RequestParam("page") int page,@RequestParam("id") String id,@RequestParam("type_of_nonconformance") String type_of_nonconformance,ModelMap model) {	
		
		session.setAttribute("nc",id);
		session.setAttribute("typenc",type_of_nonconformance);

		model.addAttribute("justcame",false);
		
		Type_of_NC_Form type_of_NC_Form= new Type_of_NC_Form();
		type_of_NC_Form.setType_of_NCs(typeNCDAO.getType());
		model.addAttribute("type_of_NC_Form",type_of_NC_Form);
		
		
		NonConformanceForm nonConformanceForm = new NonConformanceForm();
    	nonConformanceForm.setNonconformance(nonConformanceDAO.findnonconformance(id, type_of_nonconformance, page));
		model.addAttribute("noofpages",(int) Math.ceil(nonConformanceDAO.FindNonconformance(id, type_of_nonconformance) * 1.0 / 5));	 
    	System.out.println((int) Math.ceil(nonConformanceDAO.FindNonconformance(id, type_of_nonconformance) * 1.0 / 5));
		model.addAttribute("nonConformanceForm",nonConformanceForm);
	  	model.addAttribute("noofrows",5);   
	    model.addAttribute("currentpage",page);
	    model.addAttribute("menu","nonconformance");
	    model.addAttribute("button","viewall");
	    
	    return "view_nonconformance";
		
	}



	@RequestMapping(value={"/viewallnonconformancereport"}, method = RequestMethod.GET)
	public String viewallnonconformanceport(HttpSession session, HttpServletRequest request,@RequestParam("id") String id,@RequestParam("type_of_nonconformance") String type_of_nonconformance,ModelMap model, Principal principal ) {
		

		session.setAttribute("nc",id);
		session.setAttribute("typenc",type_of_nonconformance);

		Type_of_NC_Form type_of_NC_Form= new Type_of_NC_Form();
		type_of_NC_Form.setType_of_NCs(typeNCDAO.getType());
		model.addAttribute("type_of_NC_Form",type_of_NC_Form);
		
		NonConformanceForm nonConformanceForm = new NonConformanceForm();
		nonConformanceForm.setNonconformance(nonConformanceDAO.findnonconformance(id, type_of_nonconformance,0));
		model.addAttribute("nonConformanceForm", nonConformanceForm);
	  	model.addAttribute("noofrows",5);    
	   //narrativereportForm.getNarrativereport().size()
	    model.addAttribute("menu","maintenance");
	    model.addAttribute("button","close");
	      
	    	model.addAttribute("menu","nonconformance");
	        model.addAttribute("success","false");
	        model.addAttribute("button","close");
	        return "view_nonconformance";

	}


	//Request Method for Insert Operation
	@RequestMapping(value = { "/add_nonconformance" }, method = RequestMethod.GET)
	public String addNonconformance_get(HttpSession session,ModelMap model, Principal principal) {
		model.addAttribute("id", nonConformanceDAO.get_maxid());
		session.removeAttribute("nonconformance");
		model.addAttribute("menu","nonconformance");
		
		Non_Conformance_SourceForm conformance_SourceForm = new Non_Conformance_SourceForm();
		conformance_SourceForm.setConformance_Sources(sourceNCDAO.getSource());    
		model.addAttribute("conformance_SourceForm",conformance_SourceForm);
		
		Type_of_NC_Form type_of_NC_Form= new Type_of_NC_Form();
		type_of_NC_Form.setType_of_NCs(typeNCDAO.getType());
		model.addAttribute("type_of_NC_Form",type_of_NC_Form);
		
		ProductId_NC_Form productId_NC_Form = new ProductId_NC_Form();
		productId_NC_Form.setProductIDNCs(productId_NCDAO.getProductId());
		model.addAttribute("productId_NC_Form",productId_NC_Form);
		
		HRandTrainingForm hRandTrainingForm=new HRandTrainingForm();
		hRandTrainingForm.sethRandTrainings(hRandTrainingDAO.getnameList());
		model.addAttribute("hRandTrainingForm",hRandTrainingForm);		
		
		return "add_nonconformance";
	}
	
	// Insert the records into the Database
	@RequestMapping(value = "/add_nonconformance", method = RequestMethod.POST)
	public String addNonconformance_post(HttpSession session,HttpServletRequest request,@ModelAttribute("Nonconformance") @Valid NonConformance nonConformance,BindingResult result,@ModelAttribute("CorrectiveAndPreventiveActions") @Valid CorrectiveAndPreventiveActions correctiveAndPreventiveActions,BindingResult result2,ModelMap model) {
		
		session.removeAttribute("nc");
		session.removeAttribute("typenc");
		model.addAttribute("justcame",false);
		String customerEmail = request.getParameter("customerEmail");
		Type_of_NC_Form type_of_NC_Form= new Type_of_NC_Form();
		type_of_NC_Form.setType_of_NCs(typeNCDAO.getType());
		model.addAttribute("type_of_NC_Form",type_of_NC_Form);
		
		ProductId_NC_Form productId_NC_Form = new ProductId_NC_Form();
		productId_NC_Form.setProductIDNCs(productId_NCDAO.getProductId());
		model.addAttribute("productId_NC_Form",productId_NC_Form);
		
		HRandTrainingForm hRandTrainingForm=new HRandTrainingForm();
		hRandTrainingForm.sethRandTrainings(hRandTrainingDAO.getnameList());
		model.addAttribute("hRandTrainingForm",hRandTrainingForm);		
		
		
		session.setAttribute("nonconformance",nonConformance);
       System.out.println(nonConformance.getCost_of_nonconformance());
       System.out.println(correctiveAndPreventiveActions.getAssigned_team_leader());
		
       if(nonConformance.getCorrective_action_required()=="1")
       {
		if (result.hasErrors()||result2.hasErrors())
			{
			
			model.addAttribute("id",nonConformanceDAO.get_maxid());
				return "add_nonconformance";
			}
       }
       else if(result.hasErrors())
       {
    	   model.addAttribute("id",nonConformanceDAO.get_maxid());
			return "add_nonconformance"; 
       }
       if(!(customerEmail.equals("")))
       {
    	   String bccEmailAddress =  mainDAO.getemail("ROLE_MANAGER"); //QMS manager Email ID
			System.out.println("bccEmailAddress ="+bccEmailAddress);
			emailSender.sendCustomerComplaint(customerEmail,"support@deemsysinc.com",nonConformance,bccEmailAddress);
       }
		nonConformanceDAO.insert_nonconformance(nonConformance,correctiveAndPreventiveActions);
		NonConformanceForm nonConformanceForm=new NonConformanceForm();
		nonConformanceForm.setNonconformance(nonConformanceDAO.get_nonconformance());
	   // model.addAttribute("nonConformanceForm",nonConformanceForm);
	    model.addAttribute("menu","nonconformance");
	    model.addAttribute("success","true");
	    model.addAttribute("justcame",false);
		session.removeAttribute("typenc");
	   return "view_nonconformance";
	}

	//Delete operation
	@RequestMapping(value = "/delete_nonconformance", method = RequestMethod.GET)
	public String deleteNonconformance_get(@RequestParam("id") String id,
			NonConformance nonConformance,ModelMap model) {
		model.addAttribute("justcame","false");
		nonConformanceDAO.delete_nonconformance(id);
		NonConformanceForm nonConformanceForm = new NonConformanceForm();
		nonConformanceForm.setNonconformance(nonConformanceDAO.get_nonconformance());
		model.addAttribute("nonConformanceForm",nonConformanceForm);
		model.addAttribute("menu","nonconformance");
		model.addAttribute("justcame","false");
		return "view_nonconformance";
	}
	
	//Request Method for Edit Operation
	@RequestMapping(value = "/edit_nonconformance", method = RequestMethod.GET)
	public String editNonconformance_get(HttpServletRequest request,@RequestParam("id") String id,
			NonConformance nonConformance,ModelMap model) {

		NonConformanceForm nonConformanceForm=new NonConformanceForm();
		nonConformanceForm.setNonconformance(nonConformanceDAO.edit_nonconformance(id));
	    model.addAttribute("nonConformanceForm",nonConformanceForm);
		
	    Non_Conformance_SourceForm conformance_SourceForm = new Non_Conformance_SourceForm();
		conformance_SourceForm.setConformance_Sources(sourceNCDAO.getSource());    
		model.addAttribute("conformance_SourceForm",conformance_SourceForm);
	    
		Type_of_NC_Form type_of_NC_Form= new Type_of_NC_Form();
		type_of_NC_Form.setType_of_NCs(typeNCDAO.getType());
		model.addAttribute("type_of_NC_Form",type_of_NC_Form);

		ProductId_NC_Form productId_NC_Form = new ProductId_NC_Form();
		productId_NC_Form.setProductIDNCs(productId_NCDAO.getProductId());
		model.addAttribute("productId_NC_Form",productId_NC_Form);
		
		HRandTrainingForm hRandTrainingForm=new HRandTrainingForm();
		hRandTrainingForm.sethRandTrainings(hRandTrainingDAO.getnameList());
		model.addAttribute("hRandTrainingForm",hRandTrainingForm);	
		
		
		
	    model.addAttribute("menu","nonconformance");
	    return "edit_nonconformance";
	}
	
	// Update the values in the database
	@RequestMapping(value = "/update_nonconformance", method = RequestMethod.POST)
	public String editNonconformance_post(ModelMap model,@ModelAttribute("Nonconformance") @Valid NonConformance nonConformance,BindingResult result,HttpSession session) {

		session.removeAttribute("nc");
		session.removeAttribute("typenc");
		Type_of_NC_Form type_of_NC_Form= new Type_of_NC_Form();
		type_of_NC_Form.setType_of_NCs(typeNCDAO.getType());
		model.addAttribute("type_of_NC_Form",type_of_NC_Form);

		ProductId_NC_Form productId_NC_Form = new ProductId_NC_Form();
		productId_NC_Form.setProductIDNCs(productId_NCDAO.getProductId());
		model.addAttribute("productId_NC_Form",productId_NC_Form);
		
		HRandTrainingForm hRandTrainingForm=new HRandTrainingForm();
		hRandTrainingForm.sethRandTrainings(hRandTrainingDAO.getnameList());
		model.addAttribute("hRandTrainingForm",hRandTrainingForm);	
		
		model.addAttribute("justcame",false);
		
		session.removeAttribute("id");
		session.removeAttribute("type");
		if (result.hasErrors())
		{
			
			System.out.println("output");
			NonConformanceForm nonConformanceForm=new NonConformanceForm();
			nonConformanceForm.setNonconformance(nonConformanceDAO.edit_nonconformance(nonConformance.getId()));
			model.addAttribute("nonConformanceForm",nonConformanceForm);	
	        return "edit_nonconformance";
		}
		
		
		nonConformanceDAO.update_nonconformance(nonConformance);
		NonConformanceForm nonConformanceForm=new NonConformanceForm();
		nonConformanceForm.setNonconformance(nonConformanceDAO.get_nonconformance());
		//model.addAttribute("nonConformanceForm",nonConformanceForm);
		model.addAttribute("menu","nonconformance");
		model.addAttribute("success","update");
		session.removeAttribute("typenc");
		return "view_nonconformance";
	}

	//Find Operation
	@RequestMapping(value="/findnonconformance",method=RequestMethod.GET)		
	public String findnonconformance(HttpServletRequest request,HttpSession session,@RequestParam("id") String id,@RequestParam("type_of_nonconformance") String type_of_nonconformance,ModelMap model)
	{
	
		System.out.println("find");
		session.setAttribute("nc", id);
		session.setAttribute("typenc", type_of_nonconformance);
	
		
		Type_of_NC_Form type_of_NC_Form= new Type_of_NC_Form();
		type_of_NC_Form.setType_of_NCs(typeNCDAO.getType());
		model.addAttribute("type_of_NC_Form",type_of_NC_Form);
		
		ProductId_NC_Form productId_NC_Form = new ProductId_NC_Form();
		productId_NC_Form.setProductIDNCs(productId_NCDAO.getProductId());
		model.addAttribute("productId_NC_Form",productId_NC_Form);
		
		HRandTrainingForm hRandTrainingForm=new HRandTrainingForm();
		hRandTrainingForm.sethRandTrainings(hRandTrainingDAO.getnameList());
		model.addAttribute("hRandTrainingForm",hRandTrainingForm);		
		
		
		System.out.println("searching started.......");
			NonConformanceForm nonConformanceForm = new NonConformanceForm();
			nonConformanceForm.setNonconformance(nonConformanceDAO.findnonconformance(id, type_of_nonconformance, 1));
			model.addAttribute("noofpages",(int) Math.ceil(nonConformanceDAO.FindNonconformance(id, type_of_nonconformance) * 1.0 / 5));
			model.addAttribute("button","viewall");
			model.addAttribute("success","false");
			model.addAttribute("currentpage",1);
			model.addAttribute("nonConformanceForm",nonConformanceForm);
			model.addAttribute("menu", "nonconformance");
			System.out.println("finding....");
			return "view_nonconformance";
					
		}
		


// Nonconformance Report list page	
	
	@RequestMapping(value = "list_nonconformance", method = RequestMethod.GET)
	public String list_nonconformance(@RequestParam("id") String id,
			ModelMap model, Principal principal) 
	{
		NonConformanceForm nonConformanceForm = new NonConformanceForm();

		nonConformanceForm.setNonconformance(nonConformanceDAO.list_nonconformance(id));

		model.addAttribute("nonConformanceForm", nonConformanceForm);
		model.addAttribute("menu","nonconformance");
		return "list_nonconformance";
	}

	
	

	//This is used for downloading Excel Sheet
	@RequestMapping(value ={ "/nonconformancereport" }, method = RequestMethod.GET)
	  public ModelAndView getExcel_view() {
	java.util.List<NonConformance> nonConformances=new ArrayList<NonConformance>();
	
	nonConformances=nonConformanceDAO.get_nonconformance();
	
	return new ModelAndView("nonconformanceDAO","nonConformances",nonConformances);
	
	}
	//report page request passing
	@RequestMapping(value = "/nonconformance_report", method = RequestMethod.GET)
	public String reportnonconformance(ModelMap model) {
		  model.addAttribute("menu","nonconformance");
		return "report_nonconformance";

	}
	
	//Nonconformance Report Generation
	@RequestMapping(value = "/generate_nonconformance_report", method = RequestMethod.POST)
	public ModelAndView generatenonnonconformance_Report(HttpServletRequest request,ModelMap model, HttpServletResponse response)
	{
		String start = null,end = null;
		/*String[] fields={"id","source_of_nonconformance","external_id","type_of_nonconformance","product_id",
				"quantity_suspect","nature_of_nonconformance","date_found","reported_by","temporary_action",
				"corrective_action_required","disposition_required","disposition1","disposition_complete_date",
				"name_of_disposition_responsibility","cost_of_nonconformance"};
		*/
		String[] fields = {"id","reported_by","corrective_action_required","cost_of_nonconformance","external_id","source_of_nonconformance",
				"disposition_required","disposition1","type_of_nonconformance","product_id","nature_of_nonconformance",
				"quantity_suspect","disposition_complete_date","date_found","temporary_action","name_of_disposition_responsibility"};
		System.out.println(request.getParameter("type_of_report"));
		java.util.List<NonConformance> nonConformances=new ArrayList<NonConformance>();
		System.out.println(Integer.parseInt(request.getParameter("doc_type")));
			switch(Integer.parseInt(request.getParameter("doc_type")))
				  {
		  case 0:
			  nonConformances=nonConformanceDAO.get_nonconformance_type("opennonconformance",start,end);
			  break;
		  case 1:
			  nonConformances=nonConformanceDAO.get_nonconformance_type("nodispositionover30days","start","end");
			  break;
		  case 2:
			String  startdate=request.getParameter("start");
			String	enddate=request.getParameter("end");
				
				System.out.println(start);
				System.out.println(end);
				String[] split = startdate.split("/");
				String[] split1 = enddate.split("/");
				System.out.println(split1[2]+"-"+split1[0]+"-"+split1[1]);
				System.out.println(split[2]+"-"+split[0]+"-"+split[1]);
				start= split[2]+"-"+split[0]+"-"+split[1];
				end = split1[2]+"-"+split1[0]+"-"+split1[1];
				
			  nonConformances=nonConformanceDAO.get_nonconformance_type("betweendates",start,end);
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
			
		response.setHeader("Content-Disposition","attachment;filename='NonConformance_Report'");
		
		
		ModelAndView modelAndView=new ModelAndView("nonconformanceDAO","nonConformances",nonConformances);
		
		modelAndView.addObject("fields",fields);
		
		System.out.println("now ok::::");
		return modelAndView ;
	}


	// Edit operation for Corrective and Preventive Actions Form
	@RequestMapping(value = { "/edit_correctiveactions" }, method = RequestMethod.GET)
	public String add_corrective(@RequestParam("nc_id") String nc_id,HttpSession session,ModelMap model, Principal principal) {
		
		CorrectiveAndPreventiveActionsForm correctiveAndPreventiveActionsForm = new CorrectiveAndPreventiveActionsForm();
		correctiveAndPreventiveActionsForm.setCorrectiveAndPreventiveActions(nonConformanceDAO.edit_corrective(nc_id));
		model.addAttribute("correctiveAndPreventiveActionsForm", correctiveAndPreventiveActionsForm);
		model.addAttribute("menu","corrective");
		return "edit_correctiveactions";
	}
	
	//Update Operation for Corrective and Preventive Actions Form
	@RequestMapping(value = "/update_corrective", method = RequestMethod.POST)
	public String update_corrective(ModelMap model,CorrectiveAndPreventiveActions correctiveAndPreventiveActions) {

		
		nonConformanceDAO.update_corrective(correctiveAndPreventiveActions);
	   /* MaintenanceForm maintenanceForm= new MaintenanceForm();
		maintenanceForm.setMaintenance(maintenanceDAO.getmaintenance());
		model.addAttribute("maintenanceForm",maintenanceForm);*/
		model.addAttribute("menu","corrective");
	    return "edit_correctiveactions";
	}
	
	
	// View Page for Corrective and Preventive Actions Form
	@RequestMapping(value="/view_correctiveactions", method=RequestMethod.GET)
	public String viewcorrective(HttpServletRequest request,ModelMap model, Principal principal) {
		 
		model.addAttribute("success","false");
		CorrectiveAndPreventiveActionsForm correctiveAndPreventiveActionsForm = new CorrectiveAndPreventiveActionsForm();
		correctiveAndPreventiveActionsForm.setCorrectiveAndPreventiveActions(nonConformanceDAO.get_corrective());
		model.addAttribute("correctiveAndPreventiveActionsForm", correctiveAndPreventiveActionsForm);
		model.addAttribute("menu","corrective");
		return "view_correctiveactions";
	}

	//delete a record for admin setup
		@RequestMapping(value={"/nonconformancedelete"}, method = RequestMethod.GET)
		public String delete_nonconformance(ModelMap model, Principal principal,HttpSession session )
		{
			
			model.addAttribute("justcame","false");
		    Type_of_NC_Form type_of_NC_Form= new Type_of_NC_Form();
			type_of_NC_Form.setType_of_NCs(typeNCDAO.getType());
			model.addAttribute("type_of_NC_Form",type_of_NC_Form);
			NonConformanceForm nonConformanceForm = new NonConformanceForm();
			nonConformanceForm.setNonconformance(nonConformanceDAO.get_nonconformance());
		//	model.addAttribute("nonConformanceForm",nonConformanceForm);
					
		  	model.addAttribute("noofrows",5);    
		   //narrativereportForm.getNarrativereport().size()
		    model.addAttribute("menu","nonconformance");
		    model.addAttribute("button","close");
		    model.addAttribute("justcame",false);
		    session.removeAttribute("id");
			session.removeAttribute("type");
		    return "nonconformancedelete";
		}

		//Admin Set up search operation created on 28-jun-2014(3.34pm).
		@RequestMapping(value="/findnonconformances",method=RequestMethod.GET)		
		public String findnonconformances(HttpServletRequest request,HttpSession session,@RequestParam("id") String id,@RequestParam("type_of_nonconformance") String type_of_nonconformance,ModelMap model)
		{
		
			session.setAttribute("id", id);
			session.setAttribute("type", type_of_nonconformance);
		
			Type_of_NC_Form type_of_NC_Form= new Type_of_NC_Form();
			type_of_NC_Form.setType_of_NCs(typeNCDAO.getType());
			model.addAttribute("type_of_NC_Form",type_of_NC_Form);
			
			ProductId_NC_Form productId_NC_Form = new ProductId_NC_Form();
			productId_NC_Form.setProductIDNCs(productId_NCDAO.getProductId());
			model.addAttribute("productId_NC_Form",productId_NC_Form);
			
			HRandTrainingForm hRandTrainingForm=new HRandTrainingForm();
			hRandTrainingForm.sethRandTrainings(hRandTrainingDAO.getnameList());
			model.addAttribute("hRandTrainingForm",hRandTrainingForm);		
			
			System.out.println("searching started.......");
				NonConformanceForm nonConformanceForm = new NonConformanceForm();
				nonConformanceForm.setNonconformance(nonConformanceDAO.findnonconformance(id, type_of_nonconformance, 1));
				model.addAttribute("noofpages",(int) Math.ceil(nonConformanceDAO.FindNonconformance(id, type_of_nonconformance) * 1.0 / 5));
				model.addAttribute("button","viewall");
				model.addAttribute("success","false");
				model.addAttribute("currentpage",1);
				model.addAttribute("nonConformanceForm",nonConformanceForm);
				model.addAttribute("menu", "nonconformance");
				System.out.println("finding....");

				return "nonconformancedelete";
			
			}

		//Admin Setup pagination created on 28-june-2014(3.40pm).
		@RequestMapping(value="/viewdeletenonconformancereport_page", method=RequestMethod.GET)
		public String viewdeletenonconformancereport_page(HttpServletRequest request,HttpSession session,@RequestParam("page") int page,@RequestParam("id") String id,@RequestParam("type_of_nonconformance") String type_of_nonconformance,ModelMap model) {	
			
			session.setAttribute("id",id);
			session.setAttribute("type",type_of_nonconformance);

			Type_of_NC_Form type_of_NC_Form= new Type_of_NC_Form();
			type_of_NC_Form.setType_of_NCs(typeNCDAO.getType());
			model.addAttribute("type_of_NC_Form",type_of_NC_Form);
			
			NonConformanceForm nonConformanceForm = new NonConformanceForm();
	    	nonConformanceForm.setNonconformance(nonConformanceDAO.findnonconformance(id, type_of_nonconformance, page));
			model.addAttribute("noofpages",(int) Math.ceil(nonConformanceDAO.FindNonconformance(id, type_of_nonconformance) * 1.0 / 5));	 
	    	model.addAttribute("nonConformanceForm",nonConformanceForm);
		  	model.addAttribute("noofrows",5);   
		    model.addAttribute("currentpage",page);
		    model.addAttribute("menu","nonconformance");
		    model.addAttribute("button","viewall");
		    
		    return "nonconformancedelete";
			
		}


		//Admin Setup pagination created on 28-june-2014(4pm)
		@RequestMapping(value={"/viewalldeletenonconformancereport"}, method = RequestMethod.GET)
		public String viewalldeletenonconformanceport(HttpSession session, HttpServletRequest request,@RequestParam("id") String id,@RequestParam("type_of_nonconformance") String type_of_nonconformance,ModelMap model, Principal principal ) {
			

			session.setAttribute("id",id);
			session.setAttribute("type",type_of_nonconformance);

			Type_of_NC_Form type_of_NC_Form= new Type_of_NC_Form();
			type_of_NC_Form.setType_of_NCs(typeNCDAO.getType());
			model.addAttribute("type_of_NC_Form",type_of_NC_Form);
			
			NonConformanceForm nonConformanceForm = new NonConformanceForm();
			nonConformanceForm.setNonconformance(nonConformanceDAO.findnonconformance(id, type_of_nonconformance,0));
			model.addAttribute("nonConformanceForm", nonConformanceForm);
		  	model.addAttribute("noofrows",5);    
		   //narrativereportForm.getNarrativereport().size()
		    model.addAttribute("menu","nonconformance");
		    model.addAttribute("button","close");
		      
		    	model.addAttribute("menu","nonconformance");
		        model.addAttribute("success","false");
		        model.addAttribute("button","close");
		        return "nonconformancedelete";

		}




			@RequestMapping(value={"/deletenonconformance"}, method = RequestMethod.POST)
		public String deleteSelectednonconformance(HttpServletRequest request,ModelMap model,Principal principal,HttpSession session) 
		{	
				model.addAttribute("justcame","false");
				session.removeAttribute("id");
				session.removeAttribute("type");
				
			String[] SelectedIDs=new String[100];
			SelectedIDs=request.getParameterValues("chkUser");
			for(String id:SelectedIDs)
			{
			System.out.println(id);
			
			//formDAO.deleteParticipant(id,principal.getName());
			nonConformanceDAO.delete_nonconformance(id);
			}
			NonConformanceForm nonConformanceForm = new NonConformanceForm();
			nonConformanceForm.setNonconformance(nonConformanceDAO.get_nonconformance());
			//model.addAttribute("nonConformanceForm",nonConformanceForm);
	     
			model.addAttribute("menu","nonconformance");
			model.addAttribute("success","delete");
			return "nonconformancedelete";
			
		}	
			//ajax get typeofnc post method created on 22-june-2014.(1.53pm)
			@RequestMapping(value = { "/ajax_gettypenc" }, method = RequestMethod.POST)
			public @ResponseBody String insert_external_typenc(HttpSession session,
					HttpServletRequest request, @RequestParam("type_of_nonconformance") String type_of_nonconformance,@RequestParam("group_person") String group_person,ModelMap model, Principal principal,ReportedByNC reportedByNC) {
				List<String> resultHTML=new ArrayList<String>();
				System.out.println(" type of nc:::: "+type_of_nonconformance);
				System.out.println("khhjjhhjhjhj"+type_of_nonconformance);
				resultHTML=(reportedByNCDAO.filtertypeofnc(type_of_nonconformance));
				//resultHTML=resultHTML+"/n"+resultHTML+"\n"+resultHTML;
				System.out.println("result html:::::"+resultHTML);
				 
				String returnText="";
				returnText=returnText+"<select name='reported_by' class='input_txtbx' id='reported_id'>";
			 	
				System.out.println("Group Person"+group_person);
				returnText+="<option value=''>-Select-</option>";
				for(String typenc:resultHTML)
				{
					returnText+="<option value='"+typenc+"'";
					
					if(typenc.equals(group_person))
					{
						returnText+=" selected";
					}
					returnText+=">"+typenc+"</option>";
					}			
				  
			   returnText=returnText+"</select>";
			   returnText=returnText+"<br>"+"<span id='reporterr' style='color:red;'></span>";
				return returnText;
			}

/*			//ajax get typeofnc post method created on 22-june-2014.(1.53pm)
			@RequestMapping(value = { "/ajax_edittypenc" }, method = RequestMethod.POST)
			public @ResponseBody String edit_external_typenc(HttpSession session,
					HttpServletRequest request, @RequestParam("type_of_nonconformance") String type_of_nonconformance,@RequestParam("group_person") String group_person,ModelMap model, Principal principal,ReportedByNC reportedByNC) {
				List<String> resultHTML=new ArrayList<String>();
				System.out.println(" type of nc:::: "+type_of_nonconformance);
				System.out.println("khhjjhhjhjhj"+type_of_nonconformance);
				resultHTML=(reportedByNCDAO.filtertypeofnc(type_of_nonconformance));
				//resultHTML=resultHTML+"/n"+resultHTML+"\n"+resultHTML;
				System.out.println("result html:::::"+resultHTML);
				 
				String returnText="";
				returnText=returnText+"<select name='reported_by' class='input_txtbx' id='report'>";
			 	
				System.out.println("Group Person"+group_person);
				//returnText+="<option value=''>-select-</option>";
				for(String typenc:resultHTML)
				{
					returnText+="<option value='"+typenc+"'";
					
					if(typenc.equals(group_person))
					{
						returnText+=" selected";
					}
					returnText+=">"+typenc+"</option>";
					}			
				  
			   returnText=returnText+"</select>";
			   returnText=returnText+"<br>"+"<span id='reporterr' style='color:red;'></span>";
				return returnText;
			}
*/
			
			//ajax getting typeofnc post method for add page created on 23-june-2014.(7.07pm)
			@RequestMapping(value = { "/ajax_getaddtypenc" }, method = RequestMethod.POST)
			public @ResponseBody String insert_external_reportedby(HttpSession session,
					HttpServletRequest request, @RequestParam("type_of_nonconformance") String type_of_nonconformance,ModelMap model, Principal principal,NonConformance nonConformance) {
				List<String> resultHTML=new ArrayList<String>();
				System.out.println(" type of nc:::: "+type_of_nonconformance);
				System.out.println("khhjjhhjhjhj"+type_of_nonconformance);
				resultHTML=(reportedByNCDAO.filtertypeofnc(type_of_nonconformance));
				//resultHTML=resultHTML+"/n"+resultHTML+"\n"+resultHTML;
				System.out.println("result html:::::"+resultHTML);
				 
				String returnText="";
				returnText=returnText+"<select name='reported_by' class='input_cmbbx1' id='reported_by' >";
				 for(String typenc:resultHTML)
				
					 returnText+="<option value='"+typenc+"'>"+typenc+"</option>";
				//	}			
				  
			   returnText=returnText+"</select>";
			
				return returnText;
			}
			//Delete operation
			
			
	 	}
