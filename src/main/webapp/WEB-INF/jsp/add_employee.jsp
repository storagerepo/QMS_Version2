<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<form method="post" enctype="multipart/form-data" action="addemployee">
<!-- Modal Ends -->

<!-- Ajax -->
<script type="text/javascript">
$(window).load
(
		function()
		{
		$.ajax
		(
		{
			type : "POST", url: "/QMS_App/ajax_getjob",
        success: function(response)
  	      {
    		   $('#job_titles').html(response);
   		  }
		}
		);
}
		);
</script>


<script type="text/javascript">

function doAjaxPost() {
		// get the form values  
	
		var job_id = $('#add_job_id').val();
		var job_title=$('#add_job_title').val();
		var job_desc=$('#add_job_desc').val();
		/*   var education = $('#education').val();	 */		
		$.ajax({
			type : "POST",
			url : "/QMS_App/ajax_addjob",
			data : "job_id=" + job_id +"&job_title="+job_title+"&job_desc="+job_desc,
			success : function(response) {
				// we have the response  
				$('#job_titles').html(response);
			//document.getElementById("newjob").style.display="none";
				//  $('#education').val(''); */
			},
			error : function(e) {
				alert('Error: ' + e);
			}
		});
	}
</script>
	<!-- End Ajax -->



<!-- <script>

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
 
</script> -->


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









<form method="post" action="addemployee">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
        <td>
        <div>
  <ul class="horizmenu">
  <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addemployee" class="<c:choose>
								<c:when test="${menu=='employee'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									<span>Add Employees</span>
									
								</a>
							</li>
						
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="viewemployees" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>View Employees</span>
									
								</a>
							</li>
							
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="employee_report" class="<c:choose>
								<c:when test="${menu=='employees'}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Reports</span>
									
								</a>
							</li>
						
				           </ul>
				          
  </div>
        </td>
      </tr>
      <tr>
        <td valign="top" align="left">
            <div class="headings altheading">
              <h2>Add Employee Details</h2><div id="info"></div>
            </div>
            <div class="contentbox">
             <div style="border:#993300  2px solid; padding:15px; margin-bottom:15px;">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr class="row2">
                 <td valign="top" align="left" class="input_txt" width="20%">ID :</td>
                <td valign="top" align="left" class="input_txt" width="20%"><input type="text" name="employee_id" class="input_txtbx" readonly="readonly" value="<c:out value="${id}"/>"/><br/><span style="color: red;"></span><form:errors path="Employee.employee_id"></form:errors></td>
                 <td valign="top" align="left" class="input_txt" width="20%">Qualified By :</td>
                 <td valign="top" align="left" class="input_txt" width="20%">
                 <select name="qualified_by" class="dropdown" id="qualifiedby">
                  			<option value="">--Select--</option>
                  		<option value="Education">Education</option>
						<option value="Experience">Experience</option>
						<option value="Training">Training</option>
				</select><br/>
											 <span style="color: red;" id="qualifiedbyerror"><form:errors path="Employee.qualified_by"></form:errors></span></td>
                </tr>
                <tr class="row1">
                  <td valign="top" align="left" class="input_txt" width="20%">Name :</td>
                  <td valign="top" align="left" class="input_txt" width="20%"><input type="text" name="name" class="input_txtbx" maxlength="32" id="inp_name" onkeypress="return Alphabets(event,this);"  onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"  onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${Employee.name}"  />
                  <br/><span style="color: red;" id="nameerror"><form:errors path="Employee.name"></form:errors></span></td>
                  <td valign="top" align="left" class="input_txt" width="20%">Type :</td>
               <td valign="top" align="left" class="input_txt" width="20%"><select	name="type_of_training" class="dropdown" id="type">
                 	<option value="">--Select--</option>
				                  									
                  										<option
															<c:if test="${Employee.type_of_training eq 'Classroom'}"><c:out value="Selected"/></c:if>
															value="Classroom">Classroom</option>
														<option
															<c:if test="${Employee.type_of_training eq 'Hands on'}"><c:out value="Selected"/></c:if>
															value="Hands on">Hands on</option>
														</select>
														<br/><span style="color: red;" id="typeerror"><form:errors path="Employee.type_of_training"></form:errors></span></td>
				
                </tr>
		<tr class="row2">
                  <td valign="top" align="left" class="input_txt" width="20%">Job Title :</td>
               	<td valign="top" align="left" class="input_txt" width="20%"><span id="job_titles"></span>&nbsp;&nbsp;
               	<%-- <a href="newjob" data-toggle="modal">Add New Job</a><br/> <span style="color: red;"><form:errors path="Employee.job_title"></form:errors></span> --%></td>
   				  <td valign="top" align="left" class="input_txt" width="20%"> Trainer :</td>
                  <td valign="top" align="left" class="input_txt" width="20%"><input  type="text" name="trainer" class="input_txtbx" maxlength="32" id="trainer" onkeypress="return Alphabets(event,this);" onmouseover="showTooltip('tooltip_id','inp_id3');" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"  onmouseout="hideTooltip('tooltip_id');" value="${Employee.trainer}" /><br/> <span style="color: red;" id="trainererror"><form:errors path="Employee.trainer"></form:errors></span></td>
                </tr>
                	
				<tr class="row1">
                  <td valign="top" align="left" class="input_txt" width="20%">Working as :</td>
                  <td valign="top" align="left" class="input_txt" width="20%">
                  
                  <input type="checkbox" name="process_owner" onclick="toggle1()"  value="yes" id="processowner"/>&nbsp;Process Owner                 
             	  <input type="checkbox" name="document_control" onclick="toggle2()" value="yes" id="documentcontrol"/>&nbsp;Document Control<br/><br/>
                  <input type="checkbox" name="management" value="yes"  onclick="toggle3()" id="managementrep"/>&nbsp;Management Representative<br/>
                  <span style="color: red;" id="workingerror"></span>
                  
                  
                  <%--  <span style="color: red;"><form:errors path="Employee.name"></form:errors></span>
                   --%>
                  </td>
                 <td valign="top" align="left" class="input_txt" width="20%"> Training Effectiveness Notes :</td>
                  <td><textarea class="input_txtbx" id="inp_job_title" name="training_effectiveness_notes" onmouseover="showTooltip('tooltip_id','inp_id3');" value="${employee.training_effectiveness_notes}" onmouseout="hideTooltip('tooltip_id');"  style="height: 75px;" name="note"></textarea><br/> 
                  <span id="inp_job_titleerror" style="color: red;"><form:errors path="Employee.training_effectiveness_notes"></form:errors></span></td>
                 
                </tr>
		
		
                <tr class="row1">
                  <td valign="top" align="left" class="input_txt" width="20%"> Date Hired :</td>
                  <td valign="top" align="left" class="input_txt" width="20%">
                  <input type="text" name="date_hired" class="input_txtbx"  id="datepicker" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"  onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${Employee.date_hired}" /><br> 
                  <span style="color: red;" id="datepickererror"><form:errors path="Employee.date_hired"></form:errors></span></td>
                  <td valign="top" align="left" class="input_txt" width="20%">Due Date :</td>
                  <td valign="top" align="left" class="input_txt" width="20%"><input type="text" name="training_due_date" class="input_txtbx" id="datepicker1" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"  onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${Employee.training_due_date}" /><br>
                   <span id="datepicker1error" style="color: red; id="datepicker1err"><form:errors path="Employee.training_due_date"></form:errors></span></td>
                
                </tr>
                <tr class="row2">
                  <td valign="top" align="left" class="input_txt" width="20%">Attachments :</td>
				  <td valign="top" align="left" class="input_txt" width="20%"><input name="attachments" id="image" type="file" />
				  <br/><span id="imageerror" style="color:red"></span><span class="err"></span></td>
                   <td valign="top" align="left" class="input_txt" width="20%">Completion Date :</td>
                  <td valign="top" align="left" class="input_txt" width="20%"><input type="text" name="training_completion_date" class="input_txtbx" id="datepicker2" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"  onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${Employee.training_completion_date}" /><br> 
                  <span id="datepicker2error" style="color: red;"><form:errors path="Employee.training_completion_date"></form:errors></span></td>
                
                </tr>
                <tr class="row2">
                  <td valign="top" align="left" class="input_txt" width="20%">Process :</td>
                  <td valign="top" align="left" class="input_txt" width="20%"><input type="text" name="process" class="input_txtbx" maxlength="32" id="inp_process" onkeypress="return Alphabets(event,this);" onmouseover="showTooltip('tooltip_id','inp_id3');"  onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"  onmouseout="hideTooltip('tooltip_id');" value="${Employee.process}" /><br> 
                  <span id="processerror" style="color: red;"><form:errors path="Employee.process"></form:errors></span></td>
                  <td valign="top" align="left" class="input_txt" width="20%">Process Name :</td>
                  <td valign="top" align="left" class="input_txt" width="20%">
                  <input type="text" name="process_name" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"  class="input_txtbx" maxlength="32" id="inp_process_name" value="${Employee.process_name}" onkeypress="return Alphabets(event,this);"/><br> 
                  <span style="color: red;" id="processnameerror"><form:errors path="Employee.process_name"></form:errors></span></td>
                
                </tr>
                
                <tr class="row2">
                  <td valign="top" align="left" class="input_txt" width="20%">Document Control :</td>
                 	<td valign="top" align="left" class="input_txt" width="20%"><input
															type="radio" name="doc_control" value="yes"
															class="input_txt" checked >Yes&nbsp;&nbsp;&nbsp;<input
															type="radio" name="doc_control" value="no"
															class="input_txt" >No<br> <span style="color: red;"><form:errors path="Employee.doc_control"></form:errors></span></td>
                  <td valign="top" align="left" class="input_txt" width="20%">Management Rep :</td>
                  	<td valign="top" align="left" class="input_txt" width="20%"><input
															type="radio" name="management_rep" value="yes"
															class="input_txt" checked >Yes&nbsp;&nbsp;&nbsp;<input
															type="radio" name="management_rep" value="no"
															class="input_txt" >No <span style="color: red;"><form:errors path="Employee.management_rep"></form:errors></span></td>
                
                </tr>
                <tr class="row1">
                  <td valign="top" align="left" class="input_txt" width="20%">Functions Needs :</td>
                  <td valign="top" align="left" class="input_txt" width="20%"><input type="text" maxlength="32" name="list_of_functions_needes" class="input_txtbx" onkeypress="return Alphabets(event,this);" id="inp_list_of_functions_needes" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"  onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${Employee.list_of_functions_needes}" /><br>
                   <span style="color: red;" id="functionneedserror"><form:errors path="Employee.list_of_functions_needes"></form:errors></span></td>
                  <td valign="top" align="left" class="input_txt" width="20%">Review Due Date :</td>
                  <td valign="top" align="left" class="input_txt" width="20%"><input type="text" name="training_effectiveness_review_due_date" class="input_txtbx" id="datepicker3" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"  onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${Employee.training_effectiveness_review_due_date}" /><br> 
                  <span style="color: red;" id="datepicker3error"><form:errors path="Employee.training_effectiveness_review_due_date"></form:errors></span></td>
                
                </tr>
                <tr class="row2">
                  <td valign="top" align="left" class="input_txt" width="20%">Documented In :</td>
                  <td valign="top" align="left" class="input_txt" width="20%"><input type="text" name="documented_in" maxlength="32" class="input_txtbx" id="documentedin"  onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${Employee.documented_in}" /><br> <span style="color: red;" id="documentedinerror"><form:errors path="Employee.documented_in"></form:errors></span></td>
                 </tr>      
                
                <!--  <tr class="row1">
                  <td valign="top" align="right">&nbsp;</td>
                  <td></td> 
                  <td valign="top" align="left">&nbsp;&nbsp;<input type="submit" value="Submit" class="submit_btn1" onclick="return onsubmitvalidate();"></td>
                </tr> -->
                  <tr class="row1">
                  <td valign="bottom" style="padding-right: 55px" colspan="4"align="right">&nbsp;<input type="submit" value="Submit" onclick="return onsubmitvalidate();"class="submit_btn1" ></td>
                 
                </tr>
              </table>
           
                
              
              <div id="newjob" class="modal hide fade" style="display: none; " >
              <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal">×</button>
		<h2>Add New Job</h2>
		</div>
		<table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr class="row2">
                  <td valign="top" align="right" class="input_txt" width="20%"><label>Job ID :</label></td>
                  <td valign="top" align="left" class="input_txt" width="20%"><input type="hidden" name="add_job_id" id="add_job_id" value="<c:out value="${job_id}"/>"/><c:out value="${job_id }"/><br/> <span style="color: red;"></span></td>
                </tr>
                <tr class="row1">
                  <td valign="top" align="right" class="input_txt" width="20%">Job Name :</td>
                  <td valign="top" align="left" class="input_txt" width="20%"><input type="text" name="add_job_title" id="add_job_title" class="input_txtbx" id="inp_name" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.name}" /><br> <span style="color: red;"><form:errors path="Employee.name"></form:errors></span></td>
                </tr>
		<tr class="row2">
                  <td valign="top" align="right" class="input_txt" width="20%"> Job Description :</td>
               	<td valign="top" align="left" class="input_txt" width="20%"><input type="text" name="job_description" id="add_job_desc" class="input_txtbx" id="inp_name" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.job_title}" /><br> <span style="color: red;"><form:errors path="Employee.job_title"></form:errors></span></td>
   
									  </tr>
                <tr class="row1" style>
                  <td valign="top" align="right" class="input_txt" width="20%"></td>
                  <td valign="top" align="left" class="input_txt" width="20%"><input type="button" class="submit_btn1" value="Submit" onclick="doAjaxPost();"  data-dismiss="modal" /><form:errors path="Employee.date_hired"></form:errors></td>
                </tr>
                <tr class="row2">
                  <td valign="top" align="right" class="input_txt" width="20%"></td>
                  <td valign="top" align="left" class="input_txt" width="20%"></td>
                </tr>
                </table>
   				</div>
   				</div>
   				</div>
   				</td>
   				</tr>
   				</table>
   				</div>
   				   
</form>

<script>
$(function() {
		 $( "#datepicker1" ).datepicker({dateFormat: 'yy-mm-dd'});
	        });
	 
	</script>
	   <script>
	 $(function() {
	           $( "#datepicker" ).datepicker({dateFormat: 'yy-mm-dd'});
	         });
	 
	</script>
	   <script>
	 $(function() {
		 $( "#datepicker2" ).datepicker({dateFormat: 'yy-mm-dd'});
	     
	         });
</script>
<script>
$(function() {
		 $( "#datepicker3" ).datepicker({dateFormat: 'yy-mm-dd'});
	     
	         });
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
function onsubmitvalidate()
{
	var error="";
	//var date = /^(0?[1-9]|1[012])[\/](0?[1-9]|[12][0-9]|3[01])[\/]\d{4}$/;
	var date = /^\d{4}-(0?[1-9]|1[012])-(0?[1-9]|[12][0-9]|3[01])$/;
	var datepick = document.getElementById("datepicker").value;
	var datepick1 = document.getElementById("datepicker1").value;
	var datepick2 = document.getElementById("datepicker2").value;
	var datepick3 = document.getElementById("datepicker3").value;
	
	 var name = document.getElementById('inp_name').value;
	 var process = document.getElementById('inp_process').value;
	  var fneeds = document.getElementById('inp_list_of_functions_needes').value;
	   var doc = document.getElementById('documentedin').value;
	    var job = document.getElementById('inp_job_title').value;
	   
	    var pname = document.getElementById('inp_process_name').value;
	    
	    var trainer = document.getElementById('trainer').value;
	var owner = document.getElementById('processowner').checked;
	var control = document.getElementById('documentcontrol').checked;
	var management = document.getElementById('managementrep').checked;
	var image = document.getElementById('image').value;
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
	 document.getElementById("datepickererror").innerHTML="Invalid date format";
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
	 document.getElementById("datepicker1error").innerHTML="Invalid date format";
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
	 document.getElementById("datepicker2error").innerHTML="Invalid date format";
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
	 document.getElementById("datepicker3error").innerHTML="Invalid date format";
	 error="true";
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
		
		document.getElementById("nameerror").innerHTML="Required field should be of length 4 to 32";	
		error="true";
		}
	
	else{
		document.getElementById('nameerror').innerHTML="";
	}
	
	  if(document.getElementById("type").value=="")
	{
		  
		document.getElementById("typeerror").innerHTML="Required field should not be empty";	
		error="true";
		
	}
	else
		{
		document.getElementById('typeerror').innerHTML="";
		} 
	
	if(document.getElementById("qualifiedby").value=="")
	{
		
		document.getElementById("qualifiedbyerror").innerHTML="Required field should not be empty";	
		error="true";
		
	}
	else
		{
		document.getElementById('qualifiedbyerror').innerHTML="";
		} 
	if(document.getElementById("trainer").value=="")
	{
		document.getElementById("trainererror").innerHTML="Required field should not be empty";	
		error="true";
		
	}
	 else if(trainer.charAt(0) ==" ") 
	   {
	   document.getElementById("trainererror").innerHTML="Should not accept initial space";
  	error="true";
		}
	else if((document.getElementById("trainer").value.length < 4) || (document.getElementById("trainer").value.length > 45))
		{
		
		document.getElementById("trainererror").innerHTML="Required field should be of length 4 to 32";	
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
		document.getElementById("inp_job_titleerror").innerHTML="Required field should be of length 5 to 500";	
		error="true";
		}
	else
		{
		document.getElementById("inp_job_titleerror").innerHTML="";
		}
	 if(image == "")
	  {
	  document.getElementById("imageerror").innerHTML="Please upload a file";
		 error="true";
	  }
	else {
		  document.getElementById("imageerror").innerHTML="";
		}

		if(document.getElementById("inp_process").value=="")
							{
								document.getElementById("processerror").innerHTML="Required field should not empty";	
								error="true";
								
							}
		  else if(process.charAt(0) ==" ") 
		   {
		   document.getElementById("processerror").innerHTML="Should not accept initial space";
	    	error="true";
			}
							else if((document.getElementById("inp_process").value.length < 4) || (document.getElementById("inp_process").value.length > 45))
								{
								document.getElementById("processerror").innerHTML="Required field should be of length 4 to 32";	
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
								document.getElementById("functionneedserror").innerHTML="Required field should be of length 4 to 32";	
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

            
      <jsp:include page="footer.jsp"></jsp:include>
  