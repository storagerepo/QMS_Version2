<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="header.jsp"></jsp:include>
<script type="text/javascript" src="js/ajaxpaging.js"></script>
<link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" /> 	
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/jquery-ui.js"></script> 

<div id="right_content">
<!-- 	<form name="grid"  action="" method="POST">
 -->    	<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      		<tr>
      		<td>
      		 <div><ul class="horizmenu" style=" float:left;margin-left:205px; margin-top:8px;">
<li  style="float:left;margin-right:8px;text-transform:uppercase;">
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
	<tr>
		
		<c:if test="${success=='true'}">
			<tr>
				<td valign="top" align="left" style="padding: 5px 0 10px 200px;">&nbsp;
					<div id="success_statusbar" class="status success">
						<p class="closestatus">
						<img alt="Success" src="resources/images/icons/inserted.png">
						<a title="Close" href="viewmanagementreview">
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
						<a title="Close" href="viewmanagementreview">
						<img alt="Success" src="resources/images/icons/icon_square_close.png"></a>
						</p>
					</div></td>
			</tr>
		</c:if>
	</tr> 

<!-- <table cellpadding="0" cellspacing="0" border="0" width="98%"
	class="margin_table">
 -->	<tr>
		<td valign="top" align="left">
				<div class="headings altheading">
							<h2>Search Management Review Details</h2>
						</div>
							<div class="contentbox">
						<div style="border:#ccc 2px solid; padding:15px; margin-bottom:15px;">
						<form action="search_review" name="dashboard" method="GET">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
						
							  <tr>
							    <td align="left" valign="middle" width="12%">Review ID :</td>
							    <td align="left" valign="middle" width="10%"> <input type="text" name="review_id" class="input_txtbx" id="id" style="height:13px" value="${reviewid}" onInput="return validatename(id);"> 
							     <br> <span id="iderror" style="color:red"></span>
							    </td>
							     <td align="left" valign="middle" width="2%">
							    <td align="left" valign="middle" width="29%">Management Review Date :</td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="management_review_date" class="input_txtbx" id="datepicker"style="height:13px" value="${managementreviewdate}">
							     <br> <span id="datepicker11" style="color:red"></span>
							    </td>
							    <td align="left" valign="middle" width="2%">
							    <td align="left" valign="middle" width="8%">Category :</td>
							    <td align="left" valign="middle" width="10%"> <select name="category" id="category" class="input_txtbx">
				                  		  <option value="">--Select--</option>
						                  <option <c:if test="${categoryvalue eq 'audits'}"><c:out value="Selected"/></c:if>  value="audits" >Audits</option>
						                  <option <c:if test="${categoryvalue eq 'corrective and prev actions'}"><c:out value="Selected"/></c:if> value="corrective and prev actions" >Corrective and Prev Actions</option>
										  <option <c:if test="${categoryvalue eq 'cost of non conformance'}"><c:out value="Selected"/></c:if> value="cost of non conformance" >Cost of NonConformance</option>
										  <option  <c:if test="${categoryvalue eq 'customer satisfaction'}"><c:out value="Selected"/></c:if> value="customer satisfaction" >Customer Satisfaction</option>
										  <option <c:if test="${categoryvalue eq 'suppliers'}"><c:out value="Selected"/></c:if>  value="suppliers" >Suppliers</option>
										  <option  <c:if test="${categoryvalue eq 'human resources'}"><c:out value="Selected"/></c:if> value="human resources" >Human Resources</option>
										  <option <c:if test="${categoryvalue eq 'product/service conformity'}"><c:out value="Selected"/></c:if>  value="product/service conformity" >Product/Service Conformity</option>
										  <option <c:if test="${categoryvalue eq 'previous items'}"><c:out value="Selected"/></c:if>  value="previous items" >Previous Items</option>
										  <option <c:if test="${categoryvalue eq 'recommendations for improvement'}"><c:out value="Selected"/></c:if>  value="recommendations for improvement" >Recommendations for Improvement</option>
										  <option <c:if test="${categoryvalue eq 'significant changes to the QMS'}"><c:out value="Selected"/></c:if>  value="significant changes to the QMS" >Significant changes to the QMS</option>	
				                   	</select>
				                   	<br> <span id="caterror" style="color:red"></span></td>
							    <td align="center" valign="middle" width="38%">
							  <input type="submit" class="submit_btn1" name="search" value="Search" id="id_submit" onmouseover="showTooltip('tooltip_id','inp_id3');" />
							  

							  <!-- <input type="submit" class="submit_btn1" name="search" id="id_submit"onclick="return validation1();" onmouseover="showTooltip('tooltip_id','inp_id3');" /> -->
							  <br> <span id="searcherror" style="color:red"></span>

							  </td>
							
							  </tr>
							</table>
						</form>
						</div>
						
						
						<!-- <form action="?do=viewmanagementreview" name="dashboard" method="POST">
						-->	<table cellpadding="0" cellspacing="0" border="0" width="100%">
						 		<tr class="title">
							
									<td valign="top" align="left" width="10%">Review ID</td>
									<td valign="top" align="left" width="10%">Review Date</td>
									<td valign="top" align="left" width="10%">Category</td>
									<td valign="top" align="left" width="12%">Responsibility</td>
									<td valign="top" align="left" width="12%">Completion Date</td>
									<td valign="top" align="left" width="17%">Improvement Project (Y/N)</td> 				
									<td valign="top" align="left" width="10%">Actions</td>						
									</tr>

					 <c:if test="${fn:length(managementreviewform.managementreviewdetails) gt 0}">
								<% int i=1; %>
							      	<c:forEach items="${managementreviewform.managementreviewdetails}" var="managementreviewdetails" varStatus="status">
							       		
							       		<% if(i==1)
							       			i=2;
							       			else
							       			i=1;%>
							       		<tr class="row<%=i%>">
								           	
								           	<td valign="top" align="left"  width="10%"><a href="<c:out value="view_review?review_id=${managementreviewdetails.review_id}"/>">${managementreviewdetails.review_id}</a></td>
											
											<td valign="top" align="left" width="10%">${managementreviewdetails.management_review_date}</td>
											<td valign="top" align="left" width="10%">${managementreviewdetails.category}</td>
											<td valign="top" align="left" width="12%">${managementreviewdetails.responsibility}</td>
											<td valign="top" align="left" width="12%">${managementreviewdetails.completion_date}</td> 
											<td valign="top" align="left" width="17%">${managementreviewdetails.continuous_improvement_project}</td> 
											<td valign="top" align="left" width="10%">
											<a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a><a href="<c:out value="edit_managementreview?review_id=${managementreviewdetails.review_id}"/>" style="padding-right:10px;">Edit</a>
											<%-- <a href="#" title="" ><img src="resources/images/icons/icon_delete.png" alt="Delete" /></a><a href="<c:out value="delete_managementreview?review_id=${managementreviewdetails.review_id}"/>" onclick="return confirmation()" >Remove</a> --%>
											</td>	
										 
										</tr>
							    </c:forEach>
							    </c:if>	
							    <c:if test="${fn:length(managementreviewform.managementreviewdetails) == 0}">	
							    <c:if test="${justcame ne false}">
							    	<tr class="row1">
							    	<td colspan="7" width="100%" style="color:red"><center><b>No Records Found!!!</b></center></td>
							    		
							    	</tr></c:if>
							    	</c:if>		
						    		
								 <!-- 	<div style="clear: both;"></div>
								</div>
							
								</td>
								</tr>
								<tr>
									<td valign="top" align="left">&nbsp;</td>
								</tr>
							
							</table> -->
							</table>
							</div>
							</td>
							</tr>
							 
<tr>	
<td colspan="6">  
	<div class="extrabottom">
             <ul class="pagination">
        
			<c:if test="${currentpage!=1&&currentpage!=null}">
             <li class="page_unselect"><a href="viewmanagementreport_page?page=${currentpage - 1}&review_id=${reviewid}&category=${categoryvalue}&management_review_date=${managementreviewdate}" >Prev</a></li> 
               </c:if>
             
               <c:forEach begin="1" end="${noofpages}" var="i">
                <c:choose>
                    <c:when test="${currentpage eq i}">
                      <li class="page"><a class="paging_select"><c:out value="${i}"></c:out></a></li>
                     </c:when>
                    <c:otherwise>
                        <li class="page_unselect"><a href="viewmanagementreport_page?page=${i}&review_id=${reviewid}&category=${categoryvalue}&management_review_date=${managementreviewdate}"><c:out value="${i}"></c:out></a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>          
            <c:if test="${currentpage!=noofpages}">
              <li class="page_unselect"><a href="viewmanagementreport_page?page=${currentpage+1}&review_id=${reviewid}&category=${categoryvalue}&management_review_date=${managementreviewdate}">Next</a></li> 
                 </c:if>
              <c:choose>
              <c:when test="${button=='viewall'}">
                  <li class="page"><a href="viewallmanagementreport?&review_id=${reviewid}&category=${categoryvalue}&management_review_date=${managementreviewdate}" class="paging_select">ViewAll</a></li>
             </c:when>
                <c:otherwise>
                  <li class="page"><a href="viewmanagementreview" class="paging_select">Back</a></li>
              </c:otherwise>
              </c:choose>							 
		  </ul>
</div></td>
</tr>
</table>
</div>

				<table  width=300 height=280>
			<tr height=30><td></td></tr></table>	
					<script>

					function confirmation(val) {
							var answer = confirm("Are you Sure You Want to delete this record ?");
							if (answer){
								window.location = "?do=deleteparticipant&id="+val;
							}
							else{
								
							}
						}
						


</script>
<script>
$(function() {
	$("#id").on("keypress", function(e) {
	
	if (e.which === 32 && !this.value.length)
        e.preventDefault();
});
});
</script>
  <script type="text/javascript">
function validatename(id){
	
    var textInput = document.getElementById(id).value;
    textInput = textInput.replace(/[^0-9]/g, "");
    document.getElementById(id).value = textInput;
} 
</script>
<script type="text/javascript">
function validation()
{
 var error = "";
 var date = /^\d{4}-(0?[1-9]|1[012])-(0?[1-9]|[12][0-9]|3[01])$/;
 var id = document.getElementById('id').value;
 var datepicker = document.getElementById('datepicker').value;
 var category = document.getElementById('category').value;
 document.getElementById('caterror').innerHTML = "";
 document.getElementById('iderror').innerHTML ="";
 document.getElementById("datepicker11").innerHTML="";
 	if(id =="")
	{

		document.getElementById('iderror').innerHTML = "Required field should not be empty";


		error = "true";
	}
 	if(datepicker==""){
 		document.getElementById('datepicker11').innerHTML = "Required field should not be empty";
		error = "true";
 	}
 	if(category==""){
 		document.getElementById('caterror').innerHTML = "Required field should not be empty";
		error = "true";
 	}
 	else
 	{
 		if(id.length > 0)
 		{
 			if((id.length > 32))
 			{

 				document.getElementById('iderror').innerHTML = "Required Field Should be length 4 to 32";

 	
 				error = "true";	
 			}
 		}
 		if(datepicker.length > 0)
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
 	}
 	if(error == "true")
 		{
 		return false;
 		}
}

</script>
 <script>
 $(function() {
	 $( "#datepicker" ).datepicker({dateFormat: 'yy-mm-dd'});
        });
 
</script>
<jsp:include page="footer.jsp"></jsp:include>