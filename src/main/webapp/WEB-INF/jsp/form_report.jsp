<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="header.jsp"></jsp:include>

<link rel="stylesheet" href="resources/css/jquery-ui.css"
	type="text/css" />
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/jquery-ui.js"></script>

<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table" >
	<tr>
		<td>
			<div>
				<ul class="horizmenu" style=" float:left;margin-left:204px;">

				        <li  style=" float:left;margin-right:10px;text-transform:uppercase;">
								<a href="addform" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									Add Form
									
								</a>
							</li>
				            <li  style=" float:left;margin-right:10px;text-transform:uppercase;">
								<a href="view_form" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									View Form
									
								</a>
							</li>
							
							   <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
                <a href="view_formdetails" class="<c:choose>
                <c:when test="${menu=='document'}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
                  <span>View Revisions</span>
                </a>
              </li>
				            <li  style=" float:left;margin-right:10px;text-transform:uppercase;">
								<a href="form_report" class="<c:choose>
								<c:when test="${menu=='document'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									Reports
									
								</a>
							</li>
							 
				</ul>
			</div></td>
	</tr>
	<tr>
		<c:if test="${success==true}">
			<tr>
				<td valign="top" align="left" style="padding: 5px 0 10px 0;">&nbsp;
					<div id="success_statusbar" class="status success">
						<p class="closestatus">
							<a title="Close" href="maintenance_list">x</a>
						</p>
						<p>
							<img alt="Success" src="resources/images/icons/icon_success.png"><span>Success!</span>.
						</p>
					</div>
			</tr>
		</c:if>
	</tr>
<tr><td>
<table cellpadding="0" cellspacing="0"style="height:720px;" border="0" width="98%" class="margin_table">
	<tr>
		<td valign="top" align="left">
				<div class="headings altheading">
					<h2>Form Details Reports</h2>
				</div>
				<div class="contentbox">
					<form method="post" action="generate_doc_form">
						<table cellpadding="0"  cellspacing="0" border="0" width="100%">
							<tr class="row2">
								<td valign="middle" align="right" class="input_txt" width="30%">
									Select Form List by Process :</td>
									<!-- <td valign="top" align="left" class="input_txt" width="100%">
									<select name="type_of_form" class="input_cmbbx_big"
									onchange="toggle2(this.value)">
										<option value="human_resources">Human Resources (FHR-XX)</option>
										<option value="engineering">Engineering (FEN-XX)</option>
								   </select> -->
								
               <td valign="top" align="left" class="input_txt" >
               
               <select name="process" id="id_inpprocess"  class="input_txtbx" style="width:200px;">
               <option value="">--Select--</option>
             <c:forEach items="${processForm.processes}" var="processes" varStatus="true">
                <option value="${processes.process_name}">${processes.process_name}</option>
               </c:forEach>
                
               
               </select><br><span id="id_inpprocesserror" style="color:red"></span>
               <span id="report_error" style="color:red"></span>
								</td>
								
							</tr>
							<tr class="row2">
								<td valign="middle" align="right" class="input_txt" width="30%">
									Select Report Type :</td>
								<td valign="top" align="left" class="input_txt" width="100%">
									<input type="radio" onchange="toggle3(this.value)" name="report_type" value="0" id="id_type_standard" checked/>Standard Report&nbsp;&nbsp;&nbsp;
								<input type="radio" onchange="toggle3(this.value)" name="report_type" value="1" id="id_type_userdefined"/>User Defined Report<br/>
							
								</td>
								
							</tr>
						</table>
						
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
						
						
							<!-- <tr class="row2">
								<td valign="middle" align="right" class="input_txt" width="30%">
									Select Report Type:</td>
								<td valign="top" align="left" class="input_txt" width="50%">
									<input type="radio" name="report_type" value="0" id="id_type_standard" checked/>Standard Report&nbsp;&nbsp;&nbsp;
								<input type="radio" name="report_type" value="1" id="id_type_userdefined"/>User Defined Report<br/>
							
								</td>
								
							</tr> -->
							<tr class="row1" id="userdefined_name" style="display:none;">
								<td valign="middle" align="right" class="input_txt" width="30%">
									Name to appear on the Report :</td>
								<td valign="top" align="left" class="input_txt" width="50%">
									<input type="text" name="document_name" id="report_title"class="input_txtbx" value=""/>
								</td>
								
							</tr>
							<tr class="row2" id="userdefined_fields" style="display:none;">
								<td valign="top" align="right" style="margin-top:2px;" class="input_txt" width="30%">
									Select Fields Required on the Report :
									<br> <span id="userdefineerror" style="color:red"></span></td>
								<td valign="top" align="left" class="input_txt" width="100%">
								<table cellpadding="0" cellspacing="0" border="0" width="100%">
								<tr>
								<tr>
								<td><input type="checkbox" id="select_all"/>Select All</td>
								</tr>
								
								<td><input type="checkbox" name="report_field[]" value="location" id="1"/>Location</td>
								<td><input type="checkbox" name="report_field[]" value="form_or_rec_id" id="2"/>Form/Rec Id</td>
					      		<td><input type="checkbox" name="report_field[]" value="revision_id" id="14"/>Revision No</td>
					      		</tr>
					      		<tr>
								<td><input type="checkbox" name="report_field[]" value="responsibility" id="3"/>Responsibility</td>
								<td><input type="checkbox" name="report_field[]" value="form_or_rec_title" id="4"/>Form/Rec Title</td>
								<td><input type="checkbox" name="report_field[]" value="process" id="5"/>Process</td>
					      		</tr>
					      		<tr>
								<td><input type="checkbox" name="report_field[]" value="media_type" id="6"/>Media Type</td>
								<td><input type="checkbox" name="report_field[]" value="retention_time" id="7"/>Retention Time</td>
								<td><input type="checkbox" name="report_field[]" value="form" id="8"/>Form</td>
					      		</tr>
					      		<tr>
								<td><input type="checkbox" name="report_field[]" value="effective_date" id="9"/>Effective Date</td>
								<td><input type="checkbox" name="report_field[]" value="document_id" id="10"/>Document Id</td>
								<td><input type="checkbox" name="report_field[]" value="approver1" id="11"/>Approver 1</td>
					      		</tr>
					      		<tr>
								<td><input type="checkbox" name="report_field[]" value="issuer" id="12"/>Issuer</td>
								<!-- <td><input type="checkbox" name="report_field[]" value="status" id="id_field_status"/>Status</td> -->
								<td><input type="checkbox" name="report_field[]" value="comments" id="13"/>Comments</td>
								
					      		</tr>
								</table>
								
								</td>
								
							</tr>
							<tr >
			<td  align="left" width="13%" align="left"></td>
             <td  colspan="2" align="left" width="30%">
             <table><tr style="padding:10px;"><td style="padding:10px;" align="left"><input type="submit" id="export" onclick="return validate();" name="export" value="Generate" class="submit_btn1">
             </td><td style="padding:10px;" align="left">
              <input type="reset" id="reset_export" name="reset_export" onclick="toggle3(0)" value="Reset" class="submit_btn1"></td>
            
             </tr>
            
             </table>
             </td>
             </tr>
             
             </table>
             </form></div>
             </td>
             </tr>
             </table>
             
             	
           <table  width=300 height=30>
			<tr height=30><td></td></tr></table>
							
	
<script type="text/javascript">
function validate()
{
	var error ="";
	
	var id_type_userdefined = document.getElementById('id_type_userdefined').checked;
	var id_inpprocess = document.getElementById('id_inpprocess').value
	var a1 = document.getElementById('1').checked;
	var a2 = document.getElementById('2').checked;
	var a3 = document.getElementById('3').checked;
	var a4 = document.getElementById('4').checked;
	var a5 = document.getElementById('5').checked;
	var a6 = document.getElementById('6').checked;
	var a7 = document.getElementById('7').checked;
	var a8 = document.getElementById('8').checked;
	var a9 = document.getElementById('9').checked;
	var a10 = document.getElementById('10').checked;
	var a11 = document.getElementById('11').checked;
	var a12 = document.getElementById('12').checked;
	var a13 = document.getElementById('13').checked;
	var a14 = document.getElementById('14').checked;
	if(id_inpprocess == "")
	{
		document.getElementById("id_inpprocesserror").innerHTML="Required field should not be empty";
		error = "true";
	}
	else
		{
		document.getElementById("id_inpprocesserror").innerHTML="";
		}
	if(id_type_userdefined)
		{
		if(a1 || a2|| a3|| a4|| a5|| a6|| a7|| a8|| a9|| a10|| a11|| a12|| a13|| a14)
			{
			document.getElementById("userdefineerror").innerHTML="";
			}
		else{
			document.getElementById("userdefineerror").innerHTML="Please Select atleast One";
			error = "true";
		}
	}
	else
	{
		document.getElementById("userdefineerror").innerHTML="";
		}
	
	if(error == "true")
		{
		return false;
		}
	
	
	var name = $('#id_inpprocess').val();
	
		 /*   var education = $('#education').val();	 */   
		  $.ajax({  
		    type: "POST",  
		    url: "/QMS_App/ajaxformreportpdferror",  
		    data: "process=" + name,  
		    success: function(response){  
		      // we have the response  
		    
		    $('#report_error').html(response);
		  
		  
		     
		   err=response;
		    
		      if(response=='')
		    	  {
		    	 
		    	
		    	  document.forms[0].method = "POST";
		    	  document.forms[0].action = "generate_doc_form";
		    	  document.forms[0].submit();
		    	
		    	  return true;
		    	 
		    	  }
		     
		      /*     $('#education').val(''); */
		    },  
		    error: function(e){  
		     /*  alert('Error: ' + e);   */
		    }
		   
		  });  
	 return false;
}
</script>
						
<script type="text/javascript">
/* function toggle2(value){
    var e3=document.getElementById("document_type_table");
if(value=="document_list_by_type")
    {
	
	e3.style.display="table-row";
	
    }
else
    {
	
	e3.style.display="none";
  
    }
    
}
 */

function toggle3(value){
	
    var e1=document.getElementById("userdefined_name");
    var e2=document.getElementById("userdefined_fields");
if(value==1)
    {
	document.getElementById('select_all').checked = false;
	document.getElementById('1').checked = false;
	document.getElementById('2').checked = false;
	document.getElementById('3').checked = false;
	document.getElementById('4').checked = false;
	document.getElementById('5').checked = false;
	document.getElementById('6').checked = false;
	document.getElementById('7').checked = false;
	document.getElementById('8').checked = false;
	document.getElementById('9').checked = false;
	document.getElementById('10').checked = false;
	document.getElementById('11').checked = false;
	document.getElementById('12').checked = false;
	document.getElementById('13').checked = false;
	document.getElementById('14').checked = false;
	document.getElementById('report_title').value = "";
	document.getElementById("userdefineerror").innerHTML="";
	e1.style.display="table-row";
	e2.style.display="table-row";
    }
if(value==0)
    {
	
	e1.style.display="none";
	e2.style.display="none";
  
    }
    
}
 

 $('#select_all').change(function() {
	    var checkboxes = $(this).closest('form').find(':checkbox');

	    if($(this).is(':checked')) {
	        checkboxes.attr('checked','checked');
	    } else {
	        checkboxes.removeAttr('checked');
	    }
	   
	});
 
 </script>
			
 <jsp:include page="footer.jsp"></jsp:include> 			
 