<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="header.jsp"></jsp:include>
<div id="right_content">

	
		<table cellpadding="0" cellspacing="0" border="0" width="98%"
			class="margin_table">
<tr>
<td>
<div>
  <ul class="horizmenu">
  						<c:if test="${role==2}">
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addinternalaudits" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Add Internal Audits</span>
									
								</a>
							</li>
								<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="add_finding" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>" rel="audit_finding">
									<span>Add Internal Audits Finding</span>
								</a>
							</li>
							
					   </c:if>
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="view_internalaudits" class="<c:choose>
								<c:when test="${menu=='audits'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									<span>View Internal Audits </span>
									
								</a>
							</li>
						<c:if test="${role==2}">
								<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
									<a href="finding_list" class="<c:choose>
									<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
										<span>View Internal Audits Finding</span>
										
									</a>
							</li>
						    </c:if>
				         <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="internalaudit_report" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Reports</span>
									
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
						<a title="Close" href="view_internalaudits">
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
						<a title="Close" href="view_internalaudits">
						<img alt="Success" src="resources/images/icons/icon_square_close.png"></a>
						</p>
					</div></td>
			</tr>
		</c:if>
			<tr>
				<td valign="top" align="left"><div>
						<div class="headings altheading">
							<h2>Search Internal Audits Details</h2>
						</div>
						<div class="contentbox">
						<form action="search_audits" name="dashboard" method="GET">
<div style="border:#ccc 2px solid; padding:15px; margin-bottom:15px;">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr>
							    <td align="left" valign="middle" width="8%">Audit ID :</td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="id" class="input_txtbx" id="id" placeholder="IA1001" onblur="ChangeCase(this);" onkeypress="return onlyAlphabets(event,this);" value="${id}">
							    <br><span id="iderror" style="color:red"></span>
							    </td>
							     <td align="left" valign="middle" width="10%">
							    <td align="left" valign="middle" width="8%">Process :</td>
							    <td align="left" valign="middle" width="10%">
					
							    <select name="process" id="process"  class="input_txtbx">
               					 <option value="" >--Select--</option>
              					 <c:forEach items="${processForm.processes}" var="processes" varStatus="true">
              					 <option value="${processes.process_name}" <c:if test="${processes.process_name==process}"><c:out value="selected"></c:out></c:if>>${processes.process_name}</option>
             				  	</c:forEach>
             				  </select>
             				  	</td> 
             				  	 <td align="left" valign="middle" width="10%">
							    <td align="left" valign="middle" width="15%">Auditee Name :</td>
							    <td align="left" valign="middle" width="10%">
							    <select name="auditee_name" id="auditee"  class="input_txtbx">
               						<option value="">--Select--</option>
               						<c:forEach items="${processForm.processes}" var="processes" varStatus="true">
               						<option value="<c:out value="${processes.process_owner}"/>" <c:if test="${processes.process_owner==name}"><c:out value="Selected"/></c:if>><c:out value="${processes.process_owner}"/></option>
               						</c:forEach>
               						</select>
               					</td>
                   <td align="center" valign="middle" width="38%">
							  <input type="submit" class="submit_btn1" value="Search" onclick="return validation();"id="id_submit" onmouseover="showTooltip('tooltip_id','inp_id3');" />
							  <br><span id="searcherror" style="color:red"></span>
							  </td>
							  </tr>
							</table>
						</div>
</form>
					<form action="?do=viewparticipants" name="dashboard" method="POST">
							<table cellpadding="0" cellspacing="0" border="0" width="100%">
								<tr class="title">
									<td valign="top" align="left" width="10%">Audit Id</td>
									<td valign="top" align="left" width="10%">Process</td>
									<td valign="top" align="left" width="15%">Audit Due Date</td>
									<td valign="top" align="left" width="15%">Audit Start Date</td>
									<td valign="top" align="left" width="10%">Auditor</td>									
									<td valign="top" align="left" width="10%">Finding</td>
									<td valign="top" align="left" width="15%">Completion Date</td>
									<td valign="top" align="left" width="10%">Actions</td>
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
								           	<td valign="top" align="left"  width="10%"><a href="list_internalaudit?id=${internalAudits.id}">${internalAudits.id}</a></td>
											<td valign="top" align="left" width="10%">${internalAudits.process}</td>
											<td valign="top" align="left" width="10%">${internalAudits.audit_due_date}</td>
											<td valign="top" align="left" width="10%">${internalAudits.audit_start_date}</td>
											<td valign="top" align="left" width="10%">${internalAudits.auditor}</td>
											<td valign="top" align="left" width="10%">${internalAudits.finding}</td>
											<td valign="top" align="left" width="15%">${internalAudits.completion_date}</td>
											
											
											 <td valign="top" align="left" width="15%">
											<a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a><a href="edit_internalaudit?id=<c:out value="${internalAudits.id}"/>">Edit</a>
											<%-- <a href="#" title=""><img src="resources/images/icons/icon_delete.png" alt="Delete" /></a><a href="<c:out value="delete_internalaudit?id=${internalAudits.id}"/>" onclick="return confirmation()">Delete</a> --%>
											
											</td> 
										</tr>
							    	</c:forEach>
							    	</c:if>
							    	
							    	<c:if test="${fn:length(internalAuditsForm.internalAudits)== 0}">
							    	<c:if test="${justcame ne false}">
							    	<tr class="row1">
							    	<td colspan="7" width="100%"><center><b style="color:red">No Records Found!!!</b></center></td>
							    	</tr></c:if>
							    	</c:if>
						    	
						    	

								

								</table>
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
             <li class="page_unselect"><a href="viewinternalreport_page?page=${currentpage - 1}&id=${id}&process=${process}&auditee_name=${name}" >Prev</a></li> 
               </c:if>
              
             <%-- <c:forEach var="count" begin="1" end="${noofrows}"> --%> 
               <c:forEach begin="1" end="${noofpages}" var="i">
                <c:choose>
                    <c:when test="${currentpage eq i}">
                      <li class="page"><a class="paging_select"><c:out value="${i}"></c:out></a></li>
                     </c:when>
                    <c:otherwise>
                        <li class="page_unselect"><a href="viewinternalreport_page?page=${i}&id=${id}&process=${process}&auditee_name=${name}"><c:out value="${i}"></c:out></a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>          
            <c:if test="${currentpage!=noofpages}">
              <li class="page_unselect"><a href="viewinternalreport_page?page=${currentpage+1}&id=${id}&process=${process}&auditee_name=${name}">Next</a></li> 
                 </c:if>
              <c:choose>
              <c:when test="${button=='viewall'}">
                  <li class="page"><a href="viewallinternalreport?&id=${id}&process=${process}&auditee_name=${name}" class="paging_select">ViewAll</a></li>
             </c:when>
                <c:otherwise>
                  <li class="page"><a href="view_internalaudits" class="paging_select">Back</a></li>
              </c:otherwise>
              </c:choose>		
              </ul>
              </div>
              </td>
         </tr>
         </table>
         </div>
 <script>
   
 $(function() {
		$("#id").on("keypress", function(e) {
		
		if (e.which === 32 && !this.value.length)
	        e.preventDefault();
	});
	});
  </script>               
  <script>
  function ChangeCase(elem)
  {
      elem.value = elem.value.toUpperCase();
  }
  </script>
<script type="text/javascript">  
function validatename2(id){
	
    var textInput = document.getElementById(id).value;
    textInput = textInput.replace(/[^A-Za-z0-9]/g, "");
    document.getElementById(id).value = textInput;
} 
function confirmation() {
	var answer = confirm("Are you Sure You Want to Delete Internal Audits Form ?")
	if (answer){
		return true;
	}
	else
		return false;
	
}
</script>
<!-- <script type="text/javascript">
function validation()
{
	var error = "";
	var id = document.getElementById('id').value;
	var process = document.getElementById('process').value;
	var auditee = document.getElementById('auditee').value;
	document.getElementById('searcherror').innerHTML = "";
	document.getElementById('iderror').innerHTML = "";
	
	if((id == "") && (process == "") && (auditee == ""))
	{
		document.getElementById('searcherror').innerHTML = "Input is empty";
		error = "true";
	}
	else
	{
		if(id.length > 0 )
		{
			if((id.length < 4) || (id.length > 32))
			{
				document.getElementById('iderror').innerHTML = "Required field should of length 4 to 32";
				error = "true";
			}
			else
			{
				document.getElementById('iderror').innerHTML = "";
			}
		}
		else
		{
			document.getElementById('iderror').innerHTML = "";
		}
		
	}	
	
	if(error == "true")
	{
		return false;
	}
}
</script>
 -->
 
 <script>
 function onlyAlphabetsnumeric(e, t) {
     try {
         if (window.event) {
             var charCode = window.event.keyCode;
         }
         else if (e) {
             var charCode = e.which;
         }
         else { return true; }
         if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123)|| (charCode==32) || (charCode > 47 && charCode < 58))
             return true;
         else
             return false;
     }
     catch (err) {
         alert(err.Description);
     }
 }
 
 </script>
 
 <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
      
      <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<jsp:include page="footer.jsp"></jsp:include>