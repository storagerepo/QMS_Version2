<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" />
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/jquery-ui.js"></script>
 

<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table" >
	<tr>
		<td>
			<div>
				<ul class="horizmenu" style=" float:left;margin-left:205px; margin-top:8px;">
<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
  
  
						<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addcustomer" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Add Customers</span>
									
								</a>
							</li>
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="viewcustomers" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
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
								<c:when test="${menu=='customer'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									<span>Feedback Report</span>
									
								</a>
							</li>
				             
				            </ul>
  </div>
  </td>
  </tr>
  <tr>

        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2>Customer Feedback Reports</h2>
            </div>
            
              <form method="post" action="feedbackreport">
 <div id="right_content">
            <div class="contentbox">
            <table cellpadding="0" cellspacing="0" border="0" width="100%">
               <tr class="row2">
               <td valign="middle" align="left" class="input_txt" width="2%"> Type of Feedback :</td>
               <td valign="top" width="10%"><span class="err">
                  <select name="type_of_feedback" id="feedback" class="dropdown">
                  <option value="">-select-</option>
                  <option value="Complaint"<c:if test="${feedback=='Complaint'}"><c:out value="selected"/></c:if>>Complaint</option>
                  <option value="Suggestion"<c:if test="${feedback=='Suggestion'}"><c:out value="selected"/></c:if>>Suggestion</option>
                  
                  </select>
                     <br><span id="generateerror" style="color:red"></span>
                  <td>
                   </tr>
                   
               
                  <tr class="row1">
                     <td valign="middle" align="left" class="input_txt" width="2%">From Date :</td>
                <td valign="middle" align="left" class="input_txt" width="10%"><span class="err"></span>
                  <input type="text" name="from_date" class="input_txtbx" id="datepicker"  value="${fromdate}" /><br>
                  
                  <span id="datepicker11"style="color:red"></span></td></tr>
                    <tr class="row1">
                   <td valign="middle" align="left" class="input_txt" width="2%"><span class="err"></span>To Date :</td>
                     <td valign="middle" align="left" class="input_txt" width="10%"><span class="err"></span>
                  <input type="text" name="to_date" class="input_txtbx" id="datepicker1" value="${todate}" /><br>
                  <span id="datepicker22"style="color:red"></span>
                  <span class="err"></span></td>
                  </td></tr>
                  <tr class="row2">
                  <td></td>
                  <td> <span id="dateerror"style="color:red"></span></td>
                  </tr>
                  
                   <tr class="row1">
                  <td valign="middle"  align="left" class="input_txt" width="20%">&nbsp;</td>
                
                 <td valign="middle" align="left" class="input_txt" width="40%"><input type="submit" value="Generate" class="submit_btn1" onclick="return validation();"id="button" >
                 &nbsp; &nbsp; &nbsp; &nbsp;<input type="reset" id="reset_export" name="reset_export" value="Reset" class="submit_btn1"></td>
                </tr>
                 <!--  <td  valign="top" align="right">&nbsp;</td>
                   <td valign="top" align="left"  colspan="3"><input type="submit" value="Generate" class="submit_btn1" onclick="return validation();"id="button" >
                 -->
                   </td>
     				                     
</tr>
<tr class="row2">
<td></td>
<td></td> 
</div></div></form></div></td></tr>
</table> 
<script type="text/javascript">
function validation()
{
var error = "";
var date = /^(0?[1-9]|1[012])[\/](0?[1-9]|[12][0-9]|3[01])[\/]\d{4}$/;
var feedback  = document.getElementById('feedback').value;
var datepicker = document.getElementById('datepicker').value;
var datepicker1 = document.getElementById('datepicker1').value;
document.getElementById("datepicker11").innerHTML="";
document.getElementById("datepicker22").innerHTML="";
document.getElementById("generateerror").innerHTML="";
document.getElementById("dateerror").innerHTML="";

	if(feedback == "")
	{
		 document.getElementById("generateerror").innerHTML="Required field should not be empty";
			error="true";
	}
	else 
	{
		if((datepicker == "") || (datepicker1 == ""))
			{
			
			 document.getElementById("dateerror").innerHTML="Please pickup the from and to date";
				error="true";
			}
		
		else
		{
			if(!datepicker.match(date))
			{
				 document.getElementById("datepicker11").innerHTML="Invalid date format";
			 	error="true";
		 	}
		
			if(!datepicker1.match(date))
			{
		 	document.getElementById("datepicker22").innerHTML="Invalid date format";
		 	error="true";
			}
			
			if(datepicker > datepicker1)
			{
				 document.getElementById("dateerror").innerHTML="Please pickup the from date not more than to date";
					error="true";
			}	
		}
		
	}
	if(error == "true")
		{
		return false;
		
		}
	
		
	
}
</script>
<script>
 $(function() {
           $( "#datepicker" ).datepicker();
         });
 
</script>

 <script>
 $(function() {
           $( "#datepicker1" ).datepicker();
         });
 
</script>

<table  width=300 height=280>
			<tr height=30><td></td></tr></table>
			
			<br><br><br><br>
			
<jsp:include page="footer.jsp"></jsp:include>