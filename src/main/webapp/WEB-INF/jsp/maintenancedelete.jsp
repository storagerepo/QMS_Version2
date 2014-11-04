<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="header.jsp"></jsp:include>
<head>
<script  language="javascript">
function ChangeCase(elem)
{
    elem.value = elem.value.toUpperCase();
}
function AlphabetsNumber(e, t) {
    try {
        if (window.event) {
            var charCode = window.event.keyCode;
        }
        else if (e) {
            var charCode = e.which;
        }
        else { return true; }
        if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123)|| (charCode >47 && charCode < 58))
            return true;
        else
            return false;
    }
    catch (err) {
        alert(err.Description);
    }
}
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
</head>
<div id="right_content">

	
		<table cellpadding="0" cellspacing="0" border="0" width="98%"
			class="margin_table">
<tr>
<td>
<div>
    <ul class="horizmenu">
						
	
										
								<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="view_referenceMaintenance" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
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
								<c:when test="${menu=='maintenance'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									<span>Delete</span>
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
						<a title="Close" href="maintenancedelete">
						<img alt="Success" src="resources/images/icons/icon_square_close.png"></a>
						</p>
					</div></td>
			</tr>
		</c:if>
			<tr>
				<td valign="top" align="left"><div>
						<div class="headings altheading">
							<h2>Delete Maintenance & Calibrations </h2>
						</div>
						 <div class="contentbox">
						<form action="search_maintenances" name="dashboard" method="GET">
<div style="border:#ccc 2px solid; padding:15px; margin-bottom:15px;">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr>
							    <td align="left" valign="middle" width="25%">ID&nbsp;:</td>
							    <td align="left" valign="middle" width="5%">
							    <input type="text" name="equipment_id" onkeypress="return AlphabetsNumber(event,this);" onblur="ChangeCase(this)" class="input_txtbx" id="equipment_id"  value="${equipid}">
							    </td>
							    <td align="left" valign="middle" width="30%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Equipment Name&nbsp;:</td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="equipment_name" class="input_txtbx" id="equipment_name"
							    
							     value="${equipname}"  >
							    </td>
							    
							  	<td align="center" valign="middle" width="30%">
							  	<input type="submit" class="submit_btn1" value="Search" id="id_submit" name="search_maintenances"/></td>
							 	<td align="center" valign="middle" width="30%">
							<!--   <input type="button" class="submit_btn1" name="clear" id="id_clear" value="clear"> -->
							  </tr>
							</table>
						</div>
</form>
			     
					<form action="deletemaintenance" name="dashboard" onsubmit="return validate()" method="POST">
							<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr class="title">
							<td valign="top" align="left" width="20%">Select</td>
							<td valign="top" align="left" width="20%">Equipment Id</td>
							<td valign="top" align="left" width="20%">Equipment Name</td>
							<td valign="top" align="left" width="20%">Equipment Model</td>
							<td valign="top" align="left" width="20%">Acquired Date </td>
							<td valign="top" align="left" width="20%">
							</tr>

								<!-- Display Admin Userd here  Suresh--> 
								<% int i=1; %>
							       	<c:if test="${fn:length(maintenanceForm.maintenance) gt 0}">	
									<c:forEach items="${maintenanceForm.maintenance}" var="maintenance" varStatus="status">
							       		<% if(i==1)
							       			i=2;
							       			else
							       			i=1;%>
							       		<tr class="row<%=i%>" onmouseover="mouse_event(this,"row_hover");" onmouseout="mouse_event(this,"row1");">
							       		<td valign="top" align="left" width="10%"><input type="checkbox" name="chkUser" value="${maintenance.equipment_id}"/></td>
					<%-- 			           	<td valign="top" align="left"  width="10%">${documentMains.document_id}</td> --%>
									        <td valign="top" align="left" width="10%">${maintenance.equipment_id}</td>
									         <td valign="top" align="left" width="10%">${maintenance.equipment_name}</td>
											<td valign="top" align="left" width="10%">${maintenance.equipment_model}</td>
											<td valign="top" align="left" width="10%">${maintenance.date_acquired}</td>
											
											<td valign="top" align="center" width="15%">
											
											
											
											<td valign="top" align="left" width="15%">
											
											
											</td>
										</tr>
							    	</c:forEach>
							    	</c:if>
						    		<c:if test="${fn:length(maintenanceForm.maintenance) == 0}">	
							    	<c:if test="${justcame ne false }">
							    	<tr class="row1">
							    	<td colspan="7" width="100%"><span style="color:red;"><center><b>No Records Found!!!</b></center></span></td>
							    		
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
             <li class="page_unselect"><a href="viewdeletemaintenancereport_page?page=${currentpage - 1}&equipment_id=${equipid}&equipment_name=${equipname}" >Prev</a></li> 
               </c:if>
             
               <c:forEach begin="1" end="${noofpages}" var="i">
                <c:choose>
                    <c:when test="${currentpage eq i}">
                      <li class="page"><a class="paging_select"><c:out value="${i}"></c:out></a></li>
                     </c:when>
                    <c:otherwise>
                        <li class="page_unselect"><a href="viewdeletemaintenancereport_page?page=${i}&equipment_id=${equipid}&equipment_name=${equipname}"><c:out value="${i}"></c:out></a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>          
            <c:if test="${currentpage!=noofpages}">
              <li class="page_unselect"><a href="viewdeletemaintenancereport_page?page=${currentpage+1}&equipment_id=${equipid}&equipment_name=${equipname}">Next</a></li> 
                 </c:if>
              <c:choose>
              <c:when test="${button=='viewall'}">
                  <li class="page"><a href="viewalldeletemaintenancereport?equipment_id=${equipid}&equipment_name=${equipname}" class="paging_select">ViewAll</a></li>
             </c:when>
                <c:otherwise>
                  <li class="page"><a href="maintenancedelete" class="paging_select">Back</a></li>
              </c:otherwise>
              </c:choose>					
		 
		  </ul>
		  </div>
		  </td>
		  </tr>
		
	<TR height="150"></TR>
	</table></div>
		<table height="2%"><tr><td></td></tr></table>
								
<script  language="javascript">
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

<script>
$(function() {

	$("#equipment_name").on("keypress", function(e) {
		
		if (e.which === 32 && !this.value.length)
	        e.preventDefault();
	});
	});
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



 <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
 <jsp:include page="footer.jsp"></jsp:include> 