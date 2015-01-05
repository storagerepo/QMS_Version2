package qms.controllers;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
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
import org.springframework.web.multipart.MultipartFile;

import qms.dao.CustomersDAO;
import qms.dao.FileHandlingDAO;
import qms.dao.HRandTrainingDAO;
import qms.dao.NonConformanceDAO;
import qms.dao.ProductId_NCDAO;
import qms.dao.ReferenceMaintenanceDAO;
import qms.dao.ReportedByNCDAO;
import qms.dao.Source_NCDAO;
import qms.dao.Type_of_NC_DAO;
import qms.model.Customers;
import qms.forms.CustomersForm;
import qms.forms.DocumentMainForm;
import qms.forms.HRandTrainingForm;
import qms.forms.MaintenanceForm;
import qms.forms.Non_Conformance_SourceForm;
import qms.forms.ProductId_NC_Form;
import qms.forms.Type_of_NC_Form;


@Controller
@SessionAttributes({"customer","cust_id","cusid","cusname","cusaddress"})
public class CustomersController
{
	@Autowired
	CustomersDAO customersDAO;
	
	@Autowired
	NonConformanceDAO nonConformanceDAO;
	
	@Autowired
	Source_NCDAO sourceNCDAO;
	
	@Autowired
	Type_of_NC_DAO typeNCDAO;
	
	@Autowired
	ProductId_NCDAO productId_NCDAO;
	
	
	@Autowired
	HRandTrainingDAO hRandTrainingDAO;
	
	
	
	//view records
	@RequestMapping(value={"/viewcustomers"}, method = RequestMethod.GET)
	public String show_customers(HttpSession session,ModelMap model, Principal principal )
	{
		
	session.removeAttribute("cust_id");
	session.removeAttribute("name");
	session.removeAttribute("address");
    CustomersForm customersForm=new CustomersForm();
    model.addAttribute("menu","customer");
  //  model.addAttribute("noofrows",5); 
    customersForm.setCustomers(customersDAO.getlimitedcustomerreport(1));
   /* model.addAttribute("noofpages",(int) Math.ceil(customersDAO.getnoofcustomerreport() * 1.0 / 5));
    model.addAttribute("button","viewall");
    model.addAttribute("success","false");
    model.addAttribute("currentpage",1);
  *///  model.addAttribute("customersForm",customersForm);
    model.addAttribute("justcame",false);


	return "view_customers";
 	}
	
	
	@RequestMapping(value="/viewcustomerreport_page", method=RequestMethod.GET)
	public String viewcustomerreport_page(HttpServletRequest request,HttpSession session,@RequestParam("page") int page,
			@RequestParam("customer_id") String id,@RequestParam("customer_name") String name,@RequestParam("address") String address,ModelMap model) {
		
		session.setAttribute("cust_id",id);
		session.setAttribute("name",name);
		session.setAttribute("address",address);
		CustomersForm customersForm = new CustomersForm();
		customersForm.setCustomers(customersDAO.getfindcustomer(id, name, address,page));
		model.addAttribute("noofpages",(int) Math.ceil(customersDAO.FindCustomer(id, name, address) * 1.0 / 5));
		model.addAttribute("customersForm", customersForm);	
	  	model.addAttribute("noofrows",5);
	    model.addAttribute("currentpage",page);
	    model.addAttribute("menu","customer");
	    model.addAttribute("button","viewall");
	    
	    return "view_customers";
		
	}

	@RequestMapping(value={"/viewallcustomerreport"}, method = RequestMethod.GET)
	public String viewallcustomerreport(HttpServletRequest request,HttpSession session,ModelMap model,@RequestParam("customer_id") String id,
			@RequestParam("customer_name") String name,@RequestParam("address") String address,
			Principal principal ) 
	{
		

		session.setAttribute("cust_id",id);
		session.setAttribute("name",name);
		session.setAttribute("address", address);
		CustomersForm customersForm = new CustomersForm();
		customersForm.setCustomers(customersDAO.getfindcustomer(id, name, address, 0));
	//	model.addAttribute("noofpages",(int) Math.ceil(documentControlDAO.FindDocuments(search_document_type, search_process) * 1.0 / 5));	 
		model.addAttribute("customersForm", customersForm);

	 // 	model.addAttribute("noofrows",5);    
	   //narrativereportForm.getNarrativereport().size()
	    model.addAttribute("menu","document");
	    model.addAttribute("button","close");
	      
	    	model.addAttribute("menu","document");
	        model.addAttribute("success","false");
	        model.addAttribute("button","close");
	        return "view_customers";
	}
	
	//getting unique id
	@RequestMapping(value={"/addcustomer"}, method = RequestMethod.GET)
	public String add_customer(HttpSession session,ModelMap model, Principal principal )
	{
     model.addAttribute("id",customersDAO.getMax_customerID());	
     session.removeAttribute("customer");
     model.addAttribute("menu","customer");
	return "add_customers";
 	}
	

	//insert a record
	@RequestMapping(value={"/addcustomer"}, method = RequestMethod.POST)
	public String insert_customer(HttpSession session,@ModelAttribute("Customers") @Valid Customers customers,BindingResult result,ModelMap model)
	{
		session.removeAttribute("cust_id");
		session.removeAttribute("name");
		session.removeAttribute("address");
		session.setAttribute("customer",customers);
			if (result.hasErrors())
			{
			/*	CustomersForm customersForm=new CustomersForm();
				customersForm.setCustomers(customersDAO.getCustomers());
				model.addAttribute("customersForm",customersForm);
				model.addAttribute("Success","true");
			*/	model.addAttribute("id",customersDAO.getMax_customerID());	
		        return "add_customers";
			}
    // model.addAttribute("id",customersDAO.getMax_customerID());
			//customer feedback insertion
			byte[] buffer=null;// = new byte[10000];
			try {
				MultipartFile file = customers.getAttachments();
				String orginal_fileName = null;
				String duplicate_fileName=null;
				InputStream inputStream = null;
				OutputStream outputStream = null;
				    if (file.getSize() > 0) {
					inputStream = file.getInputStream();
					if (file.getSize() > 2097152) 
					{
						System.out.println("File Size:::" + file.getSize());
						model.addAttribute("filelarge", true);
						return "add_customers";
					}				

				    orginal_fileName ="/qms_upload/"+file.getOriginalFilename();
				    duplicate_fileName=orginal_fileName;
				    File create_file=new File(orginal_fileName);
				    int i=1;			    
				    while(create_file.exists())
				    {

				    	duplicate_fileName="/qms_upload/"+file.getOriginalFilename().substring(0,file.getOriginalFilename().lastIndexOf('.'))+i+file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf('.'));
				    	create_file=new File(duplicate_fileName);
				    	i++;
				    }
				    outputStream = new FileOutputStream(duplicate_fileName);
				    System.out.println("fileName:" + file.getOriginalFilename());
	         
				    
				    //------Lines to changes------//
				    
				    customers.setAttachments_type(file.getContentType());
				    customers.setAttachment_name(file.getOriginalFilename());
				    customers.setAttachment_referrence(duplicate_fileName);
	                
	                //----End Lines to changed----//
	              
	                int readBytes = 0;
					buffer=new byte[(int)file.getSize()];
					while ((readBytes = inputStream.read(buffer, 0,(int) file.getSize())) != -1) {
					outputStream.write(buffer, 0, readBytes);			
					}
					outputStream.close();
					inputStream.close();
				    }
					
			} catch (Exception e) {
				System.out.println(e.toString());
				e.printStackTrace();
			}
			
    customersDAO.insert_customer(customers);
    CustomersForm customersForm = new CustomersForm();
	customersForm.setCustomers(customersDAO.getCustomers());
//	model.addAttribute("customersForm",customersForm);
	model.addAttribute("id", customersDAO.getMax_customerID());
	model.addAttribute("menu","customer");
	model.addAttribute("success","true");
	 model.addAttribute("justcame",false);
	 if(customers.getType_of_feedback().equals("Complaint"))
	 {
		 model.addAttribute("customerEmail",customers.getEmail_address());
		 model.addAttribute("id", nonConformanceDAO.get_maxid());
			session.removeAttribute("nonconformance");
			model.addAttribute("menu","nonconformance");
			
			Non_Conformance_SourceForm conformance_SourceForm = new Non_Conformance_SourceForm();
			conformance_SourceForm.setConformance_Sources(sourceNCDAO.getSource());    
			model.addAttribute("conformance_SourceForm",conformance_SourceForm);
			
			Type_of_NC_Form type_of_NC_Form= new Type_of_NC_Form();
			type_of_NC_Form.setType_of_NCs(typeNCDAO.getType());
			model.addAttribute("type_of_NC_Form",type_of_NC_Form);
			
			ProductId_NC_Form productId_NC_Form = new ProductId_NC_Form();
			productId_NC_Form.setProductIDNCs(productId_NCDAO.getProductId());
			model.addAttribute("productId_NC_Form",productId_NC_Form);
			
			HRandTrainingForm hRandTrainingForm=new HRandTrainingForm();
			hRandTrainingForm.sethRandTrainings(hRandTrainingDAO.getnameList());
			model.addAttribute("hRandTrainingForm",hRandTrainingForm);		
			
			return "add_nonconformance";
		 
	 }
	 else{
	return "view_customers";}
 	}
	
	//Update a record
	@RequestMapping(value={"/updatecustomer"}, method = RequestMethod.POST)

	public String update_customer(ModelMap model,@ModelAttribute("Customers") @Valid Customers customers,BindingResult result,HttpSession session) throws IOException{

		session.removeAttribute("cust_id");
		session.removeAttribute("name");
		session.removeAttribute("address");
		byte[] buffer=null;// = new byte[10000];
		int flag = 0;
		try {
			
			MultipartFile file = customers.getAttachments();
			System.out.println("feedback details = "+customers.getFeedback_details()+ " att = " +customers.getAttachments());
			String orginal_fileName = null;
			String duplicate_fileName=null;
			InputStream inputStream = null;
			OutputStream outputStream = null;
			    if (file.getSize() > 0)
			    {
				inputStream = file.getInputStream();
				if (file.getSize() > 100000) 
				{
					System.out.println("File Size:::" + file.getSize());
					model.addAttribute("filelarge", true);
					return "edit_customers";
				}				
			    orginal_fileName ="/qms_upload/"+file.getOriginalFilename();
			    duplicate_fileName=orginal_fileName;
			    File create_file=new File(orginal_fileName);
			    int i=1;			    
			    while(create_file.exists())
			    {
			    	duplicate_fileName="/qms_upload/"+file.getOriginalFilename().substring(0,file.getOriginalFilename().lastIndexOf('.'))+i+file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf('.'));
			    	create_file=new File(duplicate_fileName);
			    	i++;
			    }
			    outputStream = new FileOutputStream(duplicate_fileName);
			    System.out.println("fileName:" + file.getOriginalFilename());
         
			    
			    //------Lines to changes------//
			    
			    customers.setAttachments_type(file.getContentType());
			    customers.setAttachment_name(file.getOriginalFilename());
			    customers.setAttachment_referrence(duplicate_fileName);
                
                //----End Lines to changed----//
              
                int readBytes = 0;
				buffer=new byte[(int)file.getSize()];
				while ((readBytes = inputStream.read(buffer, 0,(int) file.getSize())) != -1) {
				outputStream.write(buffer, 0, readBytes);			
				}
				outputStream.close();
				inputStream.close();
				/*customerFeedbackDAO.insert_customerfeedback(customerFeedback);*/
				
			}
		if (result.hasErrors())
		{
			
			System.out.println("output");
			CustomersForm customersForm=new CustomersForm();
			//customersForm.setCustomers(customersDAO.getCustomers_byid(customers.getCustomer_id()));
			customersForm.setCustomers(customersDAO.getCustomers());
			model.addAttribute("customersForm",customersForm);	
	        return "edit_customers";
		}
		} catch (Exception e) {
			System.out.println(e.toString());
			e.printStackTrace();
		}
    // model.addAttribute("id",customersDAO.getMax_customerID());
    customersDAO.update_customer(customers);

    CustomersForm customersForm=new CustomersForm();
    customersForm.setCustomers(customersDAO.getCustomers());
  //  model.addAttribute("customersForm",customersForm);
    model.addAttribute("success","update");
    model.addAttribute("menu","customer");
    model.addAttribute("justcame",false);


	return "view_customers";

	

 	}
	
	//delete a record
	@RequestMapping(value={"/deletecustomer"}, method = RequestMethod.GET)
	public String delete_customer(@RequestParam("cid") String customer_id,ModelMap model, Principal principal )
	{
    
		model.addAttribute("justcame","false");
		customersDAO.delete_customer(customer_id);
		CustomersForm customersForm = new CustomersForm();
	    customersForm.setCustomers(customersDAO.getCustomers());
	    model.addAttribute("customersForm",customersForm);
		model.addAttribute("menu","customer");
		model.addAttribute("justcame","false");
		return "view_customers";
 	}
	
	//edit a record
	@RequestMapping(value={"/editcustomer"}, method = RequestMethod.GET)
	public String edit_customer(@RequestParam("cid") String customer_id,ModelMap model, Principal principal )
	{
    
		CustomersForm customersForm=new CustomersForm();
		customersForm.setCustomers(customersDAO.getCustomers_byid(customer_id));
		model.addAttribute("customersForm",customersForm);
		model.addAttribute("menu","customer");
		return "edit_customers";
 	}
	
	//search a record
	@RequestMapping(value="/findcustomer",method=RequestMethod.GET)		
	public String findcustomer(HttpServletRequest request,HttpSession session,@RequestParam("customer_id") String id,@RequestParam("customer_name") String name,@RequestParam("address") String address,ModelMap model)
	{
	
		System.out.println("find");
		session.setAttribute("cust_id", id);
		session.setAttribute("name", name);
		session.setAttribute("address", address);

			CustomersForm customersForm = new CustomersForm();
			customersForm.setCustomers(customersDAO.getfindcustomer(id, name, address,1));
			model.addAttribute("noofpages",(int) Math.ceil(customersDAO.FindCustomer(id, name, address) * 1.0 / 5));
			model.addAttribute("button","viewall");
			model.addAttribute("success","false");
			model.addAttribute("currentpage",1);
			model.addAttribute("customersForm",customersForm);
			model.addAttribute("menu", "customer");
			System.out.println("finding....");
			return "view_customers";
		}
	
	
	// Customer list page	
		
		@RequestMapping(value = "list_customer", method = RequestMethod.GET)
		public String list_customer(@RequestParam("id") String customer_id,
				ModelMap model, Principal principal) 
		{
			CustomersForm customersForm = new CustomersForm();

			customersForm.setCustomers(customersDAO.listCustomers(customer_id));
			System.out.println("list id::"+customer_id);
			model.addAttribute("customersForm", customersForm);
			model.addAttribute("menu","customer");
			return "list_customer";
		}

		//delete a record for admin setup
		@RequestMapping(value={"/customersdelete"}, method = RequestMethod.GET)
		public String delete_customers(ModelMap model, Principal principal,HttpSession session )
		{
			model.addAttribute("justcame","false");
			session.removeAttribute("cusid");
			session.removeAttribute("cusname");
			session.removeAttribute("cusaddress");
			CustomersForm customersForm = new CustomersForm();
		    customersForm.setCustomers(customersDAO.getCustomers());
		  //  model.addAttribute("customersForm",customersForm);
						
		  	model.addAttribute("noofrows",5);    
		   //narrativereportForm.getNarrativereport().size()
		    model.addAttribute("menu","customer");
		    model.addAttribute("button","close");
		    model.addAttribute("justcame",false);
		    return "customersdelete";
		}	
		
		//search a record for Admin's Setup created on 28-june-2014.
		@RequestMapping(value="/findcustomers",method=RequestMethod.GET)		
		public String findcustomers(HttpServletRequest request,HttpSession session,@RequestParam("customer_id") String id,@RequestParam("customer_name") String name,@RequestParam("address") String address,ModelMap model)
		{
		
			System.out.println("find");
			
			session.setAttribute("cusid", id);
			session.setAttribute("cusname", name);
			session.setAttribute("cusaddress", address);

				CustomersForm customersForm = new CustomersForm();
				customersForm.setCustomers(customersDAO.getfindcustomer(id, name, address,1));
				model.addAttribute("noofpages",(int) Math.ceil(customersDAO.FindCustomer(id, name, address) * 1.0 / 5));
				model.addAttribute("button","viewall");
				model.addAttribute("success","false");
				model.addAttribute("currentpage",1);
				model.addAttribute("customersForm",customersForm);
				model.addAttribute("menu", "customer");
				System.out.println("finding....");
				return "customersdelete";
			}
		
		@RequestMapping(value="/viewdeletecustomerreport_page", method=RequestMethod.GET)
		public String viewdeletecustomerreport_page(HttpServletRequest request,HttpSession session,@RequestParam("page") int page,
				@RequestParam("customer_id") String id,@RequestParam("customer_name") String name,@RequestParam("address") String address,ModelMap model) {
			
			session.setAttribute("cusid",id);
			session.setAttribute("cusname",name);
			session.setAttribute("cusaddress", address);
			CustomersForm customersForm = new CustomersForm();
			customersForm.setCustomers(customersDAO.getfindcustomer(id, name, address,page));
			model.addAttribute("noofpages",(int) Math.ceil(customersDAO.FindCustomer(id, name, address) * 1.0 / 5));
			model.addAttribute("customersForm", customersForm);	
		  	model.addAttribute("noofrows",5);
		    model.addAttribute("currentpage",page);
		    model.addAttribute("menu","customer");
		    model.addAttribute("button","viewall");
		    
		    return "customersdelete";
			
		}

		@RequestMapping(value={"/viewalldeletecustomerreport"}, method = RequestMethod.GET)
		public String viewalldeletecustomerreport(HttpServletRequest request,HttpSession session,ModelMap model,@RequestParam("customer_id") String id,
				@RequestParam("customer_name") String name,@RequestParam("address") String address,
				Principal principal ) 
		{
			

			session.setAttribute("cusid",id);
			session.setAttribute("cusname",name);
			session.setAttribute("cusaddress", address);
			CustomersForm customersForm = new CustomersForm();
			customersForm.setCustomers(customersDAO.getfindcustomer(id, name, address, 0));
		//	model.addAttribute("noofpages",(int) Math.ceil(documentControlDAO.FindDocuments(search_document_type, search_process) * 1.0 / 5));	 
			model.addAttribute("customersForm", customersForm);

		 // 	model.addAttribute("noofrows",5);    
		   //narrativereportForm.getNarrativereport().size()
		    model.addAttribute("menu","admin");
		    model.addAttribute("button","close");
		      
		    	model.addAttribute("menu","customer");
		        model.addAttribute("success","false");
		        model.addAttribute("button","close");
		        return "customersdelete";
		}

		
		
			@RequestMapping(value={"/deletecustomers"}, method = RequestMethod.POST)
		public String deleteSelectedcustomers(HttpServletRequest request,ModelMap model,Principal principal,HttpSession session) 
		{	
				model.addAttribute("justcame","false");
				session.removeAttribute("cusid");
				session.removeAttribute("cusname");
				session.removeAttribute("cusaddress");

			String[] SelectedIDs=new String[100];
			SelectedIDs=request.getParameterValues("chkUser");
			for(String id:SelectedIDs)
			{
			System.out.println(id);
			
			//formDAO.deleteParticipant(id,principal.getName());
			customersDAO.delete_customer(id);
			}
			CustomersForm customersForm = new CustomersForm();
		    customersForm.setCustomers(customersDAO.getCustomers());
		//    model.addAttribute("customersForm",customersForm);
				
			model.addAttribute("menu","customer");
			model.addAttribute("success","delete");
			return "customersdelete";
			
		}	
		
}
	