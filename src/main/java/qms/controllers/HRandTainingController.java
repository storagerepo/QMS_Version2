package qms.controllers;
import org.springframework.beans.factory.annotation.Autowired;

import qms.dao.FileHandlingDAO;
import qms.dao.HRandTrainingDAO;
import java.security.Principal;
import java.awt.PageAttributes.OriginType;
import java.io.FileOutputStream;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;


import qms.model.HRandTraining;
import qms.forms.DocumentMainForm;
import qms.forms.DocumentTypeForm;
import qms.forms.EmployeeForm;
import qms.forms.HRandTrainingForm;
import qms.forms.ProcessForm;
import qms.forms.SupplierPerformanceForm;

@Controller
@SessionAttributes({"hr"})
public class HRandTainingController {
	@Autowired
	HRandTrainingDAO hRandTrainingDAO;
	
	@Autowired
	FileHandlingDAO fileHandlingDAO;

	//Getting unique id
		@RequestMapping(value={"/addhr"},method=RequestMethod.GET)
		public String addHR(HttpSession session,ModelMap model,Principal principal)
		{
			model.addAttribute("id",hRandTrainingDAO.getMax_HRID());
			
			session.removeAttribute("hr");
			model.addAttribute("menu","hr");
			return "add_hr";
		}
		
		
		//insert operation
		@RequestMapping(value={"/addhr"}, method = RequestMethod.POST)
		public String insert_hr(HttpSession session,HttpServletRequest request,ModelMap model, Principal principal,@ModelAttribute("HRandTraining") @Valid HRandTraining hRandTraining,BindingResult result ) throws IOException {
			session.removeAttribute("type");
			session.removeAttribute("qualifiedby");
			session.removeAttribute("trainer");
			System.err.println("-------------------------------------------");
			byte[] buffer=null;// = new byte[10000];
			try {
				MultipartFile file = hRandTraining.getAttachments();
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
						return "/add_hr";
					}				
				    orginal_fileName ="/qms_upload/"+file.getOriginalFilename();
				    System.out.println("filename is::::"+orginal_fileName);
				    duplicate_fileName=orginal_fileName;
				    File create_file=new File(orginal_fileName);
				    int i=1;			    
				    while(create_file.exists())
				    {
				    	duplicate_fileName="/qms_upload/"+file.getOriginalFilename().substring(0,file.getOriginalFilename().lastIndexOf('.'))+i+file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf('.'));
				   System.out.println("duplicate name is::::"+duplicate_fileName);
				    	create_file=new File(duplicate_fileName);
				    	i++;
				    }
				    outputStream = new FileOutputStream(duplicate_fileName);
				    System.out.println("fileName:" + file.getOriginalFilename());
	         
				    
				    //------Lines to changes------//
				    hRandTraining.setAttachment_name(file.getOriginalFilename());
				    hRandTraining.setAttachment_type(file.getContentType());
	                hRandTraining.setAttachment_referrence(duplicate_fileName);
	                
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
		
			System.out.println("before inserting");
				if (hRandTrainingDAO.insert_hr(hRandTraining)) {
					System.out.println("after inserting");
					//employeeDAO.insert(documentMain.getDocument_id().substring(0,documentMain.getDocument_id().lastIndexOf('-')));
					model.addAttribute("success", "true");
					model.addAttribute("success_message", "Inserted Successfully");
				//	flag = 1;
				}
			}
				catch (Exception e) {
				System.out.println(e.toString());
				e.printStackTrace();
			}
			session.setAttribute("hr",hRandTraining);
			if (result.hasErrors())
			{
				HRandTrainingForm hRandTrainingForm=new HRandTrainingForm();
				hRandTrainingForm.sethRandTrainings(hRandTrainingDAO.getHRandTrainings());
				model.addAttribute("Success","true");
				model.addAttribute("menu","hr");
		        return "view_hr";
			}
			
			
			HRandTrainingForm hRandTrainingForm=new HRandTrainingForm();
			hRandTrainingForm.sethRandTrainings(hRandTrainingDAO.getHRandTrainings());
			//model.addAttribute("hRandTrainingForm",hRandTrainingForm);		
			model.addAttribute("menu","hr");
			 model.addAttribute("justcame",false);
	        return "view_hr";
			}
		//view records
				@RequestMapping(value = "/viewhr", method = RequestMethod.GET)
			public String viewHr(HttpSession session,ModelMap model,Principal principal,HRandTraining hRandTraining)
			{
				
				session.removeAttribute("type");
				session.removeAttribute("qualifiedby");
				session.removeAttribute("trainer");
				HRandTrainingForm hRandTrainingForm =  new HRandTrainingForm();
				model.addAttribute("menu","hr");
			//	model.addAttribute("noofrows",5);
				hRandTrainingForm.sethRandTrainings(hRandTrainingDAO.getlimitedhrreport(1));
			/*	model.addAttribute("noofpages",(int) Math.ceil(hRandTrainingDAO.getnoofhrreport() * 1.0 / 5));	 
		        model.addAttribute("button","viewall");
		        model.addAttribute("success","false");
		        model.addAttribute("currentpage",1);
		    */  //  model.addAttribute("employeeForm",employeeForm);
				 model.addAttribute("justcame",false);
				return "view_hr";
			}
				

				@RequestMapping(value="/viewhrreport_page", method=RequestMethod.GET)
				public String viewhrreport_page(HttpServletRequest request,
						@RequestParam("page") int page,
						HttpSession session,@RequestParam("trainer") String trainer,@RequestParam("type_of_training") String type,
						@RequestParam("qualified_by") String qualifiedby,ModelMap model) {	
					session.setAttribute("trainer", trainer);
					session.setAttribute("type", type);
					session.setAttribute("qualifiedby",qualifiedby);
					HRandTrainingForm hRandTrainingForm = new HRandTrainingForm();
					hRandTrainingForm.sethRandTrainings(hRandTrainingDAO.findhr(type, qualifiedby, trainer,page));
					model.addAttribute("noofpages",(int) Math.ceil(hRandTrainingDAO.FindHR(type,qualifiedby,trainer) * 1.0 / 5));
				 	model.addAttribute("hRandTrainingForm",hRandTrainingForm);	
				  	model.addAttribute("noofrows",5);   
				    model.addAttribute("currentpage",page);
				    model.addAttribute("menu","hr");
				    model.addAttribute("button","viewall");
				    return "view_hr";
				    
					
				}

				
				@RequestMapping(value={"/viewallhrreport"}, method = RequestMethod.GET)
				public String viewallhrreport(HttpServletRequest request,
						HttpSession session,@RequestParam("trainer") String trainer,
						@RequestParam("type_of_training") String type,
						@RequestParam("qualified_by") String qualifiedby,
						ModelMap model, Principal principal ) {
					session.setAttribute("trainer", trainer);
					session.setAttribute("type", type);
					session.setAttribute("qualifiedby",qualifiedby);HRandTrainingForm hRandTrainingForm = new HRandTrainingForm();
					hRandTrainingForm.sethRandTrainings(hRandTrainingDAO.findhr(type, qualifiedby, trainer,0));
			//		model.addAttribute("noofpages",(int) Math.ceil(hRandTrainingDAO.FindHR(type,qualifiedby,trainer) * 1.0 / 5));
				model.addAttribute("hRandTrainingForm",hRandTrainingForm);

				  	model.addAttribute("noofrows",5);    
				   //narrativereportForm.getNarrativereport().size()
				    model.addAttribute("menu","hr");
				    model.addAttribute("button","close");
				      
				    	model.addAttribute("menu","hr");
				        model.addAttribute("success","false");
				        model.addAttribute("button","close");
				        return "view_hr";

				}

				
				//Search operation 
				@RequestMapping(value="/findhr",method=RequestMethod.GET)		
				public String findhr(HttpServletRequest request,HttpSession session,@RequestParam("trainer") String trainer,@RequestParam("type_of_training") String type,@RequestParam("qualified_by") String qualifiedby,ModelMap model)
				{
				
					System.out.println("find");
					session.setAttribute("trainer", trainer);
					session.setAttribute("type", type);
					session.setAttribute("qualifiedby",qualifiedby);
					HRandTrainingForm hRandTrainingForm = new HRandTrainingForm();
						hRandTrainingForm.sethRandTrainings(hRandTrainingDAO.findhr(type, qualifiedby, trainer,1));
						model.addAttribute("noofpages",(int) Math.ceil(hRandTrainingDAO.FindHR(type,qualifiedby,trainer) * 1.0 / 5));
						System.out.println(type);
						System.out.println(qualifiedby);
						System.out.println(trainer);
						model.addAttribute("button","viewall");
						model.addAttribute("success","false");
						model.addAttribute("currentpage",1);
						model.addAttribute("hRandTrainingForm",hRandTrainingForm);
						model.addAttribute("menu", "hr");
						System.out.println("finding....");
						return "view_hr";
					}
					
				//Search operation for AdminSetup created on 28-june-14.(6.30pm)
				@RequestMapping(value="/findadminhr",method=RequestMethod.GET)		
				public String findadminhr(HttpServletRequest request,HttpSession session,@RequestParam("trainer") String trainer,@RequestParam("type_of_training") String type,@RequestParam("qualified_by") String qualifiedby,ModelMap model)
				{
				
					System.out.println("find");
					session.setAttribute("trainer", trainer);
					session.setAttribute("type", type);
					session.setAttribute("qualifiedby",qualifiedby);
					HRandTrainingForm hRandTrainingForm = new HRandTrainingForm();
						hRandTrainingForm.sethRandTrainings(hRandTrainingDAO.findhr(type, qualifiedby, trainer,1));
						model.addAttribute("noofpages",(int) Math.ceil(hRandTrainingDAO.FindHR(type,qualifiedby,trainer) * 1.0 / 5));
						System.out.println(type);
						System.out.println(qualifiedby);
						System.out.println(trainer);
						model.addAttribute("button","viewall");
						model.addAttribute("success","false");
						model.addAttribute("currentpage",1);
						model.addAttribute("hRandTrainingForm",hRandTrainingForm);
						model.addAttribute("menu", "hr");
						System.out.println("finding....");
						return "hrdelete";
					}
								
				@RequestMapping(value="/viewdeletehrreport_page", method=RequestMethod.GET)
				public String viewdeletehrreport_page(HttpServletRequest request,
						@RequestParam("page") int page,
						HttpSession session,@RequestParam("trainer") String trainer,@RequestParam("type_of_training") String type,
						@RequestParam("qualified_by") String qualifiedby,ModelMap model) {	
					session.setAttribute("trainer", trainer);
					session.setAttribute("type", type);
					session.setAttribute("qualifiedby",qualifiedby);
					HRandTrainingForm hRandTrainingForm = new HRandTrainingForm();
					hRandTrainingForm.sethRandTrainings(hRandTrainingDAO.findhr(type, qualifiedby, trainer,page));
					model.addAttribute("noofpages",(int) Math.ceil(hRandTrainingDAO.FindHR(type,qualifiedby,trainer) * 1.0 / 5));
				 	model.addAttribute("hRandTrainingForm",hRandTrainingForm);	
				  	model.addAttribute("noofrows",5);   
				    model.addAttribute("currentpage",page);
				    model.addAttribute("menu","hr");
				    model.addAttribute("button","viewall");
				    return "hrdelete";
				    
					
				}

				
				@RequestMapping(value={"/viewalldeletehrreport"}, method = RequestMethod.GET)
				public String viewalldeletehrreport(HttpServletRequest request,
						HttpSession session,@RequestParam("trainer") String trainer,
						@RequestParam("type_of_training") String type,
						@RequestParam("qualified_by") String qualifiedby,
						ModelMap model, Principal principal ) {
					session.setAttribute("trainer", trainer);
					session.setAttribute("type", type);
					session.setAttribute("qualifiedby",qualifiedby);
					HRandTrainingForm hRandTrainingForm = new HRandTrainingForm();
					hRandTrainingForm.sethRandTrainings(hRandTrainingDAO.findhr(type, qualifiedby, trainer,0));
			//		model.addAttribute("noofpages",(int) Math.ceil(hRandTrainingDAO.FindHR(type,qualifiedby,trainer) * 1.0 / 5));
				model.addAttribute("hRandTrainingForm",hRandTrainingForm);

				  	model.addAttribute("noofrows",5);    
				   //narrativereportForm.getNarrativereport().size()
				    model.addAttribute("menu","admin");
				    model.addAttribute("button","close");
				      
				    	model.addAttribute("menu","hr");
				        model.addAttribute("success","false");
				        model.addAttribute("button","close");
				        return "hrdelete";

				}

			
				//delete a record
				@RequestMapping(value={"/deletehr"}, method = RequestMethod.GET)
				public String delete_hr(@RequestParam("id") String id,ModelMap model, Principal principal )
				{
			    
					model.addAttribute("justcame","false");
					hRandTrainingDAO.delete_hr(id);
					HRandTrainingForm hRandTrainingForm = new HRandTrainingForm();
					hRandTrainingForm.sethRandTrainings(hRandTrainingDAO.getHRandTrainings());
					model.addAttribute("hRandTrainingForm", hRandTrainingForm);
					model.addAttribute("menu","hr");
					return "view_hr";
			 	}
				//delete a record created on 20-june-14.(5.14pm)
				@RequestMapping(value={"/hrdelete"}, method = RequestMethod.GET)
				public String delete_adminhr(ModelMap model, Principal principal,HttpSession session )
				{
					model.addAttribute("justcame","false");
					session.removeAttribute("trainer");
					session.removeAttribute("type");
					session.removeAttribute("qualifiedby");

					HRandTrainingForm hRandTrainingForm = new HRandTrainingForm();
					hRandTrainingForm.sethRandTrainings(hRandTrainingDAO.getHRandTrainings());
					//model.addAttribute("hRandTrainingForm", hRandTrainingForm);

				  	model.addAttribute("noofrows",5);    
				   //narrativereportForm.getNarrativereport().size()
				    model.addAttribute("menu","hr");
				    model.addAttribute("button","close");
				    model.addAttribute("justcame",false);
				    return "hrdelete";
					
					
			 	}
				
				@RequestMapping(value={"/deletehr"}, method = RequestMethod.POST)
				public String deleteSelectedhr(HttpServletRequest request,ModelMap model,Principal principal,HttpSession session) 
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
					hRandTrainingDAO.delete_hr(id);
					}

					HRandTrainingForm hRandTrainingForm = new HRandTrainingForm();
					hRandTrainingForm.sethRandTrainings(hRandTrainingDAO.getHRandTrainings());
					//model.addAttribute("hRandTrainingForm", hRandTrainingForm);
					
					
					model.addAttribute("menu","hr");
					model.addAttribute("success","delete");
					return "hrdelete";
					
				}	

				
				//Edit a record
				@RequestMapping(value={"/edithr"}, method = RequestMethod.GET)
				public String edit_hr(@RequestParam("id") String id,ModelMap model, Principal principal)//,Employee employee )
				{
					System.out.println("id" + id);
			    	HRandTrainingForm hRandTrainingForm=new HRandTrainingForm();
					hRandTrainingForm.sethRandTrainings(hRandTrainingDAO.getHr_byid(id));
					model.addAttribute("hRandTrainingForm",hRandTrainingForm);

					model.addAttribute("menu","hr");
					return "edit_hr";
			 	}
				
				//Update a record
				@RequestMapping(value={"/updatehr"}, method = RequestMethod.POST)

					public String update_hr(HttpServletRequest request,@ModelAttribute("HRandTraining") @Valid HRandTraining hRandTraining,BindingResult result,HttpSession session, ModelMap model,Principal principal) {

					session.removeAttribute("type");
					session.removeAttribute("qualifiedby");
					session.removeAttribute("trainer");
					byte[] buffer=null;
							int status =0;
							try {
								MultipartFile file = hRandTraining.getAttachments();
								String orginal_fileName = null;
								String duplicate_fileName = null;
								InputStream inputStream = null;
								OutputStream outputStream = null;
									if (file.getSize() > 0) {
										inputStream = file.getInputStream();
										if (file.getSize() > 100000) {
											System.out.println("File Size:::" + file.getSize());
											return "/add_hr";
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

										hRandTraining.setAttachment_type(file.getContentType());
										hRandTraining.setAttachment_name(file.getOriginalFilename());
										hRandTraining.setAttachment_referrence(duplicate_fileName);

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
								
								if (hRandTrainingDAO.update_hr(hRandTraining)) {
									model.addAttribute("success", "update");
									model.addAttribute("success_message", "Updated Successfully");
									System.out.println("id from update::::"+request.getParameter(hRandTraining.getId()));
									status = 1;
								}

							} catch (Exception e) {
								System.out.println(e.toString());
								e.printStackTrace();
							}
							if(status == 1)
							{
							HRandTrainingForm hRandTrainingForm = new HRandTrainingForm();
							hRandTrainingForm.sethRandTrainings(hRandTrainingDAO.getHRandTrainings());
							model.addAttribute("menu","hr");
							 model.addAttribute("justcame",false);
							return "view_hr";
							}
							else{
								return "edit_hr";
							}
						}
				
				//downloading the attachment created on 19-jun-14
				@RequestMapping(value={"/downloadhrfile"}, method = RequestMethod.GET)
				public String downloademployeefile(@RequestParam("id") String id,HttpServletResponse response,ModelMap model, Principal principal ) throws IOException {
					
				
					HRandTrainingForm hRandTrainingForm = new HRandTrainingForm();
					hRandTrainingForm.sethRandTrainings(hRandTrainingDAO.getParticular_HR(id));
					model.addAttribute("hRandTrainingForm",hRandTrainingForm);
					System.out.println("HR id is:::"+id);	
					System.out.println("Going to download");
					System.out.println("index of employee 0 ="+hRandTrainingForm.gethRandTrainings().get(0).getAttachment_referrence());
					fileHandlingDAO.filedownload(response,hRandTrainingForm.gethRandTrainings().get(0).getAttachment_referrence(),hRandTrainingForm.gethRandTrainings().get(0).getAttachment_name());
					System.out.println("End Download");
					
					return "view_hr";
				}
				
				// Getting the Supplier Performance record's list
				@RequestMapping(value = "list_hr", method = RequestMethod.GET)
				public String list_hr(@RequestParam("id") String id,
						ModelMap model, Principal principal) 
				{
					HRandTrainingForm hRandTrainingForm = new HRandTrainingForm();
					hRandTrainingForm.sethRandTrainings(hRandTrainingDAO.getParticular_HR(id));
					model.addAttribute("hRandTrainingForm",hRandTrainingForm);
					model.addAttribute("menu","hr");
					System.out.println("list result.......");
					return "list_hr";
				}

}
