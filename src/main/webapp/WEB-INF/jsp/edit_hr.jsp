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

	 $( "#datepicker" ).datepicker();

        });
$(function() {

	 $( "#datepicker1" ).datepicker();

        });

$(function() {

     $( "#datepicker2" ).datepicker();
         });

 $(function() {
	 $( "#datepicker3" ).datepicker();
 });
</script>

<form method="post" enctype="multipart/form-data" action="updatehr">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
        <td>
        <div>
  <ul class="horizmenu">
						
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addhr" class="<c:choose>
								<c:when test="${menu=='hr'}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Add HR & Training</span>
									
								</a>
							</li>
						
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="viewhr" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									<span>View HR & Training</span>
									
								</a>
							</li>
						</ul>
						
  </div>
        </td>
      </tr>
      <tr>
        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2>Update HR and Training Details</h2>
            </div>
            <div class="contentbox">
            <c:set value="${hRandTrainingForm.hRandTrainings[0]}" var="hRandTrainings"/>
                 <table cellpadding="0" cellspacing="0" border="0" width="100%" style="border:#993300  2px solid; padding:15px; margin-bottom:15px; height:475px">
					<tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="20%"><label>ID :</label></td>
                  <td valign="top" align="left" class="input_txt" width="20%"><input type="text" name="id" class="input_txtbx"  readonly="readonly" value="<c:out value="${hRandTrainings.id }"/>"/><br/><span class="err"></span></td>
           <td>  Review Due Date :</td>
                  <td valign="top" align="left" class="input_txt" width="20%"><input type="text" name="training_effectiveness_review_due_date" class="input_txtbx" id="datepicker3" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"  onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${hRandTrainings.training_effectiveness_review_due_date }" /><br>
                  <span id="datepicker33" style="color:red"></span>
                  <span class="err"><form:errors path="HRandTraining.training_effectiveness_review_due_date"></form:errors></span>    </tr>
                <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="20%">Name :</td>
                  <td valign="top" align="left" class="input_txt" width="20%"><input type="text" name="name" class="input_txtbx" id="name" onkeypress="return onlyAlphabets(event,this);" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"  onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${hRandTrainings.name }" maxlength="32"/><br>
               		<span id="nameerror" style="color:red"></span>
                  <span class="err"><form:errors path="HRandTraining.name"></form:errors></span></td>
                <td valign="middle" align="left" class="input_txt" width="20%"> Trainer :</td>
                  <td valign="top" align="left" class="input_txt" width="20%"><input type="text" name="trainer" class="input_txtbx" id="trainer"onkeypress="return onlyAlphabets(event,this);"  onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"  onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${hRandTrainings.trainer }" maxlength="32"/><br>
                  <span id="trainererror" style="color:red"></span>
                  <span class="err"><form:errors path="HRandTraining.trainer"></form:errors></span></td>
                
                
                                 </tr>
		<tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="20%">Job Title :</td>
               	<td valign="top" align="left" class="input_txt" width="20%">
              
			                 <select	name="job_title" id="jobtitle"class="dropdown" >
			                 <option value="">--Select--</option>
			                 <option <c:if test="${hRandTrainings.job_title eq 'Job Title1'}"><c:out value="Selected"/></c:if> value="Job Title1">Job Title1</option>
							<option <c:if test="${hRandTrainings.job_title eq 'Job Title2'}"><c:out value="Selected"/></c:if> value="Job Title2">Job Title2</option>
							<option <c:if test="${hRandTrainings.job_title eq 'Job Title3'}"><c:out value="Selected"/></c:if> value="Job Title3">Job Title3</option>		
							</select>
								<br> <span id="jobtitleerror" style="color:red"></span>
							<span class="err"><form:errors path="HRandTraining.job_title"></form:errors></span></td>

			                 
            <td valign="middle" align="left" class="input_txt" width="20%">Qualified By :</td>
                  <td valign="top" align="left" class="input_txt" width="20%"><select	name="qualified_by" id="qualifiedby" class="dropdown" >
                  					
                  										<option
															<c:if test="${hRandTrainings.qualified_by eq 'Education'}"><c:out value="Selected"/></c:if>
															value="Education">Education</option>
														<option
															<c:if test="${hRandTrainings.qualified_by eq 'Experience'}"><c:out value="Selected"/></c:if>
															value="Experience">Experience</option>
														<option
															<c:if test="${hRandTrainings.qualified_by eq 'Training'}"><c:out value="Selected"/></c:if>
															value="Training">Training</option>
														
															</select>
															<br> <span id="qualifiedbyerror" style="color:red"></span>
															<span class="err"><form:errors path="HRandTraining.qualified_by"></form:errors></span></td>
                
            
               	
               	</tr>
               	
               	<tr class="row1">
                <td valign="middle" align="left" class="input_txt" width="20%">Training Effectiveness Notes :</td>
                 <td><textarea class="input_txtbx" style="height: 75px;" id="effectivenessnotes" name="training_effectiveness_notes" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" style="height: 89px;" name="note" maxlength="400"><c:out value="${hRandTrainings.training_effectiveness_notes  }"/> </textarea><br>
                 <span id="effectivenessnoteserror" style="color:red"></span>
                 <span class="err"><form:errors path="HRandTraining.training_effectiveness_notes"></form:errors></span></td>
 <td valign="middle" align="left" class="input_txt" width="20%">Type :</td>
                  <td valign="middle" align="left" class="input_txt" width="20%">
                  <select  name="type_of_training" id="typeoftraining" class="dropdown" >

				                  									
                  										<option
															<c:if test="${hRandTrainings.type_of_training eq 'Classroom'}"><c:out value="Selected"/></c:if>
															value="Classroom">Classroom</option>
														<option
															<c:if test="${hRandTrainings.type_of_training eq 'Hands on'}"><c:out value="Selected"/></c:if>
															value="Hands on">Hands on</option>
														</select>
														<br> <span id="typeoftrainingerror" style="color:red"></span>
														</td>
                </tr>    
               	
                
				<tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="20%">Date Hired :</td>
                  <td valign="top" align="left" class="input_txt" width="20%">
                  <input type="text" name="date_hired" class="input_txtbx" id="datepicker"  onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"   value="${hRandTrainings.date_hired }" /><br>
                   <span id="datepicker00" style="color:red"></span>
                  <span class="err"><form:errors path="HRandTraining.date_hired"></form:errors></span></td>
                <td valign="middle" align="left" class="input_txt" width="20%">Due Date :</td>
                  <td valign="top" align="left" class="input_txt" width="20%">
                  <input type="text" name="training_due_date" class="input_txtbx" id="datepicker1"  onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"  onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${hRandTrainings.training_due_date }" /><br>
                  <br> <span id="datepicker11" style="color:red"></span>
                  <span class="err"><form:errors path="HRandTraining.training_due_date"></form:errors></span></td>
                </tr>
                <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="20%">Attachments :</td>
                  
                  <td valign="top" align="left" class="input_txt" width="20%" >
                   <input type="hidden" value="${hRandTrainings.attachment_name}" id="image"/><c:out value="${hRandTrainings.attachment_name}"></c:out>
                  <input type="file" name="attachments" class="input_txtbx1" id="id_attachments" font-weight:bold;" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" ><br>
                   <span id="imageerror" style="color:red"></span>
                  </td>
                  

                  
                  
                   <td valign="middle" align="left" class="input_txt" width="20%">Completion Date :</td>
                  <td valign="top" align="left" class="input_txt" width="20%">
                  <input type="text" name="training_completion_date" class="input_txtbx" id="datepicker2"  onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"  onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${hRandTrainings.training_completion_date }" /><br>
                   <span id="datepicker22" style="color:red"></span>
                  <span class="err"><form:errors path="HRandTraining.training_completion_date"></form:errors></span>
                  </td>
                </tr>
                
           
                <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="20%">Functions Needs :</td>
                 <td valign="top" align="left" class="input_txt" width="20%">
                 <input type="checkbox" name="calibration" value="yes" id="calibration"<c:if test="${hRandTrainings.calibration=='yes'}"><c:out value="checked=checked"/></c:if>>&nbsp;Calibration<br>                
                   <input type="checkbox" name="responsibility" value="yes" id="responsibility"<c:if test="${hRandTrainings.responsibility=='yes'}"><c:out value="checked=checked"/></c:if>>&nbsp;Responsibility<br/>
                   <input type="checkbox" name="disposition" value="yes" id="disposition"/<c:if test="${hRandTrainings.disposition=='yes'}"><c:out value="checked=checked"/></c:if>>&nbsp;Disposition
                 <br> <span id="functionsneedserror" style="color:red"></span>
                  </td>
                   <td valign="middle" align="left" class="input_txt" width="20%">Documented In :</td>
                  <td valign="top" align="left" class="input_txt" width="20%"><input type="text" name="documented_in" class="input_txtbx" id="documentedin" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"  onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${hRandTrainings.documented_in}" maxlength="32"/><br>
                   <span id="documentedinerror" style="color:red"></span>
                  <span class="err"><form:errors path="HRandTraining.documented_in"></form:errors></span></td>
                  </tr>
                  
                  <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="20%"></td>
                 
                  </tr>
                  <!--  <tr class="row1">
                  <td valign="middle"  align="left" class="input_txt" width="20%">&nbsp;</td>
                  <td></td>
                 <td valign="middle" align="left" class="input_txt" width="20%"><input type="submit" value="Update" onclick="return validate();"class="submit_btn1"></td>
                </tr> -->
                  <tr class="row1">
                  <td valign="bottom" colspan="4"align="right" style="padding-right:60px;">&nbsp;<input type="submit" value="Update" onclick="return validate();"class="submit_btn1"></td>
                 
                </tr>
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

 <script>
   $(function() {
		 var format="yy-mm-dd";
	           $( "#datepicker" ).datepicker();
	           
	         });
	 
	 $(function() {
		 var format="yy-mm-dd";
	           $( "#datepicker1" ).datepicker();
	         });
	 
	 $(function() {
		 var format="yy-mm-dd";
         $( "#datepicker2" ).datepicker();
       });
	 
	 $(function() {
		 var format="yy-mm-dd";
         $( "#datepicker3" ).datepicker();
       });
    </script> 
     <script>
$(function() {

	$("#name").on("keypress", function(e) {
		
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

	$("#effectivenessnotes").on("keypress", function(e) {
		
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
  <script type="text/javascript">
function validatename(id){
	
    var textInput = document.getElementById(id).value;
    textInput = textInput.replace(/[^A-Za-z ]/g, "");
    document.getElementById(id).value = textInput;
}  
function validatename1(id){
	
    var textInput = document.getElementById(id).value;
    textInput = textInput.replace(/[ ]/g, "");
    document.getElementById(id).value = textInput;
}  
</script>
<script type="text/javascript">
function validate()
{
	
	var error="";
	var date = /^(0?[1-9]|1[012])[\/](0?[1-9]|[12][0-9]|3[01])[\/]\d{4}$/;
	var name = document.getElementById('name').value;
	var trainer = document.getElementById('trainer').value;
	var jobtitle = document.getElementById('jobtitle').value;
	var qualifiedby = document.getElementById('qualifiedby').value;
	var effectivenessnotes = document.getElementById('effectivenessnotes').value;
	var typeoftraining = document.getElementById('typeoftraining').value;
	var datepicker = document.getElementById('datepicker').value;
	var image = document.getElementById('image').value;
	var calibration = document.getElementById('calibration').checked;
	var disposition = document.getElementById('disposition').checked;
	var responsibility =  document.getElementById('responsibility').checked;
	var datepicker1 = document.getElementById('datepicker1').value;
	var datepicker2= document.getElementById('datepicker2').value;
	var datepicker3 = document.getElementById('datepicker3').value;
	var documentedin = document.getElementById('documentedin').value;
	
	if(name == "")
	{
	 document.getElementById("nameerror").innerHTML="Required field should not be empty";
	 error="true";
	
	}
	else if(name.charAt(0) == " ")
	{
		document.getElementById("nameerror").innerHTML="Required field should not accept initial space";
		 error="true";
	}
else if((name.length < 4) ||(name.length > 32))
	{
	document.getElementById("nameerror").innerHTML="Required field should be length of 4 to 32";
	error="true";
	
	}
else
	{
	document.getElementById("nameerror").innerHTML="";
	}
	
	if(trainer == "")
	{
	 document.getElementById("trainererror").innerHTML="Required field should not be empty";
	 error="true";
	
	}
	else if(trainer.charAt(0) == " ")
	{
		document.getElementById("trainererror").innerHTML="Required field should not accept initial space";
		 error="true";
	}
	else if((trainer.length < 4) ||(trainer.length > 32))
	{
	document.getElementById("trainererror").innerHTML="Required field should be length of 4 to 32";
	error="true";
	
	}
	else
	{
	document.getElementById("trainererror").innerHTML="";
	}
	
	 if(jobtitle == "")
	  {
	  document.getElementById("jobtitleerror").innerHTML="Required field should not be empty";
		 error="true";
	  }
 else {
	  document.getElementById("jobtitleerror").innerHTML="";
 }

	 if(qualifiedby == "")
	  {
	  document.getElementById("qualifiedbyerror").innerHTML="Required field should not be empty";
		 error="true";
	  }
 	else
 	{
		  document.getElementById("qualifiedbyerror").innerHTML="";
	}
	 if(effectivenessnotes == "")
		{
		 document.getElementById("effectivenessnoteserror").innerHTML="Required field should not be empty";
		 error="true";
		
		}
		else if(effectivenessnotes.charAt(0) == " ")
		{
			document.getElementById("effectivenessnoteserror").innerHTML="Required field should not accept initial space";
			 error="true";
		}
	else if((effectivenessnotes.length < 4) ||(effectivenessnotes.length > 400))
		{
		document.getElementById("effectivenessnoteserror").innerHTML="Required field should be length of 4 to 400";
		error="true";
		
		}
	else
		{
		document.getElementById("effectivenessnoteserror").innerHTML="";
		}
	 
	 
	 
	 if(typeoftraining == "")
	  {
	  document.getElementById("typeoftrainingerror").innerHTML="Required field should not be empty";
		 error="true";
	  }
	else {
		  document.getElementById("typeoftrainingerror").innerHTML="";
		}
	 
	 if(datepicker == "")
	 {
	 document.getElementById("datepicker00").innerHTML="Required field should not be empty";
	 error="true";
	 
	 }
	 else if(datepicker.match(date))
	 {
	 document.getElementById("datepicker00").innerHTML="";
	 }
	 else
	 {
	 document.getElementById("datepicker00").innerHTML="Invalid date format";
	 error="true";
	 }
	 
	 if(image == "")
	  {
	  document.getElementById("imageerror").innerHTML="Please upload a file";
		 error="true";
	  }
	else {
		  document.getElementById("imageerror").innerHTML="";
		}

	 
	 if(datepicker1 == "")
	 {
	 document.getElementById("datepicker11").innerHTML="Required field should not be empty";
	 error="true";
	 
	 }
	 else if(datepicker1.match(date))
	 {
	 document.getElementById("datepicker11").innerHTML="";
	 }
	 else
	 {
	 document.getElementById("datepicker11").innerHTML="Invalid date format";
	 error="true";
	 }
	 
	 if(datepicker2 == "")
	 {
	 document.getElementById("datepicker22").innerHTML="Required field should not be empty";
	 error="true";
	 
	 }
	 else if(datepicker2.match(date))
	 {
	 document.getElementById("datepicker22").innerHTML="";
	 }
	 else
	 {
	 document.getElementById("datepicker22").innerHTML="Invalid date format";
	 error="true";
	 }
	 
	 if(datepicker3 == "")
	 {
	 document.getElementById("datepicker33").innerHTML="Required field should not be empty";
	 error="true";
	 
	 }
	 else if(datepicker3.match(date))
	 {
	 document.getElementById("datepicker33").innerHTML="";
	 }
	 else
	 {
	 document.getElementById("datepicker33").innerHTML="Invalid date format";
	 error="true";
	 }
	 if(!disposition && !calibration && !responsibility)
	 {
	 document.getElementById("functionsneedserror").innerHTML="Please select atleast one";
	 error="true";
	 }
 else
	 {
	 document.getElementById("functionsneedserror").innerHTML="";
	 }
	 
	 
	 if(documentedin == "")
		{
		 document.getElementById("documentedinerror").innerHTML="Required field should not be empty";
		 error="true";
		
		}
	 else if(documentedin.charAt(0) == " ")
		{
			document.getElementById("documentedinerror").innerHTML="Required field should not accept initial space";
			 error="true";
		}
	else if((documentedin.length < 4) ||(documentedin.length > 32))
		{
		document.getElementById("documentedinerror").innerHTML="Required field should be length of 4 to 32";
		error="true";
		
		}
	else
		{
		document.getElementById("documentedinerror").innerHTML="";
		}
	 
	 if(error == "true")
		 {
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
    
    
    </script>
    
<br><br><br><br><br><br><br><br><br>
	 <jsp:include page="footer.jsp"></jsp:include>
