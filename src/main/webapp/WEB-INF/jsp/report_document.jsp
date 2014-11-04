<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="header.jsp"></jsp:include>
<script src="/QMS_App/resources/js/jquery.js"></script>
<link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" />
<link rel="stylesheet" href="http://s.codepen.io/assets/reset/normalize.css" type="text/css" />
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/jquery-ui.js"></script>  	
<script src="resources/js/jquery.min.js"></script>

<script src="resources/js/jquery-1.7.2.min.js"></script>

<script src="resources/js/jquery-ui.js"></script>

<script src="resources/js/modal.js"></script>

<script src="resources/js/popover.js"></script>

<script src="resources/js/transition.js"></script>

<link rel="stylesheet" href="resources/css/jquery-ui.css"
	type="text/css" />
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/jquery-ui.js"></script>

<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table" >
	<tr>
		<td>
			<div>
				<ul class="horizmenu" style=" float:left;margin-left:205px;">

					<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="adddocument" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									Add Document
									
								</a>
							</li>
						
				          <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="viewdocuments" class="<c:choose>
								<c:when test="${menu=='document'}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									View Document
									
								</a>
							</li>
				            <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="document_report" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									Document report
									
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
<table cellpadding="0" cellspacing="0" border="0" width="98%"
	class="margin_table">
	<tr>
		<td valign="top" align="left">
				<div class="headings altheading">
					<h2 style="padding-left: 50px">Document Details Reports</h2>
				</div>
				<div class="contentbox">
					<form method="post" id="form"action="generate_doc_report">
					<input type="hidden" id="errormsg">	<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr class="row2">
								<td valign="middle" align="left" class="input_txt" width="25%" style="padding-left: 55px">
									Select Report :</td>
								<td valign="top" align="left" class="input_txt" width="100%">
									<select name="type_of_report" class="dropdown" id="reporttype"
									onchange="toggle2(this.value)">
										<option value="document_list_by_type">Document List by type</option>
										<option value="external_document">External Document</option>
								   </select>
								</td>
								
							</tr>
							<tr class="row1" id="document_type_table">
								<!-- <td valign="middle" align="right" class="input_txt" width="30%">
								Select Document Type :
								</td>
								<td valign="middle" align="left" class="input_txt" width="100%">
								<input type="radio" name="doc_type" value="0" id="id_type_manual" checked/>Manual<br/>
								<input type="radio" name="doc_type" value="1" id="id_type_procedure"/>Procedure<br/>
								<input type="radio"  name="doc_type" value="2" id="id_type_workinstruction"/>Work-Instruction<br/>
								<input type="radio"  name="doc_type" value="3" id="id_type_standard"/>Standard<br/>
								<input type="radio"  name="doc_type" value="4" id="id_type_gov_regulation"/>Goverment Regulation<br/>
								<input type="radio" name="doc_type" value="5" id="id_type_manual"/>Specification<br/>
							</td> -->
							 <td valign="middle" align="left" class="input_txt" width="25%" style="padding-left: 55px">
								Select Document Type :
								</td>
              <td valign="top" align="left" class="input_txt" width="25%">
              <select name="document_type" id="documenttype" class="input_txtbx">
              <option value="">--Select--</option>
                <c:forEach items="${documentTypeForm.documentTypes}" var="documenttype" varStatus="status">
        				       <option value="${documenttype.document_type}">${documenttype.document_type}</option>
			                  </c:forEach> </select>
			                  <br><span id="report_error"style="color:red"><span id="reporterror" style="color:red"></span>
			                  </span>
               </td>
               
							</tr>
							<tr class="row2">
								<td valign="middle" align="left" class="input_txt" width="25%" style="padding-left: 55px">
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
								<td valign="middle" align="left" class="input_txt" width="25%" style="padding-left: 55px">
									Name to appear on the Report :</td>
								<td valign="top" align="left" class="input_txt" width="50%" >
									<input type="text" name="document_name" class="input_txtbx" id="report_title"value=""/>
								</td>
								
							</tr>
							<tr class="row2" id="userdefined_fields" style="display:none;">
								<td valign="top" align="left" style="margin-top:2px;padding-left: 55px;" class="input_txt" width="25%">
									Select Fields Required on the Report :
									<br><span id="checkerror" style="color:red"></span>
									</td>
								<td valign="top" align="left" class="input_txt" width="100%">
								<table cellpadding="0" cellspacing="0" border="0" width="100%" style="margin-left:-10px;">
								<tr>
								<td><input type="checkbox" id="select_all"/>Select All</td>
								</tr>
								<tr>
								<td><input type="checkbox" name="report_field[]" value="document_id" id="1"/>Document ID</td>
								<td><input type="checkbox" name="report_field[]" value="document_title" id="2"/>Document Title</td>
								<td><input type="checkbox" name="report_field[]" value="document_type" id="3"/>Document Type</td>
					      		</tr>
					      		<tr>
								<td><input type="checkbox" name="report_field[]" value="media_type" id="4"/>Media Type</td>
								<td><input type="checkbox" name="report_field[]" value="location" id="5"/>Location(s)</td>
								<td><input type="checkbox" name="report_field[]" value="process" id="6"/>Process</td>
					      		</tr>
					      		<tr>
								<td><input type="checkbox" name="report_field[]" value="external" id="7"/>Is an External Document</td>
								<td><input type="checkbox" name="report_field[]" value="issuer" id="8"/>Issuer</td>
								<td><input type="checkbox" name="report_field[]" value="revision_level" id="9"/>Revision Level</td>
					      		</tr>
					      		<tr>
								<td><input type="checkbox" name="report_field[]" value="date" id="10"/>Date</td>
								<td><input type="checkbox" name="report_field[]" value="approver1" id="11"/>Approver 1</td>
								<td><input type="checkbox" name="report_field[]" value="approver2" id="12"/>Approver 2</td>
					      		</tr>
					      		<tr>
								<td><input type="checkbox" name="report_field[]" value="approver3" id="13"/>Approver 3</td>
								<td><input type="checkbox" name="report_field[]" value="status" id="14"/>Status</td>
								<td><input type="checkbox" name="report_field[]" value="comments" id="15"/>Comment/Changes</td>
								<td><input type="checkbox" name="report_field[]" value="revision_id" id="15"/>Revision ID</td>
					      		</tr>
								</table>
								
								</td>
								
							</tr>
							<tr >
				<td  align="left" width="10%" align="left"></td>
             <td align="left" width="30%">
             <table><tr style="padding:10px;"><td style="padding:10px;"><input type="submit" id="export"  name="export" value="Generate" onclick="return Ajaxreportcheck();" class="submit_btn1">
             </td><td style="padding:10px;">
              <input type="reset" id="reset_export" onclick="toggle3(0)" name="reset_export" value="Reset" class="submit_btn1"></td>
            
             </tr></table>
            
           
             </tr>
            
							
						</table>
						</form>
					</div>
				</td></tr>
</table></td></tr></table>
<table  width=300 height=140>
			<tr height=30><td></td></tr></table>
<script type="text/javascript">
function Ajaxreportcheck(){
	var reporttype = document.getElementById('reporttype').value;
	if(reporttype == "external_document")
	{
		  document.forms[0].method = "POST";
    	  document.forms[0].action = "generate_doc_report";
    	  document.forms[0].submit();
	}
		
	
		  var reporttype = document.getElementById('reporttype').value;
		  var documenttype = document.getElementById('documenttype').value;
		  
		  var error ="";
		  var id_type_userdefined = document.getElementById('id_type_userdefined').checked;
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
		  var a15 = document.getElementById('15').checked;
		  document.getElementById('reporterror').innerHTML = "";
		  document.getElementById('checkerror').innerHTML = "";
		  if(reporttype == "document_list_by_type")
		  {
		 	 if(documenttype == "")
		 	{
		 		 document.getElementById('reporterror').innerHTML ="Required field should not be empty";
		 		
		 		error = "true";
		 	}
		 	 else
		 		 {
		 		 document.getElementById('reporterror').innerHTML = "";
		 		 }
		  }
		  if(id_type_userdefined)
		  {
		 	 if(a1 || a2 || a3 || a4 || a5 || a6 || a7 || a8 || a9 || a10 || a11 || a12 || a13 || a14 || a15)
		 		{
		 		 document.getElementById('checkerror').innerHTML = "";
		 		}
		 	 else
		 		  {
		 		
		 		 document.getElementById('checkerror').innerHTML = "Please Select Atleast One";
		 		error = "true";
		 		  }
		  }
		  
		  if(error == "true")
			  {
			  return false;
			  }
		  var err;
		  var name = $('#documenttype').val();
		  document.getElementById("errormsg").value="";
			 /*   var education = $('#education').val();	 */   
			  $.ajax({  
			    type: "POST",  
			    url: "/QMS_App/ajaxreportpdferror",  
			    data: "document_type=" + name,  
			    success: function(response){  
			      // we have the response  
			    
			    $('#report_error').html(response);
			    document.getElementById("errormsg").value="";
			    document.getElementById("errormsg").value=response; 
			  
			     
			   err=response;
			    
			      if(response=='')
			    	  {
			    	 
			    	
			    	  document.forms[0].method = "POST";
			    	  document.forms[0].action = "generate_doc_report";
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
jQuery("#button").click(function()
		{   
		    for(var i = 0;i < data.length; i++)
		    {
		        updateUser(data[i]).done(function(result) {
		                    alert(result); //prints 'undefined'
		        });

		    }
		});

function validations()
{ 
	Ajaxreportcheck();
	
	
	alert("asdas12");
	if(response)
		{
		return false;
		}
	}



function validation()
{
 var reporttype = document.getElementById('reporttype').value;
 var documenttype = document.getElementById('documenttype').value;
 
 var error ="";
 var id_type_userdefined = document.getElementById('id_type_userdefined').checked;
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
 var a15 = document.getElementById('15').checked;
 document.getElementById('reporterror').innerHTML = "";
 document.getElementById('checkerror').innerHTML = "";
 if(reporttype == "document_list_by_type")
 {
	 if(documenttype == "")
	{
		 document.getElementById('reporterror').innerHTML ="Please Select One";
		 error = "true";
	}
	 else
		 {
		 document.getElementById('reporterror').innerHTML = "";
		 }
 }
 if(id_type_userdefined)
 {
	 if(a1 || a2 || a3 || a4 || a5 || a6 || a7 || a8 || a9 || a10 || a11 || a12 || a13 || a14 || a15)
		{
		 document.getElementById('checkerror').innerHTML = "";
		}
	 else
		  {
		 document.getElementById('checkerror').innerHTML = "Please Select Atleast One";
		 error = "true";
		  }
 }
 if(error == "true")
	 {
	 return false;
	 }
	
}

function toggle2(value){
    var e3=document.getElementById("document_type_table");
if(value=="document_list_by_type")
    {
	document.getElementById('documenttype').value ="";
	e3.style.display="table-row";
	
    }
else
    {
	
	e3.style.display="none";
  
    }
    
}
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
	document.getElementById('15').checked = false;
	document.getElementById('report_title').value = "";
	 document.getElementById('checkerror').innerHTML = "";
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

 <table  width=300 height=30>
			<tr height=30><td></td></tr></table>
			
<jsp:include page="footer.jsp"></jsp:include>		
