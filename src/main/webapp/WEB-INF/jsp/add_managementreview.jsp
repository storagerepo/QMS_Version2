 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" />

<script src="resources/js/jquery.min.js"></script>
 <script src="resources/js/jquery-ui.js"></script>
<script src="resources/js/jquery-1.7.2.min.js"></script>
<script src="resources/js/jquery-ui.js"></script>
<script src="resources/js/modal.js"></script>
<jsp:include page="header.jsp"></jsp:include>
<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
	<tr>
		<td>
			<div>
				<ul class="horizmenu" style=" float:left;margin-left:205px; margin-top:8px;">
<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addmanagementreview" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									<span>Add Management Review</span>
									
								</a>
							</li>
							
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="viewmanagementreview" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>View Management Review</span>
									
								</a>
							</li>
						
				         <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="managementreview_report" class="<c:choose>
								<c:when test="${menu=='review'}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Reports</span>
									
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

<form method="post" action="addmanagementreview">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table" >
      <tr>
        <td valign="top" align="left" style="padding:5px 0 10px 0;"></td>
      </tr>
      <tr>
        <td valign="top" align="left"><div>
         <font color="Red" size="+1"></font>
            <div class="headings altheading">
              <h2>Add Management Review Details</h2>
            </div>
            <div class="contentbox">
            <div style="border:#993300  2px solid; padding:15px; margin-bottom:15px;">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr class="row2" valign="right">
               
                  <td valign="middle" align="left" class="input_txt" width="20%">Review ID :</td>
	                  <td valign="middle" align="left" class="input_txt" width="20%"><input type="text" class="input_txtbx" readonly="readonly" name="review_id" value="<c:out value="${id}"/>"/><br/></td>
      
                  <td valign="middle" align="left" class="input_txt" width="20%">Review Date :</td>
                  <td valign="top" align="left" class="input_txt1" width="10%"><input type="text" name="management_review_date" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"  class="input_txtbx" id="datepicker3" onmouseover="showTooltip('tooltip_id','inp_id3');" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"  onmouseout="hideTooltip('tooltip_id');"/><br/>
                  <span id="datepicker33" style="color:red"></span>
                  <span class="err"><form:errors path="ManagementReview.management_review_date"></form:errors></span></td>
  				    </tr>
    					
                      <tr class="row1"  >
                  <td valign="middle" align="left" class="input_txt" width="20%">Attendee List With Titles :</td>
                  <td valign="middle" align="left" class="input_txt" width="20%"><input type="text" name="attendee_list_with_titles" class="input_txtbx" id="attendeelistwithtitles" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"  onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" onkeypress="return onlyAlphabets(event,this);" maxlength="32" /><br/>
                  <span id="attendeelistwithtitleserror" style="color:red"></span>
                  <span class="err"><form:errors path="ManagementReview.attendee_list_with_titles"></form:errors></span></td>                
               	 <td valign="middle" align="left" class="input_txt" width="20%">Next Management Review By :</td>
                  <td valign="middle" align="left" class="input_txt" width="20%"><input type="text" name="next_management_review_by" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"  class="input_txtbx" id="nextmanagementreviewby" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" onkeypress="return onlyAlphabets(event,this);" maxlength="32"/><br/>
                  <span id="nextmanagementreviewbyerror" style="color:red"></span>
                  <span class="err"><form:errors path="ManagementReview.next_management_review_by"></form:errors></span></td>                
		
		 </tr>
		  <tr class="row2" >
						         	<td valign="middle" align="left" class="input_txt"width="20%">Category :</td>
						          <td valign="middle" align="left" class="input_txt"width="20%">
				                  		<select name="category" id="category" class="input_txtbx">
				                  		<option value="">--Select--</option>
						                      
						                  <option value="audits" >Audits</option>
						                  <option value="corrective and prev actions" >Corrective and Prev Actions</option>
										  <option value="cost of non conformance" >Cost of NonConformance</option>
										  <option  value="customer satisfaction" >Customer Satisfaction</option>
										  <option value="suppliers" >Suppliers</option>
										  <option value="human resources" >Human Resources</option>
										  <option value="product/service conformity" >Product/Service Conformity</option>
										  <option value="previous items" >Previous Items</option>
										  <option value="recommendations for improvement" >Recommendations for Improvement</option>
										  <option value="significant changes to the QMS" >Significant Changes to the QMS</option>	
				                   	</select>
						           		<br/>
						           		<span id="categoryerror" style="color:red"></span>
						           		<span class="err"><form:errors path="ManagementReview.category"></form:errors></span>
				                   	</td>	
				                   	 <td valign="middle" align="left" class="input_txt" width="20%">Report Link :</td>
                  <td valign="middle" align="left" class="input_txt" width="20%"><input type="text" name="report_link" placeholder="www.example.com" class="input_txtbx" id="reportlink" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"onInput="return validatename1();" maxlength="32"/><br/>
                  <span id="reportlinkerror" style="color:red"></span>
                  <span class="err"><form:errors path="ManagementReview.report_link"></form:errors></span></td>                
                  
              
						         </tr> 
           
                <tr class="row1" >
                  <td valign="middle" align="left" class="input_txt" width="20%">Assessment :</td>
                  <td valign="middle" align="left" class="input_txt" width="20%"><textarea name="assessment" class="input_txtbx" id="assessment" style="height: 50px;" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" onInput="return validatename3();" maxlength="200"></textarea><br/>
                  <span id="assessmenterror" style="color:red"></span>
                  <span class="err"><form:errors path="ManagementReview.assessment"></form:errors></span></td>                
                  <td valign="middle" align="left" class="input_txt" width="20%">Action Due Date :</td>
                  <td valign="middle" align="left" class="input_txt" width="20%"><input type="text" name="action_due_date" class="input_txtbx" id="datepicker2" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"   /><br/>
                  <span id="datepicker22" style="color:red"></span>
                  <span class="err"><form:errors path="ManagementReview.action_due_date"></form:errors></span></td>                
                  
                  </tr>
                <tr class="row2">
               <td valign="middle" align="left" class="input_txt" width="30%">Action Needed (Y/N) :</td>
               <td valign="top" align="left" class="input_txt" width="30%">
               <input type="radio" name="action_needed" value="Yes" onchange="toggle3(this.value);"  id="action_needed_yes" checked>Yes&nbsp;&nbsp;&nbsp;
               <input type="radio" name="action_needed" value="No" id="action_needed_no" onchange="toggle3(this.value);"  >No&nbsp;&nbsp;&nbsp;<br/><span class="err"></span>
               </td>
               <td valign="middle" align="left" class="input_txt" width="20%">Completion Date :</td>
                  <td valign="middle" align="left" class="input_txt" width="20%"><input type="text" name="completion_date" class="input_txtbx" id="datepicker1" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"  /><br/>
                  <span id="datepicker11" style="color:red"></span>
                  <span class="err"><form:errors path="ManagementReview.completion_date"></form:errors></span></td>                
                  </tr>
                  
                      <tr class="row1" >
                  <td valign="middle" align="left" class="input_txt" width="20%">Action Detail :</td>
                  <td valign="middle" align="left" class="input_txt" width="20%"><input type="text" name="action_detail" class="input_txtbx" id="actiondetail" onmouseover="showTooltip('tooltip_id','inp_id3');" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"  onmouseout="hideTooltip('tooltip_id');" onInput="return validatename1();" maxlength="32"/><br/>
                  <span id="actiondetailerror" style="color:red"></span>
                  <span class="err"><form:errors path="ManagementReview.action_detail"></form:errors></span></td>                
                  
                  </tr>
           	       <tr class="row2" >
                  <td valign="middle" align="left" class="input_txt" width="20%">Responsibility :</td>
                  <td valign="middle" align="left" class="input_txt" width="20%"><input type="text" name="responsibility" class="input_txtbx" id="responsibility" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" maxlength="32" /><br/>
                   <span id="responsibilityerror" style="color:red"></span>
                  <span class="err"><form:errors path="ManagementReview.responsibility"></form:errors></span></td>                
                   
                  </tr>
                  
                   <tr class ="row1" >
                   
         		   <td valign="middle" align="left" class="input_txt" width="20%">Continuous Improvement Project (Y/N) :</td>
                  </td>                
                  	<td valign="top" align="left" class="input_txt" width="20%"><input
															type="radio" name="continuous_improvement_project" value="Yes"
															class="input_txt" checked >Yes&nbsp;&nbsp;&nbsp;<input
															type="radio" name="continuous_improvement_project" value="No"
															class="input_txt" id="inp_continuous_improvement_project" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" /><span class="err"><form:errors path="ManagementReview.continuous_improvement_project"></form:errors></span>No
															
					</td>															
                  
                   </tr>
           
                 <!-- <tr class="row2">
                 <td valign="middle" align="left" class="input_txt" width="20%"></td>
                 <td colspan="1" align="left">
                  <td valign="middle" align="left" class="input_txt" width="20%"><input type="submit" class="submit_btn1" name="submit" id="id_submit" onclick="return validate();" onmouseover="showTooltip('tooltip_id','inp_id3');" /><br/></td>
                  <td valign="middle" align="left" class="input_txt" width="20%">
              <td valign="middle" align="left" class="input_txt" width="20%">
               </tr> -->
                 <tr class="row1">
                  <td valign="bottom" colspan="4"align="right">&nbsp;<input type="submit" value="Submit" onclick="return validate();"class="submit_btn1"></td>
                  
                </tr>
                                
                              </table>
              
            </div>
          </div></td>
      </tr>
      </table>
      </div>
      
</form>

</tr>
</table>
<br/><br/><br/><br/><br/><br/><br/><br/>

<script>
$(function() {
	$("#attendeelistwithtitles").on("keypress", function(e) {
	
	if (e.which === 32 && !this.value.length)
        e.preventDefault();
});
});
$(function() {
	$("#nextmanagementreviewby").on("keypress", function(e) {
	
	if (e.which === 32 && !this.value.length)
        e.preventDefault();
});
});
$(function() {
	$("#assessment").on("keypress", function(e) {
	
	if (e.which === 32 && !this.value.length)
        e.preventDefault();
});
});

$(function() {
	$("#reportlink").on("keypress", function(e) {
	
	if (e.which === 32 && !this.value.length)
        e.preventDefault();
});
});

$(function() {
	$("#actiondetail").on("keypress", function(e) {
	
	if (e.which === 32 && !this.value.length)
        e.preventDefault();
});
});

$(function() {
	$("#responsibility").on("keypress", function(e) {
	
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
function validatename3(id){
	
    var textInput = document.getElementById(id).value;
    textInput = textInput.replace(/[^A-Z0-9 ]/g, "");
    document.getElementById(id).value = textInput;
}  
</script>
<script type="text/javascript">
function validate()
{
	var error = "";
	/* var website = /(ftp|http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/; */
	 var website= /^[a-zA-Z0-9]+[a-zA-Z0-9.-]+\.[a-zA-Z]{2,3}$/;
	var date = /^\d{4}-(0?[1-9]|1[012])-(0?[1-9]|[12][0-9]|3[01])$/;
	
	var attendeelistwithtitles = document.getElementById('attendeelistwithtitles').value;
	var datepicker3 = document.getElementById('datepicker3').value;
	var nextmanagementreviewby  = document.getElementById('nextmanagementreviewby').value;
	var category = document.getElementById('category').value;
	var assessment= document.getElementById('assessment').value;
	var reportlink = document.getElementById('reportlink').value;
	var actiondetail = document.getElementById('actiondetail').value;
	var datepicker2 = document.getElementById('datepicker2').value;
	var responsibility = document.getElementById('responsibility').value;
	var datepicker1 = document.getElementById('datepicker1').value;
	if(attendeelistwithtitles =="")
		{
		 document.getElementById("attendeelistwithtitleserror").innerHTML="Required field should not be empty";
		 error="true";
		}
	else if(attendeelistwithtitles.charAt(0) == " ")
	{
		 document.getElementById("attendeelistwithtitleserror").innerHTML="Initial spaces not allowed";
		 error="true";
	}
	else if((attendeelistwithtitles.length < 4) ||(attendeelistwithtitles.length > 32))
		{
		document.getElementById("attendeelistwithtitleserror").innerHTML="Required field should be length of 4 to 32";
		error="true";
		
		}
	else {
		document.getElementById("attendeelistwithtitleserror").innerHTML="";
		
	}
	
	if(nextmanagementreviewby == "")
		{
		 document.getElementById("nextmanagementreviewbyerror").innerHTML="Required field should not be empty";
			error="true";
		
		}
	else if(nextmanagementreviewby.charAt(0) == " ")
	{
		 document.getElementById("nextmanagementreviewbyerror").innerHTML="Initial spaces not allowed";
		 error="true";
	}
	else if((nextmanagementreviewby.length < 4) ||(nextmanagementreviewby.length > 32))
	{
	document.getElementById("nextmanagementreviewbyerror").innerHTML="Required field should be length of 4 to 32";
	error="true";
	
	}
	else {
			document.getElementById("nextmanagementreviewbyerror").innerHTML="";
	
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
	 document.getElementById("datepicker33").innerHTML="Invalid date";
	 error="true";
	 }
	  if(category == "")
		  {
		  document.getElementById("categoryerror").innerHTML="Required field should not be empty";
			 error="true";
		  }
	  else {
		  document.getElementById("categoryerror").innerHTML="";
	  }
	
	if(assessment == "")
		{
		 document.getElementById("assessmenterror").innerHTML="Required field should not be empty";
		 error="true";
		
		}
	else if(assessment.charAt(0) == " ")
	{
		 document.getElementById("assessmenterror").innerHTML="Initial spaces not allowed";
		 error="true";
	}
	else if((assessment.length < 4) ||(assessment.length > 32))
		{
		document.getElementById("assessmenterror").innerHTML="Required field should be length of 4 to 32";
		error="true";
		
		}
	else
		{
		document.getElementById("assessmenterror").innerHTML="";
		}
	
	
	  if(document.getElementById("reportlink").value.match(website)==null)
  	    {
  	    	document.getElementById("reportlinkerror").innerHTML="Invalid URL format";
  	    	
  	    	 return false;
  	    }
	  if(reportlink == "")
	  {
	  document.getElementById("reportlinkerror").innerHTML="Required field should not be empty";
	    	error="true";
	  }
	  else if(reportlink.charAt(0) == " ")
		{
			 document.getElementById("reportlinkerror").innerHTML="Initial spaces not allowed";
			 error="true";
		}
  	/* 	else  if(reportlink.match(website))
	   {
	  
		   document.getElementById("reportlinkerror").innerHTML="";
	   }
	   
   else
	   {
	   document.getElementById("reportlinkerror").innerHTML="Invalid URL";
	    	error="true";
	   } */
   
	if(actiondetail == "")
		{
		
		 document.getElementById("actiondetailerror").innerHTML="Required field should not be empty";
		 error="true";
		
		}
		 else if(actiondetail.charAt(0) == " ")
		{
			 document.getElementById("actiondetailerror").innerHTML="Initial spaces not allowed";
			 error="true";
		}
		else if((actiondetail.length < 4) ||(actiondetail.length > 32))
		{
		document.getElementById("actiondetailerror").innerHTML="Required field should be length of 4 to 32";
		error="true";
		
		}
		else
		{
		document.getElementById("actiondetailerror").innerHTML="";
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
	 document.getElementById("datepicker22").innerHTML="Invalid date";
	 error="true";
	 }
	
	if(responsibility =="")
	{
		 document.getElementById("responsibilityerror").innerHTML="Required field should not be empty";
		 error="true";
		
	}
	 else if(responsibility.charAt(0) == " ")
		{
			 document.getElementById("responsibilityerror").innerHTML="Initial spaces not allowed";
			 error="true";
		}
	else if((responsibility.length < 4) ||(responsibility.length > 32))
		{
		document.getElementById("responsibilityerror").innerHTML="Required field should be length of 4 to 32";
		error="true";
		
		}
	else
		{
		document.getElementById("responsibilityerror").innerHTML="";
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
	 document.getElementById("datepicker11").innerHTML="Invalid date";
	 error="true";
	 }
	if(error=="true")
		{
		return false;
		}
	}



</script>
   <script>
 $(function() {
	 $( "#datepicker1" ).datepicker({dateFormat: 'yy-mm-dd'});
        });
 
</script>
   <script>
 $(function() {
           $( "#datepicker3" ).datepicker({dateFormat: 'yy-mm-dd'});
         });
 
</script>
   <script>
 $(function() {
	 $( "#datepicker2" ).datepicker({dateFormat: 'yy-mm-dd'});
     
         });
 
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
      <jsp:include page="footer.jsp"></jsp:include>



 