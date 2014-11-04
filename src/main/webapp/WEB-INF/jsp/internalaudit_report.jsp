<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/jquery-ui.css"
	type="text/css" />
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/jquery-ui.js"></script>

<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table" >
	<tr>
		<td>
			<div>
				<ul class="horizmenu" style=" float:left;margin-left:205px; margin-top:8px;">
			<c:if test="${role==2}">
			<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addinternalaudits" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Add Internal Audits</span>
									
								</a>
							</li>
					</c:if>		
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="view_internalaudits" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>View Internal Audits </span>
									
								</a>
							</li>
						
				         <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="internalaudit_report" class="<c:choose>
								<c:when test="${menu=='audits'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									<span>Reports</span>
									
								</a>
							</li>
							</ul>
			</div></td>
	</tr>
	<tr>
		<c:if test="${success==true}">
			<tr>
				<td valign="top" align="left" style="padding: 5px 0 10px 0;">&nbsp;
					<div id="success_statusbar" class="status success">
						<p class="closestatus">
							<a title="Close" href="maintenance_list">x</a>
						</p>
						<p>
							<img alt="Success" src="resources/images/icons/icon_success.png"><span>Success!</span>.
						</p>
					</div>
			</tr>
		</c:if>
	</tr>
<tr><td>
<table cellpadding="0" cellspacing="0" border="0" width="98%"
	class="margin_table">
	<tr>
		<td valign="top" align="left">
				<div class="headings altheading">
					<h2>Internal Audits Details Reports</h2>
				</div>
				<div class="contentbox">
					<form method="post" action="internal_audit_report">
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
							
							<tr class="row1" id="report_type_table">
								<td valign="middle" align="right" class="input_txt" width="30%">
								Type of Report :
								</td>
								<td valign="middle" align="left" class="input_txt" width="100%">
								<input type="radio" name="audit_report_type" value="0" id="id_type_pastduedate" checked/>Past due audits<br/>
								<input type="radio" onchange="toggle4(this.value)" name="audit_report_type" value="1" id="id_type_auditnonconformance"/>Audits with NonConformance<br/>
								
								<input type="radio"  name="audit_report_type" value="2" id="id_type_areaofimprovement"/>Area of Improvements<br/>
								<input type="radio"  name="audit_report_type" value="3" id="id_type_pastduebyauditor"/>Past due audits by auditor<br/>
								<input type="radio" name="audit_report_type" value="4" id="id_type_schedule"/>Audit Schedule<br/>
							</td>
							</tr>
							<tr class="row2">
								<td valign="middle" align="right" class="input_txt" width="30%">
									Select Report Type:</td>
								<td valign="top" align="left" class="input_txt" width="100%">
									<input type="radio" onchange="toggle3(this.value)" name="report_type" value="0" id="id_type_standard" checked/>Standard Report&nbsp;&nbsp;&nbsp;
								<input type="radio" onchange="toggle3(this.value)" name="report_type" value="1" id="id_type_userdefined"/>User Defined Report<br/>
							
								</td>
								
							</tr>
						
						</table>
						
						
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
						
						
							
							<tr class="row1" id="userdefined_name" style="display:none;">
								<td valign="middle" align="right" class="input_txt" width="30%">
									Name to appear on the report:</td>
								<td valign="top" align="left" class="input_txt" width="50%">
									<input type="text" name="report_title" class="input_txtbx" id="report_title"  onInput="return validatename(id)"; value=""/>
								</td>
								
							</tr>
							<tr class="row2" id="userdefined_fields" style="display:none;">
								<td valign="top" align="right" style="margin-top:2px;" class="input_txt" width="30%">
									Select fields required on the report:</td>
								<td valign="top" align="left" class="input_txt" width="100%">
								<table cellpadding="0" cellspacing="0" border="0" width="100%" style="margin-left:-10px;">
								<tr>
								
								
								<td><input type="checkbox" id="select_all"/>Select all<br><span id="reporterror" style="color:red"> </span></td>
								</tr> 
								<tr>
								<td><input type="checkbox"  onclick="selectall(this.id)" name="report_field[]" value="report_id" id="1"/>ID</td>
								<td><input type="checkbox"  onclick="selectall(this.id)" name="report_field[]" value="process" id="2"/>Process</td>
								<td><input type="checkbox"  onclick="selectall(this.id)" name="report_field[]" value="auditee_name" id="3"/>Auditee Name</td>
					      		</tr>
					      		<tr>
								<td><input type="checkbox" onclick="selectall(this.id)"  name="report_field[]" value="audit_start_date" id="4"/>Audit Start Date</td>
								<td><input type="checkbox" onclick="selectall(this.id)"  name="report_field[]" value="audit_due_date" id="5"/>Audit Start Date</td>
								<td><input type="checkbox" onclick="selectall(this.id)"  name="report_field[]" value="auditor" id="6"/>Auditor</td>
					      		</tr>
					      		<tr>
								<td><input type="checkbox" onclick="selectall(this.id)"  name="report_field[]" value="audit_notes" id="7"/>Auditor Notes</td>
								<td><input type="checkbox"  onclick="selectall(this.id)" name="report_field[]" value="finding" id="8"/>Finding</td>
								<td><input type="checkbox"  onclick="selectall(this.id)" name="report_field[]" value="completion_date" id="9"/>Completion Date</td>
					      		</tr>
					      		<tr>
								<td><input type="checkbox"  onclick="selectall(this.id)"  name="report_field[]" value="auditors_initial" id="10"/>Auditor's Initial</td>
							
								</table>
								
								</td>
								
							</tr>
							<tr >
             <td  colspan="2"  style="padding-left:320px;" width="30%">
             <table><tr style="padding:10px;"><td style="padding:10px;"><input type="submit" id="export"  name="export" value="Generate" onclick="return validation();" class="submit_btn1">
             </td><td style="padding:10px;">
              <input type="reset" id="reset_export" name="reset_export" value="Reset" class="submit_btn1" onclick="toggle3(0);"></td>
            
             </tr></table>
            
           
             </tr>
            
							
						</table>
						</form>
					</div>
				</td></tr>
</table></td></tr></table>
<table  width=300 height=200>
			<tr height=30><td></td></tr></table>

<script type="text/javascript">
function validation()
{
	
 var id_type_userdefined = document.getElementById('id_type_userdefined').checked;
 var a1 = document.getElementById('1').checked;
 var a2 = document.getElementById('2').checked;
 var a3 = document.getElementById('3').checked;
 var a4 = document.getElementById('4').checked;
 var a5 = document.getElementById('5').checked;
 var a6 = document.getElementById('6').checked;
 var a7 = document.getElementById('7').checked;
 var a8 = document.getElementById('8').checked;
 var a9 = document.getElementById('9').checked;
 var a10 = document.getElementById('10').checked;

 if(id_type_userdefined)
	{
	 
	  if(a1 || a2 || a3 || a4 || a5 || a6 || a7 || a8 || a9 || a10)
		  {
		  document.getElementById('reporterror').innerHTML ="";
		  }
	  else
		  {
		  document.getElementById('reporterror').innerHTML = "Please Select Atleast One";
		  return false;
		  
		  }
	}
 else
 {
	 document.getElementById('reporterror').innerHTML ="";
 }


}
function toggle2(value){
    var e3=document.getElementById("report_type_table");
if(value=="report_list_by_type")
    {
	
	e3.style.display="table-row";
	
    }
else
    {
	
	e3.style.display="none";
  
    }
    
}
function toggle4(value)
{
	var e3=document.getElementById("no_of_days");
	if(value==1)
    {
	
	e3.style.display="table-row";
	
    }
if(value==0)
    {
	
	e3.style.display="none";
	
  
    }
  
	}
function toggle3(value){
	
    var e1=document.getElementById("userdefined_name");
    var e2=document.getElementById("userdefined_fields");
if(value==1)
    {
	document.getElementById('select_all').checked = false;
	document.getElementById('1').checked = false;
	document.getElementById('2').checked = false;
	document.getElementById('3').checked = false;
	document.getElementById('4').checked = false;
	document.getElementById('5').checked = false;
	document.getElementById('6').checked = false;
	document.getElementById('7').checked = false;
	document.getElementById('8').checked = false;
	document.getElementById('9').checked = false;
	document.getElementById('10').checked = false;
	 document.getElementById('reporterror').innerHTML ="";
	 document.getElementById('report_title').value = "";
	e1.style.display="table-row";
	e2.style.display="table-row";
    }
if(value==0)
    {
	
	e1.style.display="none";
	e2.style.display="none";
  
    }
    
}
</script>

<script>
$('#select_all').change(function() {
    var checkboxes = $(this).closest('form').find(':checkbox');

    if($(this).is(':checked')) {
        checkboxes.attr('checked','checked');
    } else {
        checkboxes.removeAttr('checked');
    }
   
});

</script>

<script>
function validatename(id){
    var textInput = document.getElementById(id).value;
    textInput = textInput.replace(/[^A-Za-z ]/g, "");
    document.getElementById(id).value = textInput;
}
</script>
<script>
		function selectall(id) 
		{
			// var checkboxes1 = $(id).closest('form').find(':checkbox').not($('#select_all'));
		
 if(($('#id').is(':checked')))
	//if(!$(id).closest('form').find(':checkbox').not($('#select_all').is(':checked')))
	
	 {  $("#select_all").attr('checked','checked'); 
		
		//if(!$id.closest('form').find(':checkbox').not($("#select_all")))
			
			
	     
			
	 }
	 else 
	 {$("#select_all").removeAttr('checked');
		 
	 }
	 
		}
		
</script>
<br><br><br><br><br>
  <jsp:include page="footer.jsp"></jsp:include>
  
  
  
  
  
  