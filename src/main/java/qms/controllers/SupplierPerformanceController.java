	package qms.controllers;

	import java.security.Principal;
import java.util.ArrayList;


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

	import qms.dao.SupplierPerformanceDAO;
import qms.model.SupplierPerformance;

import qms.forms.SupplierPerformanceForm;;

	@Controller
	@SessionAttributes({"supplier"})
	public class SupplierPerformanceController
	{
		@Autowired
		SupplierPerformanceDAO supplierPerformanceDAO;
		
		
		//View method for supplier performance form
		@RequestMapping(value={"/view_supplierperformance"}, method = RequestMethod.GET)
		public String show_supplierperformance(HttpSession session,HttpServletRequest request, ModelMap model, Principal principal )
		{
			session.removeAttribute("suppliername");
			session.removeAttribute("phone");
			session.removeAttribute("email");
	    SupplierPerformanceForm supplierPerformanceForm=new SupplierPerformanceForm();
	    model.addAttribute("menu","supplier");
	    //model.addAttribute("noofrows",5); 
	    
	    supplierPerformanceForm.setSupplierperformance(supplierPerformanceDAO.getlimitedsupplierreport(1));
	    /*
	    model.addAttribute("noofpages",(int) Math.ceil(supplierPerformanceDAO.getnoofsupplierreport() * 1.0 / 5));
	    model.addAttribute("button","viewall");
        model.addAttribute("success","false");
        model.addAttribute("currentpage",1);
        */
	  //  model.addAttribute("supplierPerformanceForm",supplierPerformanceForm);
	    model.addAttribute("justcame",false);
		return "view_supplierperformance";
	 	}
		
		//View method for supplier Details
		@RequestMapping(value={"/view_supplier"}, method = RequestMethod.GET)
		public String show_suppliers(HttpSession session,HttpServletRequest request, ModelMap model, Principal principal )
		{
			
	    SupplierPerformanceForm supplierPerformanceForm=new SupplierPerformanceForm();
	    model.addAttribute("menu","supplier");
	    model.addAttribute("noofrows",10); 
	    
	    supplierPerformanceForm.setSupplierperformance(supplierPerformanceDAO.getlimitedsuppliers(1));
	    
	    model.addAttribute("noofpages",(int) Math.ceil(supplierPerformanceDAO.getnoofsupplierreport() * 1.0 / 10));
	    model.addAttribute("button","viewall");
        model.addAttribute("success","false");
        model.addAttribute("currentpage",1);
        
	   model.addAttribute("supplierPerformanceForm",supplierPerformanceForm);
	    model.addAttribute("justcame",false);
		return "view_supplier_details";
	 	}
		




		@RequestMapping(value="/viewsupplierreport_page", method=RequestMethod.GET)
		public String viewsupplierreport_page(HttpSession session,HttpServletRequest request,@RequestParam("page") int page,
				@RequestParam("supplier_name") String suppliername,@RequestParam("phone") String phone,
				@RequestParam("email_address") String email,ModelMap model) {	
			session.setAttribute("suppliername", suppliername);
			session.setAttribute("phone", phone);
			session.setAttribute("email",email);
			
			SupplierPerformanceForm supplierPerformanceForm=new SupplierPerformanceForm();
			supplierPerformanceForm.setSupplierperformance(supplierPerformanceDAO.getSupplierPerformances(suppliername, phone, email, page));
			model.addAttribute("noofpages",(int) Math.ceil(supplierPerformanceDAO.FindSupplierPerformances(suppliername, phone, email) * 1.0 / 5));	 
			model.addAttribute("supplierPerformanceForm",supplierPerformanceForm);
		  	model.addAttribute("noofrows",5);   
		    model.addAttribute("currentpage",page);
		    model.addAttribute("menu","supplier");
		    model.addAttribute("button","viewall");
		    model.addAttribute("success","true");
		    model.addAttribute("justcame",false);
		    return "view_supplierperformance";
		    
			
		}

		//supplier view
		@RequestMapping(value="/viewsupplier_page", method=RequestMethod.GET)
		public String viewsupplier_page(HttpSession session,HttpServletRequest request,@RequestParam("page") int page,ModelMap model) {	
			
			
			SupplierPerformanceForm supplierPerformanceForm=new SupplierPerformanceForm();
			supplierPerformanceForm.setSupplierperformance(supplierPerformanceDAO.getlimitedsuppliers(page));
			model.addAttribute("noofpages",(int) Math.ceil(supplierPerformanceDAO.getnoofsupplierreport() * 1.0 / 10));	 
			model.addAttribute("supplierPerformanceForm",supplierPerformanceForm);
		  	model.addAttribute("noofrows",10);   
		    model.addAttribute("currentpage",page);
		    model.addAttribute("menu","supplier");
		    model.addAttribute("button","viewall");
		    model.addAttribute("success","true");
		    model.addAttribute("justcame",false);
		    return "view_supplier_details";
		    
			
		}


		@RequestMapping(value={ "/viewallsupplierreport"}, method = RequestMethod.GET)
		public String viewallsupplierreport(HttpSession session,HttpServletRequest request,ModelMap model,
				@RequestParam("supplier_name") String suppliername,@RequestParam("phone") String phone,
				@RequestParam("email_address") String email,Principal principal )
		{
			session.setAttribute("suppliername", suppliername);
			session.setAttribute("phone", phone);
			session.setAttribute("email",email);
			SupplierPerformanceForm supplierPerformanceForm=new SupplierPerformanceForm();
			supplierPerformanceForm.setSupplierperformance(supplierPerformanceDAO.getSupplierPerformances(suppliername, phone, email, 0));
			model.addAttribute("noofpages",(int) Math.ceil(supplierPerformanceDAO.FindSupplierPerformances(suppliername, phone, email) * 1.0 / 5));	 
			model.addAttribute("supplierPerformanceForm",supplierPerformanceForm);

		  	model.addAttribute("noofrows",5);    
		   //narrativereportForm.getNarrativereport().size()
		    model.addAttribute("menu","supplier");
		    model.addAttribute("button","close");
		    model.addAttribute("success","true");
		    	model.addAttribute("menu","supplier");
		        model.addAttribute("success","false");
		        model.addAttribute("button","close");
		        return "view_supplierperformance";
		        
		}
		
		@RequestMapping(value={ "/viewallsupplier"}, method = RequestMethod.GET)
		public String viewallsupplier(HttpSession session,HttpServletRequest request,ModelMap model,Principal principal )
		{
			
			SupplierPerformanceForm supplierPerformanceForm=new SupplierPerformanceForm();
			supplierPerformanceForm.setSupplierperformance(supplierPerformanceDAO.getsupplierperformance());
				 
			model.addAttribute("supplierPerformanceForm",supplierPerformanceForm);
		   
		   //narrativereportForm.getNarrativereport().size()
		    model.addAttribute("menu","supplier");
		    model.addAttribute("button","close");
		    model.addAttribute("success","true");
		    	model.addAttribute("menu","supplier");
		        model.addAttribute("success","false");
		        model.addAttribute("button","close");
		        return "view_supplier_details";
		        
		}

	
		
		
		
		//Request Get Method for insert operation
		@RequestMapping(value={"/add_supplierperformance"}, method = RequestMethod.GET)
		public String add_supplierperformance(HttpSession session,ModelMap model, Principal principal )
		{
			session.removeAttribute("supplier");
			model.addAttribute("id", supplierPerformanceDAO.get_maxid());
			System.out.println("get method");
			 model.addAttribute("menu","supplier");
	     return "add_supplierperformance";
	    
	 	}
		

		// Insert Operation
		@RequestMapping(value={"/add_supplierperformance"}, method = RequestMethod.POST)
		public String insert_supplierperformance(HttpSession session, @ModelAttribute("supplierperformance") @Valid SupplierPerformance supplierPerformance, BindingResult result, ModelMap model, Principal principal)

		{	
			
			session.removeAttribute("phone");
			session.removeAttribute("email");
			session.removeAttribute("suppliername");
			System.out.println("came");
			session.setAttribute("supplier",supplierPerformance);
			if(result.hasErrors())
			{
				model.addAttribute("id", supplierPerformanceDAO.get_maxid());
				System.out.println("going to return");
				return "add_supplierperformance";
				
			}
			System.out.println("inserting....");
			supplierPerformanceDAO.insert_supplierperformance(supplierPerformance);
			SupplierPerformanceForm supplierPerformanceForm= new SupplierPerformanceForm();
			supplierPerformanceForm.setSupplierperformance(supplierPerformanceDAO.getsupplierperformance());
		//	model.addAttribute("supplierPerformanceForm",supplierPerformanceForm);
			model.addAttribute("id", supplierPerformanceDAO.get_maxid());
			model.addAttribute("menu","supplier");
			   model.addAttribute("success","true");
			   model.addAttribute("justcame",false);
			return "view_supplierperformance";
			
	 	}
		
		// Update Operation
		@RequestMapping(value={"/updatesupplierperformance"}, method = RequestMethod.POST)
		public String update_supplierperformance(HttpSession session,@ModelAttribute("supplierperformance") @Valid SupplierPerformance supplierPerformance,BindingResult result,ModelMap model, Principal principal)
		{
			session.removeAttribute("phone");
			session.removeAttribute("email");
			session.removeAttribute("suppliername");
			session.setAttribute("supplier",supplierPerformance);
			if(result.hasErrors())
			{
				
				SupplierPerformanceForm supplierPerformanceForm = new SupplierPerformanceForm();
				supplierPerformanceForm.setSupplierperformance(supplierPerformanceDAO.getsupplierperformance());
				model.addAttribute("supplierPerformanceForm",supplierPerformanceForm);
				return "edit_supplierperformance";
			}	
			supplierPerformanceDAO.update_supplierperformance(supplierPerformance);
			SupplierPerformanceForm supplierPerformanceForm = new SupplierPerformanceForm();
			supplierPerformanceForm.setSupplierperformance(supplierPerformanceDAO.getsupplierperformance());
		//	model.addAttribute("supplierPerformanceForm", supplierPerformanceForm);
			model.addAttribute("success","update");
			model.addAttribute("menu","supplier");
			 model.addAttribute("justcame",false);
			return "view_supplierperformance";

	 	}
		
		//Delete Operation
		@RequestMapping(value={"/deletesupplierperformance"}, method = RequestMethod.GET)
		public String delete_supplierperformance(@RequestParam("sid") String supplier_id,ModelMap model, Principal principal )
		{
			model.addAttribute("justcame","false");
			supplierPerformanceDAO.delete_supplierperformance(supplier_id);
			SupplierPerformanceForm supplierPerformanceForm=new SupplierPerformanceForm();
		    supplierPerformanceForm.setSupplierperformance(supplierPerformanceDAO.getsupplierperformance());
		    model.addAttribute("supplierPerformanceForm",supplierPerformanceForm);
		    model.addAttribute("success","true");
		    model.addAttribute("menu","supplier");
			return "view_supplierperformance";
			
	 	}
		
		//Get Method for Edit Operation
		@RequestMapping(value={"/editsupplierperformance"}, method = RequestMethod.GET)
		public String edit_supplierperformance(@RequestParam("sid") String supplier_id,ModelMap model, Principal principal )
		{
	    
			model.addAttribute("id", supplierPerformanceDAO.get_maxid());
			SupplierPerformanceForm supplierPerformanceForm=new SupplierPerformanceForm();
			supplierPerformanceForm.setSupplierperformance(supplierPerformanceDAO.getsupplierperformance_byid(supplier_id));
			model.addAttribute("supplierPerformanceForm",supplierPerformanceForm);
			model.addAttribute("menu","supplier");
			return "edit_supplierperformance";
	 	}
		
		//Find Operation
		@RequestMapping(value="/findsupplierperformance",method=RequestMethod.GET)		
		public String findsupplierperformance(HttpServletRequest request,HttpSession session,@RequestParam("supplier_name") String suppliername,@RequestParam("phone") String phone,@RequestParam("email_address") String email,ModelMap model)
		{
		
			System.out.println("find");
			session.setAttribute("suppliername", suppliername);
			session.setAttribute("phone", phone);
			session.setAttribute("email",email);
			System.out.println("searching.......");
			SupplierPerformanceForm supplierPerformanceForm = new SupplierPerformanceForm();
			supplierPerformanceForm.setSupplierperformance(supplierPerformanceDAO.getSupplierPerformances(suppliername, phone, email, 1));
			model.addAttribute("noofpages",(int) Math.ceil(supplierPerformanceDAO.FindSupplierPerformances(suppliername, phone, email) * 1.0 / 5));	 
			model.addAttribute("button","viewall");
			model.addAttribute("success","false");
			model.addAttribute("currentpage",1);
	    	model.addAttribute("supplierPerformanceForm",supplierPerformanceForm);
	    	model.addAttribute("menu","supplier");
			return "view_supplierperformance";		
			
			}
		
		// Getting the Supplier Performance record's list
		@RequestMapping(value = "list_supplierperformance", method = RequestMethod.GET)
		public String list_supplierperformance(@RequestParam("supplier_id") String supplier_id,
				ModelMap model, Principal principal) 
		{
			SupplierPerformanceForm supplierPerformanceForm = new SupplierPerformanceForm();
			supplierPerformanceForm.setSupplierperformance(supplierPerformanceDAO.list_supplierperformance(supplier_id));
			System.out.println("list:"+supplier_id);
			model.addAttribute("supplierPerformanceForm", supplierPerformanceForm);
			model.addAttribute("menu","supplier");
			System.out.println("list result.......");
			return "list_supplierperformance";
		}

	//report page request passing
	@RequestMapping(value = "/supplierperformance_report", method = RequestMethod.GET)
	public String reportsupplierperformance(ModelMap model) {
		  model.addAttribute("menu","supplier");
		return "report_supplierperformance";

	}
	


	//This is used for downloading Excel Sheet
	@RequestMapping(value ={ "/supplierperformancereport" }, method = RequestMethod.GET)
	  public ModelAndView getExcel_view() {
	java.util.List<SupplierPerformance> supplierPerformances = new ArrayList<SupplierPerformance>();
	
	supplierPerformances = supplierPerformanceDAO.getsupplierperformance();
	
	return new ModelAndView("supplierperformanceDAO","supplierPerformances",supplierPerformances);
	
	}
	


	//Report Generation
	@RequestMapping(value = "/generate_supplierperformance_report", method = RequestMethod.POST)
	public ModelAndView generatesupplierperformance_Report(HttpServletRequest request,ModelMap model, HttpServletResponse response)
	{
	
		String[] fields={"supplier_id","supplier_name","category","address","city","state","postalcode","country",
				"website","certified_to","contact_name","contact_title","phone","fax","email_address"};
	
		System.out.println(request.getParameter("type_of_report"));
		
		java.util.List<SupplierPerformance> supplierPerformances=new ArrayList<SupplierPerformance>();
			switch(Integer.parseInt(request.getParameter("doc_type")))
				  {
		  case 0:
			  supplierPerformances=supplierPerformanceDAO.get_supplierperformance_type("opensupplierperformance");
			  break;
/*		  case 1:
			  supplierPerformances=supplierPerformanceDAO.get_nonconformance_type("nodispositionover30days","start","end");
			  break;
		  case 2:
			  start=request.getParameter("start_date");
				end=request.getParameter("end_date");
				
			  supplierPerformances=supplierPerformanceDAO.get_noncon_type("opennonconformance","start","end");
			  break;
		  
*/		  default:
			  break;
				  
				
		}
		if(Integer.parseInt(request.getParameter("report_type"))==1)
		{
		
				System.out.println("now ok");
				 response.setHeader("Content-Disposition","attachment;filename='"+request.getParameter("supplier_name")+"'");
					
				fields=request.getParameterValues("report_field[]");
			
		}
		else
			
		response.setHeader("Content-Disposition","attachment;filename='SupplierPerformance_Report'");
		
		
		ModelAndView modelAndView=new ModelAndView("supplierperformanceDAO","supplierPerformances",supplierPerformances);
		
		modelAndView.addObject("fields",fields);
		
		System.out.println("now ok::::");
		return modelAndView ;
	}

	//delete a record for admin setup
	@RequestMapping(value={"/supplierperformancedelete"}, method = RequestMethod.GET)
	public String delete_supplierperformance(HttpSession session, ModelMap model, Principal principal)
	{
		model.addAttribute("justcame","false");
		session.removeAttribute("suppliername");
		session.removeAttribute("phone");
		session.removeAttribute("email");

	    SupplierPerformanceForm supplierPerformanceForm=new SupplierPerformanceForm();
	    model.addAttribute("menu","supplier");
	    model.addAttribute("justcame",false);
	    //model.addAttribute("noofrows",5); 
	    supplierPerformanceForm.setSupplierperformance(supplierPerformanceDAO.getsupplierperformance());
	    //supplierPerformanceForm.setSupplierperformance(supplierPerformanceDAO.getlimitedsupplierreport(1));	    
	    return "supplierperformancedelete";
	}

	//Find Operation
			@RequestMapping(value="/findsupplierperformances",method=RequestMethod.GET)		
			public String findsupplierperformances(HttpServletRequest request,HttpSession session,@RequestParam("supplier_name") String suppliername,@RequestParam("phone") String phone,@RequestParam("email_address") String email,ModelMap model)
			{
				System.out.println("find");
				session.setAttribute("suppliername", suppliername);
				session.setAttribute("phone", phone);
				session.setAttribute("email",email);
				System.out.println("searching.......");
				SupplierPerformanceForm supplierPerformanceForm = new SupplierPerformanceForm();
				supplierPerformanceForm.setSupplierperformance(supplierPerformanceDAO.getSupplierPerformances(suppliername, phone, email, 1));
				model.addAttribute("noofpages",(int) Math.ceil(supplierPerformanceDAO.FindSupplierPerformances(suppliername, phone, email) * 1.0 / 5));	 
				model.addAttribute("button","viewall");
				model.addAttribute("success","false");
				model.addAttribute("currentpage",1);
		    	model.addAttribute("supplierPerformanceForm",supplierPerformanceForm);
		    	model.addAttribute("menu","supplier");
			return "supplierperformancedelete";
		
		}
			//Search Operation Results Pagination for Admin Setup created on 28-june-2014.
			@RequestMapping(value="/viewdeletesupplierreport_page", method=RequestMethod.GET)
			public String viewdeletesupplierreport_page(HttpSession session,HttpServletRequest request,@RequestParam("page") int page,
					@RequestParam("supplier_name") String suppliername,@RequestParam("phone") String phone,
					@RequestParam("email_address") String email,ModelMap model) {	
				session.setAttribute("suppliername", suppliername);
				session.setAttribute("phone", phone);
				session.setAttribute("email",email);
				
				SupplierPerformanceForm supplierPerformanceForm=new SupplierPerformanceForm();
				supplierPerformanceForm.setSupplierperformance(supplierPerformanceDAO.getSupplierPerformances(suppliername, phone, email, page));
				model.addAttribute("noofpages",(int) Math.ceil(supplierPerformanceDAO.FindSupplierPerformances(suppliername, phone, email) * 1.0 / 5));	 
				model.addAttribute("supplierPerformanceForm",supplierPerformanceForm);
			  	model.addAttribute("noofrows",5);   
			    model.addAttribute("currentpage",page);
			    model.addAttribute("menu","supplier");
			    model.addAttribute("button","viewall");
			    model.addAttribute("success","true");
			    return "supplierperformancedelete";
			    
				
			}

			//Search Operation Results Pagination for Admin Setup created on 28-june-2014.
			@RequestMapping(value={ "/viewalldeletesupplierreport"}, method = RequestMethod.GET)
			public String viewalldeletesupplierreport(HttpSession session,HttpServletRequest request,ModelMap model,
					@RequestParam("supplier_name") String suppliername,@RequestParam("phone") String phone,
					@RequestParam("email_address") String email,Principal principal )
			{
				session.setAttribute("suppliername", suppliername);
				session.setAttribute("phone", phone);
				session.setAttribute("email",email);
				SupplierPerformanceForm supplierPerformanceForm=new SupplierPerformanceForm();
				supplierPerformanceForm.setSupplierperformance(supplierPerformanceDAO.getSupplierPerformances(suppliername, phone, email, 0));
				model.addAttribute("noofpages",(int) Math.ceil(supplierPerformanceDAO.FindSupplierPerformances(suppliername, phone, email) * 1.0 / 5));	 
				model.addAttribute("supplierPerformanceForm",supplierPerformanceForm);

			  	model.addAttribute("noofrows",5);    
			   //narrativereportForm.getNarrativereport().size()
			    model.addAttribute("menu","admin");
			    model.addAttribute("button","close");
			    model.addAttribute("success","true");
			    	model.addAttribute("menu","supplier");
			        model.addAttribute("success","false");
			        model.addAttribute("button","close");
			        return "supplierperformancedelete";
			        
			}


		@RequestMapping(value={"/deletesupplier"}, method = RequestMethod.POST)
	public String deletesupplierperformance(HttpServletRequest request,ModelMap model,Principal principal,HttpSession session) 
	{	
			model.addAttribute("justcame","false");
			session.removeAttribute("suppliername");
			session.removeAttribute("phone");
			session.removeAttribute("email");
		String[] SelectedIDs=new String[100];
		SelectedIDs=request.getParameterValues("chkUser");
		for(String id:SelectedIDs)
		{
		System.out.println(id);
		
		//formDAO.deleteParticipant(id,principal.getName());
		supplierPerformanceDAO.delete_supplierperformance(id);
		}
		SupplierPerformanceForm supplierPerformanceForm=new SupplierPerformanceForm();
	    supplierPerformanceForm.setSupplierperformance(supplierPerformanceDAO.getsupplierperformance());
	 //   model.addAttribute("supplierPerformanceForm",supplierPerformanceForm);

		model.addAttribute("menu","supplier");
		model.addAttribute("success","delete");
		return "supplierperformancedelete";
		
	}	
	
 	}
	
