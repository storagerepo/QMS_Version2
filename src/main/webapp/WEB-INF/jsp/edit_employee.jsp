 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" />
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/jquery-1.7.2.min.js"></script>
<script src="resources/js/jquery-ui.js"></script>
<script src="resources/js/modal.js"></script>
<script src="resources/js/popover.js"></script>
<script src="resources/js/transition.js"></script>

<script>

$(function() {
	var date = $('#datepicker').datepicker({ dateFormat: 'yy-mm-dd' }).val();   
        });
 

 $(function() {
	 var date = $('#datepicker1').datepicker({ dateFormat: 'yy-mm-dd' }).val(); 
        });
 

 $(function() {
	 var date = $('#datepicker2').datepicker({ dateFormat: 'yy-mm-dd' }).val(); 
         });
 
 $(function() {
	 var date = $('#datepicker3').datepicker({ dateFormat: 'yy-mm-dd' }).val(); 
     
         });
 
</script>
<form method="post" enctype="multipart/form-data" action="updateemployee">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
        <td>
        <div>
    <ul class="horizmenu" style=" float:left;margin-left:190px; margin-top:8px;">
  <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addemployee" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Add Employees</span>
									
								</a>
							</li>
						
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="viewemployees" class="<c:choose>
								<c:when test="${menu=='employee'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									<span>View Employees</span>
									
								</a>
							</li>
							
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="employee_report" class="<c:choose>
								<c:when test="${menu=='employees'}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Employee Report</span>
									
								</a>
							</li>
						
				           </ul>					
  </div>
        </td>
      </tr>
      <tr>
        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2>Update Employee Details</h2>
            </div>
            <div class="contentbox">
            <c:set value="${employeeForm.employees[0]}" var="employee"/>
                 <table cellpadding="0" cellspacing="0" border="0" width="100%" style="border:#993300  2px solid; padding:15px; margin-bottom:15px;">
					<tr class="row2">
                  <td valign="top" align="left" class="input_txt" width="20%"><label>ID :</label></td>
                  <td valign="top" align="left" class="input_txt" width="20%"><input type="text" class="input_txtbx" name="employee_id" readonly="readonly" value="<c:out value="${employee.employee_id }"/>"/><%-- <c:out value="${employee.employee_id }"/> --%><br/><span style="color: red;" ></span></td>
                <td valign="top" align="left" class="input_txt" width="20%">Qualified By :</td>
                  <td valign="top" align="left" class="input_txt" width="20%">
                  <select	name="qualified_by" class="input_txtbx">
                  					
                  										<option
															<c:if test="${employee.qualified_by eq 'Education'}"><c:out value="Selected"/></c:if>
															value="Education">Education</option>
														<option
															<c:if test="${employee.qualified_by eq 'Experience'}"><c:out value="Selected"/></c:if>
															value="Experience">Experience</option>
														<option
															<c:if test="${employee.qualified_by eq 'Training'}"><c:out value="Selected"/></c:if>
															value="Training">Training</option>
														
															</select><span style="color: red;" ><form:errors path="Employee.qualified_by"></form:errors></span></td>
                
                </tr>
                <tr class="row1">
                  <td valign="top" align="left" class="input_txt" width="20%">Name :</td>
                  <td valign="top" align="left" class="input_txt" width="20%"><input type="text" name="name" class="input_txtbx" maxlength="32" id="inp_name" onkeypress="return Alphabets(event,this);" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"  onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.name }" /><br><span style="color: red;" id="nameerror"><form:errors path="Employee.name"></form:errors></span></td>
                  <td valign="top" align="left" class="input_txt" width="20%">Type :</td>
                  <td valign="top" align="left" class="input_txt" width="20%">
                  <select	name="type_of_training" class="input_txtbx" id="type">

				                  									
                  										<option
															<c:if test="${employee.type_of_training eq 'Classroom'}"><c:out value="Selected"/></c:if>
															value="Classroom">Classroom</option>
														<option
															<c:if test="${employee.type_of_training eq 'Hands on'}"><c:out value="Selected"/></c:if>
															value="Hands on">Hands on</option>
														</select></td>
                
                </tr>
		<tr class="row2">
                  <td valign="top" align="left" class="input_txt" width="20%">Job Title :</td>
               	<td valign="top" align="left" class="input_txt" width="20%">
               	<select class="input_txtbx" name="job_title" id="org_id">
							    <option>-- Select Job title --</option>
        				    <option value="${employee.job_title }" selected>${employee.job_title }</option>
			                <c:forEach items="${jobForm.jobs}" var="Jobs" varStatus="status">
        				          <option value="${Jobs.job_title}">${Jobs.job_title}</option>
			                  </c:forEach>
			                 </select>
			                 
               	<td valign="top" align="left" class="input_txt" width="20%"> Trainer :</td>
                  <td valign="top" align="left" class="input_txt" width="20%"><input type="text" name="trainer" class="input_txtbx" maxlength="32" id="trainer" onkeypress="return Alphabets(event,this);" onmouseover="showTooltip('tooltip_id','inp_id3');" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"  onmouseout="hideTooltip('tooltip_id');" value="${employee.trainer }" /><br><span style="color: red;" id="trainererror" ><form:errors path="Employee.trainer"></form:errors></span></td>
                </tr>
                
				<tr class="row1">
				 <td valign="top" align="left" class="input_txt" width="20%">Working as :</td>
                  <td valign="top" align="left" class="input_txt" width="20%">
                  
                   <input type="checkbox" name="process_owner" value="yes" onclick="toggle1()" id="processowner"<c:if test="${employee.process_owner=='yes'}"><c:out value="checked=checked"/></c:if>>&nbsp;Process Owner                 
                   <input type="checkbox" name="document_control" value="yes" onclick="toggle2()" id="documentcontrol"<c:if test="${employee.document_control=='yes'}"><c:out value="checked=checked"/></c:if>>&nbsp;Document Control<br/><br/>
                   <input type="checkbox" name="management" value="yes" onclick="toggle3()"  id="managementrep"/<c:if test="${employee.management=='yes'}"><c:out value="checked=checked"/></c:if>>&nbsp;Management Representative<br/>
                  <span id="workingerror" style="color: red;" ></span>
                   <td valign="top" align="left" class="input_txt" width="20%">Training Effectiveness Notes :</td>
                 <td valign="top" class="input_txt" width="20%"><textarea class="input_txtbx" id="inp_job_title" name="training_effectiveness_notes" onmouseover="showTooltip('tooltip_id','inp_id3');"  onmouseout="hideTooltip('tooltip_id');"  style="height: 75px;"><c:out value="${employee.training_effectiveness_notes  }"/> </textarea><br><span style="color: red;" id="inp_job_titleerror" ><form:errors path="Employee.training_effectiveness_notes"></form:errors></span></td>

                  
                  </tr>
                  <tr class="row2">
                  <td valign="top" align="left" class="input_txt" width="20%">Date Hired :</td>
                  <td valign="top" align="left" class="input_txt" width="20%">
                  <input type="text" name="date_hired" class="input_txtbx" id="datepicker" onmouseover="showTooltip('tooltip_id','inp_id3');"  onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"  onmouseout="hideTooltip('tooltip_id');" value="${employee.date_hired }" /><br><span style="color: red;" id="datepickererror" ><form:errors path="Employee.date_hired"></form:errors></span></td>
                <td valign="top" align="left" class="input_txt" width="20%">Due Date :</td>
                  <td valign="top" align="left" class="input_txt" width="20%">
                  <input type="text" name="training_due_date" class="input_txtbx" id="datepicker1" onmouseover="showTooltip('tooltip_id','inp_id3');" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"  onmouseout="hideTooltip('tooltip_id');" value="${employee.training_due_date }" /><br><span id="datepicker1error" style="color: red;" ><form:errors path="Employee.training_due_date"></form:errors></span></td>
                </tr>
                <tr class="row1">
                  <td valign="top" align="left" class="input_txt" width="20%">Attachments :</td>
                  
                  <td valign="top" align="left" class="input_txt" width="20%">
                  <span style= "color:#009900;"><c:out value="${employee.attachment_name}"></c:out></span><br/>
                    <input type="hidden" value="${employee.attachment_name}" id="image"/>
                  <input type="file" name="attachments" class="input_txt" id="id_attachments" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" ><br>
                  <span id="imageerror" style="color:red"></span></td>
                  
                   
                   <td valign="top" align="left" class="input_txt" width="20%">Completion Date :</td>
                  <td valign="top" align="left" class="input_txt" width="20%">
                  <input type="text" name="training_completion_date" class="input_txtbx"  onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"  id="datepicker2" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.training_completion_date }" /><br><span id="datepicker2error" style="color: red;" ><form:errors path="Employee.training_completion_date"></form:errors></span>
                  </td>
                </tr>
                 <tr class="row2">
                  <td valign="top" align="left" class="input_txt" width="20%">Process :</td>
                  <td valign="top" align="left" class="input_txt" width="20%"><input type="text" name="process" class="input_txtbx" maxlength="32" id="inp_process" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"   onkeypress="return Alphabets(event,this);" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.process}" /><br><span id="processerror" style="color: red;" ><form:errors path="Employee.process"></form:errors></span></td>
                  <td valign="top" align="left" class="input_txt" width="20%">Process Name :</td>
                  <td valign="top" align="left" class="input_txt" width="20%"><input type="text" name="process_name" class="input_txtbx" maxlength="32" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"  id="inp_process_name" onkeypress="return Alphabets(event,this);" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.process_name}" /><br><span id="processnameerror" style="color: red;" ><form:errors path="Employee.process_name"></form:errors></span></td>
                
                </tr>
                
                <tr class="row2">
                  <td valign="top" align="left" class="input_txt" width="20%">Document Control :</td>
                  <td valign="top" align="left" class="input_txt" width="20%">
                  <input type="radio" name="doc_control" value="yes"  class="input_txt"   <c:if test="${employee.doc_control=='yes'}"><c:out value="Checked=checked"/></c:if>>Yes&nbsp;&nbsp;&nbsp;
				  <input type="radio" name="doc_control" value="no"  class="input_txt"  <c:if test="${employee.doc_control=='no'}"><c:out value="Checked=checked"/></c:if>>No&nbsp;&nbsp;&nbsp;
				
                  <span style="color: red;" ><form:errors path="Employee.doc_control"></form:errors></span></td>
                  <td valign="top" align="left" class="input_txt" width="20%">Management Rep :</td>
                  <td valign="top" align="left" class="input_txt" width="20%">
                
                   <input type="radio" name="management_rep" value="yes"  class="input_txt"   <c:if test="${employee.management_rep=='yes'}"><c:out value="Checked=checked"/></c:if>>Yes&nbsp;&nbsp;&nbsp;
				  <input type="radio" name="management_rep" value="no"  class="input_txt"  <c:if test="${employee.management_rep=='no'}"><c:out value="Checked=checked"/></c:if>>No&nbsp;&nbsp;&nbsp;
				
                  <span style="color: red;" ><form:errors path="Employee.management_rep"></form:errors></span></td>
                
                </tr>
                <tr class="row1">
                  <td valign="top" align="left" class="input_txt" width="20%">Functions Needs :</td>
                  <td valign="top" align="left" class="input_txt" width="20%"><input type="text" name="list_of_functions_needes" maxlength="32" class="input_txtbx" id="inp_list_of_functions_needes" onkeypress="return Alphabets(event,this);" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"  onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.list_of_functions_needes}" /><br><span id="functionneedserror" style="color: red;" ><form:errors path="Employee.list_of_functions_needes"></form:errors></span></td>
                  <td valign="top" align="left" class="input_txt" width="20%">Review Due Date :</td>
                  <td valign="top" align="left" class="input_txt" width="20%"><input type="text" name="training_effectiveness_review_due_date" class="input_txtbx" id="datepicker3" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.training_effectiveness_review_due_date }"  onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"  /><br><span id="datepicker3error" style="color: red;" ><form:errors path="Employee.training_effectiveness_review_due_date"></form:errors></span></td>
                  
                </tr>
                <tr class="row2">
                  <td valign="top" align="left" class="input_txt" width="20%">Documented In :</td>
                  <td valign="top" align="left" class="input_txt" width="20%"><input type="text" name="documented_in" maxlength="32" class="input_txtbx"  id="documentedin" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.documented_in}" /><br><span style="color: red;" id="documentedinerror"><form:errors path="Employee.documented_in"></form:errors></span></td>
                                <%--  <td valign="top" align="left" class="input_txt" width="20%"><input type="text" name="training_effectiveness_notes" class="input_txtbx" id="inp_email_address" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.training_effectiveness_notes }" /><br><span style="color: red;" ><form:errors path="Employee.training_effectiveness_notes"></form:errors></span></td>
                 --%>
                 
                 </tr>    
                  <!-- <tr class="row1">
                  <td valign="middle"  align="left" class="input_txt" width="20%">&nbsp;</td>
                  <td></td>
                 <td valign="middle" align="left" class="input_txt" width="20%"><input type="submit" value="Update" onclick="return onsubmitvalidate();" class="submit_btn1"></td>
                </tr> -->
                  <tr class="row1">
                  <td valign="bottom" colspan="4"align="right" style="padding-right: 55px">&nbsp;<input type="submit" value="Update" onclick="return onsubmitvalidate();"class="submit_btn1"></td>
                  
                </tr>
                 <!-- <tr class="row1">
                  <td valign="top" align="left">&nbsp;</td>
                  <td></td>
                  <td valign="top" align="center"><input type="submit" value="Update" onclick="return onsubmitvalidate();" class="submit_btn1"></td>
                </tr> -->
              </table>
              
            </div>
          </div></td>
      </tr>
      </table>
      </div>
      
</form>

<script type="text/javascript">
function toggle2(value){
  
    var e = document.getElementById('location_label');
    var e1 = document.getElementById('file_upload_label');
    var e2=document.getElementById('location_text');
    var e3=document.getElementById('id_file');
 if(value==0)
    {
	e.style.display="block";
	e1.style.display="none";
	e2.style.display="block";
	e3.style.display="none";
  
    }

    
}
</script>

<script>
function change_file(){
	document.getElementById("id_file").style.display="block";
	document.getElementById("file_name").style.display="none";
	
}
</script>

    <script language="javascript">
function toggle1()
{
 //	var management = document.getElementById('managementrep').checked;
 	//alert(management);
 	//if(management)
 	
 		//alert("You already checked Management Representative");
 	
 	var processown = 	document.getElementById('processowner').checked;
 	var documentcon = 	document.getElementById('documentcontrol').checked;
 	if(processown && documentcon )
 		{
 		
 		document.getElementById('managementrep').disabled = true;
 		
		}
 	else if(processown)
		{
 		
		document.getElementById('managementrep').disabled = true;
		
		}
 	else if(documentcon)
 		{
 		
 		document.getElementById('managementrep').disabled = true;
 		
 		}
 	else{
 		
 		document.getElementById('managementrep').disabled = false;
 	}
}
function toggle2()
{
 	
 	var documentcon = 	document.getElementById('documentcontrol').checked;
 	var processown = 	document.getElementById('processowner').checked;
	if(processown && documentcon )
		{
		document.getElementById('managementrep').disabled = true;
		
	}
	else if(documentcon)
	{
	document.getElementById('managementrep').disabled = true;
	
	}
	else if(processown)
		{
		document.getElementById('managementrep').disabled = true;
		}
 	else
 		document.getElementById('managementrep').disabled = false;
}
function toggle3()
{
 	
 	var management = 	document.getElementById('managementrep').checked;
 
 	if(management)
 		{
 		document.getElementById('processowner').disabled = true;
 		document.getElementById('documentcontrol').disabled = true;
 		
		}
 	else
 		{
 		document.getElementById('processowner').disabled = false;
 		document.getElementById('documentcontrol').disabled = false;
 		
 		}
}


</script>


<script>
$(function() {
	$("#inp_name").on("keypress", function(e) {
		if (e.which === 32 && !this.value.length)
			
	        e.preventDefault();
	});
	});	
$(function() {
	$("#trainer").on("keypress", function(e) {
		if (e.which === 32 && !this.value.length)
	        e.preventDefault();
	});
	});	
$(function() {
	$("#inp_job_title").on("keypress", function(e) {
		if (e.which === 32 && !this.value.length)
	        e.preventDefault();
	});
	});	
$(function() {
	$("#inp_process").on("keypress", function(e) {
		if (e.which === 32 && !this.value.length)
	        e.preventDefault();
	});
	});	
$(function() {
	$("#inp_process_name").on("keypress", function(e) {
		if (e.which === 32 && !this.value.length)
	        e.preventDefault();
	});
	});	
$(function() {
	$("#inp_list_of_functions_needes").on("keypress", function(e) {
		if (e.which === 32 && !this.value.length)
	        e.preventDefault();
	});
	});	
$(function() {
	$("#documentedin").on("keypress", function(e) {
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
function Alphabets(e, t) {
    try {
        if (window.event) {
            var charCode = window.event.keyCode;
        }
        else if (e) {
            var charCode = e.which;
        }
        else { return true; }
        if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123)|| (charCode == 32))
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
function onsubmitvalidate()
{

	var error="";
	
	
	var date = /^\d{4}-(0?[1-9]|1[012])-(0?[1-9]|[12][0-9]|3[01])$/;
	var datepick = document.getElementById("datepicker").value;
	var datepick1 = document.getElementById("datepicker1").value;
	var datepick2 = document.getElementById("datepicker2").value;
	var datepick3 = document.getElementById("datepicker3").value;
	var owner = document.getElementById('processowner').checked;
	var control = document.getElementById('documentcontrol').checked;
	var management = document.getElementById('managementrep').checked;
	var image = document.getElementById('image').value;
	
	 var name = document.getElementById('inp_name').value;
	 var process = document.getElementById('inp_process').value;
	  var fneeds = document.getElementById('inp_list_of_functions_needes').value;
	   var doc = document.getElementById('documentedin').value;
	    var job = document.getElementById('inp_job_title').value;
	   
	    var pname = document.getElementById('inp_process_name').value;
	    
	    var trainer = document.getElementById('trainer').value;
	    
	    
	
	 if(!owner && !control && !management)
	 {
	 document.getElementById("workingerror").innerHTML="Please select atleast one";
	 error="true";
	 }
 else
	 {
	 document.getElementById("workingerror").innerHTML="";
	 }
 

	 if(datepick == "")
	 {
	
	 document.getElementById("datepickererror").innerHTML="Required field should not be empty";
	 error="true";
	 
	 }
	 else if(datepick.match(date))
	 {
	 document.getElementById("datepickererror").innerHTML="";
	 }
	 else
	 {
	 document.getElementById("datepickererror").innerHTML="Invalid date";
	 error="true";
	 }
	 
	

	 if(datepick1 == "")
	 {
	 document.getElementById("datepicker1error").innerHTML="Required field should not be empty";
	 error="true";
	 
	 }
	 else if(datepick1.match(date))
	 {
		 
	 document.getElementById("datepicker1error").innerHTML="";
	 }
	 else
	 {
	 document.getElementById("datepicker1error").innerHTML="Invalid date";
	 error="true";
	 }
	 if(datepick2 == "")
	 {
	 document.getElementById("datepicker2error").innerHTML="Required field should not be empty";
	 error="true";
	 
	 }
	 else if(datepick2.match(date))
	 {
	 document.getElementById("datepicker2error").innerHTML="";
	 }
	 else
	 {
	 document.getElementById("datepicker2error").innerHTML="Invalid date";
	 error="true";
	 }

	 if(datepick3 == "")
	 {
	 document.getElementById("datepicker3error").innerHTML="Required field should not be empty";
	 error="true";
	 
	 }
	 else if(datepick3.match(date))
	 {
	 document.getElementById("datepicker3error").innerHTML="";
	 }
	 else
	 {
	 document.getElementById("datepicker3error").innerHTML="Invalid date";
	 error="true";
	 }

	  if(image == "" || image == "null")
	  {
	  document.getElementById("imageerror").innerHTML="Please upload a file";
		 error="true";
	  }
	else {
		
		  document.getElementById("imageerror").innerHTML="";
		}
	  
	if(document.getElementById("inp_name").value=="")
	{

		document.getElementById("nameerror").innerHTML="Required field should not be empty";	
		error="true";
		
	}
	else if(name.charAt(0) ==" ") 
	   {
	   document.getElementById("nameerror").innerHTML="Should not accept initial space";
	error="true";
		}
	
	else if((document.getElementById("inp_name").value.length < 4) || (document.getElementById("inp_name").value.length > 45))
		{
		
		document.getElementById("nameerror").innerHTML="Required field should  be of length 4 to 32";	
		error="true";
		}
	else{
		document.getElementById('nameerror').innerHTML="";
	}
	
	
	if(document.getElementById("trainer").value=="")
	{
		document.getElementById("trainererror").innerHTML="Required field should not be empty";	
		error="true";
		
	}
	else if((document.getElementById("trainer").value.length < 4) || (document.getElementById("trainer").value.length > 45))
		{
		
		document.getElementById("trainererror").innerHTML="Required field should be of length 4 to 32";	
		error="true";
		}
	else if(trainer.charAt(0) ==" ") 
	   {
	   document.getElementById("trainererror").innerHTML="Should not accept initial space";
	error="true";
		}
	else
		{
		document.getElementById("trainererror").innerHTML="";
		}
	
	if(document.getElementById("inp_job_title").value=="")
	{
		document.getElementById("inp_job_titleerror").innerHTML="Required field should not be empty";	
		error="true";
		
	}
	
	else if(job.charAt(0) ==" ") 
	   {
	   document.getElementById("inp_job_titleerror").innerHTML="Should not accept initial space";
	error="true";
		}
	
	
	else if((document.getElementById("inp_job_title").value.length < 5) || (document.getElementById("inp_job_title").value.length > 500))
		{
		document.getElementById("inp_job_titleerror").innerHTML="Required field should  be of length 5 to 500";	
		error="true";
		}
	else
		{
		document.getElementById("inp_job_titleerror").innerHTML="";
		}
	
						if(document.getElementById("inp_process").value=="")
							{
								document.getElementById("processerror").innerHTML="Required field should not be empty";	
								error="true";
								
							}
						
						 else if(process.charAt(0) ==" ") 
						   {
						   document.getElementById("processerror").innerHTML="Should not accept initial space";
					    	error="true";
							}
						
						
							else if((document.getElementById("inp_process").value.length < 4) || (document.getElementById("inp_process").value.length > 45))
								{
								document.getElementById("processerror").innerHTML="Required field should  be of length 4 to 32";	
								error="true";
								}
							else
								{
								document.getElementById('processerror').innerHTML="";
								}
							
							if(document.getElementById("inp_process_name").value=="")
							{
								document.getElementById("processnameerror").innerHTML="Required field should not be empty";	
								error="true";
								
							}
							
							 else if(pname.charAt(0) ==" ") 
							   {
							   document.getElementById("processnameerror").innerHTML="Should not accept initial space";
						    	error="true";
								}
							
							
							else if((document.getElementById("inp_process_name").value.length < 4) || (document.getElementById("inp_process_name").value.length > 45))
								{
								document.getElementById("processnameerror").innerHTML="Required field should be of length 4 to 32";	
								error="true";
								}
							else
								{
								document.getElementById("processnameerror").innerHTML="";
								}
							if(document.getElementById("inp_list_of_functions_needes").value=="")
							{
								document.getElementById("functionneedserror").innerHTML="Required field should not be empty";	
								error="true";
								
							}
							
							else if(fneeds.charAt(0) ==" ") 
							   {
							   document.getElementById("functionneedserror").innerHTML="Should not accept initial space";
						    	error="true";
								}
							
							
							else if((document.getElementById("inp_list_of_functions_needes").value.length < 4) || (document.getElementById("inp_list_of_functions_needes").value.length > 45))
								{
								document.getElementById("functionneedserror").innerHTML="Required field should  be of length 4 to 32";	
								error="true";
								}
							else
								{
								document.getElementById('functionneedserror').innerHTML="";
								}

							if(document.getElementById("documentedin").value=="")
									{
										document.getElementById("documentedinerror").innerHTML="Required field should not be empty";	
										error="true";
										
									}
							 else if(doc.charAt(0) ==" ") 
							   {
							   document.getElementById("documentedinerror").innerHTML="Should not accept initial space";
						    	error="true";
								}
									else if((document.getElementById("documentedin").value.length < 4) || (document.getElementById("documentedin").value.length > 45))
										{
										document.getElementById("documentedinerror").innerHTML="Required field should  be of length 4 to 32";	
										error="true";
										}
									else
										{
										document.getElementById('documentedinerror').innerHTML = "";
										}
 
							  if(error == "true")
								{
								return false;
								}
}
</script>

<script>
	
	window.onload = function(){
		toggle1();toggle2();toggle3();
	}
		</script>
	 <jsp:include page="footer.jsp"></jsp:include>
 