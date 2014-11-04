package qms.controllers;

import java.security.Principal;


import javax.servlet.http.HttpServletRequest;
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

import qms.dao.ChildSupplierDAO;
import qms.model.ChildSupplier;
import qms.forms.ChildSupplierForm;

@Controller
//@SessionAttributes({"audit_id","audit_process","audit_start_date","audit_due_date","auditor","audit_notes","audit_finding","audit_completion_date","auditors_initials","auditee_name"})
@SessionAttributes({"child"})
public class ChildSupplierController
{
	@Autowired
	ChildSupplierDAO childSupplierDAO;
	
	
	
	@RequestMapping(value={"/viewchildsupplier"}, method = RequestMethod.GET)
	public String show_childsupplier(HttpSession session,HttpServletRequest request, ModelMap model, Principal principal )
	{
    ChildSupplierForm childSupplierForm= new ChildSupplierForm();
    childSupplierForm.setChildsupplier(childSupplierDAO.getchildsupplier());
    model.addAttribute("childsupplierform",childSupplierForm);
	return "view_childsupplier";
 	}

	
	@RequestMapping(value={"/addchildsupplier"}, method = RequestMethod.GET)
	public String add_childsupplier(HttpSession session,ModelMap model, Principal principal )
	{
		session.removeAttribute("child");
		model.addAttribute("id", childSupplierDAO.get_maxid());
     return "add_childsupplier";
 	}
	

	@RequestMapping(value={"/addchildsupplier"}, method = RequestMethod.POST)
	public String insert_childsupplier(HttpSession session, @ModelAttribute("ChildSupplier") @Valid ChildSupplier childsupplier, BindingResult result, ModelMap model, Principal principal)

	{	
		
		System.out.println("came");
		session.setAttribute("child",childsupplier);
		if(result.hasErrors())
		{
			
			System.out.println("going to return");
			return "add_childsupplier";
			
		}
		
		childSupplierDAO.insert_childsupplier(childsupplier);		

		model.put("childsupplier", childsupplier);
		model.addAttribute("childsupplier",childsupplier);
		model.addAttribute("menu","childsupplier");
		model.addAttribute("id", childSupplierDAO.get_maxid());
		 
		
		return "view_childsupplier";
 	}
	
	
	@RequestMapping(value={"/updatechildsupplier"}, method = RequestMethod.POST)
	public String update_childsupplier(HttpSession session,@ModelAttribute("childsupplier") @Valid ChildSupplier childSupplier,BindingResult result,ModelMap model, Principal principal)
	{
		session.setAttribute("child",childSupplier);
		if(result.hasErrors())
		{
			return "edit_childsupplier";
		}	
		childSupplierDAO.update_childsupplier(childSupplier);
		
				
		ChildSupplierForm childSupplierForm = new ChildSupplierForm();
		model.addAttribute("childsupplierForm", childSupplierForm);
		model.addAttribute("success","true");
		model.addAttribute("menu","childsupplier");
		
		
		return "view_childsupplier";
 	}
	
	
	@RequestMapping(value={"/deletechildsupplier"}, method = RequestMethod.GET)
	public String delete_childsupplier(@RequestParam("cid") String po,ModelMap model, Principal principal )
	{
		
		childSupplierDAO.delete_childsupplier(po);
		ChildSupplierForm childSupplierForm = new ChildSupplierForm();
		childSupplierForm.setChildsupplier(childSupplierDAO.getchildsupplier());
	    model.addAttribute("childsupplierForm",childSupplierForm);

		
		return "view_childsupplier";
		
 	}
	
	@RequestMapping(value={"/editchildsupplier"}, method = RequestMethod.GET)
	public String edit_childsupplier(@RequestParam("cid") String po,ModelMap model, Principal principal )
	{
    
		ChildSupplierForm childSupplierForm = new ChildSupplierForm();
		childSupplierForm.setChildsupplier(childSupplierDAO.getchildsupplier_byid(po));
		model.addAttribute("childsupplierForm",childSupplierForm);
		
		return "edit_childsupplier";
 	}
	
	@RequestMapping(value="/findchildsupplier",method=RequestMethod.GET)		
	public String findchildsupplier(HttpServletRequest request,HttpSession session,@RequestParam("receipt_date") String receiptdate,@RequestParam("recorded_by") String recordedby,@RequestParam("recording_date") String recordingdate,ModelMap model)

	{
		
		System.out.println("find");
		session.setAttribute("receiptdate", receiptdate);
		session.setAttribute("recordedby", recordedby);
		session.setAttribute("recordingdate",recordingdate);

		if(receiptdate=="" && recordedby=="" && recordingdate=="")
		{
			ChildSupplierForm childSupplierForm = new ChildSupplierForm();
			childSupplierForm.setChildsupplier(childSupplierDAO.getChildSuppliers(receiptdate, recordedby, recordingdate));

			model.addAttribute("childsupplierForm",childSupplierForm);
			model.addAttribute("menu", "childsupplier");
			System.out.println("finding....");
			return "view_childsupplier";
		}
		else
		{
			System.out.println("searching.......");
		ChildSupplierForm childSupplierForm = new ChildSupplierForm();
		childSupplierForm.setChildsupplier(childSupplierDAO.getChildSuppliers(receiptdate, recordedby, recordingdate));
        model.addAttribute("childsupplierForm", childSupplierForm);
        model.addAttribute("menu","childsupplier");
        System.out.println("finding result");
		return "view_childsupplier";		
		}
		}
}

