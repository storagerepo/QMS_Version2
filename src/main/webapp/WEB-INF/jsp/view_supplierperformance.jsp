<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="header.jsp"></jsp:include>

<html>
<head>

<script type="text/javascript" src="js/ajaxpaging.js"></script>
</head>
<body>
<div id="right_content">
	 	<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      		<tr>
				<td>
				 <div>
  <ul class="horizmenu">
  							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="add_supplierperformance" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Add SupplierPerformance</span>
									
								</a>
							</li>
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="view_supplierperformance" class="<c:choose>
								<c:when test="${menu=='supplier'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									<span>View SupplierPerformance</span>
									
								</a>
							</li>
				            <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="supplierperformance_report" class="<c:choose>
								<c:when test="${menu=='supplier'}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Reports</span>
									
								</a>
							</li>
				            
				            </ul>
  </div>
				</td>
				</tr>
				<tr>
			
		<c:if test="${success=='true'}">
			<tr>
				<td valign="top" align="left" style="padding: 5px 0 10px 200px;">&nbsp;
					<div id="success_statusbar" class="status success">
						<p class="closestatus">
						<img alt="Success" src="resources/images/icons/inserted.png">
						<a title="Close" href="view_supplierperformance">
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
						<a title="Close" href="view_supplierperformance">
						<img alt="Success" src="resources/images/icons/icon_square_close.png"></a>
						</p>
					</div></td>
			</tr>
		</c:if>
	</tr> 
			<tr>
        		<td valign="top" align="left">
			        <div class="headings altheading">
			          <h2>Search Supplier Performance</h2>
			        </div>
			        <div class="contentbox">
 			        <div style="border:#ccc 2px solid; padding:15px; margin-bottom:15px;">
							<form action="findsupplierperformance" method="GET">
							
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr>
							    <td align="left" valign="middle">Supplier Name :</td>
							    <td align="left" valign="middle"><input type="text" name="supplier_name" onkeypress="return onlyAlphabets(event,this);" class="input_txtbx" id="name"  value="${suppliername}"></td>
							    <td align="left" valign="middle">&nbsp;&nbsp;Phone :</td>
								<td align="left" valign="middle">&nbsp;&nbsp;<input type="text" name="phone" id="phone" onkeypress="return validate(event);" maxlength="10" class="input_txtbx" value="${phone}"></td>							    
							    <td align="left" valign="middle">&nbsp;&nbsp;Email :</td>
							    <td align="left" valign="middle">&nbsp;&nbsp;<input type="text" name="email_address" id="mail" class="input_txtbx" value="${email}"></td>
							    <td align="center" valign="middle"><input type="submit" class="submit_btn1" value="Search" name="findsupplierperformance" ></td>
							  	
							  
							  </tr>
							  
							</table>
							</form>
						</div> 

	<form action="?do=viewparticipants" name="dashboard" method="POST">
   				
				        <table cellpadding="0" cellspacing="0" border="0" width="100%">
				        
				        
							<tr class="title">
								<!-- <td valign="center" align="left" width="5%"><input type="checkbox" onclick="selectall(this.form)" value="" name="checkall"></td> -->
         						<td valign="top" align="left" width="10%">&nbsp;Supplier ID</td>
					         	<td valign="top" align="left" width="10%">Supplier name</td>
					         	<td valign="top" align="left" width="10%">Address</td>
					         	<td valign="top" align="left" width="10%">State</td>
          						<td valign="top" align="left" width="10%">Country</td>
          						<td valign="top" align="left" width="10%">Phone</td>
          						<td valign="top" align="left" width="10%" >Email address</td>
          						<td valign="top" align="left" width="10%">Actions</td>
        					</tr>
						
						 <c:if test="${fn:length(supplierPerformanceForm.supplierperformance) gt 0}">
						<% int i=1; %>
							       		
									<c:forEach items="${supplierPerformanceForm.supplierperformance}" var="supplierperformance" varStatus="status">
							       		<% if(i==1)
							       			i=2;
							       			else
							       			i=1;%>
							       		<tr class="row<%=i%>" ">
								           	<td valign="top" align="left"  width="10%"><a href="list_supplierperformance?supplier_id=${supplierperformance.supplier_id}">${supplierperformance.supplier_id}</a></td>
											<td valign="top" align="left" width="10%">${supplierperformance.supplier_name}</td>
											<td valign="top" align="left" width="10%">${supplierperformance.address}</td>
									       <td valign="top" align="left" width="10%">${supplierperformance.state}</td>
									       <td valign="top" align="left" width="10%">${supplierperformance.country}</td>
										<td valign="top" align="left" width="10%">${supplierperformance.phone}</td>
											<td valign="top" align="left" width="10%">${supplierperformance.email_address}</td>	
										<td valign="top" align="left" width="10%">
								 			<a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a><a href="<c:out value="editsupplierperformance?sid=${supplierperformance.supplier_id}"/>" style="padding-right:10px;">Edit</a>
										<%-- 	<a href="#" title=""><img src="resources/images/icons/icon_delete.png" alt="Delete" /></a><a href="<c:out value="deletesupplierperformance?sid=${supplierperformance.supplier_id}"/>" onclick="return confirmation()">Remove</a> --%>
								 		</td>
											</tr>
							    	</c:forEach>
						    	</c:if>
						 <c:if test="${fn:length(supplierPerformanceForm.supplierperformance) == 0}">	
							    <c:if test="${justcame ne false}">
							    	<tr class="row1">
							    	<td colspan="7" width="100%"><center><span style="color:red;"><b>No Records Found!!!</b></span></center></td>
							    		
							    	</tr></c:if>
							    	</c:if>		
						
						</table>
						</form>
					</div>
				</td>
				</tr>
				<tr>
				<td colspan="6">  
	<div class="extrabottom">
             <ul class="pagination">
        
             <c:if test="${currentpage!=1&&currentpage!=null}">
             <li class="page_unselect"><a href="viewsupplierreport_page?page=${currentpage - 1}&supplier_name=${suppliername}&phone=${phone}&email_address=${email}" >Prev</a></li> 
               </c:if>
              
             <%-- <c:forEach var="count" begin="1" end="${noofrows}"> --%> 
               <c:forEach begin="1" end="${noofpages}" var="i">
                <c:choose>
                    <c:when test="${currentpage eq i}">
                      <li class="page"><a class="paging_select"><c:out value="${i}"></c:out></a></li>
                     </c:when>
                    <c:otherwise>
                        <li class="page_unselect"><a href="viewsupplierreport_page?page=${i}&supplier_name=${suppliername}&phone=${phone}&email_address=${email}"><c:out value="${i}"></c:out></a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>          
            <c:if test="${currentpage!=noofpages}">
              <li class="page_unselect"><a href="viewsupplierreport_page?page=${currentpage+1}&supplier_name=${suppliername}&phone=${phone}&email_address=${email}">Next</a></li> 
                 </c:if>
              <c:choose>
              <c:when test="${button=='viewall'}">
                  <li class="page"><a href="viewallsupplierreport?&supplier_name=${suppliername}&phone=${phone}&email_address=${email}" class="paging_select">ViewAll</a></li>
             </c:when>
                <c:otherwise>
                  <li class="page"><a href="view_supplierperformance" class="paging_select">Back</a></li>
              </c:otherwise>
              </c:choose>					
		 
		  </ul>
		  </div>
		  </td>
				
			</tr>
		</table> 
	
</div>

<script>
function confirmation() {
	var answer = confirm("Are you Sure You Want to Delete Supplier Performance Form ?");
	if (answer){
		return true;
	}
	else{
		return false;
	}
}


</script>

<script language="javascript">

function selectall(field)
{
	//field.getElementByTagName('checkbox');
	if(document.grid.checkall.checked==true)
	{
		for (i = 0; i < field.length; i++)
			field[i].checked = true ;
	}
	else
	{
		for(i = 0; i < field.length; i++)
			field[i].checked = false;
	}
}

function validate(fname)
{
// alert(fname);
var chks = document.getElementsByName('checkbox[]');

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
return true;
}

 function findpart()
{
 alert(document.getElementById("suppliername").value);
 alert(document.getElementById("phone").value);
 alert(document.getElementById("city").value);
window.location="?do=viewsupplierperformance&suppliername="+document.getElementById("suppliername").value+"&phone="+document.getElementById("phone").value+"&city="+document.getElementById("city").value;
}

 function validateusername(id){
	    var textInput = document.getElementById(id).value;
		textInput = textInput.replace(/[^A-Z0-9 ]/g, "");
		document.getElementById(id).value = textInput;
	}
 function ChangeCase(elem)
 {
     elem.value = elem.value.toUpperCase();
 }
 function validatename(id)
 {
 	var textInput = document.getElementById(id).value;
 	textInput = textInput.replace(/[^A-Za-z ]/g, "");
 	document.getElementById(id).value = textInput;
 }


</script>
<script>
$(function() {
	$("#mail").on("keypress", function(e) {
		if (e.which === 32 && !this.value.length)
	        e.preventDefault();
	});
	});	
$(function() {
	$("#name").on("keypress", function(e) {
		if (e.which === 32 && !this.value.length)
	        e.preventDefault();
	});
	});	
$(function() {
	$("#phone").on("keypress", function(e) {
		if (e.which === 32 && !this.value.length)
	        e.preventDefault();
	});
	});	
</script>
<script type="text/javascript">
       function validate(event) {
          
           var regex = new RegExp("^[0-9]+$");
           var key = String.fromCharCode(event.charCode ? event.which : event.charCode);
           if (!regex.test(key)) {
             // document.getElementById("cmaerr").innerHTML="enter numerics or decimals only";
               event.preventDefault();
               return false;
           }
       }       
    </script>


<!-- <script type="text/javascript">
  function validatefind()
  {
	  var error = "";
	  var suppliername = document.getElementById('suppliername').value;
	  var phone  = document.getElementById('phone').value;
	  var email = document.getElementById('email').value;
	
	  if(suppliername =="" && phone == "" && email == "")
		  {
		  document.getElementById("searcherror").innerHTML="Input Empty";
			error="true";
		  }
	 
	  else if(suppliername.length > 0)
	  {
	  if((suppliername.length < 4) || (suppliername.length > 32))
		  {
		  document.getElementById("nameerror").innerHTML="Required field should be length of 4 to 32";
			error="true";
		  }
	  else{
		  document.getElementById("nameerror").innerHTML="";
	 	 }
	  }
	  else
		  {
		  document.getElementById("nameerror").innerHTML="";
		  }
	  
	  if(error == "true")
		  {
		  return false;
		  }
  }
  </script>
  
 -->
 <script>
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
 <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<jsp:include page="footer.jsp"></jsp:include>