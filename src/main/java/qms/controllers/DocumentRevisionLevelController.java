package qms.controllers;

import java.io.IOException;
import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.http.HttpRequest;
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

import qms.dao.DocumentRevisionLevelDAO;
import qms.forms.DocumentRevisionLevelForm;
import qms.forms.InternalAuditsForm;

import qms.model.DocumentRevisionLevel;




@Controller
@SessionAttributes({"documentrevisionlevel"})
public class DocumentRevisionLevelController {
	
	@Autowired
	DocumentRevisionLevelDAO documentRevisionLevelDAO;
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
@RequestMapping(value = {"/add_revisionleveldocument"}, method = RequestMethod.GET)
	
	public String addDocumentRevisionLevel(HttpSession session,ModelMap model, @ModelAttribute("DocumentRevisionLevel") @Valid DocumentRevisionLevel documentRevisionLevel,Principal principal) {
/*	int size = documentRevisionLevelDAO.getFormat();
	System.out.println("size="+size);
	if(size >=1)
	{
*/		//documentRevisionLevelDAO.insert_Documentrevision(documentRevisionLevel);
		DocumentRevisionLevelForm documentRevisionLevelForm = new DocumentRevisionLevelForm();
		documentRevisionLevelForm.setDocumentRevisionLevels(documentRevisionLevelDAO.getFormattype());
		model.addAttribute("documentRevisionLevelForm",documentRevisionLevelForm);
		model.addAttribute("menu","admin");
		return "add_revisionleveldocument";		
	}
/*	else
	{
		return "add_documentrevisionlevel";
	}
}*/



		/*//session.removeAttribute("documentrevisionlevel");
		model.addAttribute("menu","admin");
		return "add_revisionleveldocument";
	}*/


//Insert a record
@RequestMapping(value = "/add_documentrevisionlevel", method = RequestMethod.POST)
public String postrevisionlevel(HttpSession session,@ModelAttribute("DocumentRevisionLevel") @Valid DocumentRevisionLevel documentRevisionLevel,BindingResult result, ModelMap model) {

	session.setAttribute("documentrevisionlevel",documentRevisionLevel);
		if (result.hasErrors())
		{
			DocumentRevisionLevelForm documentRevisionLevelForm = new DocumentRevisionLevelForm();
			documentRevisionLevelForm.setDocumentRevisionLevels(documentRevisionLevelDAO.getDocumentRevisionLevels());
			model.addAttribute("documentRevisionLevelForm",documentRevisionLevelForm);
			model.addAttribute("Success","true");
	        return "add_revisionleveldocument";
		}
	
		documentRevisionLevelDAO.insert_Documentrevision(documentRevisionLevel);
		DocumentRevisionLevelForm documentRevisionLevelForm = new DocumentRevisionLevelForm();
		documentRevisionLevelForm.setDocumentRevisionLevels(documentRevisionLevelDAO.getlimitedrevisionlevelreport(1));
		model.addAttribute("noofpages",(int) Math.ceil(documentRevisionLevelDAO.getnoofrevisionlevelreport() * 1.0 / 5));	 
		model.addAttribute("button","viewall");
	    model.addAttribute("success","false");
	    model.addAttribute("currentpage",1);		
	    model.addAttribute("documentRevisionLevelForm",documentRevisionLevelForm);
		model.addAttribute("menu","admin");
		model.addAttribute("success","true");
		//model.addAttribute("success","set");
	return "documentrevisionlevel_list";
}
	
@RequestMapping(value="/documentrevisionlevel_list", method=RequestMethod.GET)
public String documentrevisionlevellist(HttpServletRequest request,ModelMap model, Principal principal) {
	DocumentRevisionLevelForm documentRevisionLevelForm = new DocumentRevisionLevelForm();
	model.addAttribute("menu","admin");
  	model.addAttribute("noofrows",5);
	
	
  	documentRevisionLevelForm.setDocumentRevisionLevels(documentRevisionLevelDAO.getlimitedrevisionlevelreport(1));
	model.addAttribute("noofpages",(int) Math.ceil(documentRevisionLevelDAO.getnoofrevisionlevelreport() * 1.0 / 5));	 
	   
	model.addAttribute("button","viewall");
    model.addAttribute("success","false");
    model.addAttribute("currentpage",1);
	model.addAttribute("documentRevisionLevelForm",documentRevisionLevelForm);
	
	return "documentrevisionlevel_list";
}

@RequestMapping(value="/viewdocumentrevisionlevelreport_page", method=RequestMethod.GET)
public String viewdocumentrevisionlevelreport_page(HttpServletRequest request,@RequestParam("page") int page,ModelMap model) {	
	DocumentRevisionLevelForm documentRevisionLevelForm = new DocumentRevisionLevelForm();
	documentRevisionLevelForm.setDocumentRevisionLevels(documentRevisionLevelDAO.getlimitedrevisionlevelreport(page));
	model.addAttribute("documentRevisionLevelForm",documentRevisionLevelForm);
	model.addAttribute("noofpages",(int) Math.ceil(documentRevisionLevelDAO.getnoofrevisionlevelreport() * 1.0 / 5));
	model.addAttribute("documentRevisionLevelForm",documentRevisionLevelForm);	
  	model.addAttribute("noofrows",5);   
    model.addAttribute("currentpage",page);
    model.addAttribute("menu","documentrevisionlevel");
    model.addAttribute("button","viewall");
    
    return "documentrevisionlevel_list";
	
}


@RequestMapping(value={"/viewallrevisionlevelreport"}, method = RequestMethod.GET)
public String viewalldocumentrevisionlevelreport(HttpServletRequest request,ModelMap model, Principal principal ) {
	DocumentRevisionLevelForm documentRevisionLevelForm = new DocumentRevisionLevelForm();
	documentRevisionLevelForm.setDocumentRevisionLevels(documentRevisionLevelDAO.getDocumentRevisionLevels());
	model.addAttribute("documentRevisionLevelForm",documentRevisionLevelForm);

  	model.addAttribute("noofrows",5);    
    model.addAttribute("menu","documentrevisionlevel");
    model.addAttribute("button","close");
      
    	model.addAttribute("menu","admin");
        model.addAttribute("success","false");
        model.addAttribute("button","close");
        return "documentrevisionlevel_list";

}
//Edit a record
@RequestMapping(value = "/edit_documentrevisionlevel", method = RequestMethod.GET)
public String editdocumentrevisionlevel_get(@RequestParam("id") String id,DocumentRevisionLevel documentRevisionLevel,ModelMap model) {

	System.out.println(id);
	DocumentRevisionLevelForm documentRevisionLevelForm = new DocumentRevisionLevelForm();
	documentRevisionLevelForm.setDocumentRevisionLevels(documentRevisionLevelDAO.getDocumentRevisionLevels(id));
	model.addAttribute("documentRevisionLevelForm",documentRevisionLevelForm);
	model.addAttribute("menu","admin");
    return "edit_documentrevisionlevel";
}


//Update a record
@RequestMapping(value = "/update_documentrevisionlevel", method = RequestMethod.POST)
public String update_revisionlevel(HttpServletRequest request,@RequestParam("id") String sid,ModelMap model,@ModelAttribute("DocumentRevisionLevel") @Valid DocumentRevisionLevel documentRevisionLevel,BindingResult result) throws IOException {

	if (result.hasErrors())
	{
		
		DocumentRevisionLevelForm documentRevisionLevelForm = new DocumentRevisionLevelForm();
		documentRevisionLevelForm.setDocumentRevisionLevels(documentRevisionLevelDAO.getFormattype());
		model.addAttribute("documentRevisionLevelForm",documentRevisionLevelForm);
   /*     model.addAttribute("Success","true");*/
		return "edit_documentrevisionlevel";
	}
	
	System.out.println(request.getParameter(sid));
	documentRevisionLevelDAO.update_documentrevisionlevel(documentRevisionLevel);
	
	DocumentRevisionLevelForm documentRevisionLevelForm = new DocumentRevisionLevelForm();
	documentRevisionLevelForm.setDocumentRevisionLevels(documentRevisionLevelDAO.getlimitedrevisionlevelreport(1));
	model.addAttribute("noofpages",(int) Math.ceil(documentRevisionLevelDAO.getnoofrevisionlevelreport() * 1.0 / 5));	 
	   
	model.addAttribute("button","viewall");
    model.addAttribute("success","false");
    model.addAttribute("currentpage",1);
	model.addAttribute("documentRevisionLevelForm",documentRevisionLevelForm);
	model.addAttribute("menu","admin");
	model.addAttribute("success","update");
    return "documentrevisionlevel_list";
}

//delete a record
@RequestMapping(value = "/delete_documentrevisionlevel", method = RequestMethod.GET)
public String deletedocumentrevisionlevel(@RequestParam("id") String id,DocumentRevisionLevel documentRevisionLevel,ModelMap model) {

	
	documentRevisionLevelDAO.delete_documentrevisionlevel(id);
	DocumentRevisionLevelForm documentRevisionLevelForm = new DocumentRevisionLevelForm();
	documentRevisionLevelForm.setDocumentRevisionLevels(documentRevisionLevelDAO.getlimitedrevisionlevelreport(1));
	model.addAttribute("noofpages",(int) Math.ceil(documentRevisionLevelDAO.getnoofrevisionlevelreport() * 1.0 / 5));	 
	model.addAttribute("button","viewall");
    model.addAttribute("success","delete");
    model.addAttribute("currentpage",1);
	model.addAttribute("documentRevisionLevelForm",documentRevisionLevelForm);
	model.addAttribute("menu","admin");
    return "documentrevisionlevel_list";
	
}


}
