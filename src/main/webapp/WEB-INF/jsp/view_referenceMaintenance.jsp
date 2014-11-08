<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="header.jsp"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="/QMS_App/resources/js/jquery.js"></script>
<link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" />
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/jquery-ui.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript" src="js/ajaxpaging.js"></script>
<title>Insert title here</title>
</head>
<body>
<div id="right_content">
	
    	<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      		<tr>
      		<td>
      		 <div>
  <ul class="horizmenu">
								
								<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="view_referenceMaintenance" class="<c:choose>
								<c:when test="${menu=='maintenance'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									<span>Reference Attachment</span>
								</a>
							</li>
								</li>
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="view_instructionMaintenance" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Instruction Attachment</span>
								</a>
							</li>
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="maintenancedelete" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Delete</span>
								</a>
							</li>
							</ul>
  </div>
      		</td>
      		</tr>
				<c:if test="${success=='insert'}">
			<tr>
				<td valign="top" align="left" style="padding: 5px 0 10px 200px;">&nbsp;
					<div id="success_statusbar" class="status success">
						<p class="closestatus">
						<img alt="Success" src="resources/images/icons/inserted.png">
						<a title="Close" href="view_referenceMaintenance">
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
						<a title="Close" href="view_referenceMaintenance">
						<img alt="Success" src="resources/images/icons/icon_square_close.png"></a>
						</p>
					</div></td>
			</tr>
		</c:if>
			<c:if test="${success=='delete'}">
			<tr>
				<td valign="top" align="left" style="padding: 5px 0 10px 200px;">&nbsp;
					<div id="success_statusbar" class="status success">
						<p class="closestatus">
						<img alt="Success" src="resources/images/icons/removed.png"/>
						<a title="Close" href="view_referenceMaintenance">
						<img alt="Success" src="resources/images/icons/icon_square_close.png"></a>
						</p>
					</div></td>
			</tr>
		</c:if>
		<c:if test="${fail=='failed'}">
			<tr>
				<td valign="top" align="left" style="padding: 5px 0 10px 200px;">&nbsp;
					<div id="success_statusbar" class="status success">
						<p class="closestatus">
						<span style="color:red;">Cannot Add More than 5 Records</span>
						<a title="Close" href="view_referenceMaintenance">
						<img alt="Success" src="resources/images/icons/icon_square_close.png"></a>
						</p>
					</div></td>
			</tr>
		</c:if>
      		<tr>
        		<td valign="top" align="left">
			        <div class="headings altheading">
			          <h2>Reference Attachment List</h2>
			        </div>
			        <div class="contentbox">
			      <form action="documentprefix_list" method="POST"> 
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
				     <tr class="title">
							
							<td valign="top" align="left" width="20%">Frequency of Maintenance</td>
							<td valign="top" align="left" width="20%">Instructions</td>
							<td valign="top" align="left" width="20%">Instruction</td>
							<td valign="top" align="left" width="20%">Actions</td>
							</tr>
							<c:if test="${fn:length(referenceMaintenance_Form.references) gt 0}">
        				  <c:forEach items="${referenceMaintenance_Form.references}" var="reference" varStatus="status">
        				       				<tr class="row1">
        				       				
        				       				 <td valign="top" align="left" width="15%">${reference.frequency_maintenance}</td>
        				       				 <td valign="top" align="left" width="15%">${reference.attachment_name}
        				       				 <input type="hidden" name="auto_id" id="autoid"/>
        				       				 </td>
        				       				 <td valign="top" align="left" width="10%"><a href="<c:out value="downloadFile?id=${reference.auto_id}"></c:out>">Download</a></td>
        				       				 
        				       					<td valign="top" align="left">
												<a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a><a href="<c:out value="edit_reference?id=${reference.auto_id}"/>" style="padding-right:10px;">Edit</a>
											<%-- <a href="#" title=""><img src="resources/images/icons/icon_delete.png" alt="Delete" /></a><a href="<c:out value="delete_reference?id=${reference.auto_id}"/>" onclick="return confirmation()">Remove</a> --%>
											</td>
        				       				 </tr>
        				       				 </c:forEach>
        				       				 </c:if>
        				       				   <c:if test="${fn:length(referenceMaintenance_Form.references) == 0}">	
							    	<tr class="row1">
							    	<td colspan="7" width="100%"><span style="color:red;"><center><b>No Records Found!!!</b></center></span></td>
							    		
							    	</tr>
							    	</c:if>
        				       				 </table>
        				       				</form>
        				       				</div>
        				       				</td>
        				       				</tr>
        				       				
<tr height="250"></tr>
        				       				
        				       				</table>
        				       				</div>
 <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

  <jsp:include page="footer.jsp"></jsp:include>         				       				
<script language="javascript">

function confirmation() {
	var answer = confirm("Are you Sure You Want to Delete  Reference Attachment Record ?")
	if (answer){
		return true;
	}
	else{
		return false;
	}
}


</script> 
        				       		
</body>
</html>