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
<script>
function ChangeCase(elem)
{
    elem.value = elem.value.toUpperCase();
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
								<a href="customersdelete" class="<c:choose>
								<c:when test="${menu=='customer'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									Delete Customers
								</a>
							</li>
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="customersfeedbackdelete" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									Delete Customers Feedback
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
						<a title="Close" href="customersdelete">
						<img alt="Success" src="resources/images/icons/icon_square_close.png"></a>
						</p>
					</div></td>
			</tr>
		</c:if>
			<tr>
				<td valign="top" align="left"><div>
						<div class="headings altheading">
							<h2>Delete Customers</h2>
						</div>
						 <div class="contentbox">
						<div style="border:#ccc 2px solid; padding:15px; margin-bottom:15px;">
							<form action="findcustomers" method="GET">
							
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr>
							    <td align="left" valign="middle" width="10%">ID&nbsp;:</td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="customer_id" class="input_txtbx" placeholder="C1001" id="id"  value="${cusid}" onblur="ChangeCase(this);"   onkeypress="return AlphabetsNumber(event,this);"></td>
							    <td align="left" valign="middle" width="10%">&nbsp;&nbsp;Name&nbsp;:</td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="customer_name" class="input_txtbx" id="name"  value="${cusname}" onkeypress="return Alphabets(event,this);" ></td>
							    <td align="left" valign="middle" width="10%">&nbsp;&nbsp;Address&nbsp;:</td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="address" id="address" class="input_txtbx" value="${cusaddress}"></td>
							    <!-- <td align="center" valign="middle" width="38%"><input type="button" class="submit_btn" value="Find" name="find" onclick="findpart()"></td>
							     -->
							      <td align="center" valign="middle" width="20%"><input type="submit" class="submit_btn1" value="Search" name="findcustomers" ></td>
							  	<!-- <td align="center" valign="middle" width="20%"><input type="submit" class="submit_btn1" value="Clear" name="welcome" ></td> -->
							  
							  </tr>
							</table>
							</form>
						</div>

					<form action="deletecustomers" name="dashboard" onsubmit="return validate()" method="POST">
							<table cellpadding="0" cellspacing="0" border="0" width="100%">
								<tr class="title">
									<td valign="top" align="left" width="10%">Select</td>
									<td valign="top" align="left" width="10%">Customer&nbsp;ID</td>
					         	<td valign="top" align="left" width="10%">Customer Name</td>
								<td valign="top" align="left" width="10%">Address</td>
								<td valign="top" align="left" width="10%">City</td>
          						<td valign="top" align="left" width="10%">Email Address</td>
          						
        					</tr>

								<!-- Display Admin Userd here  Suresh--> 
								<% int i=1; %>
							       	<c:if test = "${fn:length(customersForm.customers) gt 0}">	       		
									<c:forEach items="${customersForm.customers}" var="customers" varStatus="status">
							       		<% if(i==1)
							       			i=2;
							       			else
							       			i=1;%>
							       		<tr class="row<%=i%>" onmouseover="mouse_event(this,"row_hover");" onmouseout="mouse_event(this,"row1");">
							       		<td valign="top" align="left" width="10%"><input type="checkbox" name="chkUser" value="${customers.customer_id}"/></td>
								           	<td valign="top" align="left"  width="10%">${customers.customer_id}</td>
									      <td valign="top" align="left" width="10%">${customers.customer_name}</td>
											<td valign="top" align="left" width="10%">${customers.address}</td>
											<td valign="top" align="left" width="10%">${customers.city}</td>
											<td valign="top" align="left" width="10%">${customers.email_address}</td>
											</tr>
							    	</c:forEach>
							    	</c:if>
							    	
							    	<c:if test="${fn:length(customersForm.customers)== 0}">
							    	<c:if test="${justcame ne false}">
							    	<tr class="row1">
							    	<td colspan="7" width="100%"><span style="color:red"><center><b>No Records Found!!!</b></center></span></td>
							    	</tr>
							    	</c:if>
							    	</c:if>
						    			


								</table>
								<br>
								<li>&nbsp;&nbsp;&nbsp;<input type="submit" value="Remove"  class="submit_btn1"></li>
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
             <li class="page_unselect"><a href="viewdeletecustomerreport_page?page=${currentpage - 1}&customer_id=${custid}&customer_name=${cusname}&address=${cusaddress}" >Prev</a></li> 
               </c:if>
              
            <%--  <c:forEach var="count" begin="1" end="${noofrows}">  --%>
               <c:forEach begin="1" end="${noofpages}" var="i">
                <c:choose>
                    <c:when test="${currentpage eq i}">
                      <li class="page"><a class="paging_select"><c:out value="${i}"></c:out></a></li>
                     </c:when>
                    <c:otherwise>
                        <li class="page_unselect"><a href="viewdeletecustomerreport_page?page=${i}&customer_id=${custid}&customer_name=${cusname}&address=${cusaddress}"><c:out value="${i}"></c:out></a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>          
            <c:if test="${currentpage!=noofpages}">
              <li class="page_unselect"><a href="viewdeletecustomerreport_page?page=${currentpage+1}&customer_id=${custid}&customer_name=${cusname}&address=${cusaddress}">Next</a></li> 
                 </c:if>
              <c:choose>
              <c:when test="${button=='viewall'}">
                  <%-- <li class="page"><a href="viewallcustomerreport?&customer_id=${cust_id}&customer_name=${name}&address=${address}" class="paging_select">ViewAll</a></li> --%>
          <li class="page"><a href="viewalldeletecustomerreport?customer_id=${custid}&customer_name=${cusname}&address=${cusaddress}" class="paging_select">ViewAll</a></li> 
             </c:when>
                <c:otherwise>
                  <li class="page"><a href="customersdelete" class="paging_select">Back</a></li>
              </c:otherwise>
              </c:choose>						
		 
		  </ul>
		  </div>
 </td>
		  </tr>
		
		
		</table></div>
		<table height="2%"><tr><td></td></tr></table>
			<script>
function ChangeCase(elem)
{
    elem.value = elem.value.toUpperCase();
}
</script>					
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
 
 
 