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
								<a href="" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>" rel="noncon">
									<span>Add Set-up</span>
								</a>
							</li>
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>"rel="noncon1">
									<span>View/Delete Set-up</span>
								</a>
							</li>
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="nonconformancedelete" class="<c:choose>
									<c:when test="${menu=='nonconformance'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
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
						<a title="Close" href="nonconformancedelete">
						<img alt="Success" src="resources/images/icons/icon_square_close.png"></a>
						</p>
					</div></td>
			</tr>
		</c:if>			<tr>
				<td valign="top" align="left"><div>
						<div class="headings altheading">
							<h2>Delete Non Conformances </h2>
						</div>
	<div class="contentbox">
							<div style="border:#ccc 2px solid; padding:15px; margin-bottom:15px;">
							<form action="findnonconformances" method="get">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr>
							    	    <td align="left" valign="middle" width="10%"> NC ID&nbsp;: </td>
							    <td align="left" valign="middle"><input type="text" name="id" class="input_txtbx" id="id" placeholder="NC1001" onblur="ChangeCase(this)" value="" onkeypress="return AlphabetsNumber(event,this);" maxlength="15"></td>
							    <td align="left" valign="middle">Type of Non Conformance&nbsp;:</td>
							    <td valign="top" align="left" class="input_txt">
				                  									<select name="type_of_nonconformance" id="type_of_nonconformance" class="input_txtbx">
				                  										<option value="">--Select--</option>
						                    							<option
						                    							<c:if test="${'Product Quality' eq type}"><c:out value="Selected"/></c:if>
				                  										<c:if test="${nonconformance.type_of_nonconformance eq 'Product Quality'}"><c:out value="Selected"/></c:if>
																		value="Product Quality">Product Quality</option>
																		<option
																		<c:if test="${'Service Quality' eq type}"><c:out value="Selected"/></c:if>
				                  										<c:if test="${nonconformance.type_of_nonconformance eq 'Service Quality'}"><c:out value="Selected"/></c:if>
																		value="Service Quality">Service Quality</option>
																		<option
																		<c:if test="${'Late Delivery' eq type}"><c:out value="Selected"/></c:if>
				                  										<c:if test="${nonconformance.type_of_nonconformance eq 'Late Delivery'}"><c:out value="Selected"/></c:if>
																		value="Late Delivery">Late Delivery</option>
																		<option
																		<c:if test="${'Early Delivery' eq type}"><c:out value="Selected"/></c:if>
				                  										<c:if test="${nonconformance.type_of_nonconformance eq 'Early Delivery'}"><c:out value="Selected"/></c:if>
																		value="Early Delivery">Early Delivery</option>
															<c:forEach items="${type_of_NC_Form.type_of_NCs}" var="types" varStatus="status">
        				      										 <option value="${types.type_of_nc}"<c:if test="${types.type_of_nc eq type}"><c:out value="selected"/></c:if>>${types.type_of_nc}</option>
			                  								</c:forEach>
																	</select></td>
							 <!--    <td align="left" valign="middle"><input type="text" name="type_of_nonconformance" id="type_of_nonconformance" class="input_text"></td>
							  --><!--    <td align="left" valign="middle">Product Id:</td>
							    <td align="left" valign="middle"><input type="text" name="product_id" id="product_id" class="input_text"></td>
							   -->
							    <td align="center" valign="middle"><input type="submit" class="submit_btn1" value="Search" name="findnonconformance"></td>
							    <td align="center" valign="middle"><!-- <input type="reset" class="submit_btn1" value="Clear"></td> -->
							  </tr>
							</table>
							</form>
						</div>
							    	
							    	<form action="deletenonconformance" name="dashboard" onsubmit="return validate()" method="POST">
							<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr class="title">
							<td valign="top" align="left" width="10%">Select</td>
							<td valign="top" align="left" width="15%">ID</td>
									 <td valign="top" align="left" width="20%">Source of Non Conformance</td>
									<!-- <td valign="top" align="left" width="10%">External ID</td>  -->
									<td valign="top" align="left" width="20%">Type of Non Conformance</td>
									<td valign="top" align="left" width="20%">Product ID</td>
									<td valign="top" align="left" width="20%">Quantity Suspect</td>
									
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
							       		<td valign="top" align="left" width="10%"><input type="checkbox" name="chkUser" value="${nonconformance.id}"/></td>
					<%-- 			           	<td valign="top" align="left"  width="10%">${documentMains.document_id}</td> --%>
									        	<td valign="top" align="left"  width="15%">${nonconformance.id}</td>
									        <td valign="top" align="left" width="20%">${nonconformance.source_of_nonconformance}</td>
									        <td valign="top" align="left" width="20%">${nonconformance.type_of_nonconformance}</td>
											<td valign="top" align="left" width="20%">${nonconformance.product_id}</td>
											<td valign="top" align="left" width="15%">${nonconformance.quantity_suspect}</td>
											
										</tr>
							    	</c:forEach>
							    	</c:if>
							    	 <c:if test="${fn:length(nonConformanceForm.nonconformance) == 0}">	
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
	  
		  <tr>	
<td colspan="6">  
	<div class="extrabottom">
             <ul class="pagination">
        
			<c:if test="${currentpage!=1&&currentpage!=null}">
             <li class="page_unselect"><a href="viewdeletenonconformancereport_page?page=${currentpage - 1}&id=${id}&type_of_nonconformance=${type}" >Prev</a></li> 
               </c:if>
             
               <c:forEach begin="1" end="${noofpages}" var="i">
                <c:choose>
                    <c:when test="${currentpage eq i}">
                      <li class="page"><a class="paging_select"><c:out value="${i}"></c:out></a></li>
                     </c:when>
                    <c:otherwise>
                        <li class="page_unselect"><a href="viewdeletenonconformancereport_page?page=${i}&id=${id}&type_of_nonconformance=${type}"><c:out value="${i}"></c:out></a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>          
            <c:if test="${currentpage!=noofpages}">
              <li class="page_unselect"><a href="viewdeletenonconformancereport_page?page=${currentpage+1}&id=${id}&type_of_nonconformance=${type}">Next</a></li> 
                 </c:if>
              <c:choose>
              <c:when test="${button=='viewall'}">
                  <li class="page"><a href="viewalldeletenonconformancereport?&id=${id}&type_of_nonconformance=${type}" class="paging_select">ViewAll</a></li>
             </c:when>
                <c:otherwise>
                  <li class="page"><a href="nonconformancedelete" class="paging_select">Back</a></li>
              </c:otherwise>
              </c:choose>							 
		  </ul>
</div></td>
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
 <br><br><br><br>
 <jsp:include page="footer.jsp"></jsp:include> 