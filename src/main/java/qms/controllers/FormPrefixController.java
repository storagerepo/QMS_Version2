package qms.controllers;

import java.io.IOException;
import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import qms.dao.FormprefixDAO;
import qms.forms.DocumentPrefixForm;
import qms.forms.FormFormPrefix;
import qms.forms.MaintenanceForm;
import qms.model.FormPrefix;
import qms.model.Maintenance;


@Controller
@SessionAttributes({"formprefix","fprefix"})
public class FormPrefixController {
	
	@Autowired
	FormprefixDAO formprefixDAO;
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
@RequestMapping(value = { "/add_prefixform" }, method = RequestMethod.GET)
	
	public String addFormPrefix(HttpSession session,ModelMap model, Principal principal) {
		session.removeAttribute("formprefix");
		model.addAttribute("menu","document");
		return "add_prefixform";
	}

//Insert a record
@RequestMapping(value = "/add_formprefix", method = RequestMethod.POST)
public String postPrefix(HttpSession session,@ModelAttribute("FormPrefix") @Valid FormPrefix formPrefix,BindingResult result, ModelMap model) {

	session.setAttribute("formPrefix",formPrefix);
		if (result.hasErrors())
		{
			FormFormPrefix formFormPrefix = new FormFormPrefix();
			formFormPrefix.setFormPrefixs(formprefixDAO.getprefix());
			model.addAttribute("formFormPrefix",formFormPrefix);
			model.addAttribute("Success","true");
	        return "add_prefixform";
		}
	
		if(formprefixDAO.getPrefixExit(formPrefix.getId(),formPrefix.getForm_prefix()))
		{
			FormFormPrefix formFormPrefix = new FormFormPrefix();
			formFormPrefix.setFormPrefixs(formprefixDAO.getprefix());
			model.addAttribute("formFormPrefix",formFormPrefix);
			model.addAttribute("success","exist");
			 return "add_prefixform";
		}
		formprefixDAO.insert_PrefixForm(formPrefix);
		FormFormPrefix formFormPrefix = new FormFormPrefix();
		formFormPrefix.setFormPrefixs(formprefixDAO.getlimitedprefixreport(1));
		model.addAttribute("noofpages",(int) Math.ceil(formprefixDAO.getnoofprefixreport() * 1.0 / 5));	 
		model.addAttribute("button","viewall");
	    model.addAttribute("success","false");
	    model.addAttribute("currentpage",1);
		model.addAttribute("formFormPrefix",formFormPrefix);
		model.addAttribute("menu","document");
		session.removeAttribute("formPrefix");
		model.addAttribute("success","insert");
	return "add_prefixform";
}
	
@RequestMapping(value="/formprefix_list", method=RequestMethod.GET)
public String Formprefixlist(HttpSession session, HttpServletRequest request,ModelMap model, Principal principal) {
session.removeAttribute("fprefix");
	FormFormPrefix formFormPrefix = new FormFormPrefix();
	model.addAttribute("menu","document");
  	model.addAttribute("noofrows",5);
  	model.addAttribute("justcame","false");
	
  	formFormPrefix.setFormPrefixs(formprefixDAO.getlimitedprefixreport(1));
	model.addAttribute("noofpages",(int) Math.ceil(formprefixDAO.getnoofprefixreport() * 1.0 / 5));	 
	   
	model.addAttribute("button","viewall");
    model.addAttribute("success","false");
    model.addAttribute("currentpage",1);
	model.addAttribute("formFormPrefix",formFormPrefix);
	
	return "formprefix_list";
}
@RequestMapping(value="/formprefix_list_search", method=RequestMethod.GET)
public String Formprefixlistsearch(HttpSession session,@RequestParam("dprefix")String prefix, HttpServletRequest request,ModelMap model, Principal principal) {
	session.setAttribute("fprefix",prefix);
	FormFormPrefix formFormPrefix = new FormFormPrefix();
	model.addAttribute("menu","document");
  	model.addAttribute("noofrows",5);
  	model.addAttribute("justcame","false");
	
  	formFormPrefix.setFormPrefixs(formprefixDAO.getprefix(prefix));
	//model.addAttribute("noofpages",(int) Math.ceil(formprefixDAO.getnoofprefixreport() * 1.0 / 5));	 
	   
	/*model.addAttribute("button","viewall");
    model.addAttribute("success","false");
    model.addAttribute("currentpage",1);*/
	model.addAttribute("formFormPrefix",formFormPrefix);
	
	return "formprefix_list";
}
@RequestMapping(value="/viewprefixreport_page", method=RequestMethod.GET)
public String viewprefixreport_page(HttpServletRequest request,@RequestParam("page") int page,ModelMap model) {	
	FormFormPrefix formFormPrefix = new FormFormPrefix();
	formFormPrefix.setFormPrefixs(formprefixDAO.getlimitedprefixreport(page));
	model.addAttribute("noofpages",(int) Math.ceil(formprefixDAO.getnoofprefixreport() * 1.0 / 5));
	model.addAttribute("formFormPrefix",formFormPrefix);	
  	model.addAttribute("noofrows",5);   
    model.addAttribute("currentpage",page);
    model.addAttribute("menu","document");
    model.addAttribute("button","viewall");
    
    return "formprefix_list";
	
}


@RequestMapping(value={"/viewallprefixreport"}, method = RequestMethod.GET)
public String viewallprefixreport(HttpServletRequest request,ModelMap model, Principal principal ) {
	FormFormPrefix formFormPrefix = new FormFormPrefix();
	formFormPrefix.setFormPrefixs(formprefixDAO.getprefix());
	model.addAttribute("formFormPrefix",formFormPrefix);

  	model.addAttribute("noofrows",5);    
    model.addAttribute("menu","document");
    model.addAttribute("button","close");
      
    	model.addAttribute("menu","document");
        model.addAttribute("success","false");
        model.addAttribute("button","close");
        return "formprefix_list";

}
//Edit a record
@RequestMapping(value = "/edit_formprefix", method = RequestMethod.GET)
public String editformprefix_get(@RequestParam("id") String id,FormPrefix formPrefix,ModelMap model) {

	FormFormPrefix formFormPrefix = new FormFormPrefix();
	formFormPrefix.setFormPrefixs(formprefixDAO.getformPrefixs(id));
	model.addAttribute("formFormPrefix",formFormPrefix);
	model.addAttribute("menu","document");
    return "edit_formprefix";
}

//Update a record
@RequestMapping(value = "/update_formpref", method = RequestMethod.POST)
public String update_formprefix(ModelMap model,@ModelAttribute("FormPrefix") @Valid FormPrefix formPrefix,BindingResult result) throws IOException {
 
	int page =1;
	if (result.hasErrors())
	{
		
		FormFormPrefix formFormPrefix = new FormFormPrefix();
		formFormPrefix.setFormPrefixs(formprefixDAO.getformPrefixs(formPrefix.getId()));
	//	model.addAttribute("formFormPrefix",formFormPrefix);
        return "edit_formprefix";
	}
	
	if(formprefixDAO.getPrefixExit(formPrefix.getId(),formPrefix.getForm_prefix()))
	{
		FormFormPrefix formFormPrefix = new FormFormPrefix();
		formFormPrefix.setFormPrefixs(formprefixDAO.getprefix());
		model.addAttribute("formFormPrefix",formFormPrefix);
		model.addAttribute("success","exist");
		 return "edit_formprefix";
	}
	
	model.addAttribute("noofrows",5);
	
	
	formprefixDAO.update_formprefix(formPrefix);
	FormFormPrefix formFormPrefix = new FormFormPrefix();

	formFormPrefix.setFormPrefixs(formprefixDAO.getlimitedprefixreport(page));
	model.addAttribute("noofpages",(int) Math.ceil(formprefixDAO.getnoofprefixreport() * 1.0 / 5));
	model.addAttribute("formFormPrefix",formFormPrefix);	
  	model.addAttribute("noofrows",5);   
    model.addAttribute("currentpage",page);
    model.addAttribute("menu","document");
    model.addAttribute("button","viewall");
   

	formFormPrefix.setFormPrefixs(formprefixDAO.getlimitedprefixreport(1));
	model.addAttribute("noofpages",(int) Math.ceil(formprefixDAO.getnoofprefixreport() * 1.0 / 5));	 
	model.addAttribute("button","viewall");
    model.addAttribute("success","false");
    model.addAttribute("currentpage",1);
	model.addAttribute("formFormPrefix",formFormPrefix);
	model.addAttribute("menu","document");

	model.addAttribute("success","update");
    return "formprefix_list";
       
}

//delete a record
@RequestMapping(value = "/delete_formprefix", method = RequestMethod.GET)
public String deletemaintenance(@RequestParam("id") String id,FormPrefix formPrefix,ModelMap model) {

	int page =1;
	formprefixDAO.delete_formprefix(id);
	FormFormPrefix formFormPrefix = new FormFormPrefix();
	formFormPrefix.setFormPrefixs(formprefixDAO.getlimitedprefixreport(page));
	model.addAttribute("noofpages",(int) Math.ceil(formprefixDAO.getnoofprefixreport() * 1.0 / 5));
	model.addAttribute("formFormPrefix",formFormPrefix);	
  	model.addAttribute("noofrows",5);   
    model.addAttribute("currentpage",page);
    model.addAttribute("menu","document");
    model.addAttribute("button","viewall");
	model.addAttribute("success","delete");
    return "formprefix_list";
	
}


}
