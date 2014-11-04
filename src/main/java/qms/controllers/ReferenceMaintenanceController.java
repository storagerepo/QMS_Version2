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
import qms.dao.ReferenceMaintenanceDAO;
import qms.forms.DocumentMainForm;
import qms.forms.DocumentPrefixForm;
import qms.forms.DocumentRevisionLevelForm;
import qms.forms.DocumentTypeForm;
import qms.forms.FormLocationForm;
import qms.forms.ProcessForm;
import qms.forms.ReferenceMaintenance_Form;
import qms.forms.RevisionDocumentForm;
import qms.model.DocumentMain;
import qms.model.Reference;
import qms.model.RevisionDocument;



@Controller
@SessionAttributes({ "reference" })
public class ReferenceMaintenanceController {

	@Autowired
	ReferenceMaintenanceDAO referenceMaintenanceDAO;
	
	//add_referenceMaintenance.jsp page view 18-June-14
	@RequestMapping(value ={ "/add_referenceMaintenance"}, method = RequestMethod.GET)
	public String addreference(HttpSession session ,ModelMap model, Principal principal) 
	{
	
		  model.addAttribute("menu","maintenance");
		
		  
		  return "add_referenceMaintenance";
	

	}
	
	//Insert a record
	@RequestMapping(value = { "/insert_reference" }, method = RequestMethod.POST)
	public String insert_document(HttpSession session,
			HttpServletRequest request, ModelMap model, Principal principal,
			@ModelAttribute("Reference") @Valid Reference reference,BindingResult result) throws IOException {
		
		
		int records = referenceMaintenanceDAO.getReferencerecords();
		if(records < 5)
		{
		
		int flag = 0;
		//documentMain.setDocument_id(request.getParameter("document_id_hidden"));
		session.setAttribute("reference",reference);
		// Started to handle upload document
		
		
		
		if(result.hasErrors())
		{
			return "add_referenceMaintenance";
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
			}
			

		} catch (Exception e) {
			System.out.println(e.toString());
			e.printStackTrace();
		}
		
			referenceMaintenanceDAO.insert_reference(reference);
			ReferenceMaintenance_Form referenceMaintenance_Form = new ReferenceMaintenance_Form();
			referenceMaintenance_Form.setReferences(referenceMaintenanceDAO.getreferences());
			model.addAttribute("referenceMaintenance_Form", referenceMaintenance_Form);
			  model.addAttribute("menu","maintenance");
			  model.addAttribute("success","true");
			  return "view_referenceMaintenance";
		}
		}
		else
		{
			model.addAttribute("fail","failed");
			return "view_referenceMaintenance";
		}
	}

	// ReferenceMaintenance Views 19-JUNE-2014
	@RequestMapping(value = "/view_referenceMaintenance", method = RequestMethod.GET)
	public String View_Reference(ModelMap model,HttpSession session) {

		
		ReferenceMaintenance_Form referenceMaintenance_Form = new ReferenceMaintenance_Form();
		referenceMaintenance_Form.setReferences(referenceMaintenanceDAO.getreferences());
		model.addAttribute("referenceMaintenance_Form", referenceMaintenance_Form);
		 
		model.addAttribute("menu","maintenance");
	  
		return "view_referenceMaintenance";

	}
	//download the Instruction file 19-JUNE-2014 
	@RequestMapping(value = "/downloadFile", method = RequestMethod.GET)
	public String downloadFile(HttpServletResponse response,
			@RequestParam("id") String auto_id, ModelMap model)
			throws IOException {
System.out.println("ajax attachement comes here");
		ReferenceMaintenance_Form referenceMaintenance_Form = new ReferenceMaintenance_Form();
		referenceMaintenance_Form.setReferences(referenceMaintenanceDAO.getReference(auto_id));
		model.addAttribute("referenceMaintenance_Form", referenceMaintenance_Form);

		FileHandlingDAO.filedownload(response, referenceMaintenance_Form.getReferences()
						.get(0).getAttachment_referrence(),  referenceMaintenance_Form.getReferences().get(0).getAttachment_name());

		return "view_referenceMaintenance";

	}
	
	//edit a Reference Maintenance 19-JUNE-2014
	@RequestMapping(value = "/edit_reference", method = RequestMethod.GET)
	public String edit_document(@RequestParam("id") String auto_id,HttpSession session, ModelMap model,Principal principal) {

		
		System.out.println("auto number=" +auto_id);
		ReferenceMaintenance_Form referenceMaintenance_Form = new ReferenceMaintenance_Form();
		referenceMaintenance_Form.setReferences(referenceMaintenanceDAO.getReference(auto_id));
		model.addAttribute("referenceMaintenance_Form", referenceMaintenance_Form);
		model.addAttribute("menu","maintenance");
		
		return "edit_referenceMaintenance";
	}
	
	//Update Reference Maintenance Attachment 19-JUNE-2014
	@RequestMapping(value = { "/update_referenceMaintenance" }, method = RequestMethod.POST)
	public String update_Reference(HttpServletRequest request,@ModelAttribute("Reference") @Valid Reference reference,BindingResult result,HttpSession session, ModelMap model,Principal principal) {

		int flag = 0;
		
		if(result.hasErrors())
		{
			return "edit_referenceMaintenance";
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
					
				
					
					

						referenceMaintenanceDAO.update_Reference(reference, reference.getAuto_id(), principal.getName());
						model.addAttribute("success", "true");
						model.addAttribute("success_message", "Updated Successfully");
					
						ReferenceMaintenance_Form referenceMaintenance_Form = new ReferenceMaintenance_Form();
						referenceMaintenance_Form.setReferences(referenceMaintenanceDAO.getreferences());
						model.addAttribute("referenceMaintenance_Form", referenceMaintenance_Form);

						
						  model.addAttribute("menu","document");
						  
						  model.addAttribute("success","update");
					    // revisionDocumentDAO.insert_revision(revisionDocument,documentMain1.getAuto_number(),documentMain1);
					}
			}
				catch (Exception e) {
				System.out.println(e.toString());
				e.printStackTrace();
			}
				return "view_referenceMaintenance";
			}
				
		}
	//Delete a Reference Maintenance 19-JUNE-2014
	@RequestMapping(value = "/delete_reference", method = RequestMethod.GET)
	public String Delete_Reference(@RequestParam("id") String auto_id,HttpSession session, ModelMap model,Principal principal) {

		
		System.out.println("auto number=" +auto_id);
		referenceMaintenanceDAO.deleteReference(auto_id);
		ReferenceMaintenance_Form referenceMaintenance_Form = new ReferenceMaintenance_Form();
		referenceMaintenance_Form.setReferences(referenceMaintenanceDAO.getreferences());
		model.addAttribute("referenceMaintenance_Form", referenceMaintenance_Form);
		model.addAttribute("menu","maintenance");
		model.addAttribute("success","delete");
		return "view_referenceMaintenance";
	}
}
