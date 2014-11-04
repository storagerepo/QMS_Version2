<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="header.jsp"></jsp:include>
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
function ChangeCase(elem)
{
    elem.value = elem.value.toUpperCase();
}
</script>
<script>


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

</script>
</head>
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
								<a href="internalauditsdelete" class="<c:choose>
								<c:when test="${menu=='audits'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									Delete Internal Audits
								</a>
							</li>
										</ul>
											
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
								<a title="Close" href="internalauditsdelete">
								<img alt="Success" src="resources/images/icons/icon_square_close.png"></a>
						</p>
					</div></td>
			</tr>
		</c:if>

			<tr>
				<td valign="top" align="left"><div>
						<div class="headings altheading">
							<h2>Delete Internal Audits</h2>
						</div>
						 <div class="contentbox">
						<form action="search_audit" name="dashboard" method="GET">
<div style="border:#ccc 2px solid; padding:15px; margin-bottom:15px;">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr>
 								    <td align="left" valign="middle" width="10%">Audit ID :</td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="id" class="input_txtbx" id="id" placeholder="IA1001" value="${id}"  onblur="ChangeCase(this);" onkeypress="return AlphabetsNumber(event,this);"></td>
							    <td align="left" valign="middle" width="10%">&nbsp;Process :</td>
							    <td align="left" valign="middle" width="10%">
							    <%-- <input type="text" name="process" class="input_txtbx1" id="process" value="${process}"></td> --%>
							    <select name="process" id="search_process"  class="input_txtbx" >
               					 <option value="" >--Select--</option>
              					 <c:forEach items="${processForm.processes}" var="processes" varStatus="true">
              					 <option value="${processes.process_name}" <c:if test="${processes.process_name==process}"><c:out value="selected"></c:out></c:if>>${processes.process_name}</option>
             				  	</c:forEach>
             				  </select>
             				  	</td> 
							    <td align="left" valign="middle" width="20%">&nbsp;Auditee Name :</td>
							    <td align="left" valign="middle" width="10%">
							    <select name="auditee_name" id="id_inpprocess"  class="input_txtbx">
               						<option value="">--Select--</option>
               						<c:forEach items="${processForm.processes}" var="processes" varStatus="true">
               						<option value="<c:out value="${processes.process_owner}"/>" <c:if test="${processes.process_owner==name}"><c:out value="Selected"/></c:if>><c:out value="${processes.process_owner}"/></option>
               						</c:forEach>
               						</select>
               					</td>

							    <td align="center" valign="middle" width="38%">
							  <input type="submit" class="submit_btn1" value="Search" name="search" id="id_submit" onmouseover="showTooltip('tooltip_id','inp_id3');" /></td>
							  </tr>
							</table>
						</div>
</form>
			     
					<form action="deleteinternalaudits" name="dashboard" onsubmit="return validate()" method="POST">
							<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr class="title">
							<td valign="top" align="left" width="10%">Select</td>
							<td valign="top" align="left" width="10%">Audit ID</td>
									<td valign="top" align="left" width="10%">Process</td>
									<td valign="top" align="left" width="10%">Audit Due Date</td>
									<td valign="top" align="left" width="10%">Audit Start Date</td>
									<td valign="top" align="left" width="10%">Auditor</td>									
									<td valign="top" align="left" width="12%">Finding</td>
									<td valign="top" align="left" width="10%">Completion Date</td>
									</tr>

								<!-- Display Admin Userd here  Suresh--> 
								<% int i=1; %>
							       	<c:if test = "${fn:length(internalAuditsForm.internalAudits) gt 0}">	
									<c:forEach items="${internalAuditsForm.internalAudits}" var="internalAudits" varStatus="status">
							       		<% if(i==1)
							       			i=2;
							       			else
							       			i=1;%>
							       		<tr class="row<%=i%>" onmouseover="mouse_event(this,"row_hover");" onmouseout="mouse_event(this,"row1");">
							       		<td valign="top" align="left" width="10%"><input type="checkbox" name="chkUser" value="${internalAudits.id}"/></td>
										 	<td valign="top" align="left"  width="10%">${internalAudits.id}</td> 
									       <td valign="top" align="left" width="10%">${internalAudits.process}</td>
											<td valign="top" align="left" width="10%">${internalAudits.audit_due_date}</td>
											<td valign="top" align="left" width="10%">${internalAudits.audit_start_date}</td>
											<td valign="top" align="left" width="10%">${internalAudits.auditor}</td>
											<td valign="top" align="left" width="12%">${internalAudits.finding}</td>
											<td valign="top" align="left" width="10%">${internalAudits.completion_date}</td>
											
										</tr>
							    	</c:forEach>
						    		</c:if>
						    		<c:if test="${fn:length(internalAuditsForm.internalAudits)== 0}">
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
             <li class="page_unselect"><a href="viewdeleteinternalreport_page?page=${currentpage - 1}&id=${id}&process=${process}&auditee_name=${name}" >Prev</a></li> 
               </c:if>
              
             <%-- <c:forEach var="count" begin="1" end="${noofrows}"> --%> 
               <c:forEach begin="1" end="${noofpages}" var="i">
                <c:choose>
                    <c:when test="${currentpage eq i}">
                      <li class="page"><a class="paging_select"><c:out value="${i}"></c:out></a></li>
                     </c:when>
                    <c:otherwise>
                        <li class="page_unselect"><a href="viewdeleteinternalreport_page?page=${i}&id=${id}&process=${process}&auditee_name=${name}"><c:out value="${i}"></c:out></a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>          
            <c:if test="${currentpage!=noofpages}">
              <li class="page_unselect"><a href="viewdeleteinternalreport_page?page=${currentpage+1}&id=${id}&process=${process}&auditee_name=${name}">Next</a></li> 
                 </c:if>
              <c:choose>
              <c:when test="${button=='viewall'}">
                  <li class="page"><a href="viewalldeleteinternalreport?&id=${id}&process=${process}&auditee_name=${name}" class="paging_select">ViewAll</a></li>
             </c:when>
                <c:otherwise>
                  <li class="page"><a href="internalauditsdelete" class="paging_select">Back</a></li>
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