<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="header.jsp"></jsp:include>

<html>
<head>
<script  language="javascript">
function validate()
{
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
var result=confirm("Are you sure want to remove this record");
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
</head>
<body>
<div id="right_content">

	
	 <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      		<tr>
      		<td>
      		 <div>

 			 <div id="ddtopmenubar1">
				<div class="menu_container">
					<div class="menu_c">
						  <ul class="horizmenu" >
						
	<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="#" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>" rel="document">
									<span>Add Set-up</span>
								</a>
							</li>
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="#" class="<c:choose>
									<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>" rel="document1">
									<span>List/Delete Set-up</span>
							</a>
							</li>
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="#" class="<c:choose>
									<c:when test="${menu=='document'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>" rel="deletedoc">
									<span>Delete</span>
							</a>
							</li>
							
				            						</ul>
			</div>
						
  <div class="clear"></div>
						<div>
						</div>						
					</div>					
				</div>
			</div>
			</td></tr>
<c:if test="${success=='delete'}">
			<tr>
				<td valign="top" align="left" style="padding: 5px 0 10px 200px;">&nbsp;
					<div id="success_statusbar" class="status success">
						<p class="closestatus">
						<img alt="Success" src="resources/images/icons/removed.png">
						<a title="Close" href="formdelete">
						<img alt="Success" src="resources/images/icons/icon_square_close.png"></a>
						</p>
					</div></td>
			</tr>
		</c:if>
			<tr>
				<td valign="top" align="left"><div>
						<div class="headings altheading">
							<h2>Delete Forms</h2>
						</div>
						 <div class="contentbox">
						 <form action="search_forms" name="dashboard" method="GET">
						<div style="border:#ccc 2px solid; padding:15px; margin-bottom:15px;">


							<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr>
							    <td align="left" valign="middle" width="20%">Process Area&nbsp;:</td>
							   <!--  <td align="left" valign="middle" width="10%"><input type="text" name="process" class="input_txtbx2" id="recordtitle"><span class="err"><form:errors path="Form.responsibility"></form:errors></span></td>
							    <td align="center" valign="middle" width="38%"> -->
							    
							     <td valign="top" align="left" class="input_txt" >
               
               <select name="process" id="id_inpprocess"  class="input_txtbx" style="width:200px;">
               <option value="">--Select--</option>
             <c:forEach items="${processForm.processes}" var="processes" varStatus="true">
                <option value="${processes.process_name}"<c:if test="${processes.process_name==processarea}"><c:out value="selected"></c:out></c:if>>${processes.process_name}</option>
               </c:forEach>
               </select>
              </td>
               <td valign="top" align="right" class="input_txt" >
							  <input type="submit" value="Search" class="submit_btn1" name="search" id="id_submit" onmouseover="showTooltip('tooltip_id','inp_id3');" /></td>
							  <td align="left" valign="middle" width="38%" style="padding-left: 40px"><!-- <input type="submit" value="Clear" class="submit_btn1" ></td> -->
							  </tr>
							</table>
							
						</div> 
</form>
						
					<form action="deleteform" name="dashboard" onsubmit="return validate()" method="POST">
							<table cellpadding="0" cellspacing="0" border="0" width="100%">
								<tr class="title">
									<td valign="top" align="left" width="10%">Select</td>
									<td valign="top" align="left" width="10%">Form/Rec ID</td>
									<td valign="top" align="left" width="10%">Process</td>
									<td valign="top" align="left" width="10%">Effective Date</td>
									<td valign="top" align="left" width="10%">Approver1</td>
									<td valign="top" align="left" width="10%">Issuer</td>
									
									</tr>

								<!-- Display Admin Userd here  Suresh--> 
								<% int i=1; %>
							       	<c:if test="${fn:length(formForm.form) gt 0}">	
									<c:forEach items="${formForm.form}" var="form" varStatus="status">
							       		<% if(i==1)
							       			i=2;
							       			else
							       			i=1;%>
							       		<tr class="row<%=i%>" onmouseover="mouse_event(this,"row_hover");" onmouseout="mouse_event(this,"row1");">
							       		<td valign="top" align="left" width="10%"><input type="checkbox" name="chkUser" value="${form.auto_number}"/></td>
								        <%--    	<td valign="top" align="left"  width="10%">${form.auto_number}</td> --%>
									        <td valign="top" align="left" width="10%">${form.form_or_rec_id}</td>
											<td valign="top" align="left" width="10%">${form.process}</td>
											<td valign="top" align="left" width="10%">${form.effective_date}</td>
											<td valign="top" align="left" width="10%">${form.approver1}</td>
											<td valign="top" align="left" width="10%">${form.issuer}</td>
											
										</tr>
							    	</c:forEach>
						    		</c:if>
						    		<c:if test="${fn:length(formForm.form) == 0}">	
						    		<c:if test="${justcame ne false}">
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
		<td colspan="6">
		
	<div class="extrabottom">
             <ul class="pagination">
       
              <c:if test="${currentpage!=1&&currentpage!=null}">
             <li class="page_unselect"><a href="viewformdelete_page?page=${currentpage - 1}&process=${processarea}" >Prev</a></li> 
               </c:if>
              
           
               <c:forEach begin="1" end="${noofpages}" var="i">
                <c:choose>
                    <c:when test="${currentpage eq i}">
                      <li class="page"><a class="paging_select"><c:out value="${i}"></c:out></a></li>
                     </c:when>
                    <c:otherwise>
                        <li class="page_unselect"><a href="viewformdelete_page?page=${i}&process=${processarea}"><c:out value="${i}"></c:out></a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>          
            <c:if test="${currentpage!=noofpages}">
              <li class="page_unselect"><a href="viewformdelete_page?page=${currentpage+1}&process=${processarea}">Next</a></li> 
                 </c:if>
              <c:choose>
              <c:when test="${button=='viewall'}">
                  <li class="page"><a href="viewallformdelete?process=${processarea}" class="paging_select">ViewAll</a></li>
             </c:when>
                <c:otherwise> 
                  <li class="page"><a href="formdelete" class="paging_select">Back</a>  </li>
                  
              </c:otherwise>
              </c:choose>			 		
	
		</ul></div>
		
		</td>
	
		</table></div>
						</body>
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
  <table  width=300 height=40>
			<tr height=120px;><td></td></tr></table>
			<br><br><br><br><br><br>
			<jsp:include page="footer.jsp"></jsp:include>
</html>