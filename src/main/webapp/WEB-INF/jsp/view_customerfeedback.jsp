<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" />
<script src="resources/js/jquery.min.js"></script>
 <script src="resources/js/jquery-ui.js"></script>
 <html style="height: 2447px; ">
<div id="right_content">
	<!-- <form name="grid" onSubmit="return validate(this)" action="" method="POST">
     -->	<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      		<tr>
      		<td>
      			 <div>
  <ul class="horizmenu">
						
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
								<c:when test="${menu=='customer'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactvie</c:otherwise></c:choose>">
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
      	
			<c:if test="${success=='true'}">
			<tr>
				<td valign="top" align="left" style="padding: 5px 0 10px 200px;">&nbsp;
					<div id="success_statusbar" class="status success">
						<p class="closestatus">
						<img alt="Success" src="resources/images/icons/inserted.png">
						<a title="Close" href="viewfeedback">
						<img alt="Success" src="resources/images/icons/icon_square_close.png"></a>		
						</p>
					</div></td>
			</tr>
		</c:if>
		<c:if test="${success=='update'}">
			<tr>
				<td valign="top" align="left" style="padding: 5px 0 10px 200px;">&nbsp;
					<div id="success_statusbar" class="status success">
						<p class="closestatus">
						<img alt="Success" src="resources/images/icons/success.png"/>
						<a title="Close" href="viewfeedback">
						<img alt="Success" src="resources/images/icons/icon_square_close.png"></a>
						</p>
					</div></td>
			</tr>
		</c:if>
      		<tr>
					<table>
					<div class="del_div">
						<p><label style="padding: 0pt 20px 0pt 0pt;"><input type="submit" name="delete" value="" class="icon1" onclick="form.action='?do=deleteparticipant'" /></label></p>
	          		</div>
	          		</table>
						</tr>
			<tr>
        		<td valign="top" align="left">
			        <div class="headings altheading">
			          <h2>Search Customer Feedbacks</h2>
			        </div>
			        <div class="contentbox">
						<div style="border:#ccc 2px solid; padding:15px; margin-bottom:15px;">
							<form action="findcustomerfeedback" method="GET">
							
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr>
							 <td align="center" valign="middle" width="5%">
							    <td align="left" valign="middle" width="2%" style="width: 121px; ">Date of Feedback : </td>
							    <td align="left" valign="middle" width="20%"><input type="text" name="date_of_feedback" id="datepicker" readonly="readonly" value="${date}" class="input_txtbx" >
							    <br><span id="datepicker11" style="color:red"></span>
							    </td>
							   
							    <td align="left" valign="middle" width="2%" style="width: 154px; ">&nbsp;Type of Feedback : </td>
							    <td align="left" valign="middle" width="20%">
							    <!-- <input type="text" name="type_of_feedback" id="type" class="input_txtbx"></td> -->
							    
							     <select name="type_of_feedback" class="input_txtbx" id="type">
				                  		<option value="">--Select--</option>
						                      
						                  <option <c:if test="${type eq 'Complaint'}"><c:out value="Selected"/></c:if>  value="Complaint" >Complaint</option>
						                  <option <c:if test="${type eq 'Suggestion'}"><c:out value="Selected"/></c:if> value="Suggestion" >Suggestion</option>
										  <option <c:if test="${type eq 'Product Return'}"><c:out value="Selected"/></c:if> value="Product Return" >Product Return</option>
								</select></td>
							    
							    <!-- <td align="left" valign="middle" width="10%">Feedback Details:</td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="feedback_details" class="input_txtbx1" id="details"></td>
							     -->
							    <td align="center" valign="middle" width="20%"><input type="submit" class="submit_btn1" value="Search" name="findcustomerfeedback">
							    <br><span id="searcherror" style="color:red"></span>
							    </td>
<!-- 							  	<td align="center" valign="middle" width="20%"><input type="submit" class="submit_btn1" value="Clear" name="welcome" ></td>
 -->							  </tr>
							</table>
							</form>
						</div>
				        <table cellpadding="0" cellspacing="0" border="0" width="100%">
				        
				        
							<tr class="title">
								<!-- <td valign="center" align="left" width="5%"><input type="checkbox" onclick="selectall(this.form)" value="" name="checkall"></td> -->
         						<td valign="top" align="left" width="15%">Date of Feedback</td>
					         	<td valign="top" align="left" width="15%">Type of Feedback</td>
					         <!--  <td valign="top" align="left" width="20%">Feedback recorded by</td>
 							 -->	<td valign="top" align="left" width="20%">Feedback Details</td> 
          						<td valign="top" align="left" width="15%">Attachments</td>
          						 <td valign="top" align="left" width="15%">Action</td>
          						
        					</tr>
						
						
						<% int i=1; %>
							       	<c:if test="${fn:length(customerFeedbackForm.customerFeedbacks) gt 0}">	
									<c:forEach items="${customerFeedbackForm.customerFeedbacks}" var="customerFeedbacks" varStatus="status">
							       		<% if(i==1)
							       			i=2;
							       			else
							       			i=1;%>
							       		 <tr class="row<%=i%>" onmouseover="mouse_event(this,'row_hover');" onmouseout="mouse_event(this,'row1');"> 
								           	<td valign="top" align="left"  width="10%">${customerFeedbacks.date_of_feedback}</td>
											<td valign="top" align="left" width="15%">${customerFeedbacks.type_of_feedback}</td>
									 	 <td valign="top" align="left" width="10%">${customerFeedbacks.feedback_details}</td>
									 	 <c:choose>
											<c:when test="${customerFeedbacks.attachment_name!='null'}">
											<td valign="top" align="left" width="10%"><a href="<c:out value="download_attachment?fid=${customerFeedbacks.feedback_id}"></c:out>">Download</a></td>
										</c:when>
										<c:otherwise><td valign="top" align="center" width="10%">No Document</td>
										</c:otherwise>
										</c:choose>	
									 	 <%-- 
										 	 <td valign="top" align="left" width="10%"><a href="download_attachment?fid=<c:out value="${customerFeedbacks.feedback_id}"/>">Download</a></td>
										 --%>	<%-- <td valign="top" align="left" width="15%">${customerFeedbacks.attachments}</td>
									    	 --%><td valign="top" align="left" width="15%">
											
											<a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a><a href="<c:out value="editfeedback?fid=${customerFeedbacks.feedback_id}"/>" style="padding-right:10px;">Edit</a>
											<%-- <a href="#" title=""><img src="resources/images/icons/icon_delete.png" alt="Delete" /></a><a href="<c:out value="deletefeedback?fid=${customerFeedbacks.feedback_id}"/>" onclick="return confirmation()">Remove</a>
											 --%>
											</td>
										</tr>
							    	</c:forEach>
							    	</c:if>
							    	<c:if test="${fn:length(customerFeedbackForm.customerFeedbacks)== 0}">
							    	<c:if test="${justcame ne false}">
							    	<tr class="row1">
							    	<td colspan="7" width="100%"><center><b style="color:red">No Records Found!!!</b></center></td>
							    	</tr></c:if>
							    	</c:if>
							    	
							    		</table>
					</div>
			
			</tr>
			
							    	<tr>
							    	<td colspan="6">  
	<div class="extrabottom">
             <ul class="pagination">
             <c:if test="${currentpage!=1&&currentpage!=null}">
             <li class="page_unselect"><a href="viewfeedbackreport_page?page=${currentpage - 1}&feedbackdate=${date}&feedbacktype=${type}">Prev</a></li>
             </c:if>
              
             <%-- <c:forEach var="count" begin="1" end="${noofrows}"> --%> 
               <c:forEach begin="1" end="${noofpages}" var="i">
                <c:choose>
                    <c:when test="${currentpage eq i}">
                      <li class="page"><a class="paging_select"><c:out value="${i}"></c:out></a></li>
                     </c:when>
                    <c:otherwise>
                        <li class="page_unselect"><a href="viewfeedbackreport_page?page=${i}&feedbackdate=${date}&feedbacktype=${type}"><c:out value="${i}"></c:out></a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>          
            <c:if test="${currentpage!=noofpages}">
              <li class="page_unselect"><a href="viewfeedbackreport_page?page=${currentpage+1}&date_of_feedback=${date}&type_of_feedback=${type}">Next</a></li> 
             
                 </c:if>
              <c:choose>
              <c:when test="${button=='viewall'}">
                  <li class="page"><a href="viewallfeedbackreport?&date_of_feedback=${date}&type_of_feedback=${type}" class="paging_select">ViewAll</a></li>
             </c:when>
                <c:otherwise>
                  <li class="page"><a href="viewfeedback" class="paging_select">Back</a></li>
              </c:otherwise>
              </c:choose>					
		 
		  </ul>
		  </div>
		  </td>
		  </tr>

						</table>
					</div>
				</td>
			</tr>
		</table> 
	
</div>
<script type="text/javascript">
function validation()
{
	var error = "";
	var date = /^(0?[1-9]|1[012])[\/](0?[1-9]|[12][0-9]|3[01])[\/]\d{4}$/;
	var datepicker = document.getElementById('datepicker').value;
	var type = document.getElementById('type').value; 
	
	if((datepicker == "") && (type == ""))
	{
		 document.getElementById("searcherror").innerHTML="Input is empty";
			error="true";		
	}
	else if(datepicker.length > 0)
	 {
		if(datepicker.match(date))
		 {
			 document.getElementById("datepicker11").innerHTML="";
		 }
		 else
		 {
			 document.getElementById("datepicker11").innerHTML="Invalid date";
			 error="true";
		 }
	 }

 else
	  {
	  document.getElementById("searcherror").innerHTML="";
	  }
 
 if(error == "true")
	  {
	  return false;
	  }
	
}


</script>
<script>
function confirmation(val) {
	var answer = confirm("Are you Sure You Want to Delete CustomerFeedback Form ?")
	if (answer){
		return true;
	}
	else{
		return false;
	}
}
</script>

<script language="javascript">

function selectall(field)
{
	//field.getElementByTagName('checkbox');
	if(document.grid.checkall.checked==true)
	{
		for (i = 0; i < field.length; i++)
			field[i].checked = true ;
	}
	else
	{
		for(i = 0; i < field.length; i++)
			field[i].checked = false;
	}
}

function validate(fname)
{
// alert(fname);
var chks = document.getElementsByName('checkbox[]');

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
return true;
}

function findpart()
{
// alert(document.getElementById("moblie").value);
// alert(document.getElementById("group").value);
// alert(document.getElementById("city").value);
window.location="?do=viewparticipants&id="+document.getElementById("id").value+"&date="+document.getElementById("date").value+"&type="+document.getElementById("type").value;
}
</script>
<script>
 $(function() {
           $( "#datepicker" ).datepicker();
         })
 
</script>

 <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
 <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<jsp:include page="footer.jsp"></jsp:include>
</html>