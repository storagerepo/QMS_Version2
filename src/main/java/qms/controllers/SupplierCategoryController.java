package qms.controllers;

import java.io.IOException;
import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.tomcat.jni.Proc;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import qms.dao.*;
import qms.forms.*;
import qms.model.*;


import qms.forms.Certified_toform;
import qms.forms.FormFormPrefix;
import qms.forms.MaintenanceForm;
import qms.forms.SupplierCategoryform;
import qms.model.FormPrefix;
import qms.model.DocumentPrefix;
import qms.model.Maintenance;
import qms.model.SuppilerCategory;
import qms.forms.DocumentPrefixForm;
import qms.model.Certified_To;


@Controller
@SessionAttributes({"documentprefix","prefixdocument"})
public class SupplierCategoryController {
	
	@Autowired
	SuppliercategoryDAO SuppliercategoryDAO;
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	
@RequestMapping(value = {"/Addsuppliercategory"}, method = RequestMethod.GET)
	
	public String addsupplier(HttpSession session,ModelMap model, Principal principal) {
		session.removeAttribute("documentprefix");
		model.addAttribute("menu","supplier");
		return "Addsuppliercategory";
	}

//Insert a record
@RequestMapping(value = "/add_supplierprefix", method = RequestMethod.POST)
public String postsupplierPrefix(HttpSession session,@ModelAttribute("addsuppilercategory") @Valid SuppilerCategory addsuppilercategory,BindingResult result, ModelMap model) {

	
	session.setAttribute("documentPrefix",addsuppilercategory);
	if (result.hasErrors()) {
		SupplierCategoryform addsuppliercategoryform = new SupplierCategoryform();
		addsuppliercategoryform.setSuppliercategory(SuppliercategoryDAO.getsuppliertype());
		model.addAttribute("addsuppliercategoryform",addsuppliercategoryform);
		//model.addAttribute("Success", "true");
			

		return "Addsuppliercategory";
	}

	SuppliercategoryDAO.insert_suppliercategory(addsuppilercategory);
	/*SupplierCategoryform addsuppliercategoryform = new SupplierCategoryform();
	addsuppliercategoryform.setSuppliercategory(SuppliercategoryDAO.getsuppliertype());
	model.addAttribute("addsuppliercategoryform",addsuppliercategoryform);
	model.addAttribute("success",true);*/
	model.addAttribute("Success", "true");
	session.removeAttribute("documentPrefix");
	
		
		return "Addsuppliercategory";
}


@RequestMapping(value="/suppliercategorylist", method=RequestMethod.GET)
public String Documenttypelist(HttpServletRequest request,ModelMap model, Principal principal,HttpSession session) {
	session.removeAttribute("dtype");
	SupplierCategoryform addsuppliercategoryform = new SupplierCategoryform();
	model.addAttribute("menu","supplier");
  	model.addAttribute("noofrows",5);
	
	addsuppliercategoryform.setSuppliercategory(SuppliercategoryDAO.getlimiteddocumenttypereport(1));
	
  	
	model.addAttribute("noofpages",(int) Math.ceil(SuppliercategoryDAO.getnoofdocumenttypereport() * 1.0 / 5));	 
	   
	model.addAttribute("button","viewall");
    model.addAttribute("success","false");
    model.addAttribute("currentpage",1);
	model.addAttribute("addsuppliercategoryform",addsuppliercategoryform);
	model.addAttribute("justcame","false");
	return "suppliercategorylist";
}

@RequestMapping(value={"/edit_suppliercategory"}, method = RequestMethod.GET)
public String edit_suppliercategory(HttpServletRequest request,@RequestParam("id") String id,@ModelAttribute("addsuppilercategory") @Valid SuppilerCategory addsuppilerCategory,ModelMap model, Principal principal ) {
	
	
	SupplierCategoryform addsupplierCategoryform = new SupplierCategoryform();
	
	addsupplierCategoryform.setSuppliercategory(SuppliercategoryDAO.getsuppliercategory(id));
	model.addAttribute("addsuppliercategoryform",addsupplierCategoryform);
	model.addAttribute("menu","supplier");
        return "edit_suppliercategory";

}
	@RequestMapping(value="/update_suppliercategory",method=RequestMethod.POST)
	public String instructor_update_settings(@RequestParam("id") String id,HttpSession session,@ModelAttribute("addsuppilercategory") @Valid SuppilerCategory addsuppilercategory,BindingResult result, ModelMap model,HttpServletRequest request ) {
		
	
		
		session.setAttribute("documentPrefix",addsuppilercategory);
	
	
	
	
		SuppliercategoryDAO.update_suppliercategory(addsuppilercategory);
		 model.addAttribute("success","update");
  
 SupplierCategoryform addsuppliercategoryform = new SupplierCategoryform();
	model.addAttribute("menu","supplier");
	model.addAttribute("noofrows",5);
	
	addsuppliercategoryform.setSuppliercategory(SuppliercategoryDAO.getlimiteddocumenttypereport(1));
	
	
model.addAttribute("noofpages",(int) Math.ceil(SuppliercategoryDAO.getnoofdocumenttypereport() * 1.0 / 5));	 
	   
	model.addAttribute("button","viewall");
 model.addAttribute("success","false");
 model.addAttribute("currentpage",1);
	model.addAttribute("addsuppliercategoryform",addsuppliercategoryform);
	model.addAttribute("justcame","false");
   return "suppliercategorylist";

}

	@RequestMapping(value = "/delete_suppliercategory", method = RequestMethod.GET)
	public String deletedocumenttype(@RequestParam("id") String id,HttpSession session,@ModelAttribute("addsuppilercategory") @Valid SuppilerCategory addsuppilercategory,BindingResult result, ModelMap model,HttpServletRequest request ) {

		
		
		SuppliercategoryDAO.delete_suppliercategory(id);
		SupplierCategoryform addsuppliercategoryform = new SupplierCategoryform();
		addsuppliercategoryform.setSuppliercategory(SuppliercategoryDAO.getlimiteddocumenttypereport(1));
		model.addAttribute("noofpages",(int) Math.ceil(SuppliercategoryDAO.getnoofdocumenttypereport() * 1.0 / 5));	 
		   
		model.addAttribute("button","viewall");
	    model.addAttribute("success","false");
	    model.addAttribute("currentpage",1);
	    

		
		
		model.addAttribute("addsuppliercategoryform",addsuppliercategoryform);
		model.addAttribute("menu","supplier");
	    return "suppliercategorylist";
		
	}
	@RequestMapping(value="/viewsuppliertypereport_page", method=RequestMethod.GET)
	public String viewdocumenttypereport_page(HttpServletRequest request,@RequestParam("page") int page,ModelMap model) {	
		SupplierCategoryform addsuppliercategoryform = new SupplierCategoryform();
		addsuppliercategoryform.setSuppliercategory(SuppliercategoryDAO.getlimiteddocumenttypereport(page));
		model.addAttribute("noofpages",(int) Math.ceil(SuppliercategoryDAO.getnoofdocumenttypereport() * 1.0 / 5));	 
	  	model.addAttribute("noofrows",5);   
	    model.addAttribute("currentpage",page);
	    model.addAttribute("menu","supplier");
	    model.addAttribute("button","viewall");
	    model.addAttribute("addsuppliercategoryform",addsuppliercategoryform);
	    
	    return "suppliercategorylist";
		
	}
	
	
	@RequestMapping(value={"/viewallsuppliercategorytypereport"}, method = RequestMethod.GET)
	public String viewalldocumenttypereport(HttpServletRequest request,ModelMap model, Principal principal ) {
		SupplierCategoryform addsuppliercategoryform = new SupplierCategoryform();
		
		addsuppliercategoryform.setSuppliercategory(SuppliercategoryDAO.getsuppliertype());
		model.addAttribute("addsuppliercategoryform",addsuppliercategoryform);
	  	model.addAttribute("noofrows",5);    
	  
	    model.addAttribute("menu","supplier");
	    model.addAttribute("button","close");
	      
	    	model.addAttribute("menu","document");
	        model.addAttribute("success","false");
	        model.addAttribute("button","close");
	        return "suppliercategorylist";

	}
	
	@RequestMapping(value="/category_search", method=RequestMethod.GET)
	public String documentprefixlistsearch(HttpSession session, @RequestParam("category") String category, HttpServletRequest request,ModelMap model, Principal principal) {

		SupplierCategoryform addsuppliercategoryform = new SupplierCategoryform();
		addsuppliercategoryform.setSuppliercategory(SuppliercategoryDAO.getcategory(category));
		model.addAttribute("menu","supplier");
	  	model.addAttribute("noofrows",5);
		model.addAttribute("justcame","false");
		
		model.addAttribute("addsuppliercategoryform",addsuppliercategoryform);
		
		return "suppliercategorylist";
	}
		

}
