<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" />

<jsp:include page="header.jsp"></jsp:include>
<script src="resources/js/jquery.min.js"></script>
 <script src="resources/js/jquery-ui.js"></script>

<script type="text/javascript" src="js/ajaxpaging.js"></script>
<script src="resources/js/jquery_checkbox.js" type="text/javascript"></script>

<div id="right_content">
	
    	<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      		<tr>
      		<td>
      		 <div>
  <ul class="horizmenu" style=" float:left;margin-left:190px; margin-top:8px;">
						
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addcorrectiveAndPreventiveActions" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Add Corrective and Preventive Actions</span>
									
								</a>
							</li>
						<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="correctiveactions_list" class="<c:choose>
								<c:when test="${menu=='corrective'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									<span>View Corrective and Preventive Actions</span>
								</a>
							</li>
				           <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="capa_report" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Reports</span>
								</a>
							</li>
							</ul>
  </div>
      		</td>
      		</tr>
		 	<tr>
		
			<c:if test="${success=='insert'}">
			<tr>
				<td valign="top" align="left" style="padding: 5px 0 10px 200px;">&nbsp;
					<div id="success_statusbar" class="status success">
						<p class="closestatus">
						<img alt="Success" src="resources/images/icons/inserted.png">
						<a title="Close" href="correctiveactions_list">
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
						<a title="Close" href="correctiveactions_list">
						<img alt="Success" src="resources/images/icons/icon_square_close.png"></a>
						</p>
					</div></td>
			</tr>
		</c:if>
    </tr> 
      		<tr>
        		<td valign="top" align="left">
			        <div class="headings altheading">
			          <h2>Search Corrective and Preventive Actions Details</h2>
			        </div>
			        <div class="contentbox">

			     <form action="search_correctiveactions" name="dashboard" method="GET">
			     <div style="border:#ccc 2px solid; padding:15px; margin-bottom:15px;">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr>
							    <td align="left" valign="middle" width="10%">CAPA ID :</td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="capa_id" class="input_txtbx" id="capa_id" value="${capa}"></td>
							    <td align="left" valign="middle" width="15%">&nbsp;Request date :</td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="request_date" class="input_txtbx" id="datepicker" value="${date}"><span style="color: red;" id="datepickererr"></td>
							    <td align="left" valign="middle" width="15%">&nbsp;Actions :</td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="action" id="action" class="input_txtbx" value="${action}"></td>
							    <td align="center" valign="middle" width="38%">
							  <input type="submit" class="submit_btn1" name="search" value="Search" id="id_submit" onmouseover="showTooltip('tooltip_id','inp_id3');"/></td>
							  </tr>
	</table></div></form>
			      <form action="correctiveactions_list" method="POST"> 
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
				     <tr class="title">
				     <td valign="top" align="left" width="20%">CAPA ID</td>
							<td valign="top" align="left" width="20%">NC ID</td>
							<td valign="top" align="left" width="20%">CAPA Requester</td>
							<td valign="top" align="left" width="20%">CAPA Due Date</td>
							<td valign="top" align="left" width="20%">File</td>
							<td valign="top" align="left" width="20%">Actions</td>
							</tr>
							<c:if test="${fn:length(correctiveAndPreventiveActionsForm.correctiveAndPreventiveActions) gt 0}">
        				  <c:forEach items="${correctiveAndPreventiveActionsForm.correctiveAndPreventiveActions}" var="correctiveAndPreventiveActions" varStatus="status">
        				       				<tr class="row1">
        				       				
        				       				
        				       				 <td valign="top" align="left"  width="10%"> <a href="view_correctiveandpreventive?capa_id=${correctiveAndPreventiveActions.capa_id}">${correctiveAndPreventiveActions.capa_id}</a></td>
        				       				 <td valign="top" align="left" width="15%">${correctiveAndPreventiveActions.nc_id}</td>
        				       				 <td valign="top" align="left" width="15%">${correctiveAndPreventiveActions.capa_requestor}</td>
        				       				 <td valign="top" align="left" width="15%">${correctiveAndPreventiveActions.capa_due_date}</td>
        				       				<c:choose>
											<c:when test="${correctiveAndPreventiveActions.attachment_name!='null'}">
											<td valign="top" align="left" width="10%"><a href="<c:out value="downloadMaindoc1?capa_id=${correctiveAndPreventiveActions.capa_id}"></c:out>">Download</a></td>
										</c:when>
										<c:otherwise><td valign="top" align="left" width="10%">No Document</td>
										</c:otherwise>
										</c:choose>	
        				       				<%--  <td valign="top" align="left" width="15%">${correctiveAndPreventiveActions.action}</td>
 --%>
        				       					<td valign="top" align="left">
												<a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a><a href="<c:out value="edit_correctiveAndPreventiveActions?capa_id=${correctiveAndPreventiveActions.capa_id}"/>" style="padding-right:10px;">Edit</a>
											<%-- <a href="#" title=""><img src="resources/images/icons/icon_delete.png" alt="Delete" /></a><a href="<c:out value="delete_correctiveAndPreventiveActions?capa_id=${correctiveAndPreventiveActions.capa_id}"/>" onclick="return confirmation()">Remove</a> --%>
											 </td>
        				       				 </tr>
        				       				 </c:forEach>
        				       				 </c:if>
        				       				  <c:if test="${fn:length(correctiveAndPreventiveActionsForm.correctiveAndPreventiveActions) == 0}">	
							    	<c:if test="${justcame ne false}"><tr class="row1">
							    	<td colspan="7" width="100%"><center><span style="color:red;"><b>No Records Found!!!</b></span></center></td>
							    		
							    	</tr></c:if>
							    	</c:if>
        				       				 </table>
        				       				 
        				       				 					<tr><td colspan="6">  
	<div class="extrabottom">
             <ul class="pagination">
        
             <c:if test="${currentpage!=1&&currentpage!=null}">
             <li class="page_unselect"><a href="viewcorrectivereport_page?page=${currentpage - 1}&capa_id=${capa}&request_date=${date}&action=${action}" >Prev</a></li> 
               </c:if>
              
             <%-- <c:forEach var="count" begin="1" end="${noofrows}"> --%> 
             
               <c:forEach begin="1" end="${noofpages}" var="i">
                <c:choose>
                    <c:when test="${currentpage eq i}">
                      <li class="page"><a class="paging_select"><c:out value="${i}"></c:out></a></li>
                     </c:when>
                    <c:otherwise>
                   
                        <li class="page_unselect"><a href="viewcorrectivereport_page?page=${i}&capa_id=${capa}&request_date=${date}&action=${action}"><c:out value="${i}"></c:out></a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>          
            <c:if test="${currentpage!=noofpages}">
              <li class="page_unselect"><a href="viewcorrectivereport_page?page=${currentpage+1}&capa_id=${capa}&request_date=${date}&action=${action}">Next</a></li> 
                 </c:if>
              <c:choose>
              <c:when test="${button=='viewall'}">
                  <li class="page"><a href="viewallcorrectivereport?&capa_id=${capa}&request_date=${date}&action=${action}" class="paging_select">ViewAll</a></li>
             </c:when>
                <c:otherwise>
                  <li class="page"><a href="correctiveactions_list" class="paging_select">Back</a></li>
              </c:otherwise>
              </c:choose>					
		 
		  </ul>
		  </div>
		  </td>
		  </tr>
        				       				</form>
        				       				
        				       				
        				       				</td>
        				       				</tr>
        				       				</table>
        				       				</div>
        				       				
        				  <table   height=50>
			<tr height=30><td></td></tr></table>
<script language="javascript">

function confirmation() {
	var answer = confirm("Are you Sure You Want to Delete this record?")
	if (answer){
		return true;
	}
	else{
		return false;
	}
}


</script> 
 <script>
 $(function() {
           $( "#datepicker" ).datepicker({dateFormat: 'yy-mm-dd'});
         });
 
</script>
<!-- <script>
function validation()
{
	var error="";
	var date = /^\d{4}-(0?[1-9]|1[012])-(0?[1-9]|[12][0-9]|3[01])$/;
	var datepicker = document.getElementById('datepicker').value;
	if(datepicker == "")
	 {
		
	 document.getElementById("datepickererr").innerHTML="Required field should not be empty";
	 error="true";
	 
	 }
	 
	else if(datepicker.match(date))
	 {
	 document.getElementById("datepickererr").innerHTML="";
	 }
	 else
	 {
	 document.getElementById("datepickererr").innerHTML="Invalid Date";
	 error="true";
	 }

}
</script>  -->  
<br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

<jsp:include page="footer.jsp"></jsp:include>				       				