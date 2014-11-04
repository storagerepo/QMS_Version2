package qms.controllers;
import org.springframework.beans.factory.annotation.Autowired;

import qms.dao.FileHandlingDAO;


import java.security.Principal;
import java.util.ArrayList;

import java.io.FileOutputStream;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;


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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import qms.dao.EmployeeDAO;
import qms.model.Employee;
import qms.forms.CustomerFeedbackForm;
import qms.forms.DocumentMainForm;
import qms.forms.EmployeeForm;
import qms.forms.JobForm;
import qms.forms.MaintenanceForm;
import qms.forms.NonConformanceForm;


import qms.dao.JobDAO;
@Controller
@SessionAttributes({"employees"})
public class EmployeeController
{
	@Autowired
	EmployeeDAO employeeDAO;
	
	@Autowired
	JobDAO jobDAO;
	
	@Autowired
	FileHandlingDAO fileHandlingDAO;
	
	//Getting unique id
	@RequestMapping(value={"/addemployee"},method=RequestMethod.GET)
	public String addEmployee(HttpSession session,ModelMap model,Principal principal)
	{
		model.addAttribute("id",employeeDAO.getMax_employeeID());
		model.addAttribute("job_id",jobDAO.get_maxid());
		session.removeAttribute("employees");
		model.addAttribute("menu","employee");
		return "add_employee";
	}
	
	
	//insert operation
	@RequestMapping(value={"/addemployee"}, method = RequestMethod.POST)
	public String insert_employee(HttpSession session,HttpServletRequest request,ModelMap model, Principal principal,@ModelAttribute("Employee") @Valid Employee employee,BindingResult result ) throws IOException {
		System.err.println("-------------------------------------------");
		session.removeAttribute("trainer");
		byte[] buffer=null;// = new byte[10000];
		try {
			MultipartFile file = employee.getAttachments();
			String orginal_fileName = null;
			String duplicate_fileName=null;
			InputStream inputStream = null;
			OutputStream outputStream = null;
			/*if(file != null)
			{*/
			    if (file.getSize() > 0) {
				inputStream = file.getInputStream();
				if (file.getSize() > 100000) 
				{
					System.out.println("File Size:::" + file.getSize());
					return "/add_employee";
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
			    employee.setAttachment_name(file.getOriginalFilename());
			    employee.setAttachment_type(file.getContentType());
                employee.setAttachment_referrence(duplicate_fileName);
                
                //----End Lines to changed----//
              
                int readBytes = 0;
				buffer=new byte[(int)file.getSize()];
				while ((readBytes = inputStream.read(buffer, 0,(int) file.getSize())) != -1) {
				outputStream.write(buffer, 0, readBytes);			
				}
				outputStream.close();
				inputStream.close();
				//employeeDAO.insert_employee(employee);
			}
	
		
			if (employeeDAO.insert_employee(employee)) {
				//employeeDAO.insert(documentMain.getDocument_id().substring(0,documentMain.getDocument_id().lastIndexOf('-')));
				model.addAttribute("id",employeeDAO.getMax_employeeID());
				model.addAttribute("success", "true");
				model.addAttribute("success_message", "Inserted Successfully");
			//	flag = 1;
			}
		}
			catch (Exception e) {
			System.out.println(e.toString());
			e.printStackTrace();
		}
		//session.setAttribute("employees",employee);
		if (result.hasErrors())
		{
			EmployeeForm employeeForm=new EmployeeForm();
			employeeForm.setEmployees(employeeDAO.getEmployees());
			model.addAttribute("id",employeeDAO.getMax_employeeID());
			//model.addAttribute("employeeForm",employeeForm);	
			model.addAttribute("Success","true");
			model.addAttribute("menu","employee");
	        return "add_employee";
		}
		
		
		EmployeeForm employeeForm=new EmployeeForm();
		employeeForm.setEmployees(employeeDAO.getEmployees());
		model.addAttribute("id",employeeDAO.getMax_employeeID());
		//model.addAttribute("employeeForm",employeeForm);		
		model.addAttribute("menu","employee");
		 model.addAttribute("justcame",false);

        return "view_employees";
		}
		
	
	//downloading the attachment
	@RequestMapping(value={"/downloademployeefile"}, method = RequestMethod.GET)
	public String downloademployeefile(@RequestParam("eid") String employee_id,HttpServletResponse response,ModelMap model, Principal principal ) throws IOException {
		
	
		EmployeeForm employeeForm=new EmployeeForm();
		employeeForm.setEmployees(employeeDAO.getParticular_Employee(employee_id));
		model.addAttribute("employeeForm",employeeForm);
		System.out.println("Employee id is:::"+employee_id);	
		System.out.println("Going to download");
		System.out.println("index of employee 0 ="+employeeForm.getEmployees().get(0).getAttachment_referrence());
		fileHandlingDAO.filedownload(response,employeeForm.getEmployees().get(0).getAttachment_referrence(),employeeForm.getEmployees().get(0).getAttachment_name());
		System.out.println("End Download");
		
		return "view_employees";
	}
	
	//view records
		@RequestMapping(value = "/viewemployees", method = RequestMethod.GET)
	public String viewEmployees(HttpSession session,ModelMap model,Principal principal,Employee employee)
	{
		
		session.removeAttribute("type");
		session.removeAttribute("qualifiedby");
		session.removeAttribute("trainer");
		EmployeeForm employeeForm=new EmployeeForm();
		model.addAttribute("menu","employee");
		employeeForm.setEmployees(employeeDAO.getlimitedemployeereport(1));
		 model.addAttribute("justcame",false);

		return "view_employees";
	}
		
	@RequestMapping(value="/viewemployeereport_page", method=RequestMethod.GET)
	public String viewemployeereport_page(HttpSession session,HttpServletRequest request,@RequestParam("page") int page,
			@RequestParam("trainer") String trainer,@RequestParam("type_of_training") String type,@RequestParam("qualified_by") String qualifiedby,
			ModelMap model) {	
		session.setAttribute("trainer", trainer);
		session.setAttribute("type", type);
		session.setAttribute("qualifiedby",qualifiedby);
		EmployeeForm employeeForm=new EmployeeForm();
		employeeForm.setEmployees(employeeDAO.findemployee(type, qualifiedby, trainer, page));
	 	model.addAttribute("noofpages",(int) Math.ceil(employeeDAO.FindEmployee(type, qualifiedby, trainer) * 1.0 / 5));
	 	model.addAttribute("employeeForm",employeeForm);	
	  	model.addAttribute("noofrows",5);   
	    model.addAttribute("currentpage",page);
	    model.addAttribute("menu","employee");
	    model.addAttribute("button","viewall");
	    
	    return "view_employees";
	    
		
	}


	@RequestMapping(value={"/viewallemployeereport"}, method = RequestMethod.GET)
	public String viewallmanagementreport(HttpServletRequest request,ModelMap model,
			@RequestParam("trainer") String trainer,@RequestParam("type_of_training") String type,@RequestParam("qualified_by") String qualifiedby,
			Principal principal ) {
		EmployeeForm employeeForm=new EmployeeForm();
		employeeForm.setEmployees(employeeDAO.findemployee(type, qualifiedby, trainer, 0));
		model.addAttribute("employeeForm",employeeForm);

	  //	model.addAttribute("noofrows",5);    
	   //narrativereportForm.getNarrativereport().size()
	    model.addAttribute("menu","employee");
	    model.addAttribute("button","close");
	      
	    	model.addAttribute("menu","employee");
	        model.addAttribute("success","false");
	        model.addAttribute("button","close");
	        return "view_employees";

	}

	//delete a record
	@RequestMapping(value={"/deleteemployee"}, method = RequestMethod.GET)
	public String delete_employee(@RequestParam("empid") String employee_id,ModelMap model, Principal principal )
	{model.addAttribute("justcame","false");
    
		employeeDAO.delete_employee(employee_id);
		EmployeeForm employeeForm = new EmployeeForm();
		employeeForm.setEmployees(employeeDAO.getEmployees());
		model.addAttribute("employeeForm", employeeForm);
		model.addAttribute("menu","employee");
		return "view_employees";
 	}
	
	//Edit a record
	@RequestMapping(value={"/editemployee"}, method = RequestMethod.GET)
	public String edit_employee(@RequestParam("empid") String employee_id,ModelMap model, Principal principal)//,Employee employee )
	{
    	EmployeeForm employeeForm=new EmployeeForm();
		employeeForm.setEmployees(employeeDAO.getEmployeess_byid(employee_id));
		model.addAttribute("employeeForm",employeeForm);
		
		JobForm jobForm=new JobForm();
		jobForm.setJobs(jobDAO.getJobs());
		model.addAttribute("jobForm",jobForm);

		model.addAttribute("menu","employee");
		return "edit_employee";
 	}
	
	//Update a record
	@RequestMapping(value={"/updateemployee"}, method = RequestMethod.POST)
/*	public String update_customer(ModelMap model, @ModelAttribute("Employee") @Valid Employee employee, BindingResult result)
	{

		if (result.hasErrors())
		{
			System.out.println("output");
			EmployeeForm employeeForm=new EmployeeForm();
			employeeForm.setEmployees(employeeDAO.getEmployeess_byid(employee.getEmployee_id()));
			model.addAttribute("employeeForm",employeeForm);
	        return "edit_employee";
		}
    	employeeDAO.update_employee(employee);
    	//EmployeeForm employeeForm=new EmployeeForm();
		//employeeForm.setEmployees(employeeDAO.getEmployees());
		//model.addAttribute("employeeForm",employeeForm);
		model.addAttribute("menu","employee");
		return "view_employees";
 	}*/
		public String update_employee(@ModelAttribute("Employee") @Valid Employee employee,BindingResult result,HttpSession session, ModelMap model,Principal principal) {

		session.removeAttribute("trainer");		
		byte[] buffer=null;
				int status =0;
				try {
					MultipartFile file = employee.getAttachments();
					String orginal_fileName = null;
					String duplicate_fileName = null;
					InputStream inputStream = null;
					OutputStream outputStream = null;
						if (file.getSize() > 0) {
							inputStream = file.getInputStream();
							if (file.getSize() > 100000) {
								System.out.println("File Size:::" + file.getSize());
								return "/add_employee";
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

							employee.setAttachment_type(file.getContentType());
							employee.setAttachment_name(file.getOriginalFilename());
							employee.setAttachment_referrence(duplicate_fileName);

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
					
					if (employeeDAO.update_employee(employee)) {
						model.addAttribute("success", "update");
						model.addAttribute("success_message", "Updated Successfully");
						status = 1;
					}

				} catch (Exception e) {
					System.out.println(e.toString());
					e.printStackTrace();
				}
				if(status == 1)
				{
				EmployeeForm employeeForm=new EmployeeForm();
				employeeForm.setEmployees(employeeDAO.getEmployees());
				//model.addAttribute("employeeForm", employeeForm);
				model.addAttribute("menu","employee");
				 model.addAttribute("justcame",false);
session.removeAttribute("Employee");
session.removeAttribute("type");
session.removeAttribute("qualifiedby");

				return "view_employees";
				}
				else{
					return "edit_employee";
				}
			}
				/*int flag = 0;
				if (flag == 1)
				{
					
					EmployeeForm employeeForm = new EmployeeForm();
					employeeForm.setEmployees(employeeDAO.getEmployees());
					model.addAttribute("employeeForm", employeeForm);
					  model.addAttribute("menu","employee");
					return "view_employees";
				
				}
				else
					return "add_employee";
				}
		*/		
			
		
	//Search operation 
	@RequestMapping(value="/findemployee",method=RequestMethod.GET)		
	public String findemployee(HttpServletRequest request,HttpSession session,@RequestParam("trainer") String trainer,@RequestParam("type_of_training") String type,@RequestParam("qualified_by") String qualifiedby,ModelMap model)
	{
	
		System.out.println("find");
		session.setAttribute("trainer", trainer);
		session.setAttribute("type", type);
		session.setAttribute("qualifiedby",qualifiedby);
		
			EmployeeForm employeeForm = new EmployeeForm();
			employeeForm.setEmployees(employeeDAO.findemployee(type, qualifiedby,trainer,1));
			model.addAttribute("noofpages",(int) Math.ceil(employeeDAO.FindEmployee(type, qualifiedby, trainer) * 1.0 /5));
			System.out.println(type);
			System.out.println(qualifiedby);
			System.out.println(trainer);
				 
		        model.addAttribute("button","viewall");
		        model.addAttribute("success","false");
		        model.addAttribute("currentpage",1);
		        model.addAttribute("employeeForm", employeeForm);
		        model.addAttribute("menu","employee");
		        return "view_employees";
			}

	
// Employee report list page	
	
	@RequestMapping(value = "list_employee", method = RequestMethod.GET)
	public String list_employee(@RequestParam("id") String employee_id,
			ModelMap model, Principal principal) 
	{
		EmployeeForm employeeForm = new EmployeeForm();

		employeeForm.setEmployees(employeeDAO.edit_employee(employee_id));
		System.out.println("edit:"+employee_id);
		model.addAttribute("employeeForm",employeeForm);
		model.addAttribute("menu","employee");
		return "list_employee";
	}

	//report page request passing	
	@RequestMapping(value = "/employee_report", method = RequestMethod.GET)
	public String reportEmployee(ModelMap model) {
		model.addAttribute("menu","employee");
		  System.out.println("get method....");
		return "report_employee";

	}
	
	//This is used for downloading Excel Sheet
	@RequestMapping(value ={ "/employeereport" }, method = RequestMethod.GET)
	  public ModelAndView getExcel_view() {
	java.util.List<Employee> employees = new ArrayList<Employee>();
	
	employees = employeeDAO.getEmployees();
	System.out.println("model and view method....");
	return new ModelAndView("employeeDAO","employees",employees);
	
	}
	
	//report generation
	@RequestMapping(value = "/generate_employee_report", method = RequestMethod.POST)
	public ModelAndView generateEmployee_Report(HttpServletRequest request,ModelMap model, HttpServletResponse response) {
		System.out.println("report generating....");
		String[] fields={"employee_id","name","job_title","date_hired","attachments","list_of_functions_needes","documented_in","qualified_by","type_of_training","trainer","training_due_date","training_completion_date","training_effectiveness_review_due_date","training_effectiveness_notes"};
		
		System.out.println(request.getParameter("report_type"));
		java.util.List<Employee> employees=new ArrayList<Employee>();
		
			switch(Integer.parseInt(request.getParameter("doc_type")))
				  {
		  case 0:
			  employees=employeeDAO.getEmployee_bytype("trainingneeds");
			  break;
		  case 1:
			  employees=employeeDAO.getEmployee_bytype("training_report_for_each_employee");
			  break;
		  case 2:
			  employees=employeeDAO.getEmployee_bytype("qualification_for_each_employee");
			  break;
		  case 3:
			  employees=employeeDAO.getEmployee_bytype("opentraining");
			  break;
		  case 4:
			  employees=employeeDAO.getEmployee_bytype("opentrainingeffectiveness");
			  break;
		  case 5:
			  employees=employeeDAO.getEmployee_bytype("past_due_training_by_trainer");
			  break;
		  default:
			  break;
				  
		}		
		
		
		
		if(Integer.parseInt(request.getParameter("report_type"))==1)
		{
		
				System.out.println("now ok::::");
				 response.setHeader("Content-Disposition","attachment;filename='"+request.getParameter("name")+"'");
					
				fields=request.getParameterValues("report_field[]");
			
		}
		else
			 response.setHeader("Content-Disposition","attachment;filename='Employee_Report'");
		
		
		ModelAndView modelAndView=new ModelAndView("employeeDAO","employees",employees);
		
		modelAndView.addObject("fields",fields);
		System.out.println("ok:::::");
	
		return modelAndView ;
	}

	//delete a record for admin setup
	@RequestMapping(value={"/employeesdelete"}, method = RequestMethod.GET)
	public String delete_employees(ModelMap model, Principal principal,HttpSession session )
	{
		model.addAttribute("justcame","false");
		session.removeAttribute("trainer");
		session.removeAttribute("type");
		session.removeAttribute("qualifiedby");

		EmployeeForm employeeForm=new EmployeeForm();
		employeeForm.setEmployees(employeeDAO.getEmployees());
		//model.addAttribute("employeeForm",employeeForm);
		
	  	model.addAttribute("noofrows",5);    
	   //narrativereportForm.getNarrativereport().size()
	    model.addAttribute("menu","employee");
	    model.addAttribute("button","close");
	    model.addAttribute("justcame",false);
	    
	    return "employeesdelete";
	}

	//Search operation for Admin's Setup created on 28-june-2014.
		@RequestMapping(value="/findemployees",method=RequestMethod.GET)		
		public String findemployees(HttpServletRequest request,HttpSession session,@RequestParam("trainer") String trainer,@RequestParam("type_of_training") String type,@RequestParam("qualified_by") String qualifiedby,ModelMap model)
		{
		
			System.out.println("find");
			session.setAttribute("trainer", trainer);
			session.setAttribute("type", type);
			session.setAttribute("qualifiedby",qualifiedby);
			
				EmployeeForm employeeForm = new EmployeeForm();
				employeeForm.setEmployees(employeeDAO.findemployee(type, qualifiedby,trainer,1));
				model.addAttribute("noofpages",(int) Math.ceil(employeeDAO.FindEmployee(type, qualifiedby, trainer) * 1.0 /5));
				System.out.println(type);
				System.out.println(qualifiedby);
				System.out.println(trainer);
					 
			        model.addAttribute("button","viewall");
			        model.addAttribute("success","false");
			        model.addAttribute("currentpage",1);
				
				
				model.addAttribute("employeeForm", employeeForm);
				model.addAttribute("menu","employee");
				return "employeesdelete";
				
			}
		
		//Admin Setup's Pagination for Search results created on 28-june-2014.
		@RequestMapping(value="/viewdeleteemployeereport_page", method=RequestMethod.GET)
		public String viewdeleteemployeereport_page(HttpSession session,HttpServletRequest request,@RequestParam("page") int page,
				@RequestParam("trainer") String trainer,@RequestParam("type_of_training") String type,@RequestParam("qualified_by") String qualifiedby,
				ModelMap model) {	
			session.setAttribute("trainer", trainer);
			session.setAttribute("type", type);
			session.setAttribute("qualifiedby",qualifiedby);
			EmployeeForm employeeForm=new EmployeeForm();
			employeeForm.setEmployees(employeeDAO.findemployee(type, qualifiedby, trainer, page));
		 	model.addAttribute("noofpages",(int) Math.ceil(employeeDAO.FindEmployee(type, qualifiedby, trainer) * 1.0 / 5));
		 	model.addAttribute("employeeForm",employeeForm);	
		  	model.addAttribute("noofrows",5);   
		    model.addAttribute("currentpage",page);
		    model.addAttribute("menu","employee");
		    model.addAttribute("button","viewall");
		    
		    return "employeesdelete";
		    
			
		}

		//Admin Setup's Pagination for Search results created on 28-june-2014.
		@RequestMapping(value={"/viewalldeleteemployeereport"}, method = RequestMethod.GET)
		public String viewalldeleteemployeereport(HttpServletRequest request,ModelMap model,
				@RequestParam("trainer") String trainer,@RequestParam("type_of_training") String type,@RequestParam("qualified_by") String qualifiedby,
				Principal principal ) {
			EmployeeForm employeeForm=new EmployeeForm();
			employeeForm.setEmployees(employeeDAO.findemployee(type, qualifiedby, trainer, 0));
			model.addAttribute("employeeForm",employeeForm);

		  //	model.addAttribute("noofrows",5);    
		   //narrativereportForm.getNarrativereport().size()
		    model.addAttribute("menu","admin");
		    model.addAttribute("button","close");
		      
		    	model.addAttribute("menu","employee");
		        model.addAttribute("success","false");
		        model.addAttribute("button","close");
		        return "employeesdelete";

		}



		@RequestMapping(value={"/deleteemployees"}, method = RequestMethod.POST)
	public String deleteSelectedemployees(HttpServletRequest request,ModelMap model,Principal principal,HttpSession session) 
	{	
			
			model.addAttribute("justcame","false");
			session.removeAttribute("trainer");
			session.removeAttribute("type");
			session.removeAttribute("qualifiedby");

		String[] SelectedIDs=new String[100];
		SelectedIDs=request.getParameterValues("chkUser");
		for(String id:SelectedIDs)
		{
		System.out.println(id);
		
		//formDAO.deleteParticipant(id,principal.getName());
		employeeDAO.delete_employee(id);
		}
		EmployeeForm employeeForm=new EmployeeForm();
		employeeForm.setEmployees(employeeDAO.getEmployees());
	//	model.addAttribute("employeeForm",employeeForm);

		model.addAttribute("menu","employee");
		model.addAttribute("success","delete");
		return "employeesdelete";
		
	}	
	
 	}
