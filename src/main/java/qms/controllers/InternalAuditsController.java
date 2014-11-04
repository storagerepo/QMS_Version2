package qms.controllers;

import java.security.Principal;
import java.util.ArrayList;

import javax.mail.Session;
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

//import com.sun.mail.iap.Response;

import qms.dao.InternalAuditsDAO;
import qms.dao.ProcessDAO;
import qms.forms.DocumentMainForm;
import qms.forms.InternalAuditsForm;
import qms.forms.ProcessForm;

import qms.model.InternalAudits;
import qms.model.NonConformance;

@Controller
@SessionAttributes({ "internalaudits" })
public class InternalAuditsController {

	@Autowired
	InternalAuditsDAO internalAuditsDAO;
	
	@Autowired
	ProcessDAO processDAO;

	
	//Internal Audit Report generation
	@RequestMapping(value = "/internal_audit_report", method = RequestMethod.POST)
	public ModelAndView generateAudit_Report(HttpServletRequest request,ModelMap model,HttpServletResponse response,HttpSession session) {
		session.removeAttribute("id");
		session.removeAttribute("process");
		session.removeAttribute("name");
	String[] fields={"report_id","process","auditee_name","audit_start_date","audit_due_date","auditor","audit_notes","finding","completion_date","auditors_initial"};	
		//String title= "internal_audit";
	String title="";
		java.util.List<InternalAudits> internalAudits=new ArrayList<InternalAudits>();
		
		 switch(Integer.parseInt(request.getParameter("audit_report_type")))
				  {
					  case 0:
			  internalAudits=internalAuditsDAO.getAudit_bytype("past_due_audits");
			  title="past_due_audits";
			  break;
		  case 1:
			  internalAudits=internalAuditsDAO.getAudit_bytype("audits_with_nonconformance");
			  title="audits_with_nonconformance";
			  break;
		  case 2:
			  internalAudits=internalAuditsDAO.getAudit_bytype("area_of_improvements");
			  title="area_of_improvements";
			  break;
		  case 3:
			  internalAudits=internalAuditsDAO.getAudit_bytype("past_due_audits_by_auditor");
			  title="past_due_audits_by_auditor";
			  break;
		  case 4:
			  internalAudits=internalAuditsDAO.getAudit_bytype("audit_schedule");
			  title="audit_schedule";
			  break;
		  default:
			  break;
				  
		}		
		 System.out.println(title);
	if(Integer.parseInt(request.getParameter("report_type"))==1)
		{
		if(request.getParameterValues("report_field[]")!=null)
			
			for (@SuppressWarnings("unused") String field : request.getParameterValues("report_field[]")) 
			{
				 response.setHeader("Content-Disposition","attachment;filename='"+request.getParameter("report_title")+"'");
					
				title=request.getParameter("report_title");
				System.out.println(title);
						
				//fields=request.getParameterValues("report_type");
				
				ModelAndView modelAndView=new ModelAndView("internalauditsDAO","internalAudits",internalAudits);
				modelAndView.addObject("fields",request.getParameterValues("report_field[]"));
				
				/*modelAndView.addObject("title",title);*/
				return modelAndView ;
			}
		}
		
	else
		response.setHeader("Content-Disposition","attachment;filename='InternalAudit_Report'");
	
		ModelAndView modelAndView=new ModelAndView("internalauditsDAO","internalAudits",internalAudits);
		modelAndView.addObject("fields",fields);
		
		 
		return modelAndView ;
		
	}
	
	/*@RequestMapping(value = "/internal_audit_report", method = RequestMethod.POST)
	public ModelAndView generateAudit_Report(HttpServletRequest request,ModelMap model, HttpServletResponse response)
	{
		String start = null,end = null;
		String[] fields={"report_id","process","auditee_name","audit_start_date","audit_due_date","auditor","audit_notes","finding","completion_date","auditors_initial","type"};
		System.out.println(request.getParameter("type_of_report"));
		
		String title = "internal_audit";
		java.util.List<InternalAudits> internalAudits=new ArrayList<InternalAudits>();
		
		switch(Integer.parseInt(request.getParameter("audit_report_type")))
		  {
			  case 0:
	  internalAudits=internalAuditsDAO.getAudit_bytype("past_due_audits");
	  title="past_due_audits";
	  break;
 case 1:
	  internalAudits=internalAuditsDAO.getAudit_bytype("audits_with_nonconformance");
	  title="audits_with_nonconformance";
	  break;
 case 2:
	  internalAudits=internalAuditsDAO.getAudit_bytype("area_of_improvements");
	  title="area_of_improvements";
	  break;
 case 3:
	  internalAudits=internalAuditsDAO.getAudit_bytype("past_due_audits_by_auditor");
	  title="past_due_audits_by_auditor";
	  break;
 case 4:
	  internalAudits=internalAuditsDAO.getAudit_bytype("audit_schedule");
	  title="audit_schedule";
	  break;
 default:
	  break;
		  
}		
		if(Integer.parseInt(request.getParameter("report_type"))==1)
		{
		
				System.out.println("now ok");
				 response.setHeader("Content-Disposition","attachment;filename='"+request.getParameter("auditee_name")+"'");
					
				fields=request.getParameterValues("report_field[]");
			
		}
		else
			
		response.setHeader("Content-Disposition","attachment;filename='internalaudit_report'");
		
		
		ModelAndView modelAndView=new ModelAndView("internalauditsDAO","internalAudits",internalAudits);
		
		modelAndView.addObject("fields",fields);
		
		System.out.println("now ok::::");
		return modelAndView ;
	}
	
	*/
	
	
	
	
	// getting unique id
	@RequestMapping(value = { "/addinternalaudits" }, method = RequestMethod.GET)
	public String add_internalaudits(HttpSession session, ModelMap model, Principal principal) {
	
		session.removeAttribute("internalaudits");
		
	//	load_document_page_dropdowns(model);
		
		
		ProcessForm processForm = new ProcessForm();
		processForm.setProcesses(processDAO.getProcess());
		model.addAttribute("processForm", processForm);
		
		model.addAttribute("id", internalAuditsDAO.get_maxid());
		model.addAttribute("menu","audits");
		return "add_internalaudits";

	}

	
	
	// inserting audit
	@RequestMapping(value = "/add_internalaudits", method = RequestMethod.POST)
	public String insert_internalaudits(HttpSession session,
			@ModelAttribute("InternalAudits") @Valid InternalAudits internalAudits,
			BindingResult result, ModelMap model, Principal principal) {
		session.removeAttribute("id");
		session.removeAttribute("process");
		session.removeAttribute("name");
		session.setAttribute("internalaudits", internalAudits);
System.out.println("id"+internalAudits.getId());
		if (result.hasErrors()) {
			// session.removeAttribute("audit_start_date");
			System.out.println(internalAudits.getProcess());
			System.out.println("Errors found");
			model.addAttribute("id", internalAuditsDAO.get_maxid());
			return "add_internalaudits";
		} else {

			if (!internalAuditsDAO.insert_internalAudits(internalAudits)) {
				
				ProcessForm processForm = new ProcessForm();
				processForm.setProcesses(processDAO.getProcess());
				model.addAttribute("processForm", processForm);
				
				
				
				InternalAuditsForm internalAuditsForm = new InternalAuditsForm();
				internalAuditsForm.setInternalAudits(internalAuditsDAO
						.get_internalaudits());
				model.addAttribute("success","true");
				//model.addAttribute("internalAuditsForm", internalAuditsForm);

			}

		}
		model.addAttribute("menu","audits");
		 model.addAttribute("justcame",false);
		
			model.remove("id");
		return "view_internalaudits";
	}
	// Internal audits report list page	
	
	@RequestMapping(value = "list_internalaudit", method = RequestMethod.GET)
	public String list_internalaudits(@RequestParam("id") String id,
			ModelMap model, Principal principal) 
	{
		InternalAuditsForm internalAuditsForm = new InternalAuditsForm();

		internalAuditsForm.setInternalAudits(internalAuditsDAO.edit_internalaudit(id));

		model.addAttribute("internalAuditsForm", internalAuditsForm);
		model.addAttribute("menu","audits");
		return "auditslist";
	}
	
	
	// Internal audits edit page
	@RequestMapping(value = "edit_internalaudit", method = RequestMethod.GET)
	public String edit_internalaudits(HttpSession session,@RequestParam("id") String id,
			ModelMap model, Principal principal) {
	
		session.removeAttribute("internalaudits");
		
		ProcessForm processForm = new ProcessForm();
		processForm.setProcesses(processDAO.getProcess());
		model.addAttribute("processForm", processForm);
		
		
		InternalAuditsForm internalAuditsForm = new InternalAuditsForm();
		internalAuditsForm.setInternalAudits(internalAuditsDAO.edit_internalaudit(id));

		model.addAttribute("internalAuditsForm", internalAuditsForm);
		model.addAttribute("menu","audits");
		return "edit_internalaudit";
	}

	
	//update record
	@RequestMapping(value = "/updateinternalaudits", method = RequestMethod.POST)
	public String update_internalaudits(ModelMap model, Principal principal,@ModelAttribute("InternalAudits") @Valid InternalAudits internalAudits,
			BindingResult result,HttpSession session) {
		
		session.removeAttribute("id");
		session.removeAttribute("process");
		session.removeAttribute("name");
		
		if (result.hasErrors())
		{
			
			System.out.println("output");
			InternalAuditsForm internalAuditsForm = new InternalAuditsForm();
			internalAuditsForm.setInternalAudits(internalAuditsDAO.edit_internalaudit(internalAudits.getId()));
			model.addAttribute("internalAuditsForm", internalAuditsForm);
	        return "edit_internalaudit";
		}
		
		internalAuditsDAO.update_internalaudits(internalAudits);
		model.addAttribute("menu","audits");
		model.addAttribute("success","update");
		
		ProcessForm processForm = new ProcessForm();
		processForm.setProcesses(processDAO.getProcess());
		model.addAttribute("processForm", processForm);
		
		
		InternalAuditsForm internalAuditsForm = new InternalAuditsForm();
		internalAuditsForm.setInternalAudits(internalAuditsDAO.get_internalaudits());

		//model.addAttribute("internalAuditsForm", internalAuditsForm);
		 model.addAttribute("justcame",false);

		return "view_internalaudits";
	}

	
	//view records
	@RequestMapping(value = { "/view_internalaudits" }, method = RequestMethod.GET)
	public String showInternalAudits(HttpSession session,ModelMap model, Principal principal) {
	
	session.removeAttribute("id");
	session.removeAttribute("process");
	session.removeAttribute("name");
	
	ProcessForm processForm = new ProcessForm();
	processForm.setProcesses(processDAO.getProcess());
	model.addAttribute("processForm", processForm);
	
		
	InternalAuditsForm internalAuditsForm = new InternalAuditsForm();
	//internalAuditsForm.setInternalAudits(internalAuditsDAO.get_internalaudits());
	model.addAttribute("menu","audits");
	//model.addAttribute("noofrows",5); 
	
	internalAuditsForm.setInternalAudits(internalAuditsDAO.getlimitedinternalreport(1));
	 /*model.addAttribute("noofpages",(int) Math.ceil(internalAuditsDAO.getnoofinternalreport() * 1.0 / 5));	 
	 model.addAttribute("button","viewall");
     model.addAttribute("success","false");
     model.addAttribute("currentpage",1);*/
   //  model.addAttribute("internalAuditsForm", internalAuditsForm);
	 model.addAttribute("justcame",false);
model.remove("id");
		return "view_internalaudits";
	}


	@RequestMapping(value="/viewinternalreport_page", method=RequestMethod.GET)
	public String viewinternalreport_page(HttpServletRequest request,HttpSession session,@RequestParam("page") int page,
			@RequestParam("id") String id,@RequestParam("process") String process,
			@RequestParam("auditee_name") String auditee_name,ModelMap model) {
		
		session.setAttribute("id",id);
		session.setAttribute("name",auditee_name);
		session.setAttribute("process", process);
		InternalAuditsForm internalAuditsForm = new InternalAuditsForm();
		internalAuditsForm.setInternalAudits(internalAuditsDAO.search_internalaudit(id, process, auditee_name, page));
		model.addAttribute("noofpages",(int) Math.ceil(internalAuditsDAO.FindAudits(id, process, auditee_name) * 1.0 / 5));	 
		model.addAttribute("internalAuditsForm", internalAuditsForm);	
	  	model.addAttribute("noofrows",5);
	    model.addAttribute("currentpage",page);
	    model.addAttribute("menu","audits");
	    model.addAttribute("button","viewall");
	    return "view_internalaudits";
	}


	@RequestMapping(value={"/viewallinternalreport"}, method = RequestMethod.GET)
	public String viewallinternalreport(HttpSession session,
			HttpServletRequest request,ModelMap model,
	@RequestParam("process") String process,@RequestParam("id") String id,
	@RequestParam("auditee_name") String auditee_name,Principal principal ) 
	{	
		session.setAttribute("id", id);
		session.setAttribute("name", auditee_name);
		session.setAttribute("process", process);
	InternalAuditsForm internalAuditsForm = new InternalAuditsForm();
	internalAuditsForm.setInternalAudits(internalAuditsDAO.search_internalaudit(id, process, auditee_name, 0));
//	model.addAttribute("noofpages",(int) Math.ceil(documentControlDAO.FindDocuments(search_document_type, search_process) * 1.0 / 5));	 
	model.addAttribute("internalAuditsForm", internalAuditsForm);

 // 	model.addAttribute("noofrows",5);    
   //narrativereportForm.getNarrativereport().size()
    model.addAttribute("menu","audits");
    model.addAttribute("button","close");
      
    	model.addAttribute("menu","audits");
        model.addAttribute("success","false");
        model.addAttribute("button","close");
        return "view_internalaudits";

}

	
	//delete a record 
	@RequestMapping(value = { "/delete_internalaudit" }, method = RequestMethod.GET)
	public String delete_internalaudits(@RequestParam("id") String id,
			ModelMap model, Principal principal) {

		model.addAttribute("justcame","false");
		internalAuditsDAO.delete_internalAudits(id);
		model.addAttribute("justcame","false");
		return "view_internalaudits";
	}

	
	
	// Report Generation
	@RequestMapping(value = { "/internalaudit_report" }, method = RequestMethod.POST)
	public String internalaudits_report(HttpServletRequest request,ModelMap model, Principal principal) 
	{
		String type=request.getParameter("type_of_report");
		
		InternalAuditsForm internalAuditsForm = new InternalAuditsForm();
		//InternalAuditsForm.setInternalAudits(internalAuditsDAO.get_report_internalaudits(type));
		model.addAttribute("internalAuditsForm", internalAuditsForm);
		model.addAttribute("type",type);		
		model.addAttribute("report_table","yes");
		model.addAttribute("menu","audits");
		return "internalaudit_report";
	}
	
	
	//report page request passing
	@RequestMapping(value = { "/internalaudit_report" }, method = RequestMethod.GET)
	public String get_internalaudits_report(ModelMap model, Principal principal) 
	{
		model.addAttribute("report_table","no");
		model.addAttribute("menu","audits");
		return "internalaudit_report";
	}
	
   
	
	//search for record in view 
	@RequestMapping(value={"/search_audits"}, method = RequestMethod.GET)
	public String search_internalaudits(HttpSession session, @RequestParam("id") String id,@RequestParam("process") String process,@RequestParam("auditee_name") String auditee_name,ModelMap model, Principal principal)
{
	System.out.println(id);
	
	session.setAttribute("id", id);
	session.setAttribute("process", process);
	session.setAttribute("name", auditee_name);
	
	ProcessForm processForm = new ProcessForm();
	processForm.setProcesses(processDAO.getProcess());
	model.addAttribute("processForm", processForm);
	
	InternalAuditsForm internalAuditsForm= new InternalAuditsForm();
	
	internalAuditsForm.setInternalAudits(internalAuditsDAO.search_internalaudit(id,process,auditee_name,1));
	model.addAttribute("noofpages",(int) Math.ceil(internalAuditsDAO.FindAudits(id, process, auditee_name) * 1.0 / 5));
	model.addAttribute("button","viewall");
    model.addAttribute("success","false");
    model.addAttribute("currentpage",1);
    model.addAttribute("internalAuditsForm",internalAuditsForm);

    model.addAttribute("menu","audits");
    return "view_internalaudits";

}

	//delete a record for admin setup
	@RequestMapping(value={"/internalauditsdelete"}, method = RequestMethod.GET)
	public String delete_internalaudits(ModelMap model, Principal principal,HttpSession session )
	{
		model.addAttribute("justcame","false");
		session.removeAttribute("id");
		session.removeAttribute("process");
		session.removeAttribute("name");
		
		ProcessForm processForm = new ProcessForm();
		processForm.setProcesses(processDAO.getProcess());
		model.addAttribute("processForm", processForm);
		
		InternalAuditsForm internalAuditsForm = new InternalAuditsForm();
		internalAuditsForm.setInternalAudits(internalAuditsDAO.get_internalaudits());
		//model.addAttribute("internalAuditsForm", internalAuditsForm);

				
	  	model.addAttribute("noofrows",5);    
	   //narrativereportForm.getNarrativereport().size()
	    model.addAttribute("menu","audits");
	    model.addAttribute("button","close");
	    model.addAttribute("justcame",false);
	    return "internalauditsdelete";
	}

	//Admin Set up search operation created on 28-june-2014.
	@RequestMapping(value={"/search_audit"}, method = RequestMethod.GET)
	public String search_internalaudit(HttpSession session,@RequestParam("id") String id,@RequestParam("process") String process,@RequestParam("auditee_name") String auditee_name,ModelMap model, Principal principal)
	{
		System.out.println(id);
		
		session.setAttribute("id", id);
		session.setAttribute("process", process);
		session.setAttribute("name", auditee_name);
		
		ProcessForm processForm = new ProcessForm();
		processForm.setProcesses(processDAO.getProcess());
		model.addAttribute("processForm", processForm);
		
		InternalAuditsForm internalAuditsForm= new InternalAuditsForm();
		
		internalAuditsForm.setInternalAudits(internalAuditsDAO.search_internalaudit(id,process,auditee_name,1));
		model.addAttribute("noofpages",(int) Math.ceil(internalAuditsDAO.FindAudits(id, process, auditee_name) * 1.0 / 5));
		model.addAttribute("button","viewall");
	    model.addAttribute("success","false");
	    model.addAttribute("currentpage",1);
	    model.addAttribute("internalAuditsForm",internalAuditsForm);
	    model.addAttribute("menu","audits");
	
    return "internalauditsdelete";

}
	//Pagination for Admin Setup's search operation results created on 28-june-2014. 
	@RequestMapping(value="/viewdeleteinternalreport_page", method=RequestMethod.GET)
	public String viewdeleteinternalreport_page(HttpServletRequest request,HttpSession session,@RequestParam("page") int page,
			@RequestParam("id") String id,@RequestParam("process") String process,
			@RequestParam("auditee_name") String auditee_name,ModelMap model) {
		
		session.setAttribute("id",id);
		session.setAttribute("name",auditee_name);
		session.setAttribute("process", process);
		InternalAuditsForm internalAuditsForm = new InternalAuditsForm();
		internalAuditsForm.setInternalAudits(internalAuditsDAO.search_internalaudit(id, process, auditee_name, page));
		model.addAttribute("noofpages",(int) Math.ceil(internalAuditsDAO.FindAudits(id, process, auditee_name) * 1.0 / 5));	 
		model.addAttribute("internalAuditsForm", internalAuditsForm);	
	  	model.addAttribute("noofrows",5);
	    model.addAttribute("currentpage",page);
	    model.addAttribute("menu","audits");
	    model.addAttribute("button","viewall");
	    return "internalauditsdelete";
	}

//Pagination for Admin Setup's search operation results created on 28-june-2014.
	@RequestMapping(value={"/viewalldeleteinternalreport"}, method = RequestMethod.GET)
	public String viewalldeleteinternalreport(HttpSession session,
			HttpServletRequest request,ModelMap model,
	@RequestParam("process") String process,@RequestParam("id") String id,
	@RequestParam("auditee_name") String auditee_name,Principal principal ) 
	{	
		session.setAttribute("id", id);
		session.setAttribute("name", auditee_name);
		session.setAttribute("process", process);
	InternalAuditsForm internalAuditsForm = new InternalAuditsForm();
	internalAuditsForm.setInternalAudits(internalAuditsDAO.search_internalaudit(id, process, auditee_name, 0));
//	model.addAttribute("noofpages",(int) Math.ceil(documentControlDAO.FindDocuments(search_document_type, search_process) * 1.0 / 5));	 
	model.addAttribute("internalAuditsForm", internalAuditsForm);

 // 	model.addAttribute("noofrows",5);    
   //narrativereportForm.getNarrativereport().size()
    model.addAttribute("menu","admin");
    model.addAttribute("button","close");
      
    	model.addAttribute("menu","audits");
        model.addAttribute("success","false");
        model.addAttribute("button","close");
        return "internalauditsdelete";

}


		@RequestMapping(value={"/deleteinternalaudits"}, method = RequestMethod.POST)
	public String deleteSelectedinternalaudits(HttpServletRequest request,ModelMap model,Principal principal,HttpSession session) 
	{	
			model.addAttribute("justcame","false");
			model.addAttribute("justcame","false");
			ProcessForm processForm = new ProcessForm();
			processForm.setProcesses(processDAO.getProcess());
			model.addAttribute("processForm", processForm);
			
			
		String[] SelectedIDs=new String[100];
		SelectedIDs=request.getParameterValues("chkUser");
		for(String id:SelectedIDs)
		{
		System.out.println(id);
		
		//formDAO.deleteParticipant(id,principal.getName());
		internalAuditsDAO.delete_internalAudits(id);
		session.removeAttribute("id");
		session.removeAttribute("process");
		session.removeAttribute("name");
		
		}
		InternalAuditsForm internalAuditsForm = new InternalAuditsForm();
		internalAuditsForm.setInternalAudits(internalAuditsDAO.get_internalaudits());
	//	model.addAttribute("internalAuditsForm", internalAuditsForm);
	    model.addAttribute("success","delete");
		model.addAttribute("menu","audits");
		return "internalauditsdelete";
		
	}	
		@RequestMapping(value = {"/add_finding"}, method = RequestMethod.GET)
		public String addFinding(HttpSession session,ModelMap model, Principal principal) {
			
			model.addAttribute("menu","internal");
			return "add_internalaudit_finding";
		}
 	}

