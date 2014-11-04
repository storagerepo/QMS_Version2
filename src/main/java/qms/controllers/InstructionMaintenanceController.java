package qms.controllers;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.security.Principal;

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

import qms.dao.FileHandlingDAO;
import qms.dao.InstructionMaintenanceDAO;
import qms.forms.InstructionMaintenanceForm;
import qms.forms.ReferenceMaintenance_Form;
import qms.model.InstructionMaintenance;
import qms.model.Reference;


@Controller
@SessionAttributes({ "instruction" })
public class InstructionMaintenanceController {

	
	@Autowired
	InstructionMaintenanceDAO instructionMaintenanceDAO;
	
	//add_instructionMaintenance.jsp page view 20-June-14
	@RequestMapping(value ={ "/add_instructionMaintenance"}, method = RequestMethod.GET)
	public String addInstruction(HttpSession session ,ModelMap model, Principal principal) 
	{
	
		  model.addAttribute("menu","maintenance");
		
		  
		  return "add_instructionMaintenance";
	

	}
	
	//Insert a record 20-JUNE-2014
	@RequestMapping(value = { "/insert_instruction" }, method = RequestMethod.POST)
	public String insert_document(HttpSession session,
			HttpServletRequest request, ModelMap model, Principal principal,
			@ModelAttribute("InstructionMaintenance") @Valid InstructionMaintenance maintenance,BindingResult result) throws IOException {
		
		
		int records = instructionMaintenanceDAO.getInstructionrecords();
		if(records < 1)
		{
		
		int flag = 0;
		
		session.setAttribute("maintenance",maintenance);
		// Started to handle upload document
		if(result.hasErrors())
		{
			return "add_instructionMaintenance";
		}
		else
		{
		byte[] buffer;
		try {
			MultipartFile file = maintenance.getAttachments();
			String orginal_fileName = null;
			String duplicate_fileName = null;
			InputStream inputStream = null;
			OutputStream outputStream = null;
			if (file != null) {
				if (file.getSize() > 0) {
					inputStream = file.getInputStream();
					/*if (file.getSize() > 10000000) {
						System.out.println("File Size:::" + file.getSize());
						return "/add_referenceMaintenance";
					}*/
					orginal_fileName = "/qms_upload/"+ file.getOriginalFilename();
					duplicate_fileName = orginal_fileName;
					File create_file = new File(orginal_fileName);
					int i = 1;
					while (create_file.exists()) {

						duplicate_fileName = "/qms_upload/"+ file.getOriginalFilename().substring(
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

					maintenance.setAttachment_type(file.getContentType());
					maintenance.setAttachment_name(file.getOriginalFilename());
					maintenance.setAttachment_referrence(duplicate_fileName);

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
			}
			

		} catch (Exception e) {
			System.out.println(e.toString());
			e.printStackTrace();
		}
		
			instructionMaintenanceDAO.insert_instruction(maintenance);
			InstructionMaintenanceForm instructionMaintenanceForm = new InstructionMaintenanceForm();
			instructionMaintenanceForm.setInstructionMaintenances(instructionMaintenanceDAO.getinstruction());
			model.addAttribute("instructionMaintenanceForm", instructionMaintenanceForm);
			  model.addAttribute("menu","maintenance");
			  model.addAttribute("success","true");
			  return "view_instructionMaintenance";
		}
		}
		else
		{
			model.addAttribute("fail","failed");
			return "view_instructionMaintenance";
		}
	}
	// InstructionMaintenance Views 20-JUNE-2014
	@RequestMapping(value = "/view_instructionMaintenance", method = RequestMethod.GET)
	public String View_Reference(ModelMap model,HttpSession session) {

		
		InstructionMaintenanceForm instructionMaintenanceForm = new InstructionMaintenanceForm();
		instructionMaintenanceForm.setInstructionMaintenances(instructionMaintenanceDAO.getinstruction());
		model.addAttribute("instructionMaintenanceForm", instructionMaintenanceForm);
	 
		model.addAttribute("menu","maintenance");
	  
		return "view_instructionMaintenance";

	}
	
	//download the Instruction file 20-JUNE-2014 
	@RequestMapping(value = "/downloadFileDown", method = RequestMethod.GET)
	public String downloadFile(HttpServletResponse response,
			@RequestParam("id") String auto_id, ModelMap model)
			throws IOException {
		System.out.println("ajax attachement comes here");
		InstructionMaintenanceForm instructionMaintenanceForm = new InstructionMaintenanceForm();
		instructionMaintenanceForm.setInstructionMaintenances(instructionMaintenanceDAO.getInstruction(auto_id));
		model.addAttribute("instructionMaintenanceForm", instructionMaintenanceForm);

		FileHandlingDAO.filedownload(response, instructionMaintenanceForm.getInstructionMaintenances()
						.get(0).getAttachment_referrence(),  instructionMaintenanceForm.getInstructionMaintenances().get(0).getAttachment_name());

		return "view_instructionMaintenance";

	}
	//edit a Instruction Maintenance 20-JUNE-2014
	@RequestMapping(value = "/edit_instruction", method = RequestMethod.GET)
	public String edit_document(@RequestParam("id") String auto_id,HttpSession session, ModelMap model,Principal principal) {

		
		System.out.println("auto number=" +auto_id);
		InstructionMaintenanceForm instructionMaintenanceForm = new InstructionMaintenanceForm();
		instructionMaintenanceForm.setInstructionMaintenances(instructionMaintenanceDAO.getInstruction(auto_id));
		model.addAttribute("instructionMaintenanceForm", instructionMaintenanceForm);
		model.addAttribute("menu","maintenance");
		
		return "edit_instructionMaintenance";
	}
	//Update Instruction Maintenance Attachment 20-JUNE-2014
	@RequestMapping(value = { "/update_instructionMaintenance" }, method = RequestMethod.POST)
	public String update_Reference(HttpServletRequest request,@ModelAttribute("InstructionMaintenance") @Valid InstructionMaintenance reference,BindingResult result,HttpSession session, ModelMap model,Principal principal) {

		int flag = 0;
		
		if(result.hasErrors())
		{
			return "edit_instructionMaintenance";
		}
		else
		{
		 
		byte[] buffer;
			try {
				
				MultipartFile file = reference.getAttachments();
				String orginal_fileName = null;
				String duplicate_fileName = null;
				InputStream inputStream = null;
				OutputStream outputStream = null;
				if (file != null) {
					if (file.getSize() > 0) {
						inputStream = file.getInputStream();
						/*if (file.getSize() > 100000) {
							System.out.println("File Size:::" + file.getSize());
							return "/add_documents";
						}*/
						orginal_fileName = "/qms_upload/"+ file.getOriginalFilename();
						duplicate_fileName = orginal_fileName;
						File create_file = new File(orginal_fileName);
						int i = 1;
						while (create_file.exists()) {
							duplicate_fileName = "/qms_upload/"+ file.getOriginalFilename().substring(
											0,file.getOriginalFilename().lastIndexOf(
													'.'))+ i
													+ file.getOriginalFilename().substring(
											file.getOriginalFilename().lastIndexOf('.'));
							create_file = new File(duplicate_fileName);
							i++;
						}
						outputStream = new FileOutputStream(duplicate_fileName);
						System.out.println("fileName:" + file.getOriginalFilename());

						// ------Lines to changes------//

						reference.setAttachment_type(file.getContentType());
						reference.setAttachment_name(file.getOriginalFilename());
						reference.setAttachment_referrence(duplicate_fileName);

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
					
						instructionMaintenanceDAO.update_Instruction(reference, reference.getAuto_id(), principal.getName());
						model.addAttribute("success", "true");
						model.addAttribute("success_message", "Updated Successfully");
					
						InstructionMaintenanceForm instructionMaintenanceForm = new InstructionMaintenanceForm();
						instructionMaintenanceForm.setInstructionMaintenances(instructionMaintenanceDAO.getinstruction());
						model.addAttribute("instructionMaintenanceForm", instructionMaintenanceForm);
					 
						
						  model.addAttribute("menu","document");
						  
						  model.addAttribute("success","update");
					    // revisionDocumentDAO.insert_revision(revisionDocument,documentMain1.getAuto_number(),documentMain1);
					}
			}
				catch (Exception e) {
				System.out.println(e.toString());
				e.printStackTrace();
			}
				return "view_instructionMaintenance";
			}
				
		}
}
