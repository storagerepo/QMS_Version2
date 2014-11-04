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

import qms.dao.ReportedByNCDAO;
import qms.dao.Type_of_NC_DAO;
import qms.forms.HRandTrainingForm;
import qms.forms.Non_Conformance_SourceForm;
import qms.forms.ProductId_NC_Form;
import qms.forms.ReportedByNCForm;
import qms.forms.Type_of_NC_Form;
import qms.model.Non_Conformance_Source;
import qms.model.ProductIDNC;
import qms.model.ReportedByNC;
import qms.model.Type_of_NC;

@Controller
@SessionAttributes({"reportnc","report"})
public class ReportedByNCController {

	@Autowired
	ReportedByNCDAO reportedByNCDAO;
	@Autowired
	Type_of_NC_DAO typeNCDAO;
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
//GET method for add page created on 19-jun-14
	@RequestMapping(value = { "/addreportnc" }, method = RequestMethod.GET)
	
	public String addReportNC(HttpSession session,ModelMap model, Principal principal) {
	
		session.removeAttribute("person");
		session.removeAttribute("typenc");

		Type_of_NC_Form type_of_NC_Form= new Type_of_NC_Form();
		type_of_NC_Form.setType_of_NCs(typeNCDAO.getType());
		model.addAttribute("type_of_NC_Form",type_of_NC_Form);
		ReportedByNCForm reportByNCForm =  new ReportedByNCForm();
		model.addAttribute("menu","nonconformance");
		
		return "add_reportnc";
	}
//Insert a record created on 19-jun-14.
@RequestMapping(value = "/addreport_nc", method = RequestMethod.POST)
public String postreportnc(HttpSession session,@ModelAttribute("ReportedByNC") @Valid ReportedByNC reportedByNC,BindingResult result, ModelMap model) {

	session.setAttribute("reportnc",reportedByNC);
	session.setAttribute("person",reportedByNC.getGroup_person());
	session.setAttribute("typenc",reportedByNC.getType_of_nc());
		if (result.hasErrors())
		{
		
			
			
			ReportedByNCForm reportedByNCForm = new ReportedByNCForm();
			reportedByNCForm.setReportedByNCs(reportedByNCDAO.getReportedByNCs());
			model.addAttribute("reportedByNCForm",reportedByNCForm);
			model.addAttribute("Success","true");
	        return "add_reportnc";
		}
		if(reportedByNCDAO.getReportedByNCsexit(reportedByNC.getType_of_nc(), reportedByNC.getGroup_person(),reportedByNC.getAuto_id()))
		{
			Type_of_NC_Form type_of_NC_Form= new Type_of_NC_Form();
			type_of_NC_Form.setType_of_NCs(typeNCDAO.getType());
			model.addAttribute("type_of_NC_Form",type_of_NC_Form);
			model.addAttribute("success","exist");
			model.addAttribute("menu","nonconformance");
			return "add_reportnc";
		}
		session.removeAttribute("person");
		session.removeAttribute("typenc");
		reportedByNCDAO.insert_nc(reportedByNC);
		ReportedByNCForm reportedByNCForm = new ReportedByNCForm();
		reportedByNCForm.setReportedByNCs(reportedByNCDAO.getlimitedNC(1));
		model.addAttribute("noofpages",(int) Math.ceil(reportedByNCDAO.getnoofncreport() * 1.0/5));
		model.addAttribute("button","viewall");
	    model.addAttribute("success","false");
	    model.addAttribute("currentpage",1);
		model.addAttribute("reportedByNCForm",reportedByNCForm);
		Type_of_NC_Form type_of_NC_Form= new Type_of_NC_Form();
		type_of_NC_Form.setType_of_NCs(typeNCDAO.getType());
		model.addAttribute("type_of_NC_Form",type_of_NC_Form);
		model.addAttribute("menu","nonconformance");
		
		model.addAttribute("success","insert");
	return "add_reportnc";
}

// Getting the List of records created on 19-jun-14.
@RequestMapping(value="/reportNC_list", method=RequestMethod.GET)
public String reportlist(HttpServletRequest request,ModelMap model, Principal principal,HttpSession session) {
	session.removeAttribute("report");
	model.addAttribute("justcame","false");
	model.addAttribute("menu","nonconformance");
	ReportedByNCForm reportedByNCForm = new ReportedByNCForm();
	reportedByNCForm.setReportedByNCs(reportedByNCDAO.getlimitedNC(1));
	model.addAttribute("noofpages",(int) Math.ceil(reportedByNCDAO.getnoofncreport() * 1.0/5));
	model.addAttribute("menu","nonconformance");
  	model.addAttribute("noofrows",5);
	model.addAttribute("button","viewall");
    model.addAttribute("success","false");
    model.addAttribute("currentpage",1);
	model.addAttribute("reportedByNCForm",reportedByNCForm);
	
	return "reportNC_list";
}

@RequestMapping(value="/reportNC_list_search", method=RequestMethod.GET)
public String reportlist_search(@RequestParam("report")String report, HttpServletRequest request,ModelMap model, Principal principal,HttpSession session) {
	session.setAttribute("report",report);
	model.addAttribute("justcame","false");
	model.addAttribute("menu","nonconformance");
	ReportedByNCForm reportedByNCForm = new ReportedByNCForm();
	reportedByNCForm.setReportedByNCs(reportedByNCDAO.getReportedByNCs(report));
	//model.addAttribute("noofpages",(int) Math.ceil(reportedByNCDAO.getnoofncreport() * 1.0/5));
	model.addAttribute("menu","nonconformance");
  	/*model.addAttribute("noofrows",5);
	model.addAttribute("button","viewall");
    model.addAttribute("success","false");
    model.addAttribute("currentpage",1);*/
	model.addAttribute("reportedByNCForm",reportedByNCForm);
	
	return "reportNC_list";
}



//Getting view all page created on 19-jun-14.
@RequestMapping(value="/viewreport_page", method=RequestMethod.GET)
public String viewncreport_page(HttpServletRequest request,@RequestParam("page") int page,ModelMap model) {	
	ReportedByNCForm reportedByNCForm = new ReportedByNCForm();
	reportedByNCForm.setReportedByNCs(reportedByNCDAO.getlimitedNC(1));
	model.addAttribute("noofpages",(int) Math.ceil(reportedByNCDAO.getnoofncreport() * 1.0/5));
    model.addAttribute("success","false");
    model.addAttribute("currentpage",1);
 	model.addAttribute("noofrows",5);   
    model.addAttribute("currentpage",page);
	model.addAttribute("reportedByNCForm",reportedByNCForm);
    model.addAttribute("menu","nonconformance");
    model.addAttribute("button","viewall");
    return "reportNC_list";
	
}
//Pagination created on 19-jun-14.
@RequestMapping(value={"/viewallncreport"}, method = RequestMethod.GET)
public String viewallncreport(HttpServletRequest request,ModelMap model, Principal principal ) {
	ReportedByNCForm reportedByNCForm = new ReportedByNCForm();
	reportedByNCForm.setReportedByNCs(reportedByNCDAO.getReportedByNCs());
		model.addAttribute("reportedByNCForm",reportedByNCForm);
  	model.addAttribute("noofrows",5);    
    model.addAttribute("menu","nonconformance");
    model.addAttribute("button","close");
    model.addAttribute("success","false");
    return "reportNC_list";

}
//Edit a record created on 20-jun-14.
@RequestMapping(value = "/edit_reportnc", method = RequestMethod.GET)
public String Editreport_get(@RequestParam("auto_id") String auto_id,ReportedByNC reportedByNC,ModelMap model) {

	Type_of_NC_Form type_of_NC_Form= new Type_of_NC_Form();
	type_of_NC_Form.setType_of_NCs(typeNCDAO.getType());
	model.addAttribute("type_of_NC_Form",type_of_NC_Form);

	
	ReportedByNCForm reportedByNCForm = new ReportedByNCForm();
	reportedByNCForm.setReportedByNCs(reportedByNCDAO.reportedByNCs(auto_id));
	model.addAttribute("reportedByNCForm",reportedByNCForm);
	model.addAttribute("menu","nonconformance");
    return "edit_report_nc";
}

//Update a record
@RequestMapping(value = "/update_reportnc", method = RequestMethod.POST)
public String Update_reportnc(HttpServletRequest request,ModelMap model,@ModelAttribute("ReportedByNC") @Valid ReportedByNC reportedByNC,BindingResult result) throws IOException {
	//String auto_id = Integer.toString(reportedByNC.getAuto_id());
	String auto_id = request.getParameter("auto_id");
	System.out.println("auto id = "+auto_id);
	System.out.println("method id = "+reportedByNC.getAuto_id());
	if (result.hasErrors())
	{
		ReportedByNCForm reportedByNCForm = new ReportedByNCForm();
		reportedByNCForm.setReportedByNCs(reportedByNCDAO.reportedByNCs(auto_id));
		model.addAttribute("reportedByNCForm",reportedByNCForm);
        return "edit_reportnc";
	}
	if(reportedByNCDAO.getReportedByNCsexit(reportedByNC.getType_of_nc(), reportedByNC.getGroup_person(),reportedByNC.getAuto_id()))
	{
		Type_of_NC_Form type_of_NC_Form= new Type_of_NC_Form();
		type_of_NC_Form.setType_of_NCs(typeNCDAO.getType());
		model.addAttribute("type_of_NC_Form",type_of_NC_Form);

		
		ReportedByNCForm reportedByNCForm = new ReportedByNCForm();
		reportedByNCForm.setReportedByNCs(reportedByNCDAO.reportedByNCs(auto_id));
		model.addAttribute("reportedByNCForm",reportedByNCForm);
		model.addAttribute("success","exist");
		model.addAttribute("menu","nonconformance");
	    return "edit_report_nc";
		
	
	}
	reportedByNCDAO.update_nc(reportedByNC);
	ReportedByNCForm reportedByNCForm = new ReportedByNCForm();
	reportedByNCForm.setReportedByNCs(reportedByNCDAO.getlimitedNC(1));
	model.addAttribute("noofpages",(int) Math.ceil(reportedByNCDAO.getnoofncreport() * 1.0/5));
     model.addAttribute("currentpage",1);
 	model.addAttribute("noofrows",5);   
	model.addAttribute("reportedByNCForm",reportedByNCForm);
    model.addAttribute("menu","nonconformance");
    model.addAttribute("button","viewall");
	model.addAttribute("success","update");
    return "reportNC_list";
}

//Search operation 
@RequestMapping(value="/findreportnc",method=RequestMethod.GET)		
public String findhr(HttpServletRequest request,HttpSession session,@RequestParam("type_of_nc") String type_of_nc,@RequestParam("type_of_training") String type,@RequestParam("qualified_by") String qualifiedby,ModelMap model)
{

	System.out.println("find");
	session.setAttribute("type_of_nc", type_of_nc);
	ReportedByNCForm reportedByNCForm = new ReportedByNCForm();
		reportedByNCForm.setReportedByNCs(reportedByNCDAO.findreportnc(type_of_nc));
		System.out.println(type_of_nc);
		model.addAttribute("reportedByNCForm",reportedByNCForm);
		model.addAttribute("menu", "reportnc");
		System.out.println("finding....");
		return "reportNC_list";
	}

@RequestMapping(value={"/delete_reportnc"}, method = RequestMethod.GET)
public String delete_reportnc(@RequestParam("auto_id") String auto_id,ModelMap model, Principal principal )
{
	reportedByNCDAO.delete_nc(auto_id);
	ReportedByNCForm reportedByNCForm = new ReportedByNCForm();
	reportedByNCForm.setReportedByNCs(reportedByNCDAO.getlimitedNC(1));
	model.addAttribute("noofpages",(int) Math.ceil(reportedByNCDAO.getnoofncreport() * 1.0/5));
	model.addAttribute("button","viewall");
    model.addAttribute("success","delete");
    model.addAttribute("currentpage",1);
	model.addAttribute("reportedByNCForm",reportedByNCForm);
	model.addAttribute("menu","nonconformance");
	return "reportNC_list";
	}
}
