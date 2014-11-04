<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>

<html>
<head>
<link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" />
<script src="resources/js/jquery-1.9.1.js"></script>
 <script src="resources/js/jquery-ui.js"></script>
 <STYLE type="text/css">
  P#mypar {font-style:calibri;
  line-height:18px;}
  
  </STYLE>
 <script>
 $(function() {
           $( "#datepicker" ).datepicker();
         });
 $(function() {
     $( "#datepicker1" ).datepicker();
   });
 $(function() {
     $( "#datepicker2" ).datepicker();
   });
 
</script>

<script type="text/javascript" src="js/ajaxpaging.js"></script>
</head>
<body>
<div id="right_content">
	 	<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
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
			          <h2>View Child Supplier</h2>
			        </div>
			        <div class="contentbox">
			        <div style="border:#ccc 2px solid; padding:15px; margin-bottom:15px;">
							<form action="findchildsupplier" method="GET">
							
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr>
							    <td align="left" valign="middle" width="10%">Receipt Date:</td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="receipt_date" class="input_txtbx1" id="receiptdate"></td>
							    <td align="left" valign="middle" width="15%">&nbsp;&nbsp;Recorded by:</td>
								<td align="left" valign="middle" width="10%"><input type="text" name="audit_start_date" id="recordedby" class="input_txtbx1"></td>							    
							    <td align="left" valign="middle" width="8%">&nbsp;&nbsp;Recording Date:</td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="recording_date" id="recordingdate" class="input_txtbx1"></td>
							    <td align="center" valign="middle" width="38%"><input type="submit" class="submit_btn" value="Find" name="findchildsupplier" ></td>
							  </tr>
							  
							</table>
							</form>
						</div>

	<form action="?do=viewparticipants" name="dashboard" method="POST">
   				
				        <table cellpadding="0" cellspacing="0" border="0" width="100%">
				        
				        
							<tr class="title">
								<!-- <td valign="center" align="left" width="5%"><input type="checkbox" onclick="selectall(this.form)" value="" name="checkall"></td> -->
         						<td valign="top" align="left" width="10%">PO #</td>
					         	<td valign="top" align="left" width="13%">Receipt Date</td>
					         	<td valign="top" align="left" width="15%">Type of Problem</td>
								<!-- <td valign="top" align="left" width="15%">Problem Details</td>
          						<td valign="top" align="left" width="5%">Problem Found at</td> -->
          						<!-- <td valign="top" align="left" width="25%">Request Corrective Action</td>
          						<td valign="top" align="left" width="25%">Due Date for corrective Action</td> -->
          						<td valign="top" align="left" width="15%">Deduction for Issue</td>
          						<!-- <td valign="top" align="left" width="5%">Recorded by</td> -->
          						<td valign="top" align="left" width="15%">Recording Date</td>
          						<td valign="top" align="left" width="15%">Actions</td>
        					</tr>
						
						
						<% int i=1; %>
							       		
									<c:forEach items="${childSupplierForm.childsupplier}" var="childsupplier" varStatus="status">
							       		<% if(i==1)
							       			i=2;
							       			else
							       			i=1;%>
							       		<tr class="row<%=i%>" ">
								           	<td valign="top" align="left"  width="15%">${childsupplier.po}</td>
											<td valign="top" align="left" width="15%">${childsupplier.receipt_date}</td>
											<td valign="top" align="left" width="10%">${childsupplier.type_of_problem}</td>
											<%-- <td valign="top" align="left" width="10%">${childsupplier.problem_details}</td>
											<td valign="top" align="left" width="10%">${childsupplier.problem_found_at}</td>
											<td valign="top" align="left" width="10%">${childsupplier.request_corrective_action}</td>
											<td valign="top" align="left" width="10%">${childsupplier.due_date_for_corrective_action}</td> --%>
											<td valign="top" align="left" width="10%">${childsupplier.deduction_for_issue}</td>
											<%-- <td valign="top" align="left" width="5%">${childsupplier.recorded_by}</td> --%>
											<td valign="top" align="left" width="25%">${childsupplier.recording_date}</td>
											<td valign="top" align="left" width="25%">
											<a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a>
											<a href="editchildsupplier?cid=<c:out value="${childsupplier.po}"/>" style="padding-right:10px;">Edit</a>
											<a href="#" title=""><img src="resources/images/icons/icon_delete.png" alt="Delete" /></a>
											<a href="deletechildsupplier?cid=<c:out value="${childsupplier.po}"/>" style="padding-right:10px;">Delete</a>
											
											</td>
										</tr>
							    	</c:forEach>
						    	
						
						
						</table>
						</form>
					</div>
				</td>
			</tr>
		</table> 
	
</div>

<script>
function confirmation(val) {
	var answer = confirm("Are you Sure You Want to Delete Participant ?");
	if (answer){
		window.location = "?do=deleteparticipant&id="+val;
	}
	else{
		
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
 alert(document.getElementById("receiptdate").value);
 alert(document.getElementById("recordedby").value);
 alert(document.getElementById("recordingdate").value);
window.location="?do=viewchildsupplier&receiptdate="+document.getElementById("receiptdate").value+"&recordedby="+document.getElementById("recordedby").value+"&recordingdate="+document.getElementById("recordingdate").value;
}


</script>

<%-- <jsp:include page="footer.jsp"></jsp:include> --%>