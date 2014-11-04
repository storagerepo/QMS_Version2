<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/jquery-ui.css"/ type="text/css">

 
<div id="right_content">
	
		<table cellpadding="0" cellspacing="0" border="0" width="98%"
			class="margin_table">
<tr>
<td>
 <div>
  <ul class="horizmenu">
						
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="add_nonconformance" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Add Nonconformance</span>
									
								</a>
							</li>

							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="view_nonconformance" class="<c:choose>
								<c:when test="${menu=='nonconformance'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									<span>View Nonconformance</span>
									
								</a>
							</li>
							
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="nonconformance_report" class="<c:choose>
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
						<a title="Close" href="view_nonconformance">
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
						<a title="Close" href="view_nonconformance">
						<img alt="Success" src="resources/images/icons/icon_square_close.png"></a>
						</p>
					</div></td>
			</tr>
		</c:if>
			<tr>
				<td valign="top" align="left">
						<div class="headings altheading">
							<h2>Search Non Conformance</h2>
						</div>
						
						<div class="contentbox">
							<div style="border:#ccc 2px solid; padding:15px; margin-bottom:15px;">
							<form action="findnonconformance" method="get">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr>
							    <td align="left" valign="middle"> NC ID&nbsp;: </td>
							    <td align="left" valign="middle"><input type="text" name="id" class="input_txtbx" id="id" value="${nc}"></td>
							    <td align="left" valign="middle">Type of Non Conformance&nbsp;:</td>
							    <td valign="middle" align="left"><select name="type_of_nonconformance" id="type_of_nonconformance" class="input_txtbx">
				                  										<option value="">--Select--</option>
						                    							<option
						                    							<c:if test="${'Product Quality' eq typenc}"><c:out value="Selected"/></c:if>
				                  										<%-- <c:if test="${nonconformance.type_of_nonconformance eq 'Product Quality'}"><c:out value="Selected"/></c:if> --%>
																		value="Product Quality">Product Quality</option>
																		<option
																		<c:if test="${'Service Quality' eq typenc}"><c:out value="Selected"/></c:if>
				                  										<%-- <c:if test="${nonconformance.type_of_nonconformance eq 'Service Quality'}"><c:out value="Selected"/></c:if> --%>
																		value="Service Quality">Service Quality</option>
																		<option
																		<c:if test="${'Late Delivery' eq typenc}"><c:out value="Selected"/></c:if>
				                  										<%-- <c:if test="${nonconformance.type_of_nonconformance eq 'Late Delivery'}"><c:out value="Selected"/></c:if> --%>
																		value="Late Delivery">Late Delivery</option>
																		<option
																		<c:if test="${'Early Delivery' eq typenc}"><c:out value="Selected"/></c:if>
				                  									<%-- 	<c:if test="${nonconformance.type_of_nonconformance eq 'Early Delivery'}"><c:out value="Selected"/></c:if> --%>
																		value="Early Delivery">Early Delivery</option>
															<c:forEach items="${type_of_NC_Form.type_of_NCs}" var="types" varStatus="status">
        				      										 <option value="${types.type_of_nc}"<c:if test="${types.type_of_nc eq typenc}"><c:out value="selected"/></c:if>>${types.type_of_nc}</option>
			                  								</c:forEach>
																	</select></td>
							 <!--    <td align="left" valign="top"><input type="text" name="type_of_nonconformance" id="type_of_nonconformance" class="input_text"></td>
							  --><!--    <td align="left" valign="top">Product Id:</td>
							    <td align="left" valign="top"><input type="text" name="product_id" id="product_id" class="input_text"></td>
							   -->
							    <td align="center" valign="top"><input type="submit" class="submit_btn1" value="Search" name="findnonconformance"></td>
							    
							  </tr>
							</table>
							</form>
						</div>
				<form action="view_nonconformance" name="dashboard" method="POST">			
							<table cellpadding="0" cellspacing="0" border="0" width="100%">
								<tr class="title">
									<td valign="top" align="left" width="10%">ID</td>
									<td valign="top" align="left" width="20%">Source of NonConformance</td>
									<!-- <td valign="top" align="left" width="10%">External ID</td> 
									 --><td valign="top" align="left" width="20%">Type of Non Conformance</td>
									<td valign="top" align="left" width="20%">Product ID</td>
									<td valign="top" align="left" width="20%">Quantity Suspect</td>
									<td valign="top" align="left" width="20%">Action</td>
									
									</tr>

								<!-- Display Admin Userd here  Suresh--> 
								<% int i=1; %>
							       	<c:if test="${fn:length(nonConformanceForm.nonconformance) gt 0}">
							       	<c:forEach items="${nonConformanceForm.nonconformance}" var="nonconformance" varStatus="status">
							       		<% if(i==1)
							       			i=2;
							       			else
							       			i=1;%>
							       		<tr class="row<%=i%>" onmouseover="mouse_event(this,"row_hover");" onmouseout="mouse_event(this,"row1");">
								           	<td valign="top" align="left"  width="10%"><a href="list_nonconformance?id=${nonconformance.id}">${nonconformance.id}</a></td>
								           	
											<td valign="top" align="left" width="20%">${nonconformance.source_of_nonconformance}</td>
										<%-- 	<td valign="top" align="left" width="10%">${nonconformance.external_id}</td> 
										 --%>	<td valign="top" align="left" width="20%">${nonconformance.type_of_nonconformance}</td>
											<td valign="top" align="left" width="20%">${nonconformance.product_id}</td>
											<td valign="top" align="left" width="20%">${nonconformance.quantity_suspect}</td>
											<td valign="top" align="left" width="20%">
											<a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a><a href="<c:out value="edit_nonconformance?id=${nonconformance.id}"/>" style="padding-right:10px;">Edit</a>
										<%-- 	<a href="#" title=""><img src="resources/images/icons/icon_delete.png" alt="Delete" /></a><a href="<c:out value="delete_nonconformance?id=${nonconformance.id }"/>" onclick="return confirmation()">Remove</a> --%>
										 </td>
										</tr>
							    	</c:forEach>
						    		</c:if>
						    		

  									<c:if test="${fn:length(nonConformanceForm.nonconformance) == 0}">	
							   <c:if test="${justcame ne false}">
							    	<tr class="row1">
							    	<td colspan="7" width="100%"><center><span style="color:red;"><b>No Records Found!!!</b></span></center></td>
							    		
							    	</tr></c:if>
							    
							    	</c:if>
<tr height="30px"></tr>
<tr>

								
               <td colspan="6"  class="extrabottom">  
	<div>
             <ul class="pagination">
        
             <c:if test="${currentpage!=1&&currentpage!=null}">
             <li class="page_unselect"><a href="viewnonconformancereport_page?page=${currentpage - 1}&id=${nc}&type_of_nonconformance=${typenc}">Prev</a></li> 
               </c:if>
              
             <%-- <c:forEach var="count" begin="1" end="${noofrows}"> --%> 
               <c:forEach begin="1" end="${noofpages}" var="i">
                <c:choose>
                    <c:when test="${currentpage eq i}">
                      <li class="page"><a class="paging_select"><c:out value="${i}"></c:out></a></li>
                     </c:when>
                    <c:otherwise>
                        <li class="page_unselect"><a href="viewnonconformancereport_page?page=${i}&id=${nc}&type_of_nonconformance=${typenc}"><c:out value="${i}"></c:out></a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>          
            <c:if test="${currentpage!=noofpages}">
              <li class="page_unselect"><a href="viewnonconformancereport_page?page=${currentpage+1}&id=${nc}&type_of_nonconformance=${typenc}">Next</a></li> 
                 </c:if>
              <c:choose>
              <c:when test="${button=='viewall'}">
                  <li class="page"><a href="viewallnonconformancereport?id=${nc}&type_of_nonconformance=${typenc}" class="paging_select">ViewAll</a></li>
             </c:when>
                <c:otherwise>
                  <li class="page"><a href="view_nonconformance" class="paging_select">Back</a></li>
              </c:otherwise>
              </c:choose>					
		 
		  </ul>
		  </div>
		  </td>
		  </tr>
</table>
</form>
</div>

</td>
</tr>
<tr height="250"><td></td></tr>
</table>
</div>


<script>
function confirmation() {
	var answer = confirm("Are you sure want to remove NonConformance Form ?");
	if (answer){
		return true;
	}
	else
		return false;
	
}
</script>
						<br><br><br><br><br><br><br><br><br>
<jsp:include page="footer.jsp"></jsp:include></html>


