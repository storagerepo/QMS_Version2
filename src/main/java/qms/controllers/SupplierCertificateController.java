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


import qms.forms.FormFormPrefix;
import qms.forms.MaintenanceForm;
import qms.forms.SupplierPerformanceForm;
import qms.forms.SupplierCategoryform;
import qms.model.FormPrefix;
import qms.model.DocumentPrefix;
import qms.model.Maintenance;
import qms.model.SuppilerCategory;
import qms.forms.DocumentPrefixForm;

import qms.model.Certified_To;
import qms.forms.Certified_toform;


@Controller
@SessionAttributes({"certifiedto"})
public class SupplierCertificateController {
	
	@Autowired
	SupplierCertificatetoDAO SupplierCertificatetoDAO;
	//SuppliercategoryDAO AddsuppliercategoryDAO;
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	
@RequestMapping(value = {"/Add_certifiedto"}, method = RequestMethod.GET)
	
	public String add_certifiedto(HttpSession session,ModelMap model, Principal principal) {
		session.removeAttribute("certifiedto");
		model.addAttribute("menu","supplier");
		return "Add_certifiedto";
	}

//Insert a record
@RequestMapping(value = "/add_certifiedto", method = RequestMethod.POST)
public String postcertifiedto(HttpSession session,@ModelAttribute("certified_to") @Valid Certified_To certified_to,BindingResult result, ModelMap model) {

	
	
	
	if (result.hasErrors()) {
		Certified_toform Certified_toform = new Certified_toform();
		
		Certified_toform.setCertified_to(SupplierCertificatetoDAO.getsuppliercerticate());
		  model.addAttribute("Certified_toform",Certified_toform);
		//model.addAttribute("Success", "true");
			

		return "Add_certifiedto";
	}

	SupplierCertificatetoDAO.insert_certifiedto(certified_to);
	/*Certified_toform Certified_toform = new Certified_toform();
	
	Certified_toform.setCertified_to(SupplierCertificatetoDAO.getsuppliercerticate());
	  model.addAttribute("Certified_toform",Certified_toform);*/
	  //model.addAttribute("success","insert");
	model.addAttribute("Success", "true");
	session.removeAttribute("certifiedto");
		return "Add_certifiedto";
}


@RequestMapping(value="/suppliercertificatelist", method=RequestMethod.GET)
public String certifiedtolist(HttpServletRequest request,ModelMap model, Principal principal,HttpSession session) {
	
	Certified_toform Certified_toform = new Certified_toform();
	model.addAttribute("menu","supplier");
  	model.addAttribute("noofrows",5);
	
  	Certified_toform.setCertified_to(SupplierCertificatetoDAO.getlimitedcertificatetypereport(1));
	
  	
model.addAttribute("noofpages",(int) Math.ceil(SupplierCertificatetoDAO.getnoofcertificatetypereport() * 1.0 / 5));	 
	   
	model.addAttribute("button","viewall");
    model.addAttribute("success","false");
    model.addAttribute("currentpage",1);
	model.addAttribute("Certified_toform",Certified_toform);
	model.addAttribute("justcame","false");
	return "suppliercertificatelist";
}


@RequestMapping(value={"/edit_suppliercertificate"}, method = RequestMethod.GET)
public String edit_suppliercertifiedto(HttpServletRequest request,@RequestParam("id") String id,@ModelAttribute("addsuppilercategory") @Valid Certified_To addsuppilerCategory,ModelMap model, Principal principal ) {
	
	
	Certified_toform Certified_toform = new Certified_toform();
	
	Certified_toform.setCertified_to(SupplierCertificatetoDAO.getsuppliercertificate(id));
	model.addAttribute("Certified_toform",Certified_toform);
        return "edit_suppliercertificate";

}
	@RequestMapping(value="/update_suppliercertificate",method=RequestMethod.POST)
	public String updatecertifiedto(@RequestParam("id") String id,HttpSession session,@ModelAttribute("Certified_To") @Valid Certified_To Certified_To,BindingResult result, ModelMap model,HttpServletRequest request ) {
		
	
		
		session.setAttribute("certifiedto",Certified_To);
	
		SupplierCertificatetoDAO.update_suppliercertificate(Certified_To);
		model.addAttribute("Success", "Update");
	session.removeAttribute("dtype");
	Certified_toform Certified_toform = new Certified_toform();
	model.addAttribute("menu","supplier");
	model.addAttribute("noofrows",5);
	
	Certified_toform.setCertified_to(SupplierCertificatetoDAO.getlimitedcertificatetypereport(1));
	
	
model.addAttribute("noofpages",(int) Math.ceil(SupplierCertificatetoDAO.getnoofcertificatetypereport() * 1.0 / 5));	 
	   
	model.addAttribute("button","viewall");
 model.addAttribute("success","false");
 model.addAttribute("currentpage",1);
	model.addAttribute("Certified_toform",Certified_toform);
	model.addAttribute("justcame","false");
   return "suppliercertificatelist";

}

	@RequestMapping(value = "/delete_suppliercertificate", method = RequestMethod.GET)
	public String deletecertifiedto(@RequestParam("id") String id,HttpSession session,@ModelAttribute("Certified_To") @Valid Certified_To Certified_To,BindingResult result, ModelMap model,HttpServletRequest request ) {

		
		
		SupplierCertificatetoDAO.deletesuppliercertificate(id);
		model.addAttribute("Success", "Del");
		Certified_toform Certified_toform = new Certified_toform();
		Certified_toform.setCertified_to(SupplierCertificatetoDAO.getlimitedcertificatetypereport(1));
		
		
		model.addAttribute("noofpages",(int) Math.ceil(SupplierCertificatetoDAO.getnoofcertificatetypereport() * 1.0 / 5));	 
		   
		model.addAttribute("button","viewall");
	    model.addAttribute("success","false");
	    model.addAttribute("currentpage",1);
	    

		
		
	    model.addAttribute("Certified_toform",Certified_toform);
		model.addAttribute("menu","supplier");
	    return "suppliercertificatelist";
		
	}
	@RequestMapping(value="/viewsuppliercertificatetypereport_page", method=RequestMethod.GET)
	public String viewdocumenttypereport_page(HttpServletRequest request,@RequestParam("page") int page,ModelMap model) {	
		Certified_toform Certified_toform = new Certified_toform();
		Certified_toform.setCertified_to(SupplierCertificatetoDAO.getlimitedcertificatetypereport(page));
		model.addAttribute("noofpages",(int) Math.ceil(SupplierCertificatetoDAO.getnoofcertificatetypereport() * 1.0 / 5));	 
	  	model.addAttribute("noofrows",5);   
	    model.addAttribute("currentpage",page);
	    model.addAttribute("menu","supplier");
	    model.addAttribute("button","viewall");
	    model.addAttribute("Certified_toform",Certified_toform);
	    
	    return "suppliercertificatelist";
		
	}
	
	
	@RequestMapping(value={"/viewallsuppliercertificatetypereport"}, method = RequestMethod.GET)
	public String viewallcertifedto(HttpServletRequest request,ModelMap model, Principal principal ) {
		Certified_toform Certified_toform = new Certified_toform();
		
		Certified_toform.setCertified_to(SupplierCertificatetoDAO.getsuppliercerticate());
		  model.addAttribute("Certified_toform",Certified_toform);
	  	model.addAttribute("noofrows",5);    
	  
	    model.addAttribute("menu","document");
	    model.addAttribute("button","close");
	      
	    	model.addAttribute("menu","supplier");
	        model.addAttribute("success","false");
	        model.addAttribute("button","close");
	        return "suppliercertificatelist";

	}
	

	@RequestMapping(value="/certificate_search", method=RequestMethod.GET)
	public String certificate_search(HttpSession session, @RequestParam("certified_to") String certified_to, HttpServletRequest request,ModelMap model, Principal principal) {

		Certified_toform Certified_toform = new Certified_toform();
		Certified_toform.setCertified_to(SupplierCertificatetoDAO.getcertificate(certified_to));
		model.addAttribute("menu","supplier");
	  	model.addAttribute("noofrows",5);
		model.addAttribute("justcame","false");
		
		 model.addAttribute("Certified_toform",Certified_toform);
		
		return "suppliercertificatelist";
	}
		

}
