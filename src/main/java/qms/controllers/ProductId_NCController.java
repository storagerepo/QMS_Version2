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
import qms.dao.ProductId_NCDAO;
import qms.forms.ProductId_NC_Form;
import qms.forms.Type_of_NC_Form;
import qms.model.ProductIDNC;
import qms.model.Type_of_NC;

@Controller
@SessionAttributes({"productidnc","pid"})
public class ProductId_NCController {
	@Autowired
	ProductId_NCDAO productId_NCDAO;
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
@RequestMapping(value = { "/addproductidnc" }, method = RequestMethod.GET)
	
	public String addTypeNC(HttpSession session,ModelMap model, Principal principal) {
		//session.removeAttribute("formlocation");
	session.removeAttribute("productnc");
		model.addAttribute("menu","nonconformance");
		return "add_productidnc";
	}
//Insert a record
@RequestMapping(value = "/addproductidnc", method = RequestMethod.POST)
public String postType(HttpSession session,@ModelAttribute("ProductIDNC") @Valid ProductIDNC productIDNC,BindingResult result, ModelMap model) {

	session.setAttribute("productIDNC",productIDNC);
	session.setAttribute("productnc",productIDNC.getProductid_nc());
	ProductId_NC_Form productId_NC_Form = new ProductId_NC_Form();
	
	
		if (result.hasErrors())
		{
		
			
			productId_NC_Form.setProductIDNCs(productId_NCDAO.getProductId());
			model.addAttribute("productId_NC_Form",productId_NC_Form);
			model.addAttribute("Success","true");
	        return "add_productidnc";
		}
		if(productId_NCDAO.getProductIdExit(productIDNC.getProductid_nc(),productIDNC.getAuto_id()))
		{
			productId_NC_Form.setProductIDNCs(productId_NCDAO.getProductId());
			model.addAttribute("productId_NC_Form",productId_NC_Form);
			model.addAttribute("success","exist");
			 return "add_productidnc";
		}
		session.removeAttribute("productnc");
		productId_NCDAO.insert_Type(productIDNC);
		productId_NC_Form.setProductIDNCs(productId_NCDAO.getlimitedproductid(1));
		model.addAttribute("noofpages",(int) Math.ceil(productId_NCDAO.getnoofproductidreport() * 1.0/5));
		model.addAttribute("button","viewall");
	    model.addAttribute("success","false");
	    model.addAttribute("currentpage",1);
		model.addAttribute("productId_NC_Form",productId_NC_Form);
		model.addAttribute("menu","nonconformance");
		model.addAttribute("success","insert");
	return "add_productidnc";
}
@RequestMapping(value="/productidNC_list", method=RequestMethod.GET)
public String Typelist(HttpServletRequest request,ModelMap model, Principal principal,HttpSession session) {
	
	
	model.addAttribute("menu","nonconformance");
	ProductId_NC_Form productId_NC_Form = new ProductId_NC_Form();
	productId_NC_Form.setProductIDNCs(productId_NCDAO.getlimitedproductid(1));
	model.addAttribute("noofpages",(int) Math.ceil(productId_NCDAO.getnoofproductidreport() * 1.0/5));
	model.addAttribute("menu","nonconformance");
  	model.addAttribute("noofrows",5);
	model.addAttribute("button","viewall");
    model.addAttribute("success","false");
    model.addAttribute("currentpage",1);
	model.addAttribute("productId_NC_Form",productId_NC_Form);
	model.addAttribute("justcame","false");
	session.removeAttribute("pid");
	return "productidNC_list";
}
@RequestMapping(value="/productidNC_list_search", method=RequestMethod.GET)
public String Typelist(@RequestParam("pid")String pid, HttpServletRequest request,ModelMap model, Principal principal,HttpSession session) {
	session.setAttribute("pid",pid);
	
	model.addAttribute("menu","nonconformance");
	ProductId_NC_Form productId_NC_Form = new ProductId_NC_Form();
	productId_NC_Form.setProductIDNCs(productId_NCDAO.getProductId(pid));
	//model.addAttribute("noofpages",(int) Math.ceil(productId_NCDAO.getnoofproductidreport() * 1.0/5));
	model.addAttribute("menu","nonconformance");
  /*	model.addAttribute("noofrows",5);
	model.addAttribute("button","viewall");
    model.addAttribute("success","false");
    model.addAttribute("currentpage",1);*/
	model.addAttribute("productId_NC_Form",productId_NC_Form);
	model.addAttribute("justcame","false");
	return "productidNC_list";
}
@RequestMapping(value="/viewproductidreport_page", method=RequestMethod.GET)
public String viewproductidreport_page(HttpServletRequest request,@RequestParam("page") int page,ModelMap model) {	
	ProductId_NC_Form productId_NC_Form = new ProductId_NC_Form();
	productId_NC_Form.setProductIDNCs(productId_NCDAO.getlimitedproductid(page));
	model.addAttribute("noofpages",(int) Math.ceil(productId_NCDAO.getnoofproductidreport() * 1.0/5));
	 model.addAttribute("success","false");
    model.addAttribute("currentpage",1);
 	model.addAttribute("noofrows",5);   
    model.addAttribute("currentpage",page);
	model.addAttribute("productId_NC_Form",productId_NC_Form);
    model.addAttribute("menu","nonconformance");
    model.addAttribute("button","viewall");
    return "productidNC_list";
	
}
@RequestMapping(value={"/viewallproductidreport"}, method = RequestMethod.GET)
public String viewallproductidreport(HttpServletRequest request,ModelMap model, Principal principal ) {
	ProductId_NC_Form productId_NC_Form = new ProductId_NC_Form();
	productId_NC_Form.setProductIDNCs(productId_NCDAO.getProductId());
	model.addAttribute("productId_NC_Form",productId_NC_Form);
  	model.addAttribute("noofrows",5);    
    model.addAttribute("menu","nonconformance");
    model.addAttribute("button","close");
    model.addAttribute("success","false");
    return "productidNC_list";

}
//Edit a record
@RequestMapping(value = "/edit_productidnc", method = RequestMethod.GET)
public String EditProductid_get(@RequestParam("auto_id") String auto_id,ProductIDNC products,ModelMap model) {

	ProductId_NC_Form productId_NC_Form = new ProductId_NC_Form();
	productId_NC_Form.setProductIDNCs(productId_NCDAO.products(auto_id));
	model.addAttribute("productId_NC_Form",productId_NC_Form);
	model.addAttribute("menu","nonconformance");
    return "edit_productidnc";
}
//Update a record
@RequestMapping(value = "/update_productid", method = RequestMethod.POST)
public String Update_type(ModelMap model,@ModelAttribute("ProductIDNC") @Valid ProductIDNC products,BindingResult result) throws IOException {
	String autoid = Integer.toString(products.getAuto_id());
	if (result.hasErrors())
	{
		
		ProductId_NC_Form productId_NC_Form = new ProductId_NC_Form();
		productId_NC_Form.setProductIDNCs(productId_NCDAO.products(autoid));
		model.addAttribute("productId_NC_Form",productId_NC_Form);
        return "edit_productidnc";
	}
	if(productId_NCDAO.getProductIdExit(products.getProductid_nc(),products.getAuto_id()))
	{
		ProductId_NC_Form productId_NC_Form = new ProductId_NC_Form();
		productId_NC_Form.setProductIDNCs(productId_NCDAO.products(autoid));
		model.addAttribute("productId_NC_Form",productId_NC_Form);
		model.addAttribute("menu","nonconformance");
		model.addAttribute("success","exist");
		 return "edit_productidnc";
	}
	productId_NCDAO.update_ProductId(products);
	ProductId_NC_Form productId_NC_Form = new ProductId_NC_Form();
	productId_NC_Form.setProductIDNCs(productId_NCDAO.getlimitedproductid(1));
	model.addAttribute("noofpages",(int) Math.ceil(productId_NCDAO.getnoofproductidreport() * 1.0/5));
     model.addAttribute("currentpage",1);
 	model.addAttribute("noofrows",5);   
	model.addAttribute("productId_NC_Form",productId_NC_Form);
    model.addAttribute("menu","nonconformance");
    model.addAttribute("button","viewall");
	model.addAttribute("success","update");
    return "productidNC_list";
}
@RequestMapping(value={"/delete_productidnc"}, method = RequestMethod.GET)
public String delete_type(@RequestParam("auto_id") String auto_id,ModelMap model, Principal principal )
{

	
	productId_NCDAO.delete_productid(auto_id);
	ProductId_NC_Form productId_NC_Form = new ProductId_NC_Form();
	productId_NC_Form.setProductIDNCs(productId_NCDAO.getlimitedproductid(1));
	model.addAttribute("noofpages",(int) Math.ceil(productId_NCDAO.getnoofproductidreport() * 1.0/5));
  	model.addAttribute("button","viewall");
    model.addAttribute("success","delete");
    model.addAttribute("currentpage",1);
	model.addAttribute("productId_NC_Form",productId_NC_Form);
	model.addAttribute("menu","nonconformance");
	return "productidNC_list";
	}
}
