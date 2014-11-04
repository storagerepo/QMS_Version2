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
<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="add_maintenance" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Enter/Modify Equipment</span>
									
								</a>
							</li>
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="equipment_list" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>View Equipments</span>
								</a>
							</li>
						<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="maintenance_list" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>View Maintenance & Calibration</span>
								</a>
							</li>
				           <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="maintenance_report" class="<c:choose>
								<c:when test="${menu=='maintenance'}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
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
					<h2>Maintenance and Calibration Details Reports </h2>
				</div>
				<div class="contentbox">
					<form method="post" action="maintanence_report">
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
							
							<tr class="row1" id="report_type_table">
								<td valign="middle" align="left" class="input_txt" width="30%">
								Types Of Report :
								</td>
								<td valign="middle" align="left" class="input_txt" width="100%">
								<input type="radio" onchange="toggle4(this.value)" name="maintenance_report_type" value="0" id="id_type_duemaintenancenext" checked/>Due Maintenance for next 30 days<br/>
								<input type="radio" onchange="toggle4(this.value)" name="maintenance_report_type" value="1" id="id_type_upcomingcalibration"/>Upcoming Calibration for next xx days<br/>
								
								
							
						
								
							    <input type="radio" onchange="toggle4(this.value)" name="maintenance_report_type" value="2" id="id_type_pastduemaintenance"/>Past Due Maintenance<br/>
								<input type="radio" onchange="toggle4(this.value)" name="maintenance_report_type" value="3" id="id_type_pastduecalibration"/>Past Due Calibration<br/>
								
							
							
							
							
							
								
							<tr class="row1" id="no_of_days" style="display:none;">
								<td valign="middle" align="left" class="input_txt" width="30%">
								Enter the Number Of Days Required:
									</td>
								<td valign="top" align="left" class="input_txt" width="100%">
								
									<input type="text" name="no_of_day" class="input_txtbx1"  style="width:40%;" value=""/>
							</td>
								
							</tr>	
							<tr class="row2">
								<td valign="middle" align="left" class="input_txt" width="30%">
									Select Report Type:</td>
								<td valign="top" align="left" class="input_txt" width="100%">
									<input type="radio" onchange="toggle3(this.value)" name="report_type" value="0" id="id_type_standard" checked/>Standard Report&nbsp;&nbsp;&nbsp;
								<input type="radio" onchange="toggle3(this.value)" name="report_type" value="1" id="id_type_userdefined"/>User Defined Report<br/>
							
								</td>
								
							</tr>
						</table>
						
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
						
						
							
							<tr class="row1" id="userdefined_name" style="display:none;">
								<td valign="middle" align="left" class="input_txt" width="30%">
									Name to appear on the Report:</td>
								<td valign="top" align="left" class="input_txt" width="50%">
									<input type="text" name="report_title" class="input_txtbx1"  style="width:40%;" value=""/>
								</td>
								
							</tr>
							<tr class="row2" id="userdefined_fields" style="display:none;">
								<td valign="top" align="left" style="margin-top:2px;" class="input_txt" width="30%">
									Select Fields Required on the Reports:</td>
								<td valign="top" align="left" class="input_txt" width="100%">
								<table cellpadding="0" cellspacing="0" border="0" width="100%">
								<tr>
								<td><input type="checkbox" name="report_field[]" value="equipment_id" id="id_report_id"/>Equipment ID</td>
								<td><input type="checkbox" name="report_field[]" value="equipment_name" id="id_process"/>Equipment Name</td>
								<td><input type="checkbox" name="report_field[]" value="equipment_model" id="id_auditee_name"/>Equipment Model</td>
					      		</tr>
					      		<tr>
								<td><input type="checkbox" name="report_field[]" value="serial_number" id="id_audit_start_date"/>Serial Number</td>
								<td><input type="checkbox" name="report_field[]" value="date_acquired" id="id_audit_due_date"/>Date Acquired</td>
								<td><input type="checkbox" name="report_field[]" value="equipment_status" id="id_auditor"/>Equipment Status</td>
					      		</tr>
					      		<tr>
								<td><input type="checkbox" name="report_field[]" value="frequency_maintenance" id="id_audit_notes"/>Frequency of Maintenance</td>
								<td><input type="checkbox" name="report_field[]" value="calibration" id="id_finding"/>Calibration</td> 

								<td><input type="checkbox" name="report_field[]" value="type_of_maintenance" id="id_completion_date"/>Type of Maintenance </td>
					      		</tr>
					      		<tr>
								<td><input type="checkbox" name="report_field[]" value="weekly" id="id_auditors_initial"/>Maintenance Frequency</td>
							<td><input type="checkbox" name="report_field[]" value="reference" id="id_auditors_initial"/>Reference</td>
							<td><input type="checkbox" name="report_field[]" value="instructions" id="id_auditors_initial"/>Instructions</td>
							</tr>
							<tr>
							<td><input type="checkbox" name="report_field[]" value="due_date" id="id_auditors_initial"/>Due Date</td>
							<td><input type="checkbox" name="report_field[]" value="completion_date" id="id_auditors_initial"/>Completion Date</td>
							<td><input type="checkbox" name="report_field[]" value="completed_by" id="id_auditors_initial"/>Completed By</td>
							</tr>
							<tr>
							<td><input type="checkbox" name="report_field[]" value="notes" id="id_auditors_initial"/>Notes</td>
								</table>
								
								</td>
								
							</tr>
							<tr >
             <td  colspan="2" align="center" width="30%">
             <table><tr style="padding:10px;"><td style="padding:10px;"><input type="submit" id="export"  name="export" value="Generate" class="submit_btn1">
             </td><td style="padding:10px;">
              <input type="reset" id="reset_export" name="reset_export" value="Reset" class="submit_btn1"></td>
            
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
function toggle3(value){
	
    var e1=document.getElementById("userdefined_name");
    var e2=document.getElementById("userdefined_fields");
if(value==1)
    {
	
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
 function toggle4(value)
{
	var e3=document.getElementById("no_of_days");
	if(value==1)
    {
	
	e3.style.display="table-row";
	
    }
	else
    {
	
	e3.style.display="none";
	
  
    }
  
	}
</script>
  <jsp:include page="footer.jsp"></jsp:include>
  
  
  
  
  
  
