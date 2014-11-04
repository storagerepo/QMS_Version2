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
								<c:when test="${menu=='maintenance'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
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
					<h2>Maintenance and Calibration Details Reports</h2>
				</div>
				<div class="contentbox">
					<form method="post" action="generate_maintenance_report">
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
							
							<tr class="row1" id="document_type_table">
								<td valign="middle" align="left" class="input_txt" width="30%">
								Type Of Report :
								</td>
								<td valign="middle" align="left" class="input_txt" width="100%">
								<input type="radio" onchange="toggle4(this.value)" name="doc_type" value="0" id="id_type_duemaintenancenext" checked/>Due Maintenance for next 30 days<br/>
								<input type="radio" onchange="toggle4(this.value)" name="doc_type" value="1" id="id_type_upcomingcalibration"/>Upcoming Calibration for next xx days<br/>
								<input type="radio" onchange="toggle4(this.value)" name="doc_type" value="2" id="id_type_pastduemaintenance"/>Past Due Maintenance<br/>
								<input type="radio" onchange="toggle4(this.value)" name="doc_type" value="3" id="id_type_pastduecalibration"/>Past Due Calibration<br/>
								
							
							
							
							
							
								
							<tr class="row1" id="no_of_days" style="display:none;">
								<td valign="middle" align="left" class="input_txt" width="30%">
									Number Of Days :
									</td>
								<td valign="top" align="left" class="input_txt" width="100%">
								
									<input type="text" name="no_of_days" maxlength="3" class="input_txtbx" id="noofdays" onkeypress="return Number(event,this);" value=""/>
									<br><span id="noofdayserror" style="color:red"></span>
							</td>
								
							</tr>	
							<tr class="row2">
								<td valign="middle" align="left" class="input_txt" width="30%">
									Select Report Type :</td>
								<td valign="top" align="left" class="input_txt" width="100%">
									<input type="radio" onchange="toggle3(this.value)" name="report_type" value="0" id="id_type_standard" checked/>Standard Report&nbsp;&nbsp;&nbsp;
								<input type="radio" onchange="toggle3(this.value)" name="report_type" value="1" id="id_type_userdefined"/>User Defined Report<br/>
							
								</td>
								
							</tr>
						</table>
						
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
						
						
							
							<tr class="row1" id="userdefined_name" style="display:none;">
								<td valign="middle" align="left" class="input_txt" width="30%">
									Name to appear on the Report :</td>
								<td valign="top" align="left" class="input_txt" width="50%">
									<input type="text" name="name_of_disposition_responsibility" class="input_txtbx" id="report_title" value=""/>
								</td>
								
							</tr>
							<tr class="row2" id="userdefined_fields" style="display:none;">
								<td valign="top" align="left" style="margin-top:2px;" class="input_txt" width="30%">
									Select Fields Required on the Report :
									<br> <span id="userdefineerror" style="color:red"></span></td>
								<td valign="top" align="left" class="input_txt" width="100%">
								<table cellpadding="0" cellspacing="0" border="0" width="100%">
								<tr>
								<td><input type="checkbox" id="select_all"/>Select All</td>
								</tr>
								<tr>
								<td><input type="checkbox" name="report_field[]" value="equipment_id" id="1"/>Equipment ID</td>
								<td><input type="checkbox" name="report_field[]" value="equipment_name" id="2"/>Equipment Name</td>
								<td><input type="checkbox" name="report_field[]" value="equipment_model" id="3"/>Equipment Model</td>
					      		</tr>
					      		<tr>
								<td><input type="checkbox" name="report_field[]" value="serial_number" id="4"/>Serial Number</td>
								<td><input type="checkbox" name="report_field[]" value="date_acquired" id="5"/>Date Acquired</td>
								<td><input type="checkbox" name="report_field[]" value="equipment_status" id="6"/>Equipment Status</td>
					      		</tr>
					      		<tr>
								<td><input type="checkbox" name="report_field[]" value="frequency_maintenance" id="7"/>Frequency of Maintenance</td>
								<td><input type="checkbox" name="report_field[]" value="calibration" id="8"/>Calibration</td> 

								<td><input type="checkbox" name="report_field[]" value="type_of_maintenance" id="9"/>Type of Maintenance </td>
					      		</tr>
					      		<tr>
								<td><input type="checkbox" name="report_field[]" value="maintenance_frequency" id="10"/>Maintenance Frequency</td>
							<td><input type="checkbox" name="report_field[]" value="reference" id="11"/>Reference</td>
							<td><input type="checkbox" name="report_field[]" value="instructions" id="12"/>Instructions</td>
							</tr>
							<tr>
							<td><input type="checkbox" name="report_field[]" value="due_date" id="13"/>Due Date</td>
							<td><input type="checkbox" name="report_field[]" value="completion_date" id="14"/>Completion Date</td>
							<td><input type="checkbox" name="report_field[]" value="completed_by" id="15"/>Completed By</td>
							</tr>
							<tr>
							<td><input type="checkbox" name="report_field[]" value="notes" id="16"/>Notes</td>
								</table>
								
								</td>
								
							</tr>
							<tr >
							<td  align="left" width="13%" align="left"></td>
             <td  colspan="2" align="left" width="30%">
             <table><tr style="padding:10px;"><td style="padding:10px;"><input type="submit" id="export"  name="export" value="Generate" onclick="return validate();"class="submit_btn1">
             </td><td style="padding:10px;">
              <input type="reset" id="reset_export" name="reset_export" onclick="toggle3(0);toggle4(0);"value="Reset" class="submit_btn1"></td>
            
             </tr></table>
            
           
             </tr>
            
							
						</table>
						</form>
					</div>
				</td></tr>
</table></td></tr></table>

<table  width=300 style="height: 255px">
			<tr height=30><td></td></tr><tr height="100"></tr></table>
<jsp:include page="footer.jsp"></jsp:include>

 <script type="text/javascript">
 $(function() {
		$("#noofdays").on("keypress", function(e) {
		
		if (e.which === 32 && !this.value.length)
	        e.preventDefault();
	});
	});
	
	
function validatename2(id){
	
    var textInput = document.getElementById(id).value;
    textInput = textInput.replace(/[^0-9]/g, "");
    document.getElementById(id).value = textInput;
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


$('#select_all').change(function() {
    var checkboxes = $(this).closest('form').find(':checkbox');

    if($(this).is(':checked')) {
        checkboxes.attr('checked','checked');
    } else {
        checkboxes.removeAttr('checked');
    }
   
});

</script>

<script type="text/javascript">
function validate()
{
	var error ="";
	var id_type_upcomingcalibration = document.getElementById('id_type_upcomingcalibration').checked;
	var id_type_userdefined = document.getElementById('id_type_userdefined').checked;
	var noofdays =  document.getElementById('noofdays').value;
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
	var a11 = document.getElementById('11').checked;
	var a12 = document.getElementById('12').checked;
	var a13 = document.getElementById('13').checked;
	var a14 = document.getElementById('14').checked;
	var a15 = document.getElementById('15').checked;
	var a16 = document.getElementById('16').checked;
	if(id_type_upcomingcalibration)
		{
		if(noofdays == "")
			{
			document.getElementById("noofdayserror").innerHTML="Required Field Should not be Empty";
			error = "true";
			}
		else
			{
			document.getElementById("noofdayserror").innerHTML="";
			}
		
		
		}
	else
		{
		document.getElementById("noofdayserror").innerHTML="";
		}
	if(id_type_userdefined)
		{
		if(a1 || a2|| a3|| a4|| a5|| a6|| a7|| a8|| a9|| a10|| a11|| a12|| a13|| a14|| a15|| a16)
			{
			document.getElementById("userdefineerror").innerHTML="";
			}
		else{
			document.getElementById("userdefineerror").innerHTML="Please Select atleast One";
			error = "true";
		}
	}
	else
	{
		document.getElementById("userdefineerror").innerHTML="";
		}
	
	if(error == "true")
		{
		return false;
		}
}
function toggle2(value){
    var e3=document.getElementById("document_type_table");
if(value=="document_list_by_type")
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
	document.getElementById('11').checked = false;
	document.getElementById('12').checked = false;
	document.getElementById('13').checked = false;
	document.getElementById('14').checked = false;
	document.getElementById('15').checked = false;
	document.getElementById('16').checked = false;
	document.getElementById('report_title').value = "";
	document.getElementById("userdefineerror").innerHTML="";
	
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
		
		document.getElementById('noofdays').value = "";
	e3.style.display="table-row";
	
    }
	else
    {
	
	e3.style.display="none";
	
  
    }
  
	}
</script>
  
  
  </html>
  
  
