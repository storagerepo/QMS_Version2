package qms.controllers;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import qms.dao.EmployeeDAO;
import qms.dao.FileHandlingDAO;
import qms.dao.FormDAO;
import qms.dao.FormLocationDAO;
import qms.dao.FormprefixDAO;
import qms.dao.ProcessDAO;
import qms.dao.RevisionFormDAO;
import qms.model.DocumentMain;
import qms.model.Employee;
import qms.model.Form;
import qms.model.FormLocation;
import qms.model.FormPrefix;
import qms.model.Maintenance;
import qms.model.Reportpdferror;
import qms.model.RevisionForm;
import qms.model.Revision_No;
import qms.forms.DocumentMainForm;
import qms.forms.EmployeeForm;
import qms.forms.FormForm;
import qms.forms.FormFormPrefix;
import qms.forms.FormLocationForm;
import qms.forms.MaintenanceForm;
import qms.forms.RevisionFormForm;
import qms.forms.Revision_No_Form;

import qms.forms.ProcessForm;

@Controller
//@SessionAttributes({"audit_id","audit_process","audit_start_date","audit_due_date","auditor","audit_notes","audit_finding","audit_completion_date","auditors_initials","auditee_name"})
@SessionAttributes({"docform","approver","issuer"})
public class FormController
{
	@Autowired
	FormDAO formDAO;
	
	@Autowired
	ProcessDAO processDAO;

	@Autowired
	EmployeeDAO employeeDAO;


	@Autowired
	FileHandlingDAO fileHandlingDAO;
	
	@Autowired
	FormprefixDAO formprefixDAO;
	@Autowired
	FormLocationDAO formLocationDAO;
	@Autowired
	RevisionFormDAO revisionFormDAO;
	
	/*@RequestMapping(value={"/viewform"}, method = RequestMethod.GET)
	public String show_form(HttpSession session,HttpServletRequest request, ModelMap model, Principal principal )
	{
    FormForm formForm=new FormForm();
    formForm.setForm(formDAO.getform());
    model.addAttribute("formForm",formForm);
	return "view_form";
 	}*/
	
	//Getting unique id
	@RequestMapping(value={"/addform"}, method = RequestMethod.GET)
	public String add_form(HttpSession session,ModelMap model, Principal principal )
	{
		session.removeAttribute("docform");
		load_document_page_dropdowns(model);
		
		
		ProcessForm processForm = new ProcessForm();
		processForm.setProcesses(processDAO.getProcess());
		model.addAttribute("processForm", processForm);
		
		model.addAttribute("id", formDAO.get_formid());
		  model.addAttribute("menu","document");
        return "add_form";
 	}
	
//search for record in view 
	
	//Insert a record
	@RequestMapping(value={"/addform"}, method = RequestMethod.POST)
	public String insert_form(HttpSession session,HttpServletRequest request,ModelMap model, @ModelAttribute("Form") @Valid Form form,BindingResult result,@ModelAttribute("RevisionForm") @Valid RevisionForm revisionForm,BindingResult result2, Principal principal)

	{	
		session.removeAttribute("processarea");
		int flag = 0;
		
		
		String approver1 = request.getParameter("approver1");
		String issuer1 = request.getParameter("issuer");
		System.out.println("approver1"+approver1);
		session.setAttribute("approver", approver1);
		session.setAttribute("issuer", issuer1);
		
		String form_id=request.getParameter("document_id_hidden");
		System.out.println("form id="+form_id);
		form.setForm_or_rec_id(form_id);
		String auto_number=request.getParameter("auto_no");
		System.out.println("auto-number"+auto_number);
		
		
		
		System.out.println("record Starus = "+formDAO.list_formExit(auto_number,form_id));

	
		if(formDAO.list_formExit(auto_number,form_id))
		{
			System.out.println("exit");
			load_document_page_dropdowns(model);
			ProcessForm processForm = new ProcessForm();
			processForm.setProcesses(processDAO.getProcess());
			model.addAttribute("processForm", processForm);
			
			model.addAttribute("id", formDAO.get_formid());
			  model.addAttribute("menu","document");
			
			
			model.addAttribute("success","exist");
			return "add_form";
		}
	//	form.setForm_or_rec_id(request.getParameter("document_type_id") + '-'	+ form.getForm_or_rec_id());
		/*form.setAuto_no(request.getParameter("document_type_id1") + '-' + form.getAuto_no());*/
		System.out.println("Started Inserting documents");
		session.setAttribute("docform",form);
		// Started to handle upload document
		/*if(result.hasErrors())
		{
			System.out.println("Error");
			load_document_page_dropdowns(model);
		    model.addAttribute("id", formDAO.get_formid());
			return "add_form";
		}
		else
		{*/
			if(form.getMedia_type().equals("1"))
			{
				form.setLocation("Nil");
			}
		byte[] buffer;
		try {
			MultipartFile file = form.getAttachments();
			String orginal_fileName = null;
			String duplicate_fileName = null;
			InputStream inputStream = null;
			OutputStream outputStream = null;
			if (file != null) {
				if (file.getSize() > 0) {
					inputStream = file.getInputStream();
					if (file.getSize() > 100000) {
						System.out.println("File Size:::" + file.getSize());
						return "/addform";
					}
					orginal_fileName = "/qms_upload/"
							+ file.getOriginalFilename();
					duplicate_fileName = orginal_fileName;
					File create_file = new File(orginal_fileName);
					int i = 1;
					while (create_file.exists()) {
						duplicate_fileName = "/qms_upload/"
								+ file.getOriginalFilename().substring(
										0,
										file.getOriginalFilename().lastIndexOf(
												'.'))
								+ i
								+ file.getOriginalFilename().substring(
										file.getOriginalFilename().lastIndexOf(
												'.'));
						create_file = new File(duplicate_fileName);
						i++;
					}
					outputStream = new FileOutputStream(duplicate_fileName);
					System.out
							.println("fileName:" + file.getOriginalFilename());

					// ------Lines to changes------//

					form.setAttachment_type(file.getContentType());
					form.setAttachment_name(file.getOriginalFilename());
					form.setAttachment_referrence(duplicate_fileName);

					// ----End Lines to changed----//

					int readBytes = 0;
					buffer = new byte[(int) file.getSize()];
					while ((readBytes = inputStream.read(buffer, 0,
							(int) file.getSize())) != -1) {
						outputStream.write(buffer, 0, readBytes);
					}
					outputStream.close();
					inputStream.close();

				}
			}
			if (formDAO.insert_form(form)) {
				formDAO.insert_prefix(form.getForm_or_rec_id().substring(0,form.getForm_or_rec_id().lastIndexOf('-')));
				model.addAttribute("success", "true");
				model.addAttribute("success_message", "Inserted Successfully");
				flag = 1;
			}
			
			
		} catch (Exception e) {
			System.out.println(e.toString());
			e.printStackTrace();
		}
		model.addAttribute("justcame",false);
		model.addAttribute("id", "1001");
		if (flag == 1)
		{
			
			ProcessForm processForm = new ProcessForm();
			processForm.setProcesses(processDAO.getProcess());
			model.addAttribute("processForm", processForm);
			model.addAttribute("justcame",false);
			
			FormForm formForm=new FormForm();
		    formForm.setForm(formDAO.getform());
		   // model.addAttribute("formForm",formForm);
             model.addAttribute("menu","document");
             model.addAttribute("id", formDAO.get_formid());
             revisionFormDAO.insert_revision(revisionForm,form.getAuto_no());
			return "view_form";
		}
		else
			return "view_form";
		
		/*System.out.println("came");
		formDAO.insert_form(form);
		model.put("form", form);
		model.addAttribute("form",form);
		model.addAttribute("menu","form");
		  model.addAttribute("menu","document");
		return "add_form";*/
 	}
	
	@RequestMapping(value = { "/ajax_formexisterror" }, method = RequestMethod.POST)
	public @ResponseBody String insert_external_correctiveactionserror(HttpSession session,HttpServletResponse response,
			HttpServletRequest request, @RequestParam("auto_no") String auto_number,@RequestParam("document_id_hidden") String form_id,ModelMap model, Principal principal,Maintenance maintenance) 
			{
		System.out.println("entered");
		String returntext="";
		if(formDAO.list_formExit(auto_number,form_id))
		{
			returntext="Form ID already exist";			
	        return returntext;
		}
				
		return "";
			}
	
	//Update a record
	@RequestMapping(value={"/updateform"}, method = RequestMethod.POST)
	public String update_form(HttpServletRequest request,HttpSession session,@ModelAttribute("Form") @Valid Form form1,BindingResult result,@ModelAttribute("RevisionForm")@Valid RevisionForm revisionForm,BindingResult result2,ModelMap model,@RequestParam("process") String process, Principal principal)
	{
		load_document_page_dropdowns(model);
		session.removeAttribute("processarea");
		int flag = 0;
		model.addAttribute("justcame",false);
		request.getAttribute("revision_id");
		System.out.println("revisionid = "+request.getAttribute("revision_id"));
		session.setAttribute("docform",form1);
		System.out.println("document id ****** "+form1.getDocument_id());
		/*String attachments = request.getParameter("attachments");*/
		/*System.out.println("attachments = "+form1.getAttachments()+request.getParameter("attachments"));*/
		System.out.println("record Starus = "+formDAO.list_formExit(form1.getAuto_no(),form1.getDocument_id()));

		
		if(formDAO.list_formExit(form1.getAuto_no(),form1.getDocument_id()))
		{
			System.out.println("exit");
			session.removeAttribute("docform");
			load_document_page_dropdowns(model);
			formDAO.change_RevisionFormat(form1,form1.getAuto_no());
			RevisionFormForm revisionFormForm = new RevisionFormForm();
			revisionFormForm.setRevisionForms(revisionFormDAO.getRevision(form1.getAuto_no()));
			model.addAttribute("revisionFormForm", revisionFormForm);
			
			EmployeeForm employeeowner = new EmployeeForm();
			employeeowner.setEmployees(employeeDAO.getEmployees_by_process_owner());
			model.addAttribute("employeeowner", employeeowner); 
			
			FormForm formForm=new FormForm();
			formForm.setForm(formDAO.getform(form1.getAuto_no()));
			model.addAttribute("formForm",formForm);
			  model.addAttribute("menu","document");
			model.addAttribute("success","exist");
			return "edit_form";
		}
		/*if(result.hasErrors())
		{
			String auto_no = form1.getAuto_no();
			System.out.println("edit auto no = "+auto_no);
			session.removeAttribute("docform");
			load_document_page_dropdowns(model);
			formDAO.change_RevisionFormat(form1,auto_no);
			RevisionFormForm revisionFormForm = new RevisionFormForm();
			revisionFormForm.setRevisionForms(revisionFormDAO.getRevision(auto_no));
			model.addAttribute("revisionFormForm", revisionFormForm);
			
			EmployeeForm employeeowner = new EmployeeForm();
			employeeowner.setEmployees(employeeDAO.getEmployees_by_process_owner());
			model.addAttribute("employeeowner", employeeowner); 
			
			FormForm formForm=new FormForm();
			formForm.setForm(formDAO.getform(auto_no));
			model.addAttribute("formForm",formForm);
			  model.addAttribute("menu","document");
		    model.addAttribute("menu","document");
			return "edit_form";
		}
		*/
		if(form1.getMedia_type().equals("1"))
		{
			form1.setLocation("Nil");
		}
		else if(form1.getMedia_type().equals("2")){
			form1.setLocation(form1.getLocation());
		}
		byte[] buffer;
		try {
			MultipartFile file = form1.getAttachments();
			System.out.println("file =" +file);
			String orginal_fileName = null;
			String duplicate_fileName = null;
			InputStream inputStream = null;
			OutputStream outputStream = null;
			if (file != null) {
				if (file.getSize() > 0) {
					inputStream = file.getInputStream();
					if (file.getSize() > 100000) {
						System.out.println("File Size:::" + file.getSize());
						return "/addform";
					}
					orginal_fileName = "/qms_upload/"
							+ file.getOriginalFilename();
					duplicate_fileName = orginal_fileName;
					File create_file = new File(orginal_fileName);
					int i = 1;
					while (create_file.exists()) {
						duplicate_fileName = "/qms_upload/"
								+ file.getOriginalFilename().substring(
										0,
										file.getOriginalFilename().lastIndexOf(
												'.'))
								+ i
								+ file.getOriginalFilename().substring(
										file.getOriginalFilename().lastIndexOf(
												'.'));
						create_file = new File(duplicate_fileName);
						i++;
					}
					outputStream = new FileOutputStream(duplicate_fileName);
					System.out.println("fileName:" + file.getOriginalFilename());

					// ------Lines to changes------//

					form1.setAttachment_type(file.getContentType());
					form1.setAttachment_name(file.getOriginalFilename());
					form1.setAttachment_referrence(duplicate_fileName);

					// ----End Lines to changed----//

					int readBytes = 0;
					buffer = new byte[(int) file.getSize()];
					while ((readBytes = inputStream.read(buffer, 0,
							(int) file.getSize())) != -1) {
						outputStream.write(buffer, 0, readBytes);
					}
					outputStream.close();
					inputStream.close();

				}

		 
			
				}
				if (true){
					   System.out.println("document id ****** "+form1.getDocument_id());
			             revisionFormDAO.insert_revision(revisionForm,form1.getAuto_no(),form1);
						
					formDAO.update_form(form1,form1.getAuto_number(),principal.getName());
					
					model.addAttribute("success", "update");
					model.addAttribute("success_message", "Updated Successfully");
					flag = 1;
					
					System.out.println("flag=1");
				}
			} catch (Exception e) {
				System.out.println(e.toString());
				e.printStackTrace();
			}

			model.addAttribute("id", "1001");
			if (flag == 1)
			{
				//session.removeAttribute("processarea");
				
				FormForm formForm=new FormForm();
			   // formForm.setForm(formDAO.getform());
				formForm.setForm(formDAO.search_form(process,1));
			    model.addAttribute("formForm",formForm);
	             model.addAttribute("menu","document");
	             model.addAttribute("id", formDAO.get_formid());
	             
	             ProcessForm processForm1 = new ProcessForm();
					processForm1.setProcesses(processDAO.getProcess());
					model.addAttribute("processForm", processForm1);
					model.addAttribute("justcame",false);
					
	          return "view_form";
			}
			else
			{
				FormForm formForm=new FormForm();
		    formForm.setForm(formDAO.getform());
		    model.addAttribute("formForm",formForm);
             model.addAttribute("menu","document");
             model.addAttribute("id", formDAO.get_formid());
             model.addAttribute("justcame",false);
				return "view_form";
			}
		
	}
		/*session.setAttribute("form",form);*/
		
		/*if(result.hasErrors())
		{
			System.out.println("vali");
			FormForm formForm=new FormForm();
		    formForm.setForm(formDAO.getform(form.getAuto_no()));
		    model.addAttribute("formForm",formForm);
			return "edit_form";
		}
		
		formDAO.update_form(form);
		
				
		FormForm formForm = new FormForm();
		model.addAttribute("formForm", formForm);
		model.addAttribute("success","true");
		model.addAttribute("menu","form");
		FormForm formForm=new FormForm();
	    formForm.setForm(formDAO.getform());
	    model.addAttribute("formForm",formForm);
	    model.addAttribute("menu","document");
		 
		return "view_form";*/
 	
	
	
	//delete a record
	@RequestMapping(value={"/formdelete"}, method = RequestMethod.GET)
	public String delete_form(ModelMap model, Principal principal,HttpSession session )
	{
		session.removeAttribute("processarea");
		FormForm formForm=new FormForm();
		formForm.setForm(formDAO.getform());
	//	model.addAttribute("formForm",formForm);
		
		ProcessForm processForm = new ProcessForm();
		processForm.setProcesses(processDAO.getProcess());
		model.addAttribute("processForm", processForm);
		
	  	model.addAttribute("noofrows",5);    
	   //narrativereportForm.getNarrativereport().size()
	    model.addAttribute("menu","document");
	    model.addAttribute("button","close");
	    model.addAttribute("justcame",false);
	    
	    return "formdelete";
		
		
 	}
	
	@RequestMapping(value={"/deleteform"}, method = RequestMethod.POST)
	public String deleteSelectedForm(HttpServletRequest request,ModelMap model,Principal principal,HttpSession session) 
	{	
		session.removeAttribute("processarea");
		ProcessForm processForm = new ProcessForm();
		processForm.setProcesses(processDAO.getProcess());
		model.addAttribute("processForm", processForm);
		
		String[] SelectedIDs=new String[100];
		SelectedIDs=request.getParameterValues("chkUser");
		for(String id:SelectedIDs)
		{
		System.out.println(id);
		//formDAO.deleteParticipant(id,principal.getName());
		formDAO.delete_form(id);
		}
		FormForm formForm=new FormForm();
		formForm.setForm(formDAO.getform());
	//	model.addAttribute("formForm",formForm);
        model.addAttribute("menu","document");
        model.addAttribute("success","delete");
        model.addAttribute("justcame","false");
		return "formdelete";
		
	}	
	
	/*@RequestMapping(value = "review_history_form", method = RequestMethod.GET)
	public String revision_history1(@RequestParam("") String document_id,HttpSession session ,ModelMap model, Principal principal) 
	{
		  System.out.println("inside history");
		load_document_page_dropdowns(model);
		DocumentMainForm documentMainForm=new DocumentMainForm();
		documentMainForm.setDocumentMains(documentControlDAO.getDocument_byid(document_id));
		model.addAttribute("documentMainForm",documentMainForm);
		
		  model.addAttribute("menu","document");
		
		return "revisionhistoryform";
	}*/
	@RequestMapping(value={"/review_history_form"}, method = RequestMethod.GET)
	public String review_history_form(HttpSession session,@RequestParam("auto_no") String auto_no,Form form,ModelMap model)
	{
    
		session.removeAttribute("processarea");
		//load_document_page_dropdowns(model);
		
		/*RevisionFormForm revisionFormForm = new RevisionFormForm();
		revisionFormForm.setRevisionForms(revisionFormDAO.getRevision(auto_no));
		model.addAttribute("revisionFormForm", revisionFormForm);
		System.out.println(revisionFormForm.getRevisionForms().get(0).getRevision_id());
		FormForm formForm=new FormForm();
		formForm.setForm(formDAO.getform(auto_no));
		model.addAttribute("formdetails",formForm);
		  model.addAttribute("menu","document");*/
		
		ProcessForm processForm = new ProcessForm();
		processForm.setProcesses(processDAO.getProcess());
		model.addAttribute("processForm", processForm);
		
		FormForm formForm=new FormForm();
		formForm.setForm(formDAO.getform());
		model.addAttribute("formForm",formForm);

	  	model.addAttribute("noofrows",5);    
	   //narrativereportForm.getNarrativereport().size()
	    model.addAttribute("menu","maintenance");
	    model.addAttribute("button","close");
	      
	    model.addAttribute("menu","document");
	    model.addAttribute("success","false");
	    model.addAttribute("button","close");
	    model.addAttribute("display","show");
		formForm.setForm(formDAO.getform(auto_no));
		//formForm.setForm(formDAO.search_form(process));
		model.addAttribute("formForm",formForm);

	  	model.addAttribute("noofrows",5);    
	   //narrativereportForm.getNarrativereport().size()
	    model.addAttribute("menu","maintenance");
	    model.addAttribute("button","close");
	      
	    model.addAttribute("menu","document");
	    model.addAttribute("success","false");
	    model.addAttribute("button","close");
	    model.addAttribute("display","show");
		 String number = auto_no.trim();
		    System.out.println("auto_number= "+number);
			//String resultHTML="";
			//List<RevisionForm> revisionForms = new ArrayList<RevisionForm>();
		    RevisionFormForm revisionForms = new RevisionFormForm();
		  revisionForms.setRevisionForms(revisionFormDAO.getRevision(number));
			 model.addAttribute("revisionForms",revisionForms);
			
			
				
		return "view_form";
 	}
	@RequestMapping(value={"/edit_form"}, method = RequestMethod.GET)
	public String edit_forms(HttpSession session,@RequestParam("auto_no") String auto_no,Form form,ModelMap model)
	{
		System.out.println("edit auto no = "+auto_no);
		session.removeAttribute("docform");
		load_document_page_dropdowns(model);
		formDAO.change_RevisionFormat(form,auto_no);
		RevisionFormForm revisionFormForm = new RevisionFormForm();
		revisionFormForm.setRevisionForms(revisionFormDAO.getRevision(auto_no));
		model.addAttribute("revisionFormForm", revisionFormForm);
		
		EmployeeForm employeeowner = new EmployeeForm();
		employeeowner.setEmployees(employeeDAO.getEmployees_by_process_owner());
		model.addAttribute("employeeowner", employeeowner); 
		
		FormForm formForm=new FormForm();
		formForm.setForm(formDAO.getform(auto_no));
		model.addAttribute("formForm",formForm);
		  model.addAttribute("menu","document");
		  
		  
		  
		return "edit_form";
 	}

@RequestMapping(value={"/review_form"}, method = RequestMethod.GET)
	public String review_form(HttpSession session,@RequestParam("auto_no") String auto_no,Form form,ModelMap model)
	{
    
		session.removeAttribute("docform");
		load_document_page_dropdowns(model);
		FormForm formForm=new FormForm();
		formForm.setForm(formDAO.getform(auto_no));
		model.addAttribute("formForm",formForm);
		  model.addAttribute("menu","document");
		return "";
 	}

// Document Control list page	
	
	@RequestMapping(value = "list_form", method = RequestMethod.GET)
	public String list_document(@RequestParam("id") String auto_number,
			ModelMap model, Principal principal) 
	{
		FormForm formForm = new FormForm();

		formForm.setForm(formDAO.list_form(auto_number));
		model.addAttribute("formForm", formForm);
		model.addAttribute("menu","document");
		return "list_form";
	}


	
	//view page generation
	@RequestMapping(value={"/view_form"},method=RequestMethod.GET)
	public String viewEmployees(HttpSession session, ModelMap model,Principal principal,Employee employee)
	{
		session.removeAttribute("processarea");
		
		FormForm formForm=new FormForm();
		model.addAttribute("menu","document");
	  	model.addAttribute("noofrows",5);
	  	model.addAttribute("justcame",false);
	  	
	  	ProcessForm processForm = new ProcessForm();
		processForm.setProcesses(processDAO.getProcess());
		model.addAttribute("processForm", processForm);
	  	
	    formForm.setForm(formDAO.getlimitedformreport(1));
	    /*model.addAttribute("noofpages",(int) Math.ceil(formDAO.getnoofformreport() * 1.0 / 5));	 
        model.addAttribute("button","viewall");
        model.addAttribute("success","false");
        model.addAttribute("currentpage",1);
	    */
	  //  model.addAttribute("formForm",formForm);
	    
	    
	   
	    
	    
		return "view_form";
	}
	
	//view page generation
		@RequestMapping(value={"/view_formdetails"},method=RequestMethod.GET)
		public String viewFormdetails(HttpSession session, ModelMap model,Principal principal,Employee employee)
		{
			
			
			FormForm formForm=new FormForm();
			model.addAttribute("menu","document");
		  /*	model.addAttribute("noofrows",10);*/
		  	model.addAttribute("justcame",false);
		  	
		  	ProcessForm processForm = new ProcessForm();
			processForm.setProcesses(processDAO.getProcess());
			model.addAttribute("process-Form", processForm);
		  	
		    formForm.setForm(formDAO.getlimitedformreportview(1));
		    System.out.println("no of pages = "+(int) Math.ceil(formDAO.getnoofformreport() * 1.0 / 10));
		    model.addAttribute("noofpages",(int) Math.ceil(formDAO.getnoofformreport() * 1.0 / 10));	 
			model.addAttribute("button","viewall");
	        model.addAttribute("success","false");
	        model.addAttribute("currentpage",1);
		    
		   model.addAttribute("formForm",formForm);
		    
		    
		   
		    
		    
			return "view_formsDetails";
		}
		
		

	@RequestMapping(value="/viewformreport_page", method=RequestMethod.GET)
	public String viewformreport_page(HttpSession session,HttpServletRequest request,@RequestParam("page") int page,@RequestParam("process") String process,ModelMap model) {	
		
		session.setAttribute("processarea",process);
		FormForm formForm=new FormForm();
		formForm.setForm(formDAO.search_form(process,page));
		model.addAttribute("noofpages",(int) Math.ceil(formDAO.Search_form(process) * 1.0 / 5));	 
	  	model.addAttribute("noofrows",5);   
	    model.addAttribute("currentpage",page);
	    model.addAttribute("menu","document");
	    model.addAttribute("button","viewall");
		model.addAttribute("formForm",formForm);
	    ProcessForm processForm = new ProcessForm();
		processForm.setProcesses(processDAO.getProcess());
		model.addAttribute("processForm", processForm);
	    
	    return "view_form";
		
	}
	//view forms
	@RequestMapping(value="/viewform_page", method=RequestMethod.GET)
	public String viewform_page(HttpSession session,HttpServletRequest request,@RequestParam("page") int page,ModelMap model) {	
		
		
		FormForm formForm=new FormForm();
		formForm.setForm(formDAO.view_form(page));
		model.addAttribute("noofpages",(int) Math.ceil(formDAO.view_form() * 1.0 / 10));	 
	  	model.addAttribute("noofrows",10);   
	    model.addAttribute("currentpage",page);
	    model.addAttribute("menu","document");
	    model.addAttribute("button","viewall");
		model.addAttribute("formForm",formForm);
	    ProcessForm processForm = new ProcessForm();
		processForm.setProcesses(processDAO.getProcess());
		model.addAttribute("processForm", processForm);
	    
	    return "view_formsDetails";
		
	}
	
	@RequestMapping(value="/viewformreport_page1", method=RequestMethod.GET)
	public String viewformreport_page1(HttpSession session,HttpServletRequest request,@RequestParam("page") int page,@RequestParam("process") String process,ModelMap model) {	
		
		session.setAttribute("processarea",process);
		FormForm formForm=new FormForm();
		formForm.setForm(formDAO.search_form1(process,page));
		model.addAttribute("noofpages",(int) Math.ceil(formDAO.Search_form(process) * 1.0 / 10));	 
	  	model.addAttribute("noofrows",10);   
	    model.addAttribute("currentpage",page);
	    model.addAttribute("menu","document");
	    model.addAttribute("button","viewall");
		model.addAttribute("formForm",formForm);
	    ProcessForm processForm = new ProcessForm();
		processForm.setProcesses(processDAO.getProcess());
		model.addAttribute("processForm", processForm);
	    
	    return "view_form";
		
	}

	@RequestMapping(value={"/viewallformreport"}, method = RequestMethod.GET)
	public String viewallformreport(HttpServletRequest request,HttpSession session,ModelMap model, @RequestParam("process") String process,Principal principal ) {
		
		FormForm formForm=new FormForm();
		formForm.setForm(formDAO.search_form(process,0));
	    model.addAttribute("menu","maintenance");
	    model.addAttribute("button","close");
	    model.addAttribute("menu","document");
	    model.addAttribute("success","false");
	    model.addAttribute("button","close");
		model.addAttribute("formForm",formForm);
	    ProcessForm processForm = new ProcessForm();
		processForm.setProcesses(processDAO.getProcess());
		model.addAttribute("processForm", processForm);
	        return "view_form";

	}

	//view allforms
	@RequestMapping(value={"/viewallform"}, method = RequestMethod.GET)
	public String viewallform(HttpServletRequest request,HttpSession session,ModelMap model,Principal principal ) {
		
		FormForm formForm=new FormForm();
		formForm.setForm(formDAO.getallforms());
	    model.addAttribute("menu","maintenance");
	    model.addAttribute("button","close");
	    model.addAttribute("menu","document");
	    model.addAttribute("success","false");
	    model.addAttribute("button","close");
		model.addAttribute("formForm",formForm);
	    ProcessForm processForm = new ProcessForm();
		processForm.setProcesses(processDAO.getProcess());
		model.addAttribute("processForm", processForm);
	        return "view_formsDetails";

	}
	//edit a record
	
	/*@RequestMapping(value="/searchform",method=RequestMethod.GET)		
	public String searchform(HttpServletRequest request,HttpSession session,@RequestParam("form_or_rec_title") String recordtitle,@RequestParam("form_media_type") String mediatype,@RequestParam("retention_time") String retentiontime,ModelMap model)

	{
		
		System.out.println("find");
		session.setAttribute("recordtitle", recordtitle);
		session.setAttribute("mediatype", mediatype);
		session.setAttribute("retentiontime",retentiontime);

		if(recordtitle=="" && mediatype=="" && retentiontime=="")
		{
			FormForm formForm = new FormForm();
			formForm.setForm(formDAO.getform(recordtitle, mediatype, retentiontime));

			model.addAttribute("formForm",formForm);
			model.addAttribute("menu", "form");
			System.out.println("finding....");
			return "view_form";
		}
		else
		{
			System.out.println("searching.......");
			FormForm formForm = new FormForm();
			formForm.setForm(formDAO.getform(recordtitle, mediatype, retentiontime));
        model.addAttribute("formForm", formForm);
        model.addAttribute("menu","form");
        System.out.println("finding result");
		return "view_form";		
		}
		}*/
	
	public void load_document_page_dropdowns(ModelMap model)
	{
		System.out.println("load");
		
		/* * To generate process drop down*/
		 
		ProcessForm processForm = new ProcessForm();
		processForm.setProcesses(processDAO.getProcess());
		model.addAttribute("processForm", processForm);

		/*
		 * Load Employee list*/
		FormFormPrefix formFormPrefix = new FormFormPrefix();
		formFormPrefix.setFormPrefixs(formprefixDAO.getprefix());
		model.addAttribute("formFormPrefix",formFormPrefix);
		
		FormLocationForm formLocationForm = new FormLocationForm();
		formLocationForm.setFormLocations(formLocationDAO.getlocation());
		model.addAttribute("formLocationForm",formLocationForm);

		EmployeeForm employeeForm = new EmployeeForm();
		employeeForm.setEmployees(employeeDAO.filterEmployees());
		model.addAttribute("employeeForm", employeeForm);
		
		model.addAttribute("prefix",formDAO.getDocument_prefix());
	}
	
	//search a record
	 @RequestMapping(value={"/search_form"}, method = RequestMethod.GET)
		
		public String search_form(HttpSession session,@RequestParam("process") String process,ModelMap model, Principal principal)
	{
		
		 FormForm formForm = new FormForm();
		 session.setAttribute("processarea",process);
		 formForm.setForm(formDAO.search_form(process,1));
		 model.addAttribute("noofpages",(int) Math.ceil(formDAO.Search_form(process) * 1.0 / 5));	 
			model.addAttribute("noofrows",5);   
		    model.addAttribute("currentpage",1);
		    model.addAttribute("menu","document");
		    model.addAttribute("button","viewall");
		    model.addAttribute("formForm",formForm);
		 ProcessForm processForm = new ProcessForm();
			processForm.setProcesses(processDAO.getProcess());
			model.addAttribute("processForm", processForm);
	    return "view_form";

	}
	 @RequestMapping(value={"/search_forms"}, method = RequestMethod.GET)
		
		public String search_forms(HttpSession session,@RequestParam("process") String process,ModelMap model, Principal principal)
		{
			
			 FormForm formForm = new FormForm();
			 session.setAttribute("processarea",process);
			 formForm.setForm(formDAO.search_form(process,1));
			 System.out.println("search to delete");
			 model.addAttribute("noofpages",(int) Math.ceil(formDAO.Search_form(process) * 1.0 / 5));	 
				model.addAttribute("noofrows",5);   
			    model.addAttribute("currentpage",1);
			    model.addAttribute("menu","document");
			    model.addAttribute("button","viewall");
			    model.addAttribute("formForm",formForm);
			 ProcessForm processForm = new ProcessForm();
				processForm.setProcesses(processDAO.getProcess());
				model.addAttribute("processForm", processForm);
	    return "formdelete";

	}
	 //delete forms with page navigation 17-June-2014
	 @RequestMapping(value="/viewformdelete_page", method=RequestMethod.GET)
		public String viewformdelete_page(HttpSession session,HttpServletRequest request,@RequestParam("page") int page,@RequestParam("process") String process,ModelMap model) {	
			
			session.setAttribute("processarea",process);
			FormForm formForm=new FormForm();
			formForm.setForm(formDAO.search_form(process,page));
			model.addAttribute("noofpages",(int) Math.ceil(formDAO.Search_form(process) * 1.0 / 5));	 
		  	model.addAttribute("noofrows",5);   
		    model.addAttribute("currentpage",page);
		    model.addAttribute("menu","document");
		    model.addAttribute("button","viewall");
			model.addAttribute("formForm",formForm);
		    ProcessForm processForm = new ProcessForm();
			processForm.setProcesses(processDAO.getProcess());
			model.addAttribute("processForm", processForm);
		    
		    return "formdelete";
			
		}


		@RequestMapping(value={"/viewallformdelete"}, method = RequestMethod.GET)
		public String viewallformdelete(HttpServletRequest request,HttpSession session,ModelMap model, @RequestParam("process") String process,Principal principal ) {
			
			FormForm formForm=new FormForm();
			formForm.setForm(formDAO.search_form(process,0));
		    model.addAttribute("menu","admin");
		    model.addAttribute("button","close");
		    model.addAttribute("menu","document");
		    model.addAttribute("success","false");
		    model.addAttribute("button","close");
			model.addAttribute("formForm",formForm);
		    ProcessForm processForm = new ProcessForm();
			processForm.setProcesses(processDAO.getProcess());
			model.addAttribute("processForm", processForm);
		        return "formdelete";

		}

	 @RequestMapping(value={"/search_todelete"}, method = RequestMethod.GET)
		
		public String search_formDelete(@RequestParam("process") String process,ModelMap model, Principal principal)
	{
		
		 FormForm formForm = new FormForm();
		 
		
		formForm.setForm(formDAO.search_form(process,1));
		
		
		model.addAttribute("formForm", formForm);
     model.addAttribute("menu","document");
     
		 model.addAttribute("formForm",formForm);
		
	    return "formdelete";

	}
	 //report page request passing
	 @RequestMapping(value={"/form_report"}, method = RequestMethod.GET)
		public String form_report(HttpSession session,ModelMap model, Principal principal )
		{
		 ProcessForm processForm = new ProcessForm();
			processForm.setProcesses(processDAO.getProcess());
			model.addAttribute("processForm", processForm);
			model.addAttribute("menu","document");
	        return "form_report";
	 	}
	 
	 //External Form report generation
	 @RequestMapping(value = "/generate_doc_form", method = RequestMethod.POST)
		public ModelAndView generateDocument_Form(HttpServletRequest request,ModelMap model, HttpServletResponse response) {
			
			String[] fields={"location","form_or_rec_id","responsibility","form_or_rec_title","process","media_type","retention_time","form","effective_date","document_id","approver1","issuer","comments","revision_id"};
			System.out.println(request.getParameter("process"));
			java.util.List<Form> form=new ArrayList<Form>();
			
			
				
				form=formDAO.gethuman_resources(request.getParameter("process"));
				int sizs = form.size();
				System.out.println("form size = " +sizs); 
			
			
			
			if(Integer.parseInt(request.getParameter("report_type"))==1)
			{
			
					System.out.println("now ok::::");
					 response.setHeader("Content-Disposition","attachment;filename='"+request.getParameter("document_name")+"'");
						
					fields=request.getParameterValues("report_field[]");
				
			}
			else
				 response.setHeader("Content-Disposition","attachment;filename='Form_Report'");
			
			
			ModelAndView modelAndView=new ModelAndView("formDAO","form",form);
			
			modelAndView.addObject("fields",fields);
			
		
			return modelAndView ;
		}
	
	 
	 @RequestMapping(value="/ajaxformreportpdferror",method=RequestMethod.POST)
		public @ResponseBody String addUser(HttpSession session,HttpServletRequest request,@ModelAttribute(value="process")Form form, BindingResult result,ModelMap model ){
			String resultHTML="";
			System.out.println("sfsdfsdf"+form.getProcess());
			java.util.List<Form> forms=new ArrayList<Form>();
			
			
			
			forms=formDAO.gethuman_resources(form.getProcess());
				
				int records_size = forms.size();
				System.out.println("record size = "+records_size);
				if(records_size == 0)
				{
					resultHTML="<p class='closestatus'> This Process Type ("+form.getProcess()+ ") doesn't have a record</p>";
						
				}
			return resultHTML;	
			}
	//Post method for ajax get process 
		@RequestMapping(value = { "/ajax_getrevision" }, method = RequestMethod.POST)
		public @ResponseBody String ajax_revision(@RequestParam("auto_number")String auto_no, HttpSession session,
				HttpServletRequest request, ModelMap model, Principal principal) {
			System.out.println(auto_no);
		String number = auto_no.trim();
			//String resultHTML="";
			List<RevisionForm> revisionForms = new ArrayList<RevisionForm>();
			revisionForms = revisionFormDAO.getRevision(number);
			System.out.println(revisionForms.size());
			 String revision_no="",effective_date="",document_id="",approver1="",issuer="",comments="";
		    
		    String resultHTML="";
		    int list = revisionForms.size();
		   
		    	for (int index=0;list>=1; index++,list--)
		    	{
		    		document_id=revisionForms.get(index).getDocument_id();
		    		effective_date=revisionForms.get(index).getEffective_date();
		    		approver1 = revisionForms.get(index).getApprover1();
		    		issuer=revisionForms.get(index).getIssuer();
		    		comments=revisionForms.get(index).getComments();
		    		revision_no=revisionForms.get(index).getRevision_id();
		    		resultHTML=  resultHTML +
		    		""+document_id+"" +","+
		    		""+effective_date+""+"," +
		    		""+approver1+"" +","+
		    		""+issuer+"" +","+
		    		""+comments+"" +","+
					""+revision_no+""+
		    				",";
		    		
		    	}
		    	
		    
			
		
			return resultHTML;
		}	

		@RequestMapping(value = { "/ajax_getrevisions" }, method = RequestMethod.POST)
		public @ResponseBody String ajax_revisions(@RequestParam("auto_number")String auto_no, HttpSession session,
				HttpServletRequest request, ModelMap model, Principal principal) {
			System.out.println(auto_no);
		String number = auto_no.trim();
			//String resultHTML="";
			List<RevisionForm> revisionForms = new ArrayList<RevisionForm>();
			revisionForms = revisionFormDAO.getRevision(number);
			System.out.println(revisionForms.size());
			 String revision_no="",effective_date="",document_id="",approver1="",issuer="",comments="";
		    
		    String resultHTML="<tr>";
		    int list = revisionForms.size();
		   int rows=list-1;
		    	for (int index=list-1;rows>=0;  index--,rows--)
		    	{
		    		document_id=revisionForms.get(index).getDocument_id();
		    		effective_date=revisionForms.get(index).getEffective_date();
		    		approver1 = revisionForms.get(index).getApprover1();
		    		issuer=revisionForms.get(index).getIssuer();
		    		comments=revisionForms.get(index).getComments();
		    		revision_no=revisionForms.get(index).getRevision_id();
		    		resultHTML=  resultHTML +
		    		"<td align='left'><input type='hidden'name='document_id' id='document_id' value='"+document_id+"'/>"+document_id+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>" +
		    		"<td><input type='hidden'name='effective_date' id='effective_date' value='"+effective_date+"'/>"+effective_date+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>" +
		    		"<td><input type='hidden' name='approver1' id='approver1' value='"+approver1+"'/>"+approver1+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>" +
		    		"<td ><input type='hidden' name='issuer' id='issuer' value='"+issuer+"'/>"+issuer+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>" +
		    		"<td ><input type='hidden' name='comments' id='comments' value='"+comments+"'/>"+comments+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>" +
					"<td ><input type='hidden'name='revision_id' id='revision_id' value='"+revision_no+"'/>"+revision_no+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>" +
		    				"</tr><tr>";
		    		
		    	}
		    	
		    resultHTML = "<tr class='row1'>" +
		    		"<td><b>Form/Rec Id</b></td>" +
		    		"<td><b>Effective Date</b></td>" +
		    		"<td><b>Approver1</b></td>" +
		    		"<td><b>Issuer</b></td>" +
		    		"<td><b>Comments</b></td>" +
		    		"<td><b>Revision No</b></td>" +
		    		"</tr>"+resultHTML;
			
		
			return resultHTML;
		}	
		@RequestMapping(value={"/setrevision"}, method = RequestMethod.GET)
		public String Set_RevisionNo(HttpSession session,ModelMap model,@ModelAttribute("Revision_No") @Valid Revision_No revision_No, Principal principal )
		{
			model.addAttribute("menu","document");
			int size = formDAO.getFormat();
			System.out.println("size = "+size);
			if(size >= 1)
			{
				
				Revision_No_Form revision_No_Form = new Revision_No_Form();
				revision_No_Form.setRevision_Nos(formDAO.getFormattype());
				model.addAttribute("revision_No_Form",revision_No_Form);
				return "show_revision_no";
			}
			else{
	        return "set_revision_no";
			}
	 	}
		@RequestMapping(value = "/selectedformat", method = RequestMethod.POST)
		public String SelectedRevision(HttpSession session,@ModelAttribute("Revision_No") @Valid Revision_No revision_No,BindingResult result, ModelMap model) {

			session.setAttribute("revision_No",revision_No);
				if (result.hasErrors())
				{
				
					Revision_No_Form revision_No_Form = new Revision_No_Form();
					revision_No_Form.setRevision_Nos(formDAO.getFormattype());
					model.addAttribute("revision_No_Form",revision_No_Form);
					model.addAttribute("Success","true");
					return "set_revision_no";
				}
				int size = formDAO.getFormat();
				System.out.println("size = "+size);
				if(size == 0)
				{
				
			//	formLocationDAO.insert_LocationForm(formLocation);
				formDAO.Revision_No_Format(revision_No);
				}
				Revision_No_Form revision_No_Form = new Revision_No_Form();
				revision_No_Form.setRevision_Nos(formDAO.getFormattype());
				model.addAttribute("revision_No_Form",revision_No_Form);
				model.addAttribute("menu","document");
				model.addAttribute("success","set");
			return "show_revision_no";
		}	
		@RequestMapping(value = "/update_revisionformat", method = RequestMethod.POST)
		public String update_revisionformat(HttpSession session, ModelMap model,@ModelAttribute("Revision_No") @Valid Revision_No revision_No,BindingResult result) throws IOException {

			session.removeAttribute("processarea");
			if (result.hasErrors())
			{
				
				Revision_No_Form revision_No_Form = new Revision_No_Form();
				revision_No_Form.setRevision_Nos(formDAO.getFormattype());
				model.addAttribute("revision_No_Form",revision_No_Form);
				model.addAttribute("Success","true");
		        return "set_revision_no";
			}
			
			
			//formLocationDAO.update_formlocation(formLocation);
			formDAO.update_revisionformate(revision_No);
			Revision_No_Form revision_No_Form = new Revision_No_Form();
			revision_No_Form.setRevision_Nos(formDAO.getFormattype());
			model.addAttribute("revision_No_Form",revision_No_Form);
			model.addAttribute("menu","document");
			model.addAttribute("success","update");
		    return "show_revision_no";
		}
}

