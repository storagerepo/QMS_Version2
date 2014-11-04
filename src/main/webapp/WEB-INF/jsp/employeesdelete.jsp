<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="header.jsp"></jsp:include>
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
}	
</script>
<script>
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
</head>
<div id="right_content">

	
		<table cellpadding="0" cellspacing="0" border="0" width="98%"
			class="margin_table">
<tr>
<td>
<div>
    <ul class="horizmenu">
						
	
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="employeesdelete" class="<c:choose>
								<c:when test="${menu=='employee'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									Delete Employees
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
						<a title="Close" href="employeesdelete">
						<img alt="Success" src="resources/images/icons/icon_square_close.png"></a>
						</p>
					</div></td>
			</tr>
		</c:if>
			<tr>
				<td valign="top" align="left"><div>
						<div class="headings altheading">
							<h2>Delete Employees</h2>
						</div>
						 <div class="contentbox">
						 <div style="border:#ccc 2px solid; padding:15px; margin-bottom:15px;">
							<form action="findemployees" method="get">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr>
							    <td align="left" valign="middle" width="10%"> Type :&nbsp;</td>
							    <!-- <td align="left" valign="middle" width="5%"><input type="text" name="type_of_training" class="input_txtbx2" id="type"></td>
							     -->
							    <td valign="middle" align="left" class="input_txt"><select	name="type_of_training" class="input_txtbx">
                 	<option value="">--Select--</option>
				                  									
                  										<option
                  											<c:if test="${'Classroom' eq type}"><c:out value="Selected"/></c:if>
															<c:if test="${Employee.type_of_training eq 'Classroom'}"><c:out value="Selected"/></c:if>
															value="Classroom">Classroom</option>
														<option
														<c:if test="${'Hands on' eq type}"><c:out value="Selected"/></c:if>
															<c:if test="${Employee.type_of_training eq 'Hands on'}"><c:out value="Selected"/></c:if>
															value="Hands on">Hands on</option>
														</select></td>
                
							     <td align="right" valign="middle" width="12%">Qualified By :&nbsp;&nbsp;&nbsp; </td>
							    <td valign="middle" align="left" class="input_txt"><select	name="qualified_by" class="input_txtbx">
                  											<option value="">--Select--</option>
				                  									
                  										<option
                  											<c:if test="${'Education' eq qualifiedby}"><c:out value="Selected"/></c:if>
															<c:if test="${Employee.qualified_by eq 'Education'}"><c:out value="Selected"/></c:if>
															value="Education">Education</option>
														<option
															<c:if test="${'Experience' eq qualifiedby}"><c:out value="Selected"/></c:if>
															<c:if test="${Employee.qualified_by eq 'Experience'}"><c:out value="Selected"/></c:if>
															value="Experience">Experience</option>
														<option
															<c:if test="${'Training' eq qualifiedby}"><c:out value="Selected"/></c:if>
															<c:if test="${Employee.qualified_by eq 'Training'}"><c:out value="Selected"/></c:if>
															value="Training">Training</option>
														
															</select><span class="err"><form:errors path="Employee.qualified_by"></form:errors></span></td>
                <!-- 
							    <td align="left" valign="middle" width="10%"><input type="text" name="qualified_by" id="qualifiedby" class="input_txtbx2"></td>
				 -->				<td align="right" valign="middle" width="12%"> Trainer :&nbsp;&nbsp;&nbsp;</td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="trainer" class="input_txtbx" id="trainer" onkeypress="return Alphabets(event,this);" maxlength="32" value="${trainer}"></td>
							  
	<!-- 						    <td align="center" valign="middle"><input type="submit" class="submit_btn" value="Find"></td>
	 -->						  
							    <td align="center" valign="middle" width="38%"><input type="submit" class="submit_btn1" value="Search"></td>
							     <!-- <td align="center" valign="middle"><input type="reset" class="submit_btn1" value="Clear"></td> -->
							  </tr>
							  </table>
							  </form>
							  </div>
				
					<form action="deleteemployees" name="dashboard" onsubmit="return validate()" method="POST">
							<table cellpadding="0" cellspacing="0" border="0" width="100%">
								<tr class="title">
								<td valign="top" align="left" width="10%">Select</td>
								<td valign="top" align="left" width="10%">Employee&nbsp;ID</td>
					         	<td valign="top" align="left" width="10%">Name</td>
					         	<td valign="top" align="left" width="10%">Type</td>
								<td valign="top" align="left" width="10%">Qualified By</td>
								<td valign="top" align="left" width="10%">Trainer</td>
          						<td valign="top" align="left" width="10%">Attachments</td>
          						
									
									
									</tr>

								<!-- Display Admin Userd here  Suresh--> 
								<% int i=1; %>
							       	<c:if test="${fn:length(employeeForm.employees) gt 0}">	
									<c:forEach items="${employeeForm.employees}" var="employees" varStatus="status">
							       		<% if(i==1)
							       			i=2;
							       			else
							       			i=1;%>
							       		<tr class="row<%=i%>" onmouseover="mouse_event(this,"row_hover");" onmouseout="mouse_event(this,"row1");">
							       		<td valign="top" align="left" width="10%"><input type="checkbox" name="chkUser" value="${employees.employee_id}"/></td>
					<%-- 			           	<td valign="top" align="left"  width="10%">${documentMains.document_id}</td> --%>
									        <td valign="top" align="left" width="10%">${employees.employee_id}</td>
									        <td valign="top" align="left" width="10%">${employees.name}</td>
											<td valign="top" align="left" width="10%">${employees.type_of_training}</td>											
											<td valign="top" align="left" width="10%">${employees.qualified_by}</td>											
											<td valign="top" align="left" width="10%">${employees.trainer}</td>
											<c:choose>
											<c:when test="${employees.attachment_name!='null'}">
											<td valign="top" align="left" width="10%"><a href="<c:out value="downloademployeefile?eid=${employees.employee_id}"></c:out>">Download</a></td>
										</c:when>
										<c:otherwise><td valign="top" align="center" width="10%">No Document</td>
										</c:otherwise>
										</c:choose>		
										</tr>
							    	</c:forEach>
						    		</c:if>
						    		<c:if test="${fn:length(employeeForm.employees) == 0}">	
						    		<c:if test="${justcame ne false }">
						    		<tr class="row1">
							    	<td colspan="7" width="100%"><span style="color:red"><center><b>No Records Found!!!</b></center></span></td>
							    		
							    	</tr>
							    	</c:if>
							    	</c:if>	


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
		<tr><td colspan="6">  
	<div class="extrabottom">
             <ul class="pagination">
        
             <c:if test="${currentpage!=1&&currentpage!=null}">
             <li class="page_unselect"><a href="viewdeleteemployeereport_page?page=${currentpage - 1}&type_of_training=${type}&trainer=${trainer}&qualified_by=${qualifiedby}" >Prev</a></li> 
               </c:if>
              
             <%-- <c:forEach var="count" begin="1" end="${noofrows}"> --%> 
               <c:forEach begin="1" end="${noofpages}" var="i">
                <c:choose>
                    <c:when test="${currentpage eq i}">
                      <li class="page"><a class="paging_select"><c:out value="${i}"></c:out></a></li>
                     </c:when>
                    <c:otherwise>
                        <li class="page_unselect"><a href="viewdeleteemployeereport_page?page=${i}&type_of_training=${type}&trainer=${trainer}&qualified_by=${qualifiedby}"><c:out value="${i}"></c:out></a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>          
            <c:if test="${currentpage!=noofpages}">
              <li class="page_unselect"><a href="viewdeleteemployeereport_page?page=${currentpage+1}&type_of_training=${type}&trainer=${trainer}&qualified_by=${qualifiedby}">Next</a></li> 
                 </c:if>
              <c:choose>
              <c:when test="${button=='viewall'}">
                  <li class="page"><a href="viewalldeleteemployeereport?&type_of_training=${type}&trainer=${trainer}&qualified_by=${qualifiedby}" class="paging_select">ViewAll</a></li>
             </c:when>
                <c:otherwise>
                  <li class="page"><a href="employeesdelete" class="paging_select">Back</a></li>
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
 
 <br><br><br><br><br><br>
 <jsp:include page="footer.jsp"></jsp:include> 