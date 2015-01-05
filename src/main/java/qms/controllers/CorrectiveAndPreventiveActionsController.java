package qms.controllers;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
//import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.hibernate.validator.cfg.context.ReturnValueTarget;
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
import org.springframework.web.servlet.ModelAndView;

import com.sun.mail.iap.Response;

import qms.dao.CorrectiveAndPreventiveActionsDAO;
import qms.dao.HRandTrainingDAO;
import qms.dao.NonConformanceDAO;
//import qms.dao.EmployeeDAO;
import qms.dao.FileHandlingDAO;
//import qms.dao.ProcessDAO;
import qms.forms.CorrectiveAndPreventiveActionsForm;
import qms.forms.DocumentMainForm;
import qms.forms.EmployeeForm;
import qms.forms.HRandTrainingForm;
import qms.forms.NonConformanceForm;
//import qms.forms.DocumentMainForm;
import qms.model.CorrectiveAndPreventiveActions;
import qms.model.Employee;
import qms.model.NonConformance;



@Controller
@SessionAttributes({"correctiveAndPreventiveActions"})
public class CorrectiveAndPreventiveActionsController
{
	

	@Autowired
	FileHandlingDAO fileHandlingDAO;

	@Autowired
	CorrectiveAndPreventiveActionsDAO correctiveAndPreventiveActionsDAO;
	
	@Autowired
	NonConformanceDAO nonConformanceDAO;
	
	@Autowired
	HRandTrainingDAO hRandTrainingDAO;
	
	
	
	//CorrectiveAndPreventiveActions Report generation
	@RequestMapping(value = "/capas_report", method = RequestMethod.POST)
	public ModelAndView generateActions_Report(HttpServletRequest request,ModelMap model,HttpSession session,HttpServletResponse response) {
		
	session.removeAttribute("capa");
		String[] fields={"capa_id","nc_id","source_of_nonconformance","external_id",
			"type_of_nonconformance","date_found",
			"temporary_action","nature_of_nc",
			"capa_requestor","request_date","capa_due_date",
			"assigned_team_leader","team_members",
			"root_cause_analysis_file","use_5_why_in_system",
			"why","root_cause_statement",
			"upload_external_analysis","action",
			"responsibility","due_date","completion_date",
			"verified_by","verification_date"};	
		String title = "Corrective And Preventive Actions";
		String[] option0 = {"nc_id","source_of_nonconformance","root_cause_statement"};
		String[] option1 = {"nc_id","source_of_nonconformance","root_cause_statement"};
		String start = null,end = null;
		String option = "";
		System.out.println(request.getParameter("type_of_report"));
		System.out.println("start_date");
		System.out.println("end_date");
		
		
		java.util.List<CorrectiveAndPreventiveActions> correctiveAndPreventiveActions=new ArrayList<CorrectiveAndPreventiveActions>();
		
		 switch(Integer.parseInt(request.getParameter("actions_report_type")))
				  {
					  case 0:
						  correctiveAndPreventiveActions=correctiveAndPreventiveActionsDAO.getCorrectiveAndPreventiveActions_bytype("Open_Corrective_Actions", start, end);
			  title="Open_Corrective_Actions";
			  System.out.println("case 0");
			  option = "0";
			  break;
		  case 1:
			  correctiveAndPreventiveActions=correctiveAndPreventiveActionsDAO.getCorrectiveAndPreventiveActions_bytype("Open_Corrective_Actions_for_Over_30_Days","start","end");
			  title="Open_Corrective_Actions_for_Over_30_Days";
			  option = "1";
			  break;
			  
		  case 2:
			  String startdate = request.getParameter("start");
				String enddate = request.getParameter("end");
				System.out.println(start);
				System.out.println(end);
				String[] split = startdate.split("/");
				String[] split1 = enddate.split("/");
				System.out.println(split1[2]+"-"+split1[0]+"-"+split1[1]);
				System.out.println(split[2]+"-"+split[0]+"-"+split[1]);
				start= split[2]+"-"+split[0]+"-"+split[1];
				end = split1[2]+"-"+split1[0]+"-"+split1[1];
			  
			  correctiveAndPreventiveActions=correctiveAndPreventiveActionsDAO.getCorrectiveAndPreventiveActions_bytype("Corrective_Actions_for_A_Certain_Period",start,end);
			  title="Corrective_Actions_for_A_Certain_Period";
			  option = "2";
			  break;
		  default:
			  break;
				  
		}		
		 
	if(Integer.parseInt(request.getParameter("report_type"))==1)
		{
		/*if(request.getParameterValues("report_field[]")!=null)
			
			for (@SuppressWarnings("unused") String field : request.getParameterValues("report_field[]")) 
			{
			*/ response.setHeader("Content-Disposition","attachment;filename='"+request.getParameter("report_title")+"'");
			fields = request.getParameterValues("report_field[]");
			System.out.println("fields --- - - -");
			option = "2";
			System.out.println("option  ="+option);
				/*title=request.getParameter("report_title");
				System.out.println(title);
						
				//fields=request.getParameterValues("report_type");
				*/
		}
	else
			response.setHeader("Content-Disposition","attachment;filename='Corrective & Preventive Actions Report'");
	if(option == "0")
	{
				ModelAndView modelAndView=new ModelAndView("CorrectiveAndPreventiveActionsDAO","correctiveAndPreventiveActions",correctiveAndPreventiveActions);
				/*modelAndView.addObject("fields",request.getParameterValues("report_field[]"));
				modelAndView.addObject("title",title);*/
				session.setAttribute("option",option);
				modelAndView.addObject("fields",option0);
				return modelAndView ;
	}
	else if(option == "1")
	{
		ModelAndView modelAndView=new ModelAndView("CorrectiveAndPreventiveActionsDAO","correctiveAndPreventiveActions",correctiveAndPreventiveActions);
		session.setAttribute("option",option);
		modelAndView.addObject("fields",option1);
		return modelAndView ;
	}
	else if(option == "2")
	{
		ModelAndView modelAndView=new ModelAndView("CorrectiveAndPreventiveActionsDAO","correctiveAndPreventiveActions",correctiveAndPreventiveActions);
		session.setAttribute("option",option);
		System.out.println("correctiveAndPreventiveActions");
		modelAndView.addObject("fields",fields);
		return modelAndView;
	}
	else{	
		
		ModelAndView modelAndView=new ModelAndView("CorrectiveAndPreventiveActionsDAO","correctiveAndPreventiveActions",correctiveAndPreventiveActions);
		
		modelAndView.addObject("fields",fields);
		
		 
		return modelAndView ;
	}
	}
	
	//downloading the attachements
	@RequestMapping(value = "/downloadMaindoc1", method = RequestMethod.GET)
	public String downloadMaindoc(HttpServletResponse response,
			@RequestParam("capa_id") String capa_id, ModelMap model)
			throws IOException {


		CorrectiveAndPreventiveActionsForm correctiveAndPreventiveActionsForm = new CorrectiveAndPreventiveActionsForm();

		correctiveAndPreventiveActionsForm.setCorrectiveAndPreventiveActions(correctiveAndPreventiveActionsDAO.getCorrectiveAndPreventiveActions(capa_id));
			
		model.addAttribute("correctiveAndPreventiveActionsForm",correctiveAndPreventiveActionsForm);
		
		

		fileHandlingDAO
				.filedownload(response, correctiveAndPreventiveActionsForm.getCorrectiveAndPreventiveActions()
						.get(0).getAttachment_referrence(), correctiveAndPreventiveActionsForm.getCorrectiveAndPreventiveActions().get(0).getAttachment_name());

		
		return "correctiveactions_list";
}
	
	
	//Search Operation		
	@RequestMapping(value={"/search_correctiveactions"}, method = RequestMethod.GET)
	
	public String search_correctiveactions(HttpSession session,@RequestParam("capa_id") String capa_id,@RequestParam("request_date") String request_date,@RequestParam("action") String action,ModelMap model, Principal principal)
	{
	
		session.setAttribute("capa", capa_id);
		session.setAttribute("date", request_date);
		session.setAttribute("action", action);
		
		NonConformanceForm nonConformanceForm = new NonConformanceForm();
		nonConformanceForm.setNonconformance(nonConformanceDAO.get_nonconformance());
		model.addAttribute("nonConformanceForm", nonConformanceForm);
		
		CorrectiveAndPreventiveActionsForm correctiveAndPreventiveActionsForm = new CorrectiveAndPreventiveActionsForm();
		correctiveAndPreventiveActionsForm.setCorrectiveAndPreventiveActions(correctiveAndPreventiveActionsDAO.search_correctiveactions(capa_id, request_date, action, 1));
		model.addAttribute("noofpages",(int) Math.ceil(correctiveAndPreventiveActionsDAO.Search_Correctiveactions(capa_id, request_date, action) * 1.0 / 5));	 
	        model.addAttribute("button","viewall");
	        model.addAttribute("success","false");
	        model.addAttribute("currentpage",1);
		
		
		model.addAttribute("correctiveAndPreventiveActionsForm", correctiveAndPreventiveActionsForm);
		model.addAttribute("menu","corrective");
		return "correctiveactions_list";
}
	
	@RequestMapping(value="/viewcorrectivereport_page", method=RequestMethod.GET)
	public String viewcorrectivereport_page(HttpServletRequest request,HttpSession session,@RequestParam("page") int page,
			@RequestParam("capa_id") String capa_id,@RequestParam("request_date") String request_date,@RequestParam("action") String action,ModelMap model) {
		
		session.setAttribute("capa", capa_id);
		session.setAttribute("date", request_date);
		session.setAttribute("action", action);
		CorrectiveAndPreventiveActionsForm correctiveAndPreventiveActionsForm = new CorrectiveAndPreventiveActionsForm();
		correctiveAndPreventiveActionsForm.setCorrectiveAndPreventiveActions(correctiveAndPreventiveActionsDAO.search_correctiveactions(capa_id, request_date, action, page));
		model.addAttribute("noofpages",(int) Math.ceil(correctiveAndPreventiveActionsDAO.Search_Correctiveactions(capa_id, request_date, action) * 1.0 / 5));
		model.addAttribute("correctiveAndPreventiveActionsForm", correctiveAndPreventiveActionsForm);	
	  	model.addAttribute("noofrows",5);
	    model.addAttribute("currentpage",page);
	    model.addAttribute("menu","corrective");
	    model.addAttribute("button","viewall");
	    
	    return "correctiveactions_list";
		
	}

	
	@RequestMapping(value={"/viewallcorrectivereport"}, method = RequestMethod.GET)
	public String viewallcorrectivereport(HttpServletRequest request,HttpSession session,ModelMap model,@RequestParam("capa_id") String capa_id,@RequestParam("request_date") String request_date,
			@RequestParam("action") String action,Principal principal ) 
	{
		
		
		CorrectiveAndPreventiveActionsForm correctiveAndPreventiveActionsForm = new CorrectiveAndPreventiveActionsForm();
		correctiveAndPreventiveActionsForm.setCorrectiveAndPreventiveActions(correctiveAndPreventiveActionsDAO.search_correctiveactions(capa_id, request_date, action, 0));
	//		 
		model.addAttribute("correctiveAndPreventiveActionsForm", correctiveAndPreventiveActionsForm);

	 // 	model.addAttribute("noofrows",5);    
	   //narrativereportForm.getNarrativereport().size()
	    model.addAttribute("menu","corrective");
	    model.addAttribute("button","close");
	      
	    	model.addAttribute("menu","corrective");
	        model.addAttribute("success","false");
	        model.addAttribute("button","close");
	        return "correctiveactions_list";

	}

	
	// getting unique id
	@RequestMapping(value = { "/addcorrectiveAndPreventiveActions" }, method = RequestMethod.GET)
	public String add_correctiveAndPreventiveActions(ModelMap model, Principal principal) {
		
		System.out.println("name = ");
		HRandTrainingForm hRandTrainingForm = new HRandTrainingForm();
		hRandTrainingForm.sethRandTrainings(hRandTrainingDAO.getHRResposible());
		int sixe = hRandTrainingDAO.getHRResposible().size();
		System.out.println("length  ="+sixe);
		model.addAttribute("hRandTrainingForm",hRandTrainingForm);	
		
		NonConformanceForm nonConformanceForm = new NonConformanceForm();
		nonConformanceForm.setNonconformance(nonConformanceDAO.get_nonconformance());
		model.addAttribute("nonConformanceForm", nonConformanceForm);
		
		List<String> date = nonConformanceDAO.getDates();
		model.addAttribute("datefound", date);
		
		model.addAttribute("capa_id",correctiveAndPreventiveActionsDAO.get_maxid());
		
		model.addAttribute("menu","corrective");
	
		return "add_correctiveAndPreventiveActions";

	}

	// Insert operation
	@RequestMapping(value = "/add_correctiveAndPreventiveActions", method = RequestMethod.POST)
	public String insert_correctiveAndPreventiveActions(HttpSession session,
			@ModelAttribute("CorrectiveAndPreventiveActions") @Valid CorrectiveAndPreventiveActions correctiveAndPreventiveActions,
			BindingResult result, ModelMap model, Principal principal) 
	{
				session.setAttribute("correctiveAndPreventiveActions",correctiveAndPreventiveActions);
				session.removeAttribute("capa");
				session.removeAttribute("date");
				session.removeAttribute("action");
		NonConformanceForm nonConformanceForm = new NonConformanceForm();
		nonConformanceForm.setNonconformance(nonConformanceDAO.get_nonconformance());
		model.addAttribute("nonConformanceForm", nonConformanceForm);
		
		if (result.hasErrors()) 
		{System.out.println("if");

		HRandTrainingForm hRandTrainingForm = new HRandTrainingForm();
		hRandTrainingForm.sethRandTrainings(hRandTrainingDAO.getHRResposible());
		model.addAttribute("hRandTrainingForm",hRandTrainingForm);	
		
			// session.removeAttribute("audit_start_date");
			model.addAttribute("capa_id",correctiveAndPreventiveActionsDAO.get_maxid());
			return "add_correctiveAndPreventiveActions";
		} 
		else 
		{System.out.println("else");
			int flag = 0;
			correctiveAndPreventiveActions.setCapa_id(correctiveAndPreventiveActions.getCapa_id());

			System.out.println("Started Inserting documents");
			// Started to handle upload document
			byte[] buffer;
			try 
			{System.out.println("try");
				MultipartFile file = correctiveAndPreventiveActions.getAttachments();
				String orginal_fileName = null;
				String duplicate_fileName = null;
				InputStream inputStream = null;
				OutputStream outputStream = null;
					if (file != null) 
					{System.out.println("file != null");
						if (file.getSize() > 0) 
						{System.out.println("file.getSize() > 0");
							inputStream = file.getInputStream();
							if (file.getSize() > 100000)
							{
								System.out.println("File Size:::" + file.getSize());
								return "/add_correctiveAndPreventiveActions";
							}
							orginal_fileName = "/qms_upload/"
								+ file.getOriginalFilename();
							duplicate_fileName = orginal_fileName;
							File create_file = new File(orginal_fileName);
							int i = 1;
							while (create_file.exists())
								{System.out.println("create");
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

							correctiveAndPreventiveActions.setAttachment_type(file.getContentType());
							correctiveAndPreventiveActions.setAttachment_name(file.getOriginalFilename());
							correctiveAndPreventiveActions.setAttachment_referrence(duplicate_fileName);
							System.out.println(correctiveAndPreventiveActions.getAttachment_type());
						// ----End Lines to changed----//

							int readBytes = 0;
							buffer = new byte[(int) file.getSize()];
							while ((readBytes = inputStream.read(buffer, 0,
								(int) file.getSize())) != -1) 
								{
									outputStream.write(buffer, 0, readBytes);
								}
							outputStream.close();
							inputStream.close();

					}
				}
					
				if (correctiveAndPreventiveActionsDAO.insert_correctiveAndPreventiveActions(correctiveAndPreventiveActions))
				 	{
						
						model.addAttribute("success", "insert");
						model.addAttribute("success_message", "Inserted Successfully");
						flag = 1;
				 	}	

			} 
			
			catch (Exception e)
			{
				System.out.println(e.toString());
				e.printStackTrace();
			}

			if (flag == 1)
			{
				session.removeAttribute("correctiveAndPreventiveActions");
				
				
				CorrectiveAndPreventiveActionsForm correctiveAndPreventiveActionsForm = new CorrectiveAndPreventiveActionsForm();

				correctiveAndPreventiveActionsForm.setCorrectiveAndPreventiveActions(correctiveAndPreventiveActionsDAO.getCorrectiveAndPreventiveActions());

				//model.addAttribute("correctiveAndPreventiveActionsForm",correctiveAndPreventiveActionsForm);
				
				return "correctiveactions_list";
			}
			else
			{
				 model.addAttribute("justcame",false);
				 model.addAttribute("success", "insert");
					model.addAttribute("success_message", "Inserted Successfully");
				
				return "correctiveactions_list";
			}
		}
	
		
		}

	//corrective and preventive actions report list page
	@RequestMapping(value="/correctiveactions_list", method=RequestMethod.GET)
	public String correctiveactionslist(HttpSession session,HttpServletRequest request,ModelMap model, Principal principal) {
		
		session.removeAttribute("capa");
		session.removeAttribute("date");
		session.removeAttribute("action");
		model.addAttribute("success","false");

		NonConformanceForm nonConformanceForm = new NonConformanceForm();
		nonConformanceForm.setNonconformance(nonConformanceDAO.get_nonconformance());
		model.addAttribute("nonConformanceForm", nonConformanceForm);
		
		CorrectiveAndPreventiveActionsForm correctiveAndPreventiveActionsForm = new CorrectiveAndPreventiveActionsForm();
		correctiveAndPreventiveActionsForm.setCorrectiveAndPreventiveActions(correctiveAndPreventiveActionsDAO.getlimitedcorrectivereport(1));
		//	correctiveAndPreventiveActionsForm.setCorrectiveAndPreventiveActions(correctiveAndPreventiveActionsDAO.getCorrectiveAndPreventiveActions());
		//model.addAttribute("correctiveAndPreventiveActionsForm",correctiveAndPreventiveActionsForm);
		model.addAttribute("menu","corrective");
		 model.addAttribute("justcame",false);
		return "correctiveactions_list";
	}
	
	
	//edit a record
	@RequestMapping(value = "edit_correctiveAndPreventiveActions", method = RequestMethod.GET)
	public String edit_correctiveAndPreventiveActions(@RequestParam("capa_id") String capa_id,
			ModelMap model, Principal principal) {
		
		NonConformanceForm nonConformanceForm = new NonConformanceForm();
		nonConformanceForm.setNonconformance(nonConformanceDAO.get_nonconformance());
		model.addAttribute("nonConformanceForm", nonConformanceForm);
		
		HRandTrainingForm hRandTrainingForm = new HRandTrainingForm();
		hRandTrainingForm.sethRandTrainings(hRandTrainingDAO.getHRResposible());
		model.addAttribute("hRandTrainingForm",hRandTrainingForm);	
		
		List<String> date = nonConformanceDAO.getDates();
		model.addAttribute("datefound", date);
		
		CorrectiveAndPreventiveActionsForm correctiveAndPreventiveActionsForm = new CorrectiveAndPreventiveActionsForm();
		System.out.println(capa_id);

		correctiveAndPreventiveActionsForm.setCorrectiveAndPreventiveActions(correctiveAndPreventiveActionsDAO.edit_CorrectiveAndPreventiveActions(capa_id));

		model.addAttribute("correctiveAndPreventiveActionsForm",correctiveAndPreventiveActionsForm);
		model.addAttribute("menu","corrective");
		return "edit_correctiveactions";
	}
	
	//update a record
	@RequestMapping(value = "/updatecorrectiveAndPreventiveActions", method = RequestMethod.POST)
	public String update_correctiveAndPreventiveActions(HttpServletRequest request,ModelMap model, Principal principal,@ModelAttribute("CorrectiveAndPreventiveActions") @Valid CorrectiveAndPreventiveActions correctiveAndPreventiveActions,
			BindingResult result,HttpSession session) {
		//NEW LINES
		
		session.removeAttribute("capa");
		session.removeAttribute("date");
		session.removeAttribute("action");
		//END NEW LINE
		String action_field = request.getParameter("action");
		System.out.println("action value::::" + action_field);
		
		if (result.hasErrors())
		{
			HRandTrainingForm hRandTrainingForm = new HRandTrainingForm();
			hRandTrainingForm.sethRandTrainings(hRandTrainingDAO.getHRResposible());
			model.addAttribute("hRandTrainingForm",hRandTrainingForm);	
			
			
			System.out.println("error occured");
			CorrectiveAndPreventiveActionsForm correctiveAndPreventiveActionsForm = new CorrectiveAndPreventiveActionsForm();
			correctiveAndPreventiveActionsForm.setCorrectiveAndPreventiveActions(correctiveAndPreventiveActionsDAO.edit_CorrectiveAndPreventiveActions(correctiveAndPreventiveActions.getCapa_id()));
			model.addAttribute("correctiveAndPreventiveActionsForm", correctiveAndPreventiveActionsForm);
			model.addAttribute("menu","corrective");
	        return "edit_correctiveactions";
		}
		byte[] buffer;
		int flag =0;
		try 
		{
			System.out.println("try");
		
			MultipartFile file = correctiveAndPreventiveActions.getAttachments();
			String orginal_fileName = null;
			String duplicate_fileName = null;
			InputStream inputStream = null;
			OutputStream outputStream = null;
				if (file != null) 
				{
					System.out.println("file != null");
					if (file.getSize() > 0) 
					{
						System.out.println("file.getSize() > 0");
						inputStream = file.getInputStream();
						if (file.getSize() > 100000)
						{
							System.out.println("File Size:::" + file.getSize());
							return "/add_correctiveAndPreventiveActions";
						}
						orginal_fileName = "/qms_upload/"
							+ file.getOriginalFilename();
						duplicate_fileName = orginal_fileName;
						File create_file = new File(orginal_fileName);
						int i = 1;
						while (create_file.exists())
							{
							System.out.println("create");
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

						correctiveAndPreventiveActions.setAttachment_type(file.getContentType());
						correctiveAndPreventiveActions.setAttachment_name(file.getOriginalFilename());
						correctiveAndPreventiveActions.setAttachment_referrence(duplicate_fileName);
						System.out.println(correctiveAndPreventiveActions.getAttachment_type());
					// ----End Lines to changed----//

						int readBytes = 0;
						buffer = new byte[(int) file.getSize()];
						while ((readBytes = inputStream.read(buffer, 0,
							(int) file.getSize())) != -1) 
							{
								outputStream.write(buffer, 0, readBytes);
							}
						outputStream.close();
						inputStream.close();
					}
				}
				System.out.println("before going to dao");
				if (correctiveAndPreventiveActionsDAO.update_correctiveAndPreventiveActions(correctiveAndPreventiveActions))
			 	{
					System.out.println("after");
					model.addAttribute("success", "update");
					model.addAttribute("success_message", "updated Successfully");
					flag = 1;
			 	}
				}
		catch (Exception e)
		{
			System.out.println(e.toString());
			e.printStackTrace();
		}

		if(flag == 1)
		{
	//	model.addAttribute("menu","audits");
		
			NonConformanceForm nonConformanceForm = new NonConformanceForm();
			nonConformanceForm.setNonconformance(nonConformanceDAO.get_nonconformance());
			model.addAttribute("nonConformanceForm", nonConformanceForm);
		
		CorrectiveAndPreventiveActionsForm correctiveAndPreventiveActionsForm = new CorrectiveAndPreventiveActionsForm();
		correctiveAndPreventiveActionsForm.setCorrectiveAndPreventiveActions(correctiveAndPreventiveActionsDAO.getCorrectiveAndPreventiveActions());
		//model.addAttribute("correctiveAndPreventiveActionsForm",correctiveAndPreventiveActionsForm);
		model.addAttribute("menu","corrective"); model.addAttribute("justcame",false);
		
		return "correctiveactions_list";
		}
		else
		{
			return "edit_correctiveactions";
		}		
		
	}
	

	//view records
	@RequestMapping(value = { "/view_correctiveandpreventive" }, method = RequestMethod.GET)
	public String showInternalAudits(HttpSession session,ModelMap model, Principal principal,@RequestParam("capa_id") String capa_id) {
		/*session.removeAttribute("capa");
		session.removeAttribute("date");
		session.removeAttribute("action");
		*/CorrectiveAndPreventiveActionsForm correctiveAndPreventiveActionsForm = new CorrectiveAndPreventiveActionsForm();
		correctiveAndPreventiveActionsForm.setCorrectiveAndPreventiveActions(correctiveAndPreventiveActionsDAO.getCorrectiveAndPreventiveActions(capa_id));
		model.addAttribute("correctiveAndPreventiveActionsForm",correctiveAndPreventiveActionsForm);
		model.addAttribute("menu","corrective");
		return "view_correctiveactions";
	}

	//delete a record 
	@RequestMapping(value = { "delete_correctiveAndPreventiveActions" }, method = RequestMethod.GET)
	public String delete_capa(@RequestParam("capa_id") String capa_id,
			ModelMap model, Principal principal) {
		model.addAttribute("justcame","false");
		correctiveAndPreventiveActionsDAO.delete_correctiveAndPreventiveActions(capa_id);
		CorrectiveAndPreventiveActionsForm correctiveAndPreventiveActionsForm = new CorrectiveAndPreventiveActionsForm();
		correctiveAndPreventiveActionsForm.setCorrectiveAndPreventiveActions(correctiveAndPreventiveActionsDAO.getCorrectiveAndPreventiveActions());
		model.addAttribute("correctiveAndPreventiveActionsForm",correctiveAndPreventiveActionsForm);
		return "correctiveactions_list";
		}

	
	//report generation
	@RequestMapping(value = { "/capa_report" }, method = RequestMethod.POST)
	public String capa_report(HttpServletRequest request,ModelMap model, Principal principal) 
	{		
		
		String type=request.getParameter("type_of_report");
		CorrectiveAndPreventiveActionsForm correctiveAndPreventiveActionsForm = new CorrectiveAndPreventiveActionsForm();
		String enddate = null;
		String startdate = null;
		//InternalAuditsForm.setInternalAudits(internalAuditsDAO.get_report_internalaudits(type));
		correctiveAndPreventiveActionsForm.setCorrectiveAndPreventiveActions(correctiveAndPreventiveActionsDAO.getCorrectiveAndPreventiveActions_bytype(type, startdate, enddate));
		model.addAttribute("correctiveAndPreventiveActionsForm",correctiveAndPreventiveActionsForm);
		model.addAttribute("type",type);		
		model.addAttribute("report_table","yes");
		model.addAttribute("menu","corrective");
		return "capa_report";
	}
	
	//report page request passing
	@RequestMapping(value = { "/capa_report" }, method = RequestMethod.GET)
	public String get_capa_report(ModelMap model, Principal principal) 
	{
		model.addAttribute("report_table","no");
		model.addAttribute("menu","corrective");
		return "capa_report";
	}
	
	
	//delete a record for admin setup
	@RequestMapping(value={"/correctiveactionsdelete"}, method = RequestMethod.GET)
	public String delete_correctiveactions(ModelMap model, Principal principal,HttpSession session )
	{
		model.addAttribute("justcame","false");
		session.removeAttribute("capa");
		session.removeAttribute("date");
		session.removeAttribute("action");
		CorrectiveAndPreventiveActionsForm correctiveAndPreventiveActionsForm = new CorrectiveAndPreventiveActionsForm();
		correctiveAndPreventiveActionsForm.setCorrectiveAndPreventiveActions(correctiveAndPreventiveActionsDAO.getCorrectiveAndPreventiveActions());
	//	model.addAttribute("correctiveAndPreventiveActionsForm",correctiveAndPreventiveActionsForm);
				
	  	model.addAttribute("noofrows",5);    
	   //narrativereportForm.getNarrativereport().size()
	    model.addAttribute("menu","corrective");
	    model.addAttribute("button","close");
	    model.addAttribute("justcame",false);
	    return "correctiveactionsdelete";
	}

	//Search Operation for Admin's Setup created on 28-june-2014.
		@RequestMapping(value={"/search_correctiveaction"}, method = RequestMethod.GET)
		
		public String search_correctiveaction(HttpSession session,@RequestParam("capa_id") String capa_id,@RequestParam("request_date") String request_date,@RequestParam("action") String action,ModelMap model, Principal principal)
		{
		
			session.setAttribute("capa", capa_id);
			session.setAttribute("date", request_date);
			session.setAttribute("action", action);
			
			NonConformanceForm nonConformanceForm = new NonConformanceForm();
			nonConformanceForm.setNonconformance(nonConformanceDAO.get_nonconformance());
			model.addAttribute("nonConformanceForm", nonConformanceForm);
			
			CorrectiveAndPreventiveActionsForm correctiveAndPreventiveActionsForm = new CorrectiveAndPreventiveActionsForm();
			correctiveAndPreventiveActionsForm.setCorrectiveAndPreventiveActions(correctiveAndPreventiveActionsDAO.search_correctiveactions(capa_id, request_date, action, 1));
			model.addAttribute("noofpages",(int) Math.ceil(correctiveAndPreventiveActionsDAO.Search_Correctiveactions(capa_id, request_date, action) * 1.0 / 5));	 
		        model.addAttribute("button","viewall");
		        model.addAttribute("success","false");
		        model.addAttribute("currentpage",1);
			
			
			model.addAttribute("correctiveAndPreventiveActionsForm", correctiveAndPreventiveActionsForm);
			model.addAttribute("menu","corrective");
			return "correctiveactionsdelete";
	}
		//Search Operation Results pagination for Admin's Setup created on 28-june-2014. 
		@RequestMapping(value="/viewdeletecorrectivereport_page", method=RequestMethod.GET)
		public String viewdeletecorrectivereport_page(HttpServletRequest request,HttpSession session,@RequestParam("page") int page,
				@RequestParam("capa_id") String capa_id,@RequestParam("request_date") String request_date,@RequestParam("action") String action,ModelMap model) {
			
			session.setAttribute("capa", capa_id);
			session.setAttribute("date", request_date);
			session.setAttribute("action", action);
			CorrectiveAndPreventiveActionsForm correctiveAndPreventiveActionsForm = new CorrectiveAndPreventiveActionsForm();
			correctiveAndPreventiveActionsForm.setCorrectiveAndPreventiveActions(correctiveAndPreventiveActionsDAO.search_correctiveactions(capa_id, request_date, action, page));
			model.addAttribute("noofpages",(int) Math.ceil(correctiveAndPreventiveActionsDAO.Search_Correctiveactions(capa_id, request_date, action) * 1.0 / 5));
			model.addAttribute("correctiveAndPreventiveActionsForm", correctiveAndPreventiveActionsForm);	
		  	model.addAttribute("noofrows",5);
		    model.addAttribute("currentpage",page);
		    model.addAttribute("menu","corrective");
		    model.addAttribute("button","viewall");
		    
		    return "correctiveactionsdelete";
			
		}

		//Search Operation Results pagination for Admin's Setup created on 28-june-2014.
		@RequestMapping(value={"/viewalldeletecorrectivereport"}, method = RequestMethod.GET)
		public String viewalldeletecorrectivereport(HttpServletRequest request,HttpSession session,ModelMap model,@RequestParam("capa_id") String capa_id,@RequestParam("request_date") String request_date,
				@RequestParam("action") String action,Principal principal ) 
		{
			
			
			CorrectiveAndPreventiveActionsForm correctiveAndPreventiveActionsForm = new CorrectiveAndPreventiveActionsForm();
			correctiveAndPreventiveActionsForm.setCorrectiveAndPreventiveActions(correctiveAndPreventiveActionsDAO.search_correctiveactions(capa_id, request_date, action, 0));
		//		 
			model.addAttribute("correctiveAndPreventiveActionsForm", correctiveAndPreventiveActionsForm);

		 // 	model.addAttribute("noofrows",5);    
		   //narrativereportForm.getNarrativereport().size()
		    model.addAttribute("menu","admin");
		    model.addAttribute("button","close");
		      
		    	model.addAttribute("menu","corrective");
		        model.addAttribute("success","false");
		        model.addAttribute("button","close");
		        return "correctiveactionsdelete";


}


		@RequestMapping(value={"/deletecorrectiveactions"}, method = RequestMethod.POST)
	public String deleteSelectedcorrectiveactions(HttpServletRequest request,ModelMap model,Principal principal,HttpSession session) 
	{	

			model.addAttribute("justcame","false");
			session.removeAttribute("capa");
			session.removeAttribute("date");
			session.removeAttribute("action");
			
		String[] SelectedIDs=new String[100];
		SelectedIDs=request.getParameterValues("chkUser");
		for(String id:SelectedIDs)
		{
		System.out.println(id);
		
		//formDAO.deleteParticipant(id,principal.getName());
		correctiveAndPreventiveActionsDAO.delete_correctiveAndPreventiveActions(id);
		}
		CorrectiveAndPreventiveActionsForm correctiveAndPreventiveActionsForm = new CorrectiveAndPreventiveActionsForm();
		correctiveAndPreventiveActionsForm.setCorrectiveAndPreventiveActions(correctiveAndPreventiveActionsDAO.getCorrectiveAndPreventiveActions());
		//model.addAttribute("correctiveAndPreventiveActionsForm",correctiveAndPreventiveActionsForm);
		
		model.addAttribute("menu","corrective");
		model.addAttribute("success","delete");
		return "correctiveactionsdelete";
		
	}	
		

/*//ajax get sourceofnc post method
@RequestMapping(value = { "/ajax_getnc" }, method = RequestMethod.POST)
public @ResponseBody List<String> insert_external_correctiveactions(HttpSession session,
		HttpServletRequest request, @RequestParam("nc_id") String nc_id,ModelMap model, Principal principal,NonConformance nonConformance) {
	List<String> resultHTML=new ArrayList<String>();
	System.out.println(" source of nc:::: "+nc_id);
	System.out.println("khhjjhhjhjhj"+nc_id);
	resultHTML=nonConformanceDAO.filtersourceofnc(nc_id);
	//resultHTML=resultHTML+"/n"+resultHTML+"\n"+resultHTML;
	System.out.println("result html:::::"+resultHTML);
	return resultHTML;
}
*/
//ajax get sourceofnc post method
		@RequestMapping(value = { "/ajax_getnc" }, method = RequestMethod.POST)
		public @ResponseBody String insert_external_correctiveactions(HttpSession session,
				HttpServletRequest request, @RequestParam("nc_id") String nc_id,ModelMap model, Principal principal,NonConformance nonConformance) 
				{
			String returnText="";
List <String> sourcenc=new ArrayList<String>();
sourcenc=nonConformanceDAO.filtersourceofnc(nc_id);


for(String sourceofnc:sourcenc)
{
	returnText=returnText+"<input type='hidden' class='input_txtbx' id='source_of_nonconformance' name='source_of_nonconformance' value='"+sourceofnc+"'/>"+sourceofnc+"";
	
}			
System.out.println(" source of nc:::: "+returnText);
 returnText=returnText+"<split>";
 
 List <String> typenc=new ArrayList<String>();
 typenc = nonConformanceDAO.filtertypeofnc(nc_id);
	
 for(String typeofnc:typenc)
	{
		returnText=returnText+"<input type='hidden' class='input_txtbx' id='type_of_nc' name='type_of_nonconformance' value='"+typeofnc+"'/>"+typeofnc+"";
		
	}	
 System.out.println("type of nc:::: "+returnText);
 returnText=returnText+"<split>";
 
 List <String> naturenc=new ArrayList<String>();
 naturenc = nonConformanceDAO.filternatureofnc(nc_id);
	
 
 for(String natureofnc : naturenc)
 {
	 returnText  =returnText + "<input type='hidden' class='input_txtbx'  id='nature_of_nc' name='nature_of_nc' value='"+natureofnc+"'/>"+natureofnc+"";
 }

 returnText=returnText+"<split>";
 
 List<String> temporary_action = new ArrayList<String>();
 temporary_action = nonConformanceDAO.filteraction(nc_id);
 for(String tempaction:temporary_action)
 {
	 returnText = returnText + "<input type='hidden' class='input_txtbx1  id='temporary_action' name='temporary_action' value='"+tempaction+"'/>"+tempaction+"";

 }
 
 //returnText = returnText ;
 return returnText;
				}
		


}


