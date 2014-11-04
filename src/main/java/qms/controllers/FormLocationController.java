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

import qms.dao.FormLocationDAO;
import qms.forms.FormFormPrefix;
import qms.forms.FormLocationForm;
import qms.model.FormLocation;
import qms.model.FormPrefix;


@Controller
@SessionAttributes({"formlocation"})
public class FormLocationController {
	
	
	@Autowired
	FormLocationDAO formLocationDAO;
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
@RequestMapping(value = { "/add_formlocation" }, method = RequestMethod.GET)
	
	public String addFormPrefix(HttpSession session,ModelMap model, Principal principal) {
		session.removeAttribute("formlocation");
		session.removeAttribute("location");
		model.addAttribute("menu","document");
		return "add_formlocation";
	}

//Insert a record
@RequestMapping(value = "/add_formlocation", method = RequestMethod.POST)
public String postLocation(HttpSession session,@ModelAttribute("FormLocation") @Valid FormLocation formLocation,BindingResult result, ModelMap model) {

	session.setAttribute("formLocation",formLocation);
	session.setAttribute("location",formLocation.getForm_location());
		if (result.hasErrors())
		{
			FormLocationForm formLocationForm = new FormLocationForm();
			formLocationForm.setFormLocations(formLocationDAO.getlocation());
			model.addAttribute("formLocationForm",formLocationForm);
			model.addAttribute("Success","true");
	        return "add_formlocation";
		}
		if(formLocationDAO.getlocationexit(formLocation.getForm_location(),formLocation.getLocation_id()))
		{
			model.addAttribute("success","exist");
			model.addAttribute("menu","document");
			return "add_formlocation";
		}
		//formprefixDAO.insert_PrefixForm(formPrefix);
		formLocationDAO.insert_LocationForm(formLocation);
		session.removeAttribute("location");
		FormLocationForm formLocationForm = new FormLocationForm();
	  	formLocationForm.setFormLocations(formLocationDAO.getlimitedlocationreport(1));
		model.addAttribute("noofpages",(int) Math.ceil(formLocationDAO.getnooflocationreport() * 1.0 / 5));	 
		model.addAttribute("button","viewall");
	    model.addAttribute("success","false");
	    model.addAttribute("currentpage",1);
		model.addAttribute("formLocationForm",formLocationForm);
		model.addAttribute("menu","document");
		model.addAttribute("success","insert");
	return "add_formlocation";
}

//Edit a record
@RequestMapping(value = "/edit_formlocation", method = RequestMethod.GET)
public String editformlocation_get(@RequestParam("location_id") String location_id,FormLocation formLocation,ModelMap model) {

	FormLocationForm formLocationForm = new FormLocationForm();
	formLocationForm.setFormLocations(formLocationDAO.getformLocations(location_id));
	model.addAttribute("formLocationForm",formLocationForm);
	model.addAttribute("menu","document");
    return "edit_formlocation";
}


//Update a record
@RequestMapping(value = "/update_formlocation", method = RequestMethod.POST)
public String update_formlocation(ModelMap model,@ModelAttribute("FormLocation") @Valid FormLocation formLocation,BindingResult result) throws IOException {

	if (result.hasErrors())
	{
		
		FormLocationForm formLocationForm = new FormLocationForm();
		formLocationForm.setFormLocations(formLocationDAO.getformLocations(formLocation.getLocation_id()));
		model.addAttribute("formLocationForm",formLocationForm);
        return "edit_formlocation";
	}
	if(formLocationDAO.getlocationexit(formLocation.getForm_location(),formLocation.getLocation_id()))
	{
		FormLocationForm formLocationForm = new FormLocationForm();
		model.addAttribute("success","exist");
		formLocationForm.setFormLocations(formLocationDAO.getformLocations(formLocation.getLocation_id()));
		model.addAttribute("formLocationForm",formLocationForm);
		model.addAttribute("menu","document");
	    return "edit_formlocation";
	}
	
	formLocationDAO.update_formlocation(formLocation);
	FormLocationForm formLocationForm = new FormLocationForm();
  	formLocationForm.setFormLocations(formLocationDAO.getlimitedlocationreport(1));
	model.addAttribute("noofpages",(int) Math.ceil(formLocationDAO.getnooflocationreport() * 1.0 / 5));	 
	model.addAttribute("button","viewall");
    model.addAttribute("success","false");
    model.addAttribute("currentpage",1);
	model.addAttribute("formLocationForm",formLocationForm);
	model.addAttribute("menu","document");
	model.addAttribute("success","update");
    return "formlocation_list";
}

//delete a record
@RequestMapping(value = "/delete_formlocation", method = RequestMethod.GET)
public String deletelocation(@RequestParam("location_id") String location_id,FormLocation formLocation,ModelMap model) {

	
	//formprefixDAO.delete_formprefix(id);
	formLocationDAO.delete_formlocation(location_id);
	FormLocationForm formLocationForm = new FormLocationForm();
	formLocationForm.setFormLocations(formLocationDAO.getlimitedlocationreport(1));
	model.addAttribute("noofpages",(int) Math.ceil(formLocationDAO.getnooflocationreport() * 1.0 / 5));	 
	model.addAttribute("button","viewall");
    model.addAttribute("success","delete");
    model.addAttribute("currentpage",1);
	model.addAttribute("formLocationForm",formLocationForm);
	model.addAttribute("menu","document");
    return "formlocation_list";
	
}



@RequestMapping(value="/formlocation_list", method=RequestMethod.GET)
public String Formlocationlist(HttpServletRequest request,ModelMap model, Principal principal,HttpSession session) {
	session.removeAttribute("location");
	FormLocationForm formLocationForm = new FormLocationForm();
	model.addAttribute("menu","document");
  	model.addAttribute("noofrows",5);
	
	
  	formLocationForm.setFormLocations(formLocationDAO.getlimitedlocationreport(1));
	model.addAttribute("noofpages",(int) Math.ceil(formLocationDAO.getnooflocationreport() * 1.0 / 5));	 
	   
	model.addAttribute("button","viewall");
    model.addAttribute("success","false");
    model.addAttribute("currentpage",1);
	model.addAttribute("formLocationForm",formLocationForm);
	model.addAttribute("justcame","false");
	return "formlocation_list";
}
@RequestMapping(value="/formlocation_list_search", method=RequestMethod.GET)
public String Formlocationlist(@RequestParam("location")String location, HttpServletRequest request,ModelMap model, Principal principal,HttpSession session) {
	session.setAttribute("location",location);
	FormLocationForm formLocationForm = new FormLocationForm();
	model.addAttribute("menu","document");
  	model.addAttribute("noofrows",5);
	model.addAttribute("justcame","false");
	
  	formLocationForm.setFormLocations(formLocationDAO.getlocation(location));
	/*model.addAttribute("noofpages",(int) Math.ceil(formLocationDAO.getnooflocationreport() * 1.0 / 5));	 
	   
	model.addAttribute("button","viewall");
    model.addAttribute("success","false");
    model.addAttribute("currentpage",1);*/
	model.addAttribute("formLocationForm",formLocationForm);
	
	return "formlocation_list";
}
@RequestMapping(value="/viewlocationreport_page", method=RequestMethod.GET)
public String viewlocationreport_page(HttpServletRequest request,@RequestParam("page") int page,ModelMap model) {	
	FormLocationForm formLocationForm = new FormLocationForm();
	formLocationForm.setFormLocations(formLocationDAO.getlimitedlocationreport(page));
	model.addAttribute("noofpages",(int) Math.ceil(formLocationDAO.getnooflocationreport() * 1.0 / 5));
	model.addAttribute("formLocationForm",formLocationForm);	
  	model.addAttribute("noofrows",5);   
    model.addAttribute("currentpage",page);
    model.addAttribute("menu","document");
    model.addAttribute("button","viewall");
    
    return "formlocation_list";
	
}


@RequestMapping(value={"/viewalllocationreport"}, method = RequestMethod.GET)
public String viewalllocationreport(HttpServletRequest request,ModelMap model, Principal principal ) {
	FormLocationForm formLocationForm = new FormLocationForm();
	//formFormPrefix.setFormPrefixs(formprefixDAO.getprefix());
	formLocationForm.setFormLocations(formLocationDAO.getlocation());
	model.addAttribute("formLocationForm",formLocationForm);

  	model.addAttribute("noofrows",5);    
   //narrativereportForm.getNarrativereport().size()
    model.addAttribute("menu","document");
    model.addAttribute("button","close");
      
    	model.addAttribute("menu","document");
        model.addAttribute("success","false");
        model.addAttribute("button","close");
        return "formlocation_list";

}


}
