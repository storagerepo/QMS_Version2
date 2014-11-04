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

import qms.dao.Source_NCDAO;
import qms.model.Non_Conformance_Source;
import qms.model.Process;
import qms.forms.Non_Conformance_SourceForm;
import qms.forms.ProcessForm;

@Controller
@SessionAttributes({"sourcenc","source"})
public class SourceNonConformanceController {

	@Autowired
	Source_NCDAO sourceNCDAO;
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
@RequestMapping(value = { "/addsourcenc" }, method = RequestMethod.GET)
	
	public String addSourceNC(HttpSession session,ModelMap model, Principal principal) {
		//session.removeAttribute("formlocation");
	session.removeAttribute("sourcenc");
		model.addAttribute("menu","nonconformance");
		return "Add_source_NC";
	}
//Insert a record
@RequestMapping(value = "/addsourcenc", method = RequestMethod.POST)
public String postProcess(HttpSession session,@ModelAttribute("Non_Conformance_Source") @Valid Non_Conformance_Source non_Conformance_Source,BindingResult result, ModelMap model) {

	session.setAttribute("non_Conformance_Source",non_Conformance_Source);
	session.setAttribute("sourcenc",non_Conformance_Source.getSource_of_nc());
	Non_Conformance_SourceForm conformance_SourceForm = new Non_Conformance_SourceForm();
		if (result.hasErrors())
		{
			conformance_SourceForm.setConformance_Sources(sourceNCDAO.getSource());
			model.addAttribute("conformance_SourceForm",conformance_SourceForm);
			model.addAttribute("Success","true");
	        return "Add_source_NC";
		}
	
		if(sourceNCDAO.sourcesExit(non_Conformance_Source.getSource_of_nc(),non_Conformance_Source.getAuto_id()))
		{
			model.addAttribute("success","exist");
			model.addAttribute("menu","nonconformance");
			return "Add_source_NC";
		}
		sourceNCDAO.insert_Source(non_Conformance_Source);
		session.removeAttribute("sourcenc");
		conformance_SourceForm.setConformance_Sources(sourceNCDAO.getlimitedsource(1));
		model.addAttribute("noofpages",(int) Math.ceil(sourceNCDAO.getnoofsourcereport() * 1.0/5));
		model.addAttribute("button","viewall");
	    model.addAttribute("success","false");
	    model.addAttribute("currentpage",1);
		model.addAttribute("conformance_SourceForm",conformance_SourceForm);
		model.addAttribute("menu","nonconformance");
		model.addAttribute("success","insert");
	return "Add_source_NC";
}
@RequestMapping(value="/sourceNC_list", method=RequestMethod.GET)
public String Sourcelist(HttpServletRequest request,ModelMap model, Principal principal,HttpSession session) {
	
	session.removeAttribute("source");
	model.addAttribute("menu","nonconformance");
	Non_Conformance_SourceForm conformance_SourceForm = new Non_Conformance_SourceForm();
	conformance_SourceForm.setConformance_Sources(sourceNCDAO.getlimitedsource(1));
	model.addAttribute("noofpages",(int) Math.ceil(sourceNCDAO.getnoofsourcereport() * 1.0 / 5));
	model.addAttribute("menu","nonconformance");
  	model.addAttribute("noofrows",5);
	model.addAttribute("button","viewall");
    model.addAttribute("success","false");
    model.addAttribute("currentpage",1);
	model.addAttribute("conformance_SourceForm",conformance_SourceForm);
	model.addAttribute("justcame","false");
	return "sourceNC_list";
}
@RequestMapping(value="/sourceNC_list_search", method=RequestMethod.GET)
public String Sourcelist(@RequestParam("source") String source, HttpServletRequest request,ModelMap model, Principal principal,HttpSession session) {
	
	session.setAttribute("source",source);
	model.addAttribute("menu","nonconformance");
	Non_Conformance_SourceForm conformance_SourceForm = new Non_Conformance_SourceForm();
	conformance_SourceForm.setConformance_Sources(sourceNCDAO.getSource(source));
	model.addAttribute("justcame","false");
	/*model.addAttribute("noofpages",(int) Math.ceil(sourceNCDAO.getnoofsourcereport() * 1.0 / 5));
	
  	model.addAttribute("noofrows",5);
	model.addAttribute("button","viewall");
    model.addAttribute("success","false");
    model.addAttribute("currentpage",1);*/
	model.addAttribute("conformance_SourceForm",conformance_SourceForm);
	
	return "sourceNC_list";
}
@RequestMapping(value="/viewsourcereport_page", method=RequestMethod.GET)
public String viewprocessreport_page(HttpServletRequest request,@RequestParam("page") int page,ModelMap model) {	
	Non_Conformance_SourceForm conformance_SourceForm = new Non_Conformance_SourceForm();
	conformance_SourceForm.setConformance_Sources(sourceNCDAO.getlimitedsource(page));
	model.addAttribute("noofpages",(int) Math.ceil(sourceNCDAO.getnoofsourcereport() * 1.0 / 5));
    model.addAttribute("success","false");
    model.addAttribute("currentpage",1);
 	model.addAttribute("noofrows",5);   
    model.addAttribute("currentpage",page);
	model.addAttribute("conformance_SourceForm",conformance_SourceForm);
    model.addAttribute("menu","nonconformance");
    model.addAttribute("button","viewall");
    return "sourceNC_list";
	
}
@RequestMapping(value={"/viewallsourcereport"}, method = RequestMethod.GET)
public String viewallprocessreport(HttpServletRequest request,ModelMap model, Principal principal ) {
	Non_Conformance_SourceForm conformance_SourceForm = new Non_Conformance_SourceForm();
	conformance_SourceForm.setConformance_Sources(sourceNCDAO.getSource());    
	model.addAttribute("conformance_SourceForm",conformance_SourceForm);
  	model.addAttribute("noofrows",5);    
    model.addAttribute("menu","nonconformance");
    model.addAttribute("button","close");
    model.addAttribute("success","false");
    return "sourceNC_list";

}
//Edit a record
@RequestMapping(value = "/edit_sourcenc", method = RequestMethod.GET)
public String EditSource_get(@RequestParam("auto_id") String auto_id,Non_Conformance_Source source,ModelMap model) {

	Non_Conformance_SourceForm conformance_SourceForm = new Non_Conformance_SourceForm();
	conformance_SourceForm.setConformance_Sources(sourceNCDAO.sources(auto_id));
	model.addAttribute("conformance_SourceForm",conformance_SourceForm);
	model.addAttribute("menu","nonconformance");
    return "edit_source_nc";
}
//Update a record
@RequestMapping(value = "/update_source", method = RequestMethod.POST)
public String Update_Process(ModelMap model,@ModelAttribute("Non_Conformance_Source") @Valid Non_Conformance_Source sources,BindingResult result) throws IOException {
	String autoid = Integer.toString(sources.getAuto_id());
	Non_Conformance_SourceForm conformance_SourceForm = new Non_Conformance_SourceForm();
	if (result.hasErrors())
	{
		
		
		
		conformance_SourceForm.setConformance_Sources(sourceNCDAO.sources(autoid));
		model.addAttribute("conformance_SourceForm",conformance_SourceForm);
        return "edit_sourcenc";
	}
	if(sourceNCDAO.sourcesExit(sources.getSource_of_nc(),sources.getAuto_id()))
	{
		
		model.addAttribute("success","exist");
		conformance_SourceForm.setConformance_Sources(sourceNCDAO.sources(autoid));
		model.addAttribute("conformance_SourceForm",conformance_SourceForm);
		model.addAttribute("menu","nonconformance");
	    return "edit_source_nc";
	}
	//processDAO.update_Process(process);
	sourceNCDAO.update_Source(sources);
	
	conformance_SourceForm.setConformance_Sources(sourceNCDAO.getlimitedsource(1));
	model.addAttribute("noofpages",(int) Math.ceil(sourceNCDAO.getnoofsourcereport() * 1.0/5));
    model.addAttribute("currentpage",1);
 	model.addAttribute("noofrows",5);   
	model.addAttribute("conformance_SourceForm",conformance_SourceForm);
    model.addAttribute("menu","nonconformance");
    model.addAttribute("button","viewall");
	model.addAttribute("success","update");
    return "sourceNC_list";
}
@RequestMapping(value={"/delete_source"}, method = RequestMethod.GET)
public String delete_process(@RequestParam("auto_id") String auto_id,ModelMap model, Principal principal )
{

	sourceNCDAO.delete_source(auto_id);
	Non_Conformance_SourceForm conformance_SourceForm = new Non_Conformance_SourceForm();
	conformance_SourceForm.setConformance_Sources(sourceNCDAO.getlimitedsource(1));
	model.addAttribute("noofpages",(int) Math.ceil(sourceNCDAO.getnoofsourcereport() * 1.0/5));
	model.addAttribute("button","viewall");
    model.addAttribute("success","delete");
    model.addAttribute("currentpage",1);
	model.addAttribute("conformance_SourceForm",conformance_SourceForm);
	model.addAttribute("menu","nonconformance");
	return "sourceNC_list";
	}

}
