<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page import="qms.model.SupplierPerformance"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>
<script src="resources/js/jquery-1.7.2.min.js"></script>
<script src="resources/js/jquery-ui.js"></script>
<html>
<head>
 <STYLE type="text/css">
  P#mypar {font-style:calibri;
  line-height:18px;}
  
  </STYLE>

</head>
<body>
  <div id="right_content" style="height:100%">
<form method="post" action="updatesupplierperformance">

    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
        <td>
         <div>
  <ul class="horizmenu">
						
								<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="add_supplierperformance" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Add SupplierPerformance</span>
									
								</a>
							</li>
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="view_supplierperformance" class="<c:choose>
								<c:when test="${menu=='supplier'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									<span>View SupplierPerformance</span>
									
								</a>
							</li>
				            <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="supplierperformance_report" class="<c:choose>
								<c:when test="${menu=='supplier'}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Reports</span>
									
								</a>
							</li>
				            
				            </ul>
  </div>
        </td>
      </tr>
      <tr>
        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2>Update Supplier Performance</h2>
            </div>
            <div class="contentbox">
              <div style="border:#993300  2px solid; padding:15px; margin-bottom:15px;">
            <c:set value="${supplierPerformanceForm.supplierperformance[0]}" var="supplierperformance"/>
              <table cellpadding="0" cellspacing="0" border="0" width="100%" style="padding-left: 30px; padding-right: 30px;">
              <tr class="row2">
                  <td valign="top" align="left" class="input_txt" width="20%">Supplier ID :</td>
                  <td valign="top" align="left" class="input_txt" width="30%"><input type="text" name="supplier_id" id="inp_id" class="input_txtbx" value="<c:out value="${supplierperformance.supplier_id }"/>"/><br/><span style="color: red;"><form:errors path="SupplierPerformance.supplier_id"></form:errors></span></td>
                  <td valign="top" align="left" class="input_txt" width="20%">Website :</td>
                  <td valign="top" align="left" class="input_txt" width="40%"><input type="text" name="website" placeholder="www.example.com" class="input_txtbx" id="inp_website" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${supplierperformance.website}" /><br/><span style="color: red;" id="websiteerror"><form:errors path="SupplierPerformance.website"></form:errors></span></td>
                
                </tr>                                                                                
                  <tr class="row1">
                  <td valign="top" align="left" class="input_txt" >Supplier name :</td>
                  <td valign="top" align="left" class="input_txt" ><input type="text" name="supplier_name" class="input_txtbx" id="inp_supplier_name" maxlength="32" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" onkeypress="return onlyAlphabets(event,this);" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"  value="${supplierperformance.supplier_name}" /><br/><span style="color: red;" id="nameerror"><form:errors path="SupplierPerformance.supplier_name"></form:errors></span></td>
                  <td valign="top" align="left" class="input_txt" >Certified to :</td>
				<td valign="top" align="left" class="input_txt"><select	name="certified_to" class="input_txtbx" id="certified">
                  										<option value="">--Select--</option>
                  										<option
															<c:if test="${supplierperformance.certified_to eq 'ISO 9001'}"><c:out value="Selected"/></c:if>
															value="ISO 9001">ISO 9001</option>
														<option
															<c:if test="${supplierperformance.certified_to eq 'ISO 9002'}"><c:out value="Selected"/></c:if>
															value="ISO 9002">ISO 9002</option>
															</select>
															<br/><span style="color: red;" id="certifiederror"><form:errors path="SupplierPerformance.certified_to"></form:errors></span></td>
                                  
                
                </tr>
		        <tr class="row2">
				  <td valign="top" align="left" class="input_txt" >Category :</td>
				<td valign="top" align="left" class="input_txt"><select	name="category" class="input_txtbx" id="category">
                  										<option value="">--Select--</option>
                  										<option
															<c:if test="${supplierperformance.category eq 'Critical'}"><c:out value="Selected"/></c:if>
															value="Critical">Critical</option>
														<option
															<c:if test="${supplierperformance.category eq 'Non Critical'}"><c:out value="Selected"/></c:if>
															value="Non Critical">Non Critical</option>
															</select>
															<br/><span style="color: red;" id="categoryerror"></span><form:errors path="SupplierPerformance.category"></form:errors></td>
                  <td valign="top" align="left" class="input_txt">Contact name :</td>
                  <td valign="top" align="left" class="input_txt" ><input type="text" name="contact_name" class="input_txtbx" id="inp_contact_name" maxlength="32" onkeypress="return onlyAlphabets(event,this);" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"  onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${supplierperformance.contact_name}" /><br/><span style="color: red;" id="contacterror"><form:errors path="SupplierPerformance.contact_name"></form:errors></span></td>
                                  
                </tr>
                <tr class="row1">
                  <td valign="top" align="left" class="input_txt" >Address :</td>
                  <td valign="top" align="left" class="input_txt" >
                  <%-- <input type="text" name="address" class="input_txtbx" id="inp_address" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${supplierperformance.address}" /><br/><span style="color: red;"><form:errors path="SupplierPerformance.address"></form:errors></span></td> --%>
                   <textarea class="input_txtbx" id="inp_address" name="address"  style="height: 70px;">${supplierperformance.address}</textarea><br/>
				<span style="color: red;" id="addresserror"><form:errors path="supplierperformance.address"></form:errors></span></td>
			
                  <td valign="top" align="left" class="input_txt" >Title :</td>
                  <td valign="top" align="left" class="input_txt" ><input type="text" name="contact_title" class="input_txtbx" id="inp_contact_title" maxlength="32" onkeypress="return onlyAlphabetsnumeric(event,this);" onmouseover="showTooltip('tooltip_id','inp_id3');" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"  onmouseout="hideTooltip('tooltip_id');" value="${supplierperformance.contact_title}" /><br/><span style="color: red;" id="titleerror"><form:errors path="SupplierPerformance.contact_title"></form:errors></span></td>
                
                </tr>
				<tr class="row2">
				  <td valign="top" align="left" class="input_txt" >City :</td>
				  <td valign="top" align="left" class="input_txt" ><input type="text" name="city" class="input_txtbx" id="inp_city" maxlength="32" onkeypress="return onlyAlphabets(event,this);" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"  value="${supplierperformance.city}" /><br/><span style="color: red;" id="cityerror"><form:errors path="SupplierPerformance.city"></form:errors></span></td>
                  <td valign="top" align="left" class="input_txt" >Phone :</td>
                  <td valign="top" align="left" class="input_txt" ><input type="text" name="phone" class="input_txtbx" placeholder="9876543210" id="inp_phone" maxlength="10"  onkeypress="return validate(event)";  onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"  onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${supplierperformance.phone}" /><br/><span style="color: red;" id="phoneerror"><form:errors path="SupplierPerformance.phone"></form:errors></span></td>
                
                </tr>
              	<tr class="row1">
              	<td valign="top" align="left" class="input_txt" >State :</td>
              	<td valign="top" align="left" class="input_txt" ><input type="text" name="state" onkeypress="return onlyAlphabets(event,this);" maxlength="32" class="input_txtbx" id="inp_state" onmouseover="showTooltip('tooltip_id','inp_id3');" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"  onmouseout="hideTooltip('tooltip_id');" value="${supplierperformance.state}" /><br/><span style="color: red;" id="stateerror"><form:errors path="SupplierPerformance.state"></form:errors></span></td>
              	  <td valign="top" align="left" class="input_txt" >Fax :</td>
                  <td valign="top" align="left" class="input_txt" ><input type="text" maxlength="10"  placeholder="6143229928" onkeypress="return Number(event,this);" name="fax" class="input_txtbx" id="inp_fax" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"  onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${supplierperformance.fax}" /><br/><span style="color: red;" id="faxerror"><form:errors path="SupplierPerformance.fax"></form:errors></span></td>
                
              	</tr>
                <tr class="row2">
				<td valign="top" align="left" class="input_txt" >Postal code :</td>
				<td valign="top" align="left" class="input_txt" ><input type="text" name="postalcode" placeholder="OH 43230" maxlength="8" onblur="ChangeCase(this);" onkeypress="return AlphabetsNumber1(event,this);" class="input_txtbx" id="inp_postalcode"   onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"  onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${supplierperformance.postalcode}" /><br/><span style="color: red;" id="postalerror"><form:errors path="SupplierPerformance.postalcode"></form:errors></span></td>
                  <td valign="top" align="left" class="input_txt">Email :</td>
                  <td valign="top" align="left" class="input_txt" ><input type="text" name="email_address" class="input_txtbx" id="inp_email_address" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"  value="${supplierperformance.email_address}" /><br/><span style="color: red;"id="emailerror"><form:errors path="SupplierPerformance.email_address"></form:errors></span></td>
                
                </tr>
				<tr class="row1">
                  <td valign="top" align="left" class="input_txt" >Country :</td>
                  <td valign="top" align="left" class="input_txt" ><input type="text" name="country" class="input_txtbx" id="inp_country" maxlength="32" onkeypress="return onlyAlphabets(event,this);" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${supplierperformance.country}" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"  /><br/><span style="color: red;" id="countryerror"><form:errors path="SupplierPerformance.country"></form:errors></span></td>
                </tr>
                
                <tr class="row2">
                <td></td>
                <td></td>
                </tr>
                
                 			   <!--    <tr class="row1">
                  <td valign="top" align="left">&nbsp;</td>
                  <td valign="top" align="center" colspan="2"><input type="submit" value="Update" onclick="return checkSubmit();" class="submit_btn1"></td>
                </tr>
                  -->
                <tr class="row1">
                  <td valign="bottom" colspan="4"align="right" style="padding-right:125px;">&nbsp;<input type="submit" value="Update" onclick="return checkSubmit();"class="submit_btn1"></td>
                
                </tr>
              </table>
              
            </div>
          </div></td>
      </tr>
      </table>
      </form>
      </div>
  <script>
  $(function() {
	$("#inp_supplier_name").on("keypress", function(e) {
		if (e.which === 32 && !this.value.length)
	        e.preventDefault();
	});
	});	
  $(function() {
		$("#inp_website").on("keypress", function(e) {
			if (e.which === 32 && !this.value.length)
		        e.preventDefault();
		});
		});	
  $(function() {
		$("#inp_contact_name").on("keypress", function(e) {
			if (e.which === 32 && !this.value.length)
		        e.preventDefault();
		});
		});	
  $(function() {
		$("#inp_address").on("keypress", function(e) {
			if (e.which === 32 && !this.value.length)
		        e.preventDefault();
		});
		});	
  $(function() {
		$("#inp_contact_title").on("keypress", function(e) {
			if (e.which === 32 && !this.value.length)
		        e.preventDefault();
		});
		});	
  $(function() {
		$("#inp_city").on("keypress", function(e) {
			if (e.which === 32 && !this.value.length)
		        e.preventDefault();
		});
		});	/* 
  $(function() {
		$("#inp_phone").on("keypress", function(e) {
			if (e.which === 32 && !this.value.length)
		        e.preventDefault();
		});
		});	 */
  $(function() {
		$("#inp_state").on("keypress", function(e) {
			if (e.which === 32 && !this.value.length)
		        e.preventDefault();
		});
		});	
  $(function() {
		$("#inp_fax").on("keypress", function(e) {
			if (e.which === 32 && !this.value.length)
		        e.preventDefault();
		});
		});	
  $(function() {
		$("#inp_postalcode").on("keypress", function(e) {
			if (e.which === 32 && !this.value.length)
		        e.preventDefault();
		});
		});	
  $(function() {
		$("#inp_email_address").on("keypress", function(e) {
			if (e.which === 32 && !this.value.length)
		        e.preventDefault();
		});
		});	
  $(function() {
		$("#inp_country").on("keypress", function(e) {
			if (e.which === 32 && !this.value.length)
		        e.preventDefault();
		});
		});	

</script>

<script>
function validatename(id)
{
	var textInput = document.getElementById(id).value;
	textInput = textInput.replace(/[^A-Za-z ]/g, "");
	document.getElementById(id).value = textInput;
}
</script>
<script>
function ChangeCase(elem)
{
    elem.value = elem.value.toUpperCase();
}
</script>
<script>
function AlphabetsNumber1(e, t) {
    try {
    
    	
        if (window.event) {
            var charCode = window.event.keyCode;
        }
        else if (e) {
            var charCode = e.which;
        }
        
        else { return true; }
       /*  if(t.value.substring(0,1))
        	{
        	alert()
        	alert(e.which);
        	} */
        if(t.value.length<2)
        	{
        if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123))
            return true;
        else
            return false;
        	}
        if(t.value.length==2)
        	{
        	
        	t.value+=" ";
        	}
        
        
        if(t.value.length>=2)
    	{
        	
    if ((charCode >47 && charCode < 58))
        return true;
    else
        return false;
    	
    	}
    }
    catch (err) {
        alert(err.Description);
    }
}
function Number(e, t) {
    try {
        if (window.event) {
            var charCode = window.event.keyCode;
        }
        else if (e) {
            var charCode = e.which;
        }
        else { return true; }
        if ((charCode >47 && charCode < 58))
            return true;
        else
            return false;
    }
    catch (err) {
        alert(err.Description);
    }
}


</script>

 <script>
i=0;
$(document).ready(function(){
$("#inp_fax").blur(function(){
var phone=document.getElementById("inp_fax").value;
phone = phone.replace(/(\d{3})(\d{3})(\d{4})/,'$1-$2-$3');
document.getElementById("inp_fax").value=phone;
 });  
$("#inp_fax").focus(function(){
	
	var phone=document.getElementById("inp_fax").value;
	phone = phone.replace("-","");
	phone = phone.replace("-","");
	document.getElementById("inp_fax").value=phone;
	 });
	 $("#inp_phone").blur(function(){
var phone=document.getElementById("inp_phone").value;
phone = phone.replace(/(\d{3})(\d{3})(\d{4})/,'$1-$2-$3');
document.getElementById("inp_phone").value=phone;
 });  
$("#inp_phone").focus(function(){
	
	var phone=document.getElementById("inp_phone").value;
	phone = phone.replace("-","");
	phone = phone.replace("-","");
	document.getElementById("inp_phone").value=phone;
	 }); 
});
</script>
<script>

	function checkSubmit()
	{
		var mobile = /(\W|^)[(]{0,1}\d{3}[)]{0,1}[\s-]{0,1}\d{3}[\s-]{0,1}\d{4}(\W|$)/;
		var contact = document.getElementById('inp_contact_name').value;
		var address = document.getElementById('inp_address').value;
		var title = document.getElementById('inp_contact_title').value;
		var city = document.getElementById('inp_city').value;
		var phone = document.getElementById('inp_phone').value;
		var state = document.getElementById('inp_state').value;
		var fax = document.getElementById('inp_fax').value;
		var postal = document.getElementById('inp_postalcode').value;
		var email = document.getElementById('inp_email_address').value;
		var country = document.getElementById('inp_country').value;
		var certified = document.getElementById('certified').value;
		var category = document.getElementById('category').value; 
		var error="";
		
		if(category=="")	
		{
		
		document.getElementById("categoryerror").innerHTML="Required field should not be empty select one";
		error="true";
		}
		else{
		document.getElementById("categoryerror").innerHTML="";
		}
		if(certified=="")
		{
		
		document.getElementById("certifiederror").innerHTML="Required field should not be empty";
		error="true";
		}
		else{
		document.getElementById("certifiederror").innerHTML="";
		}
		document.getElementById("nameerror").innerHTML="";
		if(document.getElementById("inp_supplier_name").value=="")
			{
			
			document.getElementById("nameerror").innerHTML="Required field should not be empty";
			error="true";
			}
		else if(document.getElementById("inp_supplier_name").value.substring(0,1)==" ")
		{
		document.getElementById("nameerror").innerHTML="Should not accept initial space";
		 error="true";
		}
		else if(document.getElementById("inp_supplier_name").value.length<4 || document.getElementById("inp_supplier_name").value.length>=32)
	    {
	    	
	    	document.getElementById("nameerror").innerHTML="Required field should be length of 4 to 32";
			error="true";
	    }
		
	    else
	    	{
	    	document.getElementById("nameerror").innerHTML="";
	    	}		
		
		if(contact =="")
		 {
		
			 document.getElementById("contacterror").innerHTML="Required field should not be empty";
			 error="true";
		 } 
			
		else if(document.getElementById("inp_contact_name").value.substring(0,1)==" ")
		{
		document.getElementById("contacterror").innerHTML="Should not accept initial space";
		 error="true";
		}
		
		else if(document.getElementById("inp_contact_name").value.length<4 || document.getElementById("inp_contact_name").value.length>=32)
		    {
		    	
		    	document.getElementById("contacterror").innerHTML="Required field should be length of 4 to 32";
		    	 error="true";
		    } 
		
		    else
		    	{
		    	document.getElementById("contacterror").innerHTML="";
		    	}
		
		if(address =="")
		 {
		
			 document.getElementById("addresserror").innerHTML="Required field should not be empty";
			 error="true";
		 } 
		else if(document.getElementById("inp_address").value.substring(0,1)==" ")
		{
		document.getElementById("addresserror").innerHTML="Should not accept initial space";
		 error="true";
		}	
		else if(document.getElementById("inp_address").value.length<4 || document.getElementById("inp_address").value.length>=500)
		    {
		    	
		    	document.getElementById("addresserror").innerHTML="Required field should be length of 4 to 500";
		    	 error="true";
		    } 
		
		    else
		    	{
		    	document.getElementById("addresserror").innerHTML="";
		    	}
		if(title =="")
		 {
		
			 document.getElementById("titleerror").innerHTML="Required field should not be empty";
			 error="true";
		 } 
		
		else if(document.getElementById("inp_contact_title").value.substring(0,1)==" ")
		{
		document.getElementById("titleerror").innerHTML="Should not accept initial space";
		 error="true";
		}
		else if(document.getElementById("inp_contact_title").value.length<4 || document.getElementById("inp_contact_title").value.length>=32)
		    {
		    	
		    	document.getElementById("titleerror").innerHTML="Required field should be length of 4 to 32";
		    	 error="true";
		    } 
		
		    else
		    	{
		    	document.getElementById("titleerror").innerHTML="";
		    	}
		if(city =="")
		 {
		
			 document.getElementById("cityerror").innerHTML="Required field should not be empty";
			 error="true";
		 } 
		else if(document.getElementById("inp_city").value.substring(0,1)==" ")
		{
		document.getElementById("cityerror").innerHTML="Should not accept initial space";
		 error="true";
		}	
		else if(document.getElementById("inp_city").value.length<4 || document.getElementById("inp_city").value.length>=32)
		    {
		    	
		    	document.getElementById("cityerror").innerHTML="Required field should be length of 4 to 32";
		    	 error="true";
		    } 
		
		    else
		    	{
		    	document.getElementById("cityerror").innerHTML="";
		    	}
		
		if(state =="")
		 {
		
			 document.getElementById("stateerror").innerHTML="Required field should not be empty";
			 error="true";
		 } 
			
		else if(document.getElementById("inp_state").value.substring(0,1)==" ")
		{
		document.getElementById("stateerror").innerHTML="Should not accept initial space";
		 error="true";
		}
		else if(document.getElementById("inp_state").value.length<4 || document.getElementById("inp_state").value.length>=32)
		    {
		    	
		    	document.getElementById("stateerror").innerHTML="Required field should be length of 4 to 32";
		    	 error="true";
		    } 
		
		    else
		    	{
		    	document.getElementById("stateerror").innerHTML="";
		    	}
		if(country =="")
		 {
		
			 document.getElementById("countryerror").innerHTML="Required field should not be empty";
			 error="true";
		 } 
		
		else if(document.getElementById("inp_country").value.substring(0,1)==" ")
		{
		document.getElementById("countryerror").innerHTML="Should not accept initial space";
		 error="true";
		}
		else if(document.getElementById("inp_country").value.length<4 || document.getElementById("inp_country").value.length>=32)
		    {
		    	
		    	document.getElementById("countryerror").innerHTML="Required field should be length of 4 to 32";
		    	 error="true";
		    } 
		
		    else
		    	{
		    	document.getElementById("countryerror").innerHTML="";
		    	}
		var mail = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,3}$/;
	    
		if(email=="")
		{
		document.getElementById("emailerror").innerHTML="Required field should not be empty";
		error="true";
		}
		
		else if(email.match(mail)==null)
	    {
	    	document.getElementById("emailerror").innerHTML="Invalid E-mail format";
	    	error="true";
	    }
		else if(email.substring(0,1)==" ")
		{
		document.getElementById("emailerror").innerHTML="Should not accept initial space";
		 error="true";
		}
		else
			{
			document.getElementById("emailerror").innerHTML="";
			}


		//var zipcode =/^\d{5}$/;
		var zero = 00000;
	    
	    if(postal=="")	
		{
		document.getElementById("postalerror").innerHTML="Required field should not be empty";
		error="true";
		}
	    else if(document.getElementById("inp_postalcode").value.length<4 || document.getElementById("inp_postalcode").value.length>8)
	    {
	    
	    	document.getElementById("postalerror").innerHTML="Field should be of length 4 to 8";
	    	 error="true";
	    } 
		/* else if(document.getElementById("inp_postalcode").value.match(zipcode)==null)
	    {
	    	document.getElementById("postalerror").innerHTML="Invalid postalcode format";
	    	error="true";
	    } */
	    else if(document.getElementById("inp_postalcode").value.match(zero))
	    	{
	    	document.getElementById("postalerror").innerHTML="Invalid postalcode";
	    	}
	    else
	    	{
	    	document.getElementById('postalerror').innerHTML="";
	    	}
	    

	    document.getElementById("faxerror").innerHTML=" ";
	    if(document.getElementById("inp_fax").value!="")
	    	{
	   	if(document.getElementById("inp_fax").value=="")
	   	{
	   	document.getElementById("faxerror").innerHTML="Required field should not be empty";
	   	error="true"
	   	}}
	   	document.getElementById("faxerror").innerHTML=" ";
	   	 //var faxreg = /\+1(|\.|\-)[2-9][0-9]{2}(|\.|\-)[0-9]{3}(|\.|\-)[0-9]{4}/;
	   	  var faxreg = /^\(?([0-9]{3})\)?[-]?([0-9]{3})[-]?([0-9]{4})$/;  
	   	    if(document.getElementById("inp_fax").value.match(faxreg)==null)
	   	    {
	   	    	document.getElementById("faxerror").innerHTML="Invalid fax number format";
	   	     }

	    

	   // var website = /(ftp|http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/;
		  var website= /^[a-zA-Z0-9]+[a-zA-Z0-9.-]+\.[a-zA-Z]{2,3}$/;
	    if(document.getElementById("inp_website").value=="")	
		{
		document.getElementById("websiteerror").innerHTML="Required field should not be empty";
		error="true";
		}

	    else if(document.getElementById("inp_website").value.match(website)==null)
	    {
	    	document.getElementById("websiteerror").innerHTML="Invalid website format";
	    	error="true";
	    }
	    else
	    	{
	    	document.getElementById("websiteerror").innerHTML="";
	    	}
	

	    if(phone =="")
		  {
		  document.getElementById("phoneerror").innerHTML="Required field should not be empty";
	    	error="true";
		  }
	  
	  else if(phone.match(mobile)){  
		  if((phone == "0000000000") || (phone == "1111111111"))
		   {
		   document.getElementById("phoneerror").innerHTML="Invalid number";
	    	error="true";
			}
		  else
		   {
		   document.getElementById("phoneerror").innerHTML="";
		   }
	  }
	  else{
		  document.getElementById("phoneerror").innerHTML="Field should contain 10 digits";
	    	error="true";
	  }
  	

	    if(error == "true")
	    	{
		return false; 	 	
		}
		
		
	}
	</script>

<script type="text/javascript">
       function validate(event) {
          
           var regex = new RegExp("^[0-9]+$");
           var key = String.fromCharCode(event.charCode ? event.which : event.charCode);
           if (!regex.test(key)) {
             // document.getElementById("cmaerr").innerHTML="enter numerics or decimals only";
               event.preventDefault();
               return false;
           }
       }       
    </script>
  
   <script>
 
    function onlyAlphabets(e, t) {
        try {
            if (window.event) {
                var charCode = window.event.keyCode;
            }
            else if (e) {
                var charCode = e.which;
            }
            else { return true; }
            if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123)|| (charCode==32))
                return true;
            else
                return false;
        }
        catch (err) {
            alert(err.Description);
        }
    }
    
    function onlyAlphabetsnumeric(e, t) {
        try {
            if (window.event) {
                var charCode = window.event.keyCode;
            }
            else if (e) {
                var charCode = e.which;
            }
            else { return true; }
            if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123)|| (charCode==32) || (charCode > 47 && charCode < 58))
                return true;
            else
                return false;
        }
        catch (err) {
            alert(err.Description);
        }
    }
    
    </script>  
  
</body>
</html>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br><br>
<jsp:include page="footer.jsp"></jsp:include>
                
