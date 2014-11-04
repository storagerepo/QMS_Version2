<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" />
<script src="resources/js/jquery.min.js"></script>
 <script src="resources/js/jquery-ui.js"></script>
<head>
<script  language="javascript">
function validate()
{
//alert("Are sure you wants to delete this record");
 var chks = document.getElementsByName('chkUser');
var hasChecked = false;
for (var i = 0; i < chks.length; i++)
{
if (chks[i].checked)
{
hasChecked = true;
break;
}
}
if (hasChecked == false)
{
alert("Please select at least one.");
return false;
}
var result=confirm("Are you sure want to remove this record?");
if(result)
	{
return true;
	}
else
	{ 
	return false;
	}
}	</script>

<script>
 $(function() {
           $( "#datepicker" ).datepicker();
         })
 
</script>
</head>
<div id="right_content">

	
		<table cellpadding="0" cellspacing="0" border="0" width="98%"
			class="margin_table">
<tr>
<td>
<div>
   <ul class="horizmenu">
						
	
					<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="customersdelete" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									Delete Customers
								</a>
							</li>
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="customersfeedbackdelete" class="<c:choose>
								<c:when test="${menu=='customer'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									Delete Customers Feedback
								</a>
							</li>
							
							</ul>
													
  </div>
</td>
</tr>
<c:if test="${success=='delete'}">
			<tr>
				<td valign="top" align="left" style="padding: 5px 0 10px 200px;">&nbsp;
					<div id="success_statusbar" class="status success">
						<p class="closestatus">
						<img alt="Success" src="resources/images/icons/removed.png">
						<a title="Close" href="customersfeedbackdelete">
						<img alt="Success" src="resources/images/icons/icon_square_close.png"></a>
						</p>
					</div></td>
			</tr>
		</c:if>
			<tr>
				<td valign="top" align="left"><div>
						<div class="headings altheading">
							<h2>Delete Customer Feedbacks</h2>
						</div>
						 <div class="contentbox">
						 <div style="border:#ccc 2px solid; padding:15px; margin-bottom:15px;">
							<form action="findcustomerfeedbacks" method="GET">
							
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr>
							    <td align="left" valign="middle" width="10%">Date of Feedback : </td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="date_of_feedback" id="datepicker"  class="input_txtbx" value="${date}" ></td>
							    <td width="10%"></td>
							    <td align="left" valign="middle" width="10%">&nbsp;Type of Feedback : </td>
							    <td align="left" valign="middle" width="10%">
							    <!-- <input type="text" name="type_of_feedback" id="type" class="input_txtbx"></td> -->
							    
							     <select name="type_of_feedback" class="input_txtbx" id="type">
				                  		<option value="">--Select--</option>
						                      
						                  <option <c:if test="${type eq 'Complaint'}"><c:out value="Selected"/></c:if>  value="Complaint" >Complaint</option>
						                  <option <c:if test="${type eq 'Suggestion'}"><c:out value="Selected"/></c:if> value="Suggestion" >Suggestion</option>
										  <option <c:if test="${type eq 'Product Return'}"><c:out value="Selected"/></c:if> value="Product Return" >Product Return</option>
								</select></td>
							    
							    <td align="center" valign="middle" width="20%"><input type="submit" class="submit_btn1" value="Search" name="findcustomerfeedbacks" ></td>
							  	<!-- <td align="center" valign="middle" width="20%"><input type="submit" class="submit_btn1" value="Clear" name="welcome" ></td> -->
							  </tr>
							</table>
							</form>
						</div>
					<form action="deletecustomersfeedback" name="dashboard" onsubmit="return validate()" method="POST">
							<table cellpadding="0" cellspacing="0" border="0" width="100%">
								<tr class="title">
									<td valign="top" align="left" width="10%">Select</td>
									<td valign="top" align="left" width="15%">Date of Feedback</td>
					         	<td valign="top" align="left" width="15%">Type of Feedback</td>
					           <td valign="top" align="left" width="20%">Feedback Recorded By</td>
 							 	<td valign="top" align="left" width="20%">Feedback Details</td> 
          						<td valign="top" align="left" width="15%">Attachments</td>
          							
									</tr>

								<!-- Display Admin Userd here  Suresh--> 
								<% int i=1; %>
							       	<c:if test="${fn:length(customerFeedbackForm.customerFeedbacks) gt 0}">	
									<c:forEach items="${customerFeedbackForm.customerFeedbacks}" var="customerFeedbacks" varStatus="status">
							       		<% if(i==1)
							       			i=2;
							       			else
							       			i=1;%>
							       		<tr class="row<%=i%>" onmouseover="mouse_event(this,"row_hover");" onmouseout="mouse_event(this,"row1");">
							       		<td valign="top" align="left" width="10%"><input type="checkbox" name="chkUser" value="${customerFeedbacks.feedback_id}"/></td>
					<%-- 			           	<td valign="top" align="left"  width="10%">${documentMains.document_id}</td> --%>
									       <td valign="top" align="left"  width="15%">${customerFeedbacks.date_of_feedback}</td>
											<td valign="top" align="left" width="15%">${customerFeedbacks.type_of_feedback}</td>
									 	 <td valign="top" align="left" width="20%">${customerFeedbacks.feedback_recorded_by}</td>
									 	 <td valign="top" align="left" width="20%">${customerFeedbacks.feedback_details}</td>
									 	 <c:choose>
											<c:when test="${customerFeedbacks.attachment_name!='null'}">
											<td valign="top" align="left" width="15%"><a href="<c:out value="download_attachment?fid=${customerFeedbacks.feedback_id}"></c:out>">Download</a></td>
										</c:when>
										<c:otherwise><td valign="top" align="center" width="10%">No Document</td>
										</c:otherwise>
										</c:choose>	
											
											</td>
										</tr>
							    	</c:forEach>
							    	</c:if>
							    	<c:if test="${justcame ne false}">
									<c:if test="${fn:length(customerFeedbackForm.customerFeedbacks)== 0}">
							    	<tr class="row1">
							    	<td colspan="7" width="100%"><span style="color:red"><center><b>No Records Found!!!</b></center></span></td>
							    	</tr>
							    	</c:if></c:if>
						    				


								</table>
								<br>
								<li>&nbsp;&nbsp;&nbsp;<input type="submit" value="Remove" class="submit_btn1"></li>
</form>
								<div style="clear: both;"></div>
								</div>
								</div>
								</td>
								</tr>
								<tr>
									<td valign="top" align="left">&nbsp;</td>
								</tr>
							    	<tr>
							    	<td colspan="6">  
	<div class="extrabottom">
             <ul class="pagination">
             <c:if test="${currentpage!=1&&currentpage!=null}">
             <li class="page_unselect"><a href="viewdeletefeedbackreport_page?page=${currentpage - 1}&feedbackdate=${date}&feedbacktype=${type}">Prev</a></li>
             </c:if>
              
             <%-- <c:forEach var="count" begin="1" end="${noofrows}"> --%> 
               <c:forEach begin="1" end="${noofpages}" var="i">
                <c:choose>
                    <c:when test="${currentpage eq i}">
                      <li class="page"><a class="paging_select"><c:out value="${i}"></c:out></a></li>
                     </c:when>
                    <c:otherwise>
                        <li class="page_unselect"><a href="viewdeletefeedbackreport_page?page=${i}&feedbackdate=${date}&feedbacktype=${type}"><c:out value="${i}"></c:out></a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>          
            <c:if test="${currentpage!=noofpages}">
              <li class="page_unselect"><a href="viewdeletefeedbackreport_page?page=${currentpage+1}&date_of_feedback=${date}&type_of_feedback=${type}">Next</a></li> 
                </c:if>
              <c:choose>
              <c:when test="${button=='viewall'}">
                  <li class="page"><a href="viewalldeletefeedbackreport?&date_of_feedback=${date}&type_of_feedback=${type}" class="paging_select">ViewAll</a></li>
             </c:when>
                <c:otherwise>
                  <li class="page"><a href="customersfeedbackdelete" class="paging_select">Back</a></li>
              </c:otherwise>
              </c:choose>					
		 
		  </ul>
		  </div>
		  </td>
		  </tr>
		
		</table></div>
		<table height="2%"><tr><td></td></tr></table>
								
<script  language="javascript">

$(function () {
	$('input[name="chkUser"]').click(function () {
	if ($('input[name="chkUser"]').length == $('input[name="chkUser"]:checked').length) {
	$('input:checkbox[name="chkAll"]').attr("checked", "checked");
	}
	else {
	$('input:checkbox[name="chkAll"]').removeAttr("checked");
	}
	});
	$('input:checkbox[name="chkAll"]').click(function () {
	var slvals = []
	if ($(this).is(':checked')) {
	$('input[name="chkUser"]').attr("checked", true);
	}
	else {
	$('input[name="chkUser"]').attr("checked", false);
	slvals = null;
	}
	});
	});
</script>
 <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
 
 <br><br><br><br>
 <jsp:include page="footer.jsp"></jsp:include> 