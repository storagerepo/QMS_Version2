<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="header.jsp"></jsp:include>
<script src="resources/js/jquery-1.7.2.min.js"></script>
<script src="resources/js/jquery-ui.js"></script>
<script src="resources/js/modal.js"></script>
<script type="text/javascript" src="js/ajaxpaging.js"></script>

<div id="right_content">
<!-- 	<form name="grid"  action="" method="POST">
 -->    	<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      		<tr>
      		<td>
      		 <div>
  <ul class="horizmenu">
						
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addcustomer" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Add Customers</span>
									
								</a>
							</li>
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="viewcustomers" class="<c:choose>
								<c:when test="${menu=='customer'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									<span>View Customers</span>
									
								</a>
							</li>
						
				          <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addfeedback" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Add Feedback</span>
									
								</a>
							</li>
				           <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="viewfeedback" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>View feedback</span>
									
								</a>
							</li>
				           <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="feedback_report" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Feedback Report</span>
									
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
						<a title="Close" href="viewcustomers">
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
						<a title="Close" href="viewcustomers">
						<img alt="Success" src="resources/images/icons/icon_square_close.png"></a>
						</p>
					</div></td>
			</tr>
		</c:if>
      		<tr>
				<td valign="top" align="left" style="padding:5px 0 10px 0;">
					<div class="del_div">
						<p><label style="padding: 0pt 20px 0pt 0pt;"><input type="submit" name="delete" value="" class="icon1" onclick="form.action='?do=deleteparticipant'" /></label></p>
	          		</div>
				</td>
			</tr>
			<tr>
        		<td valign="top" align="left">
			        <div class="headings altheading">
			          <h2>Search Customer Details</h2>
			        </div>
			        <div class="contentbox">
						<div style="border:#ccc 2px solid; padding:15px; margin-bottom:15px;">
							<form action="findcustomer" method="GET">
							
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr>
							    <td align="left" valign="middle" width="5%">ID :</td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="customer_id" class="input_txtbx" id="id" placeholder="C1001"  maxlength="12" onkeyup="ChangeCase(this);"   onkeypress="return AlphabetsNumber(event,this);" value="${cust_id}">
							     <br><span id="searcherror1" style="color:red"></span>
							    </td>
							  
							     <td align="center" valign="middle" width="10%">
							    <td align="left" valign="middle" width="6%">Name :</td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="customer_name" class="input_txtbx" id="name" value="${name}" maxlength="32" onkeypress="return Alphabets(event,this);">
							     <br><span id="searcherror2" style="color:red"></span>
							    </td>
							     <td align="center" valign="middle" width="10%">
							    <td align="left" valign="middle" width="8%">Address :</td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="address" id="address" class="input_txtbx" maxlength="40" value="${address}">
							     <br><span id="searcherror3" style="color:red"></span>
							    </td>
							  
							      <td align="center" valign="middle" width="20%"><input type="submit" class="submit_btn1" value="Search" name="findcustomer" >
							       <br><span id="searcherror" style="color:red"></span>
							      </td>
							<!--   	<td align="center" valign="middle" width="20%"><input type="submit" class="submit_btn1" value="Clear" name="welcome" ></td>
							   -->
							  </tr>
							</table>
							</form>
						</div>
				        <table cellpadding="0" cellspacing="0" border="0" width="100%">
				        
				        
							<tr class="title">
								<!-- <td valign="center" align="left" width="5%"><input type="checkbox" onclick="selectall(this.form)" value="" name="checkall"></td> -->
         						<td valign="top" align="left" width="10%">Customer&nbsp;ID</td>
					         	<td valign="top" align="left" width="10%">Customer Name</td>
								<td valign="top" align="left" width="10%">Address</td>
								<td valign="top" align="left" width="10%">City</td>
          						<td valign="top" align="left" width="15%">Email Address</td>
          						<td valign="top" align="left" width="15%">Actions</td>
        					</tr>
						
						
						<% int i=1; %>
									<c:if test = "${fn:length(customersForm.customers) gt 0}">	       		
									<c:forEach items="${customersForm.customers}" var="customers" varStatus="status">
							       		<% if(i==1)
							       			i=2;
							       			else
							       			i=1;%>
							       		<tr class="row<%=i%>" ">
								           	<td valign="top" align="left"  width="8%"><a href="list_customer?id=${customers.customer_id}">${customers.customer_id}</a></td>
											<td valign="top" align="left" width="10%">${customers.customer_name}</td>
											<td valign="top" align="left" width="10%">${customers.address}</td>
											<td valign="top" align="left" width="10%">${customers.city}</td>
											<td valign="top" align="left" width="15%">${customers.email_address}</td>
											<td valign="top" align="left" width="15%">
											
											<a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a><a href="<c:out value="editcustomer?cid=${customers.customer_id}"/>" style="padding-right:10px;">Edit</a>
										<%-- 	<a href="#" title=""><img src="resources/images/icons/icon_delete.png" alt="Delete" /></a><a href="<c:out value="deletecustomer?cid=${customers.customer_id}"/>" onclick="return confirmation()">Remove</a> --%>
											</td>
										</tr>
							    	</c:forEach>
							    	</c:if>
							    	
							    	<c:if test="${fn:length(customersForm.customers)== 0}">
							    	<c:if test="${justcame ne false}">
							    	<tr class="row1">
							    	<td colspan="7" width="100%"><center><b style="color:red">No Records Found!!!</b></center></td>
							    	</tr>
							    	</c:if></c:if>
						    	
						
						
						</table>
					</div>
				</td>
			</tr>
			

<tr><td colspan="6">  
	<div class="extrabottom">
             <ul class="pagination">
        
      		 <c:if test="${currentpage!=1&&currentpage!=null}">
             <li class="page_unselect"><a href="viewcustomerreport_page?page=${currentpage - 1}&customer_id=${cust_id}&customer_name=${name}&address=${address}" >Prev</a></li> 
               </c:if>
              
            <%--  <c:forEach var="count" begin="1" end="${noofrows}">  --%>
               <c:forEach begin="1" end="${noofpages}" var="i">
                <c:choose>
                    <c:when test="${currentpage eq i}">
                      <li class="page"><a class="paging_select"><c:out value="${i}"></c:out></a></li>
                     </c:when>
                    <c:otherwise>
                        <li class="page_unselect"><a href="viewcustomerreport_page?page=${i}&customer_id=${cust_id}&customer_name=${name}&address=${address}"><c:out value="${i}"></c:out></a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>          
            <c:if test="${currentpage!=noofpages}">
              <li class="page_unselect"><a href="viewcustomerreport_page?page=${currentpage+1}&customer_id=${cust_id}&customer_name=${name}&address=${address}">Next</a></li> 
                 </c:if>
              <c:choose>
              <c:when test="${button=='viewall'}">
                  <%-- <li class="page"><a href="viewallcustomerreport?&customer_id=${cust_id}&customer_name=${name}&address=${address}" class="paging_select">ViewAll</a></li> --%>
          <li class="page"><a href="viewallcustomerreport?customer_id=${cust_id}&customer_name=${name}&address=${address}" class="paging_select">ViewAll</a></li> 
             </c:when>
                <c:otherwise>
                  <li class="page"><a href="viewcustomers" class="paging_select">Back</a></li>
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
	
$(function() {
	$("#name").on("keypress", function(e) {
	
	if (e.which === 32 && !this.value.length)
        e.preventDefault();
});
});
$(function() {
	$("#address").on("keypress", function(e) {
	
	if (e.which === 32 && !this.value.length)
        e.preventDefault();
});
});
</script>
 <script type="text/javascript">
function validatename(id){
	
    var textInput = document.getElementById(id).value;
    textInput = textInput.replace(/[^A-Za-z ]/g, "");
    document.getElementById(id).value = textInput;
}  
function validatename2(id){
	
    var textInput = document.getElementById(id).value;
    textInput = textInput.replace(/[^A-Za-z0-9]/g, "");
    document.getElementById(id).value = textInput;
}  
</script>
<script>
$(document).ready(function()
		{
		    $('#id').keyup(function()
		    {
		        $(this).val($(this).val().toUpperCase());
		    });
		});
</script>
<script>
function confirmation(val) {
	var answer = confirm("Are you Sure You Want to Delete Participant ?")
	if (answer){
		window.location = "?do=deleteparticipant&id="+val;
	}
	else{
		
	}
}
</script>
<script>

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




function Number(e, t) {
    try {
        if (window.event) {
            var charCode = window.event.keyCode;
        }
        else if (e) {
            var charCode = e.which;
        }
        else { return true; }
        if ((charCode >47 && charCode < 58))
            return true;
        else
            return false;
    }
    catch (err) {
        alert(err.Description);
    }
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
</script>
<script language="javascript">
function validation()
{
	var error = "";
	var id= document.getElementById('id').value;
	var name = document.getElementById('name').value;
	var address =  document.getElementById('address').value;
	 document.getElementById("searcherror").innerHTML="";
	 document.getElementById("searcherror1").innerHTML="";
	 document.getElementById("searcherror2").innerHTML="";
	 document.getElementById("searcherror3").innerHTML="";
	if((id =="") &&(name == "") && (address == ""))
		{
		  //document.getElementById("searcherror").innerHTML="Input is empty";
	    	error="true";
		}
	  else if(id.length > 0)
	  {
	 
	  if((id.length < 4) || (id.length > 32))
		  {
		  document.getElementById("searcherror1").innerHTML="Required field should be length of 4 to 32";
			error="true";
		  }
	  else{
		  document.getElementById("searcherror1").innerHTML="";
	 	 }
	  }
 	 else if(name.length > 0)
  	{
 	 if((name.length < 4) || (name.length > 32))
	  {
	  document.getElementById("searcherror2").innerHTML="Required field should be length of 4 to 32";
		error="true";
	  }
  else{
	  document.getElementById("searcherror2").innerHTML="";
 	 }
  }
 	 else if(address.length > 0)
   	{
  	 if((address.length < 4) || (address.length > 32))
 	  {
 	  document.getElementById("searcherror3").innerHTML="Required field should be length of 4 to 32";
 		error="true";
 	  }
   else{
 	  document.getElementById("searcherror3").innerHTML="";
  	 }
   }
  else
	  {
	  document.getElementById("searcherror").innerHTML="";
	  }
  
  if(error == "true")
	  {
	  return false;
	  }
	
	}


</script>
<script>
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




function Number(e, t) {
    try {
        if (window.event) {
            var charCode = window.event.keyCode;
        }
        else if (e) {
            var charCode = e.which;
        }
        else { return true; }
        if ((charCode >47 && charCode < 58))
            return true;
        else
            return false;
    }
    catch (err) {
        alert(err.Description);
    }
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

</script>
<script>
function ChangeCase(elem)
{
    elem.value = elem.value.toUpperCase();
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
// alert(document.getElementById("moblie").value);
// alert(document.getElementById("group").value);
// alert(document.getElementById("city").value);
window.location="?do=viewparticipants&moblie="+document.getElementById("moblie").value+"&group="+document.getElementById("group").value+"&city="+document.getElementById("city").value;
}
</script>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<jsp:include page="footer.jsp"></jsp:include>