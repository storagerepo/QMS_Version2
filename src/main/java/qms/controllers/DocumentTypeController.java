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

import qms.dao.DocumentTypeDAO;
import qms.forms.DocumentPrefixForm;
import qms.forms.DocumentTypeForm;
import qms.model.DocumentType;

@Controller
@SessionAttributes({"documenttype","dtype"})
public class DocumentTypeController {
	
	
	@Autowired
	DocumentTypeDAO documentTypeDAO ;
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
@RequestMapping(value = { "/add_documenttype" }, method = RequestMethod.GET)
	
	public String addFormPrefix(HttpSession session,ModelMap model, Principal principal) {
		session.removeAttribute("documenttype");
		session.removeAttribute("documenttypes");
		
		model.addAttribute("menu","document");
		return "add_documenttype";
	}

//Insert a record
@RequestMapping(value = "/add_documenttype", method = RequestMethod.POST)
public String postDocumenttype(HttpSession session,@ModelAttribute("DocumentType") @Valid DocumentType documentType,BindingResult result, ModelMap model) {

	session.setAttribute("documentType",documentType);
	session.setAttribute("documenttypes",documentType.getDocument_type());
		if (result.hasErrors())
		{
			DocumentTypeForm documentTypeForm = new DocumentTypeForm();
			documentTypeForm.setDocumentTypes(documentTypeDAO.getdocumenttype());
			model.addAttribute("documentTypeForm",documentTypeForm);
			System.out.println("error");
			model.addAttribute("Success","true");
	        return "add_documenttype";
		}
		if(documentTypeDAO.getdocumenttypeExit(documentType.getDocument_type(),documentType.getId()))
		{
			model.addAttribute("success","exist");
			model.addAttribute("menu","document");
			return "add_documenttype";
			
		}
		//formprefixDAO.insert_PrefixForm(formPrefix);
		documentTypeDAO.insert_DocumentType(documentType);
		session.removeAttribute("documenttypes");
		DocumentTypeForm documentTypeForm = new DocumentTypeForm();
		documentTypeForm.setDocumentTypes(documentTypeDAO.getlimiteddocumenttypereport(1));
		model.addAttribute("noofpages",(int) Math.ceil(documentTypeDAO.getnoofdocumenttypereport() * 1.0 / 5));	 
		model.addAttribute("button","viewall");
	    model.addAttribute("success","false");
	    model.addAttribute("currentpage",1);
		model.addAttribute("documentTypeForm",documentTypeForm);
		model.addAttribute("menu","document");
		model.addAttribute("success","insert");
	return "add_documenttype";
}

//Edit a record
@RequestMapping(value = "/edit_documenttype", method = RequestMethod.GET)
public String editdocumenttype_get(@RequestParam("id") String id,DocumentType documentType,ModelMap model) {

	DocumentTypeForm documentTypeForm = new DocumentTypeForm();
	documentTypeForm.setDocumentTypes(documentTypeDAO.getDocumentTypes(id));
	model.addAttribute("documentTypeForm",documentTypeForm);
	model.addAttribute("menu","document");
    return "edit_documenttype";
}


//Update a record
@RequestMapping(value = "/update_documenttype", method = RequestMethod.POST)
public String update_documenttype(ModelMap model,@ModelAttribute("DocumentType") @Valid DocumentType documentType,BindingResult result) throws IOException {

	if (result.hasErrors())
	{
		
		DocumentTypeForm documentTypeForm = new DocumentTypeForm();
		documentTypeForm.setDocumentTypes(documentTypeDAO.getDocumentTypes(documentType.getId()));
		System.out.println("error");
		model.addAttribute("documentTypeForm",documentTypeForm);
        return "edit_documenttype";
	}
	
	if(documentTypeDAO.getdocumenttypeExit(documentType.getDocument_type(),documentType.getId()))
	{
		DocumentTypeForm documentTypeForm = new DocumentTypeForm();
		model.addAttribute("success","exist");
		documentTypeForm.setDocumentTypes(documentTypeDAO.getDocumentTypes(documentType.getId()));
		model.addAttribute("documentTypeForm",documentTypeForm);
		model.addAttribute("menu","document");
		return "edit_documenttype";
	}
	documentTypeDAO.update_documenttype(documentType);
	DocumentTypeForm documentTypeForm = new DocumentTypeForm();
	documentTypeForm.setDocumentTypes(documentTypeDAO.getlimiteddocumenttypereport(1));
	model.addAttribute("noofpages",(int) Math.ceil(documentTypeDAO.getnoofdocumenttypereport() * 1.0 / 5));	 
	   
	model.addAttribute("button","viewall");
    model.addAttribute("success","false");
    model.addAttribute("currentpage",1);
	model.addAttribute("documentTypeForm",documentTypeForm);
	model.addAttribute("menu","document");
	model.addAttribute("success","update");
	System.out.println("updated successfully");
    return "documenttype_list";
}



//delete a record
@RequestMapping(value = "/delete_documenttype", method = RequestMethod.GET)
public String deletedocumenttype(@RequestParam("id") String id,DocumentType documentType,ModelMap model) {

	
	//formprefixDAO.delete_formprefix(id);
	documentTypeDAO.delete_documenttype(id);
	DocumentTypeForm documentTypeForm = new DocumentTypeForm();
	documentTypeForm.setDocumentTypes(documentTypeDAO.getlimiteddocumenttypereport(1));
	model.addAttribute("noofpages",(int) Math.ceil(documentTypeDAO.getnoofdocumenttypereport() * 1.0 / 5));	 
	model.addAttribute("button","viewall");
    model.addAttribute("success","delete");
    model.addAttribute("currentpage",1);
	model.addAttribute("documentTypeForm",documentTypeForm);
	model.addAttribute("menu","document");
    return "documenttype_list";
	
}



@RequestMapping(value="/documenttype_list", method=RequestMethod.GET)
public String Documenttypelist(HttpServletRequest request,ModelMap model, Principal principal,HttpSession session) {
	session.removeAttribute("dtype");
	DocumentTypeForm documentTypeForm = new DocumentTypeForm();
	model.addAttribute("menu","document");
  	model.addAttribute("noofrows",5);
	
	documentTypeForm.setDocumentTypes(documentTypeDAO.getlimiteddocumenttypereport(1));
	model.addAttribute("noofpages",(int) Math.ceil(documentTypeDAO.getnoofdocumenttypereport() * 1.0 / 5));	 
	   
	model.addAttribute("button","viewall");
    model.addAttribute("success","false");
    model.addAttribute("currentpage",1);
	model.addAttribute("documentTypeForm",documentTypeForm);
	model.addAttribute("justcame","false");
	return "documenttype_list";
}
@RequestMapping(value="/documenttype_list_search", method=RequestMethod.GET)
public String Documenttypelistsearch(@RequestParam("dtype")String doctype, HttpServletRequest request,ModelMap model, Principal principal,HttpSession session) {
	session.setAttribute("dtype", doctype);
	DocumentTypeForm documentTypeForm = new DocumentTypeForm();
	model.addAttribute("menu","document");
  	model.addAttribute("noofrows",5);
	model.addAttribute("justcame","false");
	documentTypeForm.setDocumentTypes(documentTypeDAO.getdocumenttype(doctype));
	/*model.addAttribute("noofpages",(int) Math.ceil(documentTypeDAO.getnoofdocumenttypereport() * 1.0 / 5));	 
	   
	model.addAttribute("button","viewall");
    model.addAttribute("success","false");
    model.addAttribute("currentpage",1);*/
	model.addAttribute("documentTypeForm",documentTypeForm);
	
	return "documenttype_list";
}
@RequestMapping(value="/viewdocumenttypereport_page", method=RequestMethod.GET)
public String viewdocumenttypereport_page(HttpServletRequest request,@RequestParam("page") int page,ModelMap model) {	
	DocumentTypeForm documentTypeForm = new DocumentTypeForm();
	documentTypeForm.setDocumentTypes(documentTypeDAO.getlimiteddocumenttypereport(page));
	model.addAttribute("noofpages",(int) Math.ceil(documentTypeDAO.getnoofdocumenttypereport() * 1.0 / 5));
	model.addAttribute("documentTypeForm",documentTypeForm);	
  	model.addAttribute("noofrows",5);   
    model.addAttribute("currentpage",page);
    model.addAttribute("menu","document");
    model.addAttribute("button","viewall");
    
    return "documenttype_list";
	
}


@RequestMapping(value={"/viewalldocumenttypereport"}, method = RequestMethod.GET)
public String viewalldocumenttypereport(HttpServletRequest request,ModelMap model, Principal principal ) {
	DocumentTypeForm documentTypeForm = new DocumentTypeForm();
	//formFormPrefix.setFormPrefixs(formprefixDAO.getprefix());
	documentTypeForm.setDocumentTypes(documentTypeDAO.getdocumenttype());
	model.addAttribute("documentTypeForm",documentTypeForm);

  	model.addAttribute("noofrows",5);    
   //narrativereportForm.getNarrativereport().size()
    model.addAttribute("menu","document");
    model.addAttribute("button","close");
      
    	model.addAttribute("menu","document");
        model.addAttribute("success","false");
        model.addAttribute("button","close");
        return "documenttype_list";

}


}
