<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="qms.model.ManagementReview"%>
<link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" />
<jsp:include page="header.jsp"></jsp:include>
<script src="resources/js/jquery.min.js"></script>
 <script src="resources/js/jquery-ui.js"></script>

<form method="post" action="updatemanagementreview">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
    	<tr>
		<td>
			<div>
				<ul class="horizmenu" style=" float:left;margin-left:190px; margin-top:8px;">
<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addmanagementreview" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Add Management Review</span>
									
								</a>
							</li>
							
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="viewmanagementreview" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
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
    <c:if test="${status=='true'}">
    <tr>
    
        <td valign="top" align="left" style="padding:5px 0 10px 0;">
			<div class="status success">
	            <p class="closestatus"><a title="Close" href="">x</a></p>
	            <p><img alt="Success" src="images/icons/icon_success.png"><span>Success!</span>.</p>
	       	</div>                          
		</td>
		
      </tr></c:if>
      <tr>
        <td valign="top" align="left" style="padding:5px 0 10px 0;"></td>
      </tr>
      <tr>
        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2>Update Management Review Details</h2>
            </div>
            <div class="contentbox">
              <div style="border:#993300  2px solid; padding:15px; margin-bottom:15px;">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
      
             <c:set value="${managementreviewForm.managementreviewdetails[0]}" var="managementReviewdetails"></c:set>
             <tr class="row2">
				                  <td valign="middle" align="left" class="input_txt" width="30%">Review ID :</td>
				                  <td valign="middle" align="left" class="input_txt" width="30%">
                                  <input type="text" name="review_id" id="review_id" class="input_txtbx" readonly="readonly" value="<c:out value="${managementReviewdetails.review_id}"/>"/>
				                  	<font color="Red" size="+1"></font>
				                  	
				                  </td>
				                   
                 <td valign="middle" align="left" class="input_txt" width="30%">Management Review Date :</td>
                  <td valign="middle" align="left" class="input_txt" width="30%"><input type="text" name="management_review_date" class="input_txtbx" id="datepicker3" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"  onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value='<c:out value="${managementReviewdetails.management_review_date}"></c:out>'>
                  <br>  <span id="datepicker33" style="color:red"></span>
                  
                   <span class="err"><form:errors path="ManagementReview.management_review_date"></form:errors></span></td>
                </tr>
                
                  <tr class="row1">
                 <td valign="middle" align="left" class="input_txt" width="30%">Attendee List:</td>
                  <td valign="middle" align="left" class="input_txt" width="20%">
                 
                    <select name="attendee_list_with_titles" class="input_txtbx" id="attendeelistwithtitles" onchange="doAjaxPost_getjobtitle();">
						                  <option value="">--Select--</option>
						                     	<c:forEach items="${employeeForm.employees}" var="managements" varStatus="true">
               						<option value="<c:out value="${managements.name}"/>"><c:out value="${managements.name}"/></option>
               						</c:forEach>
				                 </select>
				                
                  <br/>				
                    <span id="attendeelistwithtitleserror" style="color:red"></span>
                  <span class="err"></span></td>
                 
                 <td valign="middle" align="left" class="input_txt" width="30%">Next Management Review By :</td>
                  <td valign="middle" align="left" class="input_txt" width="30%"><input type="text" name="next_management_review_by" class="input_txtbx" id="nextmanagementreviewby"onkeypress="return onlyAlphabets(event,this);" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"  onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" maxlength="32" value='<c:out value="${managementReviewdetails.next_management_review_by}"></c:out>'>
                  <br>   <span id="nextmanagementreviewbyerror" style="color:red"></span>
                   <span class="err"><form:errors path="ManagementReview.next_management_review_by"></form:errors></span></td>
                  </tr>
                   <tr class="row2">
				 <td valign="middle" align="left" class="input_txt" width="20%">Job Title :</td>
                  <td valign="middle" id="job_title" align="left" class="input_txt" width="20%" style="display:none;"> <span id="job_title_id"></span>
                  <br/><input type="button" value="Add" onclick="add_new_attendee();" id="add1"/>
                  
                  </td> 
		 		</tr>
                   <tr class="row1">
                   <td colspan="4" align="center"><div id="review_attendees"></div></td>
					</tr>
                   <tr class="row2">
                 <td valign="middle" align="left" class="input_txt" width="30%">Category :</td>
                  <td valign="middle" align="left" class="input_txt" width="30%">
                  <select name="category" id="category" class="dropdown" >
				                  		<option value="">--Select--</option>
						                      
						                  <option <c:if test="${managementReviewdetails.category eq 'audits'}"><c:out value="Selected"/></c:if> value="audits" >Audits</option>
						                  <option <c:if test="${managementReviewdetails.category eq 'corrective and prev actions'}"><c:out value="Selected"/></c:if> value="corrective and prev actions" >Corrective and Prev Actions</option>
										  <option <c:if test="${managementReviewdetails.category eq 'cost of non conformance'}"><c:out value="Selected"/></c:if> value="cost of non conformance" >Cost of Nonconformance</option>
										  <option <c:if test="${managementReviewdetails.category eq 'customer satisfaction'}"><c:out value="Selected"/></c:if> value="customer satisfaction" >Customer Satisfactions</option>
										  <option <c:if test="${managementReviewdetails.category eq 'suppliers'}"><c:out value="Selected"/></c:if> value="suppliers" >Suppliers</option>
										  <option <c:if test="${managementReviewdetails.category eq 'human resources'}"><c:out value="Selected"/></c:if> value="human resources" >Human Resources</option>
										  <option <c:if test="${managementReviewdetails.category eq 'product/service conformity'}"><c:out value="Selected"/></c:if> value="product/service conformity" >Product / Service Conformity</option>
										  <option <c:if test="${managementReviewdetails.category eq 'previous items'}"><c:out value="Selected"/></c:if> value="previous items" >Previous items</option>
										  <option <c:if test="${managementReviewdetails.category eq 'recommendations for improvement'}"><c:out value="Selected"/></c:if> value="recommendations for improvement" >Recommendations for Improvement</option>
										  <option <c:if test="${managementReviewdetails.category eq 'significant cchanges to the QMS'}"><c:out value="Selected"/></c:if> value="significant changes to the QMS" >Significant Changes to the QMS</option>	
				                   	</select>
						           		<br/>
						           		<span id="categoryerror" style="color:red"></span><span class="err"><form:errors path="ManagementReview.category"></form:errors></span>
				                   	</td>	
                  
                  
                  <td valign="middle" align="left" class="input_txt" width="30%">
             	  Report Link :<td valign="middle" align="left" class="input_txt" width="30%"> <input type="text" name="report_link" class="input_txtbx" id="reportlink" maxlength="32" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"onInput="return validatename1();" value='<c:out value="${managementReviewdetails.report_link}"></c:out>'> <br> <span id="reportlinkerror" style="color:red"></span>
                  <span class="err"><form:errors path="ManagementReview.report_link"></form:errors></span></tr>
                   <tr class="row1">
                 <td valign="middle" align="left" class="input_txt" width="30%">Assessment :</td>
                  <td valign="middle" align="left" class="input_txt" width="30%"><textarea name="assessment" class="input_txtbx"  style="height: 50px;" id="assessment"  onmouseover="showTooltip('tooltip_id','inp_id3');" maxlength="200" onmouseout="hideTooltip('tooltip_id');"onInput="return validatename3();">${managementReviewdetails.assessment}</textarea> 
                  <br>  <span id="assessmenterror" style="color:red"></span>
                  <span class="err"><form:errors path="ManagementReview.assessment"></form:errors></span></td>
                  
                 <td valign="middle" align="left" class="input_txt" width="30%">Action Due Date :</td>
                  <td valign="middle" align="left" class="input_txt" width="30%"> 
                 <input type="text" name="action_due_date" class="input_txtbx" id="datepicker2" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"  onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value='<c:out value="${managementReviewdetails.action_due_date}"></c:out>'>
                  <br>  <span id="datepicker22" style="color:red"></span>
                  <span class="err"><form:errors path="ManagementReview.action_due_date"></form:errors></span></td>
                  </tr>
                   <tr class="row2">
                 <td valign="middle" align="left" class="input_txt" width="30%">Action Needed(Y/N) :</td>
                  <td valign="middle" align="left" class="input_txt" width="30%">
                   <input type="radio" name="action_needed" value="Yes"  id="action_needed_yes" <c:if test="${managementReviewdetails.action_needed=='Yes'}"><c:out value="checked=checked"/></c:if>>Yes&nbsp;&nbsp;&nbsp;
                   <input type="radio" name="action_needed" value="No" id="action_needed_no" <c:if test="${managementReviewdetails.action_needed=='No'}"><c:out value="checked=checked"/></c:if>>No&nbsp;&nbsp;&nbsp;<br/><span class="err"></span>
              <td>Completion Date :</td><td><input type="text" name="completion_date" class="input_txtbx" id="datepicker1" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"  onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value='<c:out value="${managementReviewdetails.completion_date}"></c:out>'>
                <br><span id="datepicker11" style="color:red"></span>  
				 <span class="err"><form:errors path="ManagementReview.completion_date"></form:errors></span></td>
               </tr>
                   <tr class="row1">
                 <td valign="middle" align="left" class="input_txt" width="30%">Action Detail :</td>
                  <td valign="middle" align="left" class="input_txt" width="30%"><input type="text" name="action_detail" class="input_txtbx" id="actiondetail" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"  onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" onInput="return validatename1();" maxlength="32" value='<c:out value="${managementReviewdetails.action_detail}" ></c:out>'> 
                  <br>   <span id="actiondetailerror" style="color:red"></span>
                  <span class="err"><form:errors path="ManagementReview.action_detail"></form:errors></span></td>
                
                 <td valign="middle" align="left" class="input_txt" width="30%"></td>
                  <td valign="middle" align="left" class="input_txt" width="30%"></td>
                  </tr>
                   <tr class="row2">
                 <td valign="middle" align="left" class="input_txt" width="30%"> Responsibility :</td>
                  <td valign="middle" align="left" class="input_txt" width="30%"><input type="text" name="responsibility" class="input_txtbx" id="responsibility"  onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value='<c:out value="${managementReviewdetails.responsibility}"></c:out>' maxlength="32"> 
                  <br> <span id="responsibilityerror" style="color:red"></span>
                  <span class="err"><form:errors path="ManagementReview.responsibility"></form:errors></span></td>
                
                 <td valign="middle" align="left" class="input_txt" width="30%"> </td>
                  <td valign="middle" align="left" class="input_txt" width="30%"></td>
                  </tr>
                   <tr class="row1">
                 <td valign="middle" align="left" class="input_txt" width="30%"> Continuous Improvement Project (Y/N) :</td>
                  <td valign="middle" align="left" class="input_txt" width="30%">
             	     <input type="radio" name="continuous_improvement_project" value="Yes"  class="input_txt" id="id_continuous_improvenement_project" onmouseover="showTooltip('tooltip_id','inp_id3');" 
             	     				onmouseout="hideTooltip('tooltip_id');"<c:if test="${managementReviewdetails.continuous_improvement_project=='Yes'}"><c:out value="Checked=checked"/></c:if>>Yes&nbsp;&nbsp;&nbsp;
					 <input type="radio" name="continuous_improvement_project" value="No"  class="input_txt"  id="id_continuous_improvenement_project" onmouseover="showTooltip('tooltip_id','inp_id3');" 
					 				onmouseout="hideTooltip('tooltip_id');"<c:if test="${managementReviewdetails.continuous_improvement_project=='No'}"><c:out value="Checked=checked"/></c:if>>No&nbsp;&nbsp;&nbsp;
				  </td>
                 
                 
                  </tr>
             <!--  <tr class="row2">
                 <td valign="middle" align="left" class="input_txt" width="30%"></td>
                 <td colspan="1" align="right">
                  <td valign="middle" align="left" class="input_txt" width="30%"><input type="submit" class="submit_btn1" value="Update" name="submit" id="id_submit"onclick="return validate();" onmouseover="showTooltip('tooltip_id','inp_id3');" /><br/></td>
                 <td valign="middle" align="right" class="input_txt" width="30%">
             	 <td valign="middle" align="left" class="input_txt" width="30%">
             	 </tr> -->
                    <tr class="row1">
                  <td valign="bottom" colspan="4"align="right">&nbsp;<input type="submit" value="Update" onclick="return validate();"class="submit_btn1"></td>
               
                </tr>
                  
              </table>
              
            </div>
          </div></td>
      </tr>
      </table><br/><br/><br/><br/><br/><br/><br/><br/>
      </div>
      
</form>

<script>
function doAjaxPost_getjobtitle()
{

	var management_name = $('#attendeelistwithtitles').val();
	if(management_name == "")
		document.getElementById('job_title').style.display="none";
	else
		document.getElementById('job_title').style.display="block";
	$.ajax({
		type : "POST",
		url : "/QMS_App/ajax_getjobtitle",
		data : "name=" + management_name,
		success : function(response) {
			
			$('#job_title_id').html(response);
		
		},
		error : function(e) {
			alert('Error: ' + e);
		}
	});

	
}
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
function validateres(id){
	
    var textInput = document.getElementById(id).value;
    textInput = textInput.replace(/[^A-Za-z0-9 ]/g, "");
    document.getElementById(id).value = textInput;
}
</script>

<!-- Load Review Attendees List  -->
<script>
$(window).load(
		function doGetattendees() {
			var review_id = $('#review_id').val();
			
			$.ajax({  
				    type: "POST",  
				    url: "/QMS_App/edit_attendees",  
				    data: "review_id=" + review_id,
				    success: function(response){ 
				    	
					$('#review_attendees').html(response);
		  			},  
				    error: function(e){  
				      alert('Error: ' + e);  
				    }  
				  });  
				}  
				);			
</script>
<script>
function doRemoveattendee(auto_id,review_id)
{

		$.ajax({
		type : "POST",
		url : "/QMS_App/edit_remove_added_attendee",
		data : "id="+auto_id+"&review_id="+review_id,
		success : function(response) {
			
			$('#review_attendees').html(response);
			
		},
		error : function(e) {
			//alert('Error: ' + e);
		}
	});
}

function add_new_attendee()
{
	var review_id = $('#review_id').val();
	var management_name = $('#attendeelistwithtitles').val();
	var job_title = $('#hidden_process_owner').val();
	
	$.ajax({
		type : "POST",
		url : "/QMS_App/add_attendee_in_edit",
		data : "name=" + management_name+"&job_title="+job_title+"&review_id="+review_id,
		success : function(response) {
			
			$('#review_attendees').html(response);
			 $('#attendeelistwithtitles').val("");
			 $('#process_owner_lbl').text("");
			 $('#hidden_process_owner').val("");
			 
		},
		error : function(e) {
			//alert('Error: ' + e);
		}
	});
}			

</script>

<script type="text/javascript">
function validate()
{
	var error = "";
/* 	var website = /(ftp|http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/; */
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
	/* if(attendeelistwithtitles =="")
		{
		 document.getElementById("attendeelistwithtitleserror").innerHTML="Required field should not be empty";
			error="true";
		} */
	/* else if(attendeelistwithtitles.charAt(0) == " ")
	{
		 document.getElementById("attendeelistwithtitleserror").innerHTML="Should not accept initial space";
		 error="true";
	}
	else if((attendeelistwithtitles.length < 4) ||(attendeelistwithtitles.length > 32))
		{
		document.getElementById("attendeelistwithtitleserror").innerHTML="Required field should be length of 4 to 32";
		error="true";
		
		} */
	
	if(nextmanagementreviewby == "")
		{
		 document.getElementById("nextmanagementreviewbyerror").innerHTML="Required field should not be empty";
			error="true";
		
		}
	else if(nextmanagementreviewby.charAt(0) == " ")
	{
		 document.getElementById("nextmanagementreviewbyerror").innerHTML="Should not accept initial space";
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
		 document.getElementById("assessmenterror").innerHTML="Should not accept initial space";
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
	
	
	  if(reportlink == "")
	  {
	  document.getElementById("reportlinkerror").innerHTML="Required field should not be empty";
	    	error="true";
	  }
	  else if(reportlink.charAt(0) == " ")
		{
			 document.getElementById("reportlinkerror").innerHTML="Should not accept initial space";
			 error="true";
		}
  else  if(reportlink.match(website))
	   {
	  
		   document.getElementById("reportlinkerror").innerHTML="";
	   }
	   
   else
	   {
	   document.getElementById("reportlinkerror").innerHTML="Invalid URL";
	    	error="true";
	   }
   
	if(actiondetail == "")
		{
		
		 document.getElementById("actiondetailerror").innerHTML="Required field should not be empty";
		 error="true";
		
		}
	 else if(actiondetail.charAt(0) == " ")
		{
			 document.getElementById("actiondetailerror").innerHTML="Should not accept initial space";
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
			 document.getElementById("responsibilityerror").innerHTML="Should not accept initial space";
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
	 document.getElementById("datepicker11").innerHTML="Invalid Date";
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
