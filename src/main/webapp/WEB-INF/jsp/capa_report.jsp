<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/jquery-ui.css"
	type="text/css" />
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/jquery-ui.js"></script>
<script>

 function validation()
 {

 document.getElementById("start").style.display="block";
 document.getElementById("starterr").innerHTML="";
 document.getElementById("enderr").innerHTML="";
 document.getElementById('datepicker').value ="";
 document.getElementById('datepicker1').value ="";
 }
 function validation1()
 {

 document.getElementById("start").style.display="none";
  }
 
</script>

<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table" >
	<tr>
		<td>
			<div>
				<ul class="horizmenu" style=" float:left;margin-left:205px; margin-top:8px;">
<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addcorrectiveAndPreventiveActions" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Add Corrective And Preventive Actions</span>
									
								</a>
							</li>
						<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="correctiveactions_list" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>View Corrective And Preventive Actions</span>
								</a>
							</li>
				           <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="capa_report" class="<c:choose>
								<c:when test="${menu=='corrective'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
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
							<a title="Close" href="correctiveactions_list">x</a>
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
					<h2>Corrective and Preventive Actions Reports</h2>
				</div>
				<div class="contentbox">
					<form method="post" action="capas_report">
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
							
							<tr class="row1" id="report_type_table">
								<td valign="top" align="left" class="input_txt" width="30%" style="margin-left:10%;">
								Type Of Report :
								</td>
								<td valign="top" align="left" class="input_txt" width="100%">&nbsp;&nbsp;
								<input type="radio"  name="actions_report_type" value="0"  onclick="validation1()" id="id_type_Open_Corrective_Actions" checked/>&nbsp;Open Corrective Actions<br/>
								&nbsp;&nbsp;&nbsp;<input type="radio"  name="actions_report_type" value="1"  onclick="validation1()" id="id_type_Open_Corrective_Actions_for_Over_30_Days"/>&nbsp;Open Corrective Actions for Over 30 Days<br/>							
							    &nbsp;&nbsp;&nbsp;<input type="radio"  name="actions_report_type" value="2"  onclick="validation()" id="id_type_Corrective_Actions_for_A_Certain_Period"/>&nbsp;Corrective Actions for A Certain Period<br/>
								
							
								<table id="start" cellpadding="0" cellspacing="0" border="0" width="100%" style="display:none;">
	
    								<tr class="row2">
    								<td valign="top" align="left" class="input_txt"> Enter the Start Date : </td>
    								<td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx" id="datepicker" name="start" /><br><span style="color:red;" id="starterr"></span></td>
    								</tr>
    								
    								<tr class="row2">
    								<td valign="top" align="left" class="input_txt"> Enter the End Date : </td>
    								<td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx" id="datepicker1" name="end" /><br><span style="color:red;" id="enderr"></span></td>
    								</tr>
    							</table>
    							</td>
    							</tr>
    						
							
							
							<tr class="row2">
								<td valign="top" align="left" class="input_txt" width="30%">
									Select Report Type :</td>
								<td valign="top" align="left" class="input_txt" width="100%">
									&nbsp;&nbsp;&nbsp;<input type="radio" onchange="toggle3(this.value)" name="report_type" value="0" id="id_type_standard" checked/>&nbsp;Standard Report&nbsp;&nbsp;&nbsp;
								<input type="radio" onchange="toggle3(this.value)" name="report_type" value="1" id="id_type_userdefined"/>&nbsp;User Defined Report<br/>
							
								</td>
								
							</tr>
						</table>
						
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
						
						
							
							<tr class="row1" id="userdefined_name" style="display:none;">
								<td valign="top" align="left" class="input_txt" width="30%">
									Name to appear on the Report :</td>
								<td valign="top" align="left" class="input_txt" width="50%">
									&nbsp;&nbsp;&nbsp;<input type="text" name="report_title" class="input_txtbx" id="report_title" value="" onInput="return validatename();"/>
								</td>
								
							</tr>
							<tr class="row2" id="userdefined_fields" style="display:none;">
								<td valign="top" align="left" style="margin-top:2px;" class="input_txt" width="30%">
									Select Fields Required on the Report :
									<br> <span id="userdefineerror" style="color:red"></span></td>
								<td valign="top" align="left" class="input_txt" width="100%">
								<table cellpadding="0" cellspacing="0" border="0" width="100%">
						
								<tr>
								<td><input type="checkbox" id="select_all"/>&nbsp;Select All</td>
								</tr>
								<tr>
								<td><input type="checkbox" onclick="selectall(this.id)" name="report_field[]" value="capa_id" id="1"/>&nbsp;Capa id</td>
							<!-- 	<td><input type="checkbox" onclick="selectall(this.id)" name="report_field[]" value="nc_id" id="2"/>&nbsp;Nc id</td> -->
								<td><input type="checkbox" onclick="selectall(this.id)" name="report_field[]" value="source_of_nonconformance" id="3"/>&nbsp;Source of nonconformance</td>
					      		</tr>
					      		<tr>
								<td><input type="checkbox" onclick="selectall(this.id)" name="report_field[]" value="external_id" id="4"/>&nbsp;External id</td>
								<td><input type="checkbox" onclick="selectall(this.id)" name="report_field[]" value="type_of_nonconformance" id="5"/>&nbsp;Type of nonconformance</td>
								<td><input type="checkbox" onclick="selectall(this.id)" name="report_field[]" value="date_found" id="6"/>&nbsp;Date found</td>
					      		</tr>
					      		<tr>
								<td><input type="checkbox"onclick="selectall(this.id)" name="report_field[]" value="temporary_action" id="7"/>&nbsp;Temporary action</td>
								<td><input type="checkbox" onclick="selectall(this.id)" name="report_field[]" value="nature_of_nc" id="8"/>&nbsp;Nature of nc</td>
								<td><input type="checkbox" onclick="selectall(this.id)" name="report_field[]" value="capa_requestor" id="9"/>&nbsp;Capa requestor</td>
					      		</tr>
					      		<tr>
								<td><input type="checkbox" onclick="selectall(this.id)" name="report_field[]" value="request_date" id="10"/>&nbsp;Request date</td>
							<td><input type="checkbox" onclick="selectall(this.id)" name="report_field[]" value="capa_due_date" id="11"/>&nbsp;Capa due date</td>
							<td><input type="checkbox" onclick="selectall(this.id)" name="report_field[]" value="assigned_team_leader" id="12"/>&nbsp;Assigned team leader</td>
							</tr>
							<tr> 
							<td><input type="checkbox" onclick="selectall(this.id)" name="report_field[]" value="team_members" id="13"/>&nbsp;Team members</td>
							<td><input type="checkbox" onclick="selectall(this.id)" name="report_field[]" value="root_cause_analysis_file" id="14"/>&nbsp;Root cause analysis file</td>
							<td><input type="checkbox" onclick="selectall(this.id)" name="report_field[]" value="use_5_why_in_system" id="15"/>&nbsp;Use 5 why in system</td>
							</tr>
							<tr>
							<td><input type="checkbox" onclick="selectall(this.id)" name="report_field[]" value="why" id="16"/>&nbsp;Why</td>
							<td><input type="checkbox" onclick="selectall(this.id)" name="report_field[]" value="root_cause_statement" id="17"/>&nbsp;Root cause statement</td>
							<td><input type="checkbox" onclick="selectall(this.id)" name="report_field[]" value="upload_external_analysis" id="18"/>&nbsp;Upload external analysis</td>
								</tr>
								<tr>
							<td><input type="checkbox" onclick="selectall(this.id)" name="report_field[]" value="action" id="19"/>&nbsp;Action</td>
							<td><input type="checkbox" onclick="selectall(this.id)" name="report_field[]" value="responsibility" id="20"/>&nbsp;Responsibility</td>
							<td><input type="checkbox" onclick="selectall(this.id)" name="report_field[]" value="due_date" id="21"/>&nbsp;Due date</td>
								</tr>
								
							<tr>
							<td><input type="checkbox" onclick="selectall(this.id)" name="report_field[]" value="completion_date" id="22"/>&nbsp;Completion date</td>
							<td><input type="checkbox" onclick="selectall(this.id)" name="report_field[]" value="verified_by" id="23"/>&nbsp;Verified by</td>
							<td><input type="checkbox" name="report_field[]" value="verification_date" id="24"/>&nbsp;Verification date</td>
								</tr>
								
								</table>
								
								</td>
								
						
							<tr >
             <td  colspan="2" align="center" width="30%">
             <table style="width: 408px; "><tr style="padding:10px;"><td style=" width: 100px">&nbsp;<input type="submit" align="left" onclick="return validate();" id="export"  name="export" value="Generate" class="submit_btn1" style="width: 79px; ">
             </td><td style="padding:10px;">
              &nbsp;&nbsp;<!-- <input type="reset" id="reset_export" name="reset_export" value="Reset" onclick="toggle3(0);" class="submit_btn1" style="width: 79px; "> --></td>
            
             </tr></table>
            </td>
           
             </tr>
            
							
						</table>
						</form>
					</div>
				</td></tr>
</table></td></tr></table>
<table  width=300 height=200>
			<tr height=30><td></td></tr></table>



<script type="text/javascript">
function validate()
{
	var error ="";
	
	var id_type_userdefined = document.getElementById('id_type_userdefined').checked;
	
	var a1 = document.getElementById('1').checked;
	/* var a2 = document.getElementById('2').checked; */
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
	var a17 = document.getElementById('17').checked;
	var a18 = document.getElementById('18').checked;
	var a19 = document.getElementById('19').checked;
	var a20 = document.getElementById('20').checked;
	var a21 = document.getElementById('21').checked;
	var a22 = document.getElementById('22').checked;
	var a23 = document.getElementById('23').checked;
	var a24 = document.getElementById('24').checked;
	var datepicker = document.getElementById('datepicker').value;
	var datepicker1 = document.getElementById('datepicker1').value;
	var date = /^(0?[1-9]|1[012])[\/](0?[1-9]|[12][0-9]|3[01])[\/]\d{4}$/;
	var certainperiod = document.getElementById('id_type_Corrective_Actions_for_A_Certain_Period').checked;
	
	
	
	 if(certainperiod)
		{
		if(datepicker=="")
		{	
		
	 document.getElementById("starterr").innerHTML="Required field should not be empty";
	 error="true";
		}
		
	else if(!datepicker.match(date))
	 {
		
	 document.getElementById("starterr").innerHTML="Invalid Date";
	 error="true";
	 }

	else if(datepicker > datepicker1)
			{
		
				 document.getElementById("starterr").innerHTML="Please pickup the startDate not more than endDate";
					error="true";
			}	
		else
	 {
		
	 document.getElementById("starterr").innerHTML="";
	 
	 } 
		}
	 if(certainperiod)
		{
		if(datepicker1=="")
		{	
		
	 document.getElementById("enderr").innerHTML="Required field should not be empty";
	 error="true";
		}
	
	else if(!datepicker1.match(date))
	 {
		
	 document.getElementById("enderr").innerHTML="Invalid Date";
	 error="true";
	 }
	 else
	 {
		 
	 document.getElementById("enderr").innerHTML="";
	 } 
	 } 
	
	
	if(id_type_userdefined)
		{
		if(a1 || a3|| a4|| a5|| a6|| a7|| a8|| a9|| a10|| a11|| a12|| a13|| a14|| a15|| a16|| a17|| a18 || a19 || a20 || a21 || a22 || a23 || a24)
			{
			document.getElementById("userdefineerror").innerHTML="";
			}
		else{
			document.getElementById("userdefineerror").innerHTML="Please select atleast one";
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
</script>
<script>
$(function() {
	$("#report_title").on("keypress", function(e) {
		if (e.which === 32 && !this.value.length)
	        e.preventDefault();
	});
	});	


</script>
<script>
function validatename()
{
	var textInput = document.getElementById("report_title").value;
	textInput = textInput.replace(/[^A-Za-z ]/g, "");
	document.getElementById("report_title").value = textInput;
}



</script>
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
	document.getElementById('select_all').checked = false;
	document.getElementById('1').checked = false;
	/* document.getElementById('2').checked = false; */
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
	document.getElementById('17').checked = false;
	document.getElementById('18').checked = false;
	document.getElementById('19').checked = false;
	document.getElementById('20').checked = false;
	document.getElementById('21').checked = false;
	document.getElementById('22').checked = false;
	document.getElementById('23').checked = false;
	document.getElementById('24').checked = false;
	document.getElementById('report_title').value = "";
	document.getElementById("userdefineerror").innerHTML="";
	e1.style.display="table-row";
	e2.style.display="table-row";
    }
if(value==0)
    {
	
	e1.style.display="none";
	e2.style.display="none";
	document.getElementById("start").style.display="none";
  
    }
    
}
</script>

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

$(function() {
	 var format="yy-mm-dd";
         $( "#datepicker" ).datepicker();
         
       });
$(function() {
	 var format="yy-mm-dd";
         $( "#datepicker1" ).datepicker();
         
       });
       
       
       
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
<br><br><br><br><br><br><br><br><br><br><br>

  <jsp:include page="footer.jsp"></jsp:include>
  
  
  
  
  
  
