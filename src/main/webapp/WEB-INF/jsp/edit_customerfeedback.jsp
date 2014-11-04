<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" />
<script src="resources/js/jquery.min.js"></script>
 <script src="resources/js/jquery-ui.js"></script>
<form method="post" enctype="multipart/form-data" action="updatefeedback">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
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
       <td>
       	 <div>
  <ul class="horizmenu" style=" float:left;margin-left:190px; margin-top:8px;">
						
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addcustomer" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Add Customers</span>
									
								</a>
							</li>
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="viewcustomers" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>View Customers</span>
									
								</a>
							</li>
						
				          <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addfeedback" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Add Feedback</span>
									
								</a>
							</li>
				           <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="viewfeedback" class="<c:choose>
								<c:when test="${menu=='customer'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									<span>View feedback</span>
									
								</a>
							</li>
				           <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="feedback_report" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Feedback Report</span>
									
								</a>
							</li>
				            </ul>
  </div>
       </td>
      </tr>
      <tr>
        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2>Update Customer Feedback Details</h2>
            </div>
            <div class="contentbox">
                           <table cellpadding="0" cellspacing="0" border="0" width="100%" style="border:#993300  2px solid; padding:15px; margin-bottom:15px;">

              <c:set value="${customerFeedbackForm.customerFeedbacks[0]}" var="customerfeedbacks"></c:set>
                <tr class="row1">
             
                 <td valign="middle" align="left" class="input_txt" width="30%">    <input type="hidden" name="feedback_id" value="${customerfeedbacks.feedback_id }"/>
               Date of Feedback :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="date_of_feedback" class="input_txtbx" id="datepicker" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value='<c:out value="${customerfeedbacks.date_of_feedback}"></c:out>' /></br>
                  <span id="datepicker1" style="color:red"></span>
                  <span class="err"><form:errors path="CustomerFeedback.date_of_feedback"></form:errors></span></td>
                  </tr>
                   <tr class="row2">
                 <td valign="middle" align="left" class="input_txt" width="30%"> Type of Feedback :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">
                  <select name="type_of_feedback" class="input_txtbx">
                  <option <c:if test="${customerfeedbacks.type_of_feedback eq 'Complaint'}"><c:out value="Selected"/></c:if> value="Complaint">Complaint</option>
                  <option <c:if test="${customerfeedbacks.type_of_feedback eq 'Suggestion'}"><c:out value="Selected"/></c:if> value="Suggestion">Suggestion</option>
                  <option <c:if test="${customerfeedbacks.type_of_feedback eq 'Product Return'}"><c:out value="Selected"/></c:if> value="Product Return">Product return</option>                  
                  </select>
                  
                  <br/><span class="err"></span></td>
                  </tr>
                  <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="30%"> Feedback Recorded by :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">
                  <select name="feedback_recorded_by" class="input_txtbx">
                  <option <c:if test="${customerfeedbacks.feedback_recorded_by eq'name1'}"><c:out value="Selected"/></c:if> value="name1">Associate name1</option>
                  <option <c:if test="${customerfeedbacks.feedback_recorded_by eq'name2'}"><c:out value="Selected"/></c:if> value="name2">Associate name2</option>
                  <option <c:if test="${customerfeedbacks.feedback_recorded_by eq'name3'}"><c:out value="Selected"/></c:if> value="name3">Associate name3</option>                  
                  </select>                  
                  <br/><span class="err"></span></td>
                  </tr>
                   <tr class="row2">
                 <td valign="middle" align="left" class="input_txt" width="30%"> Feedback Details :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">
                  <textarea class="input_txtbx" name="feedback_details" id="id_feedback_details" style="height: 89px;"><c:out value="${customerfeedbacks.feedback_details}"></c:out></textarea>                  
                 <br/> <span id="feedbackdetailserror" style="color:red"></span>
                  <span class="err"><form:errors path="CustomerFeedback.feedback_details"></form:errors></span></td>
                  </tr>
                  <tr class="row1">
                 <td valign="middle" align="left" class="input_txt" width="30%"> Attachments :</td>
                	<td valign="middle" align="left" id="image" value="${customerfeedbacks.attachment_name}">${customerfeedbacks.attachment_name}
                 <input type="file" name="attachments" class="input_txtbx1" id="attachment" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value='<c:out value="${customerfeedbacks.attachments}"></c:out>'></br>
                 
                 <span id="imageerror" style="color:red"class="err"></span></td>
                 </tr> 
                  
                   <!--  <tr class="row1">
               <td></td>
                  <td valign="middle" align="left" class="input_txt" ><input type="submit" class="submit_btn1" value="Update" id="id_submit"style="width:170px;" onclick="return validate();"onmouseover="showTooltip('tooltip_id','inp_id3');" /><br/></td>
                  </tr> -->
                    <tr class="row1">
                  <td valign="bottom" colspan="2"align="right" style="padding-right:605px;">&nbsp;<input type="submit" value="Update" onclick="return validate();"class="submit_btn1"></td>
                  <td valign="top" align="left"></td>
                </tr>
                  
              </table>
              
            </div>
          </div></td>
      </tr>
      </table>
      </div>
      
</form>
<script>
$(function() {
	$("#id_feedback_details").on("keypress", function(e) {
	
	if (e.which === 32 && !this.value.length)
        e.preventDefault();
});
});


</script>
<script type="text/javascript">
function validate()
{

	var error ="";
	var date = /^(0?[1-9]|1[012])[\/](0?[1-9]|[12][0-9]|3[01])[\/]\d{4}$/;	
	var datepicker123 = document.getElementById('datepicker').value;
	var feedbackdetails = document.getElementById('id_feedback_details').value;
	var image = document.getElementById('image').value;
	 if(datepicker123 == "")
	 {
	 document.getElementById("datepicker1").innerHTML="Required field should not be empty";
	error="true";
	 
	 }
	 else if(datepicker123.match(date))
	 {
	 document.getElementById("datepicker1").innerHTML="";
	 }
	 else
	 {
	 document.getElementById("datepicker1").innerHTML="Invalid date format";
	 error="true";
	 }
	 
	 
	 if(feedbackdetails == "")
		 {
		 document.getElementById("feedbackdetailserror").innerHTML="Required field should not be empty";
			error="true";
		 }
	 else if(feedbackdetails.charAt(0) == " ")
		 {
		 document.getElementById("feedbackdetailserror").innerHTML="Should not accept initial space";
			error="true";
		 }
	 else  if((feedbackdetails.length < 4) ||(feedbackdetails.length > 400))
	   {
		   document.getElementById("feedbackdetailserror").innerHTML="Required field should be length of 4 to 400";
	    	error="true";
			}
	 else
	 {
		 document.getElementById("feedbackdetailserror").innerHTML="";
	 }
	 
	 if(image == "")
		 {
		 document.getElementById("imageerror").innerHTML="Please upload a file";
			error="true";
		 }
	 else
		 {
		 document.getElementById("imageerror").innerHTML="";
		 }
	 if(error == "true")
		 {
		 return false;
		 }
	
}






</script>
 <script>
 $(function() {
           $( "#datepicker" ).datepicker();
         });
 
</script>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<jsp:include page="footer.jsp"></jsp:include>
