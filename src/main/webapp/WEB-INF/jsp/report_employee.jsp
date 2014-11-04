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
								<a href="addemployee" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Add Employees</span>
									
								</a>
							</li>
						
				          <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="viewemployees" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>View Employees</span>
									
								</a>
							</li>
				            <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="employee_report" class="<c:choose>
								<c:when test="${menu=='employee'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
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
							<a title="Close" href="employee_list">x</a>
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
					<h2>Employee Details Reports</h2>
				</div>
				<div class="contentbox">
					<form method="post" action="generate_employee_report">
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
							
							<tr class="row1" id="document_type_table">
								<td valign="middle" align="left" class="input_txt" width="30%">
								Select employee report type :
								</td>
								<td valign="middle" align="left" class="input_txt" width="100%">
								<!-- <input type="radio" name="doc_type" value="0" id="id_type_manual" checked/><br/> -->
								
								<br>
								<br>
								<input type="radio" onchange="validation1()" name="doc_type" value="0" id="id_training_needs" checked/>&nbsp;Training needs<br/>
								<input type="radio"  onclick="validation1()"  name="doc_type" value="1" id="id_training_report_for_each_employee"/>&nbsp;Training report for each employee<br/>
								 <input type="radio" onclick="validation()" name="doc_type" value="2" id="id_qualification_for_each_employee"/>&nbsp;Qualification for each employee<br/>
								  <input type="radio" onclick="validation()" name="doc_type" value="3" id="id_open_training"/>&nbsp;Open training<br/>
								   <input type="radio" onclick="validation()" name="doc_type" value="4" id="id_open_training_effectiveness"/>&nbsp;Open training effectiveness<br/> 
								    <input type="radio" onclick="validation()" name="doc_type" value="5" id="id_past_due_training_by_trainer"/>&nbsp;Past-due training by trainer<br/>
								
								</td>
								</tr>
								
								<tr class="row2">
								<td valign="middle" align="left" class="input_txt" width="30%">
									Select report type :</td>
								<td valign="top" align="left" class="input_txt" width="100%">
									<input type="radio" onchange="toggle3(this.value)" name="report_type" value="0" id="id_type_standard" checked/>&nbsp;Standard report&nbsp;&nbsp;&nbsp;
								<input type="radio" onchange="toggle3(this.value)" name="report_type" value="1" id="id_type_userdefined"/>&nbsp;User defined report<br/>
									
								</td>
								
							</tr>
						
						</table>
						
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
						
						
							<!-- <tr class="row2">
								<td valign="middle" align="right" class="input_txt" width="30%">
									Select Report Type:</td>
								<td valign="top" align="left" class="input_txt" width="50%">
									<input type="radio" name="report_type" value="0" id="id_type_standard" checked/>Standard Report&nbsp;&nbsp;&nbsp;
								<input type="radio" name="report_type" value="1" id="id_type_userdefined"/>User Defined Report<br/>
							
								</td>
								
							</tr> -->
							<tr class="row1" id="userdefined_name" style="display:none;">
								<td valign="middle" align="left" class="input_txt" width="30%">
									Enter the name to appear on the report :</td>
								<td valign="top" align="left" class="input_txt" width="100%">
									&nbsp;<input type="text" name="name" class="input_txtbx" id="report_title"  value=""/>
								</td>
								
							</tr>
							<tr class="row2" id="userdefined_fields" style="display:none;">
								<td valign="top" align="left" style="margin-top:2px;" class="input_txt" width="30%">
									Enter the fields required on the report :
									<br/><span id="userdefineerror" style="color:red;"></span></td>
								<td valign="top" align="left" class="input_txt" width="100%">
								<table cellpadding="0" cellspacing="0" border="0" width="100%">
								
								<tr>
								<td><input type="checkbox" id="select_all"/>&nbsp;Select all</td>
								</tr>
								<tr>
								<td><input type="checkbox" name="report_field[]" value="employee_id" id="1"/>&nbsp;Employee id</td>
								<td><input type="checkbox" name="report_field[]" value="name" id="2"/>&nbsp;Name</td>
								<td><input type="checkbox" name="report_field[]" value="job_title" id="3"/>&nbsp;Job title</td>
					      		
					      		</tr>
					      		<tr>
								<td><input type="checkbox" name="report_field[]" value="attachments" id="4"/>&nbsp;Attachments</td>
								<td><input type="checkbox" name="report_field[]" value="list_of_function_needs" id="5"/>&nbsp;List of function needs</td>
								<td><input type="checkbox" name="report_field[]" value="documented_in" id="6"/>&nbsp;Documented In</td>
					      		</tr>
					      		<tr>
								<td><input type="checkbox" name="report_field[]" value="qualified_by" id="7"/>&nbsp;Qualified by</td>
								<td><input type="checkbox" name="report_field[]" value="type_of_training" id="8"/>&nbsp;Type of training</td>
								<td><input type="checkbox" name="report_field[]" value="trainer" id="9"/>&nbsp;Trainer</td>
					      		</tr>
					      		<tr>
								<td><input type="checkbox" name="report_field[]" value="training_due_date" id="10"/>&nbsp;Training due date</td>
								<td><input type="checkbox" name="report_field[]" value="training_completion_date" id="11"/>&nbsp;Completion date</td>
								<td><input type="checkbox" name="report_field[]" value="training_effectiveness_review_due_date" id="12"/>&nbsp;Review due date</td>
					      		</tr>
					      		<tr>
								<td><input type="checkbox" name="report_field[]" value="training_effectiveness_notes" id="13"/>&nbsp;Effectiveness notes</td>
								<td><input type="checkbox" name="report_field[]" value="date_hired" id="14"/>&nbsp;Date hired</td>
								</tr>
								</table>
								
								</td>
								
							</tr>
							<!-- <tr class="row1">
                  <td valign="middle"  align="left" class="input_txt" width="30%">&nbsp;</td>
                 
                 <td valign="middle" align="left" class="input_txt" width="20%">&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" onclick="return validate();" id="export"  name="export" value="Generate" class="submit_btn1">
           		</td>
           		<td align="left">
	            
	              <input type="reset" id="reset_export" name="reset_export" onclick="toggle3(0)" value="Reset" class="submit_btn1"></td>
	             
	                </tr> -->
							<tr >
             <td  align="left" width="13%" align="left"></td>
             <td  align="left" width="30%">
             <table><tr style="padding:10px;"><td style="padding:10px;"><input type="submit" onclick="return validate();" id="export"  name="export" value="Generate" class="submit_btn1">
             </td><td style="padding:10px;">
              <input type="reset" id="reset_export" name="reset_export" onclick="toggle3(0)" value="Reset" class="submit_btn1"></td>
            
             </tr></table>
            
           
             </tr> 
            
							
						</table>
						</form>
					</div>
				</td></tr>
</table></td></tr></table>

<script type="text/javascript">
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

function validate()
{
	var error ="";
	
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
	var a11 = document.getElementById('11').checked;
	var a12 = document.getElementById('12').checked;
	var a13 = document.getElementById('13').checked;
	var a14 = document.getElementById('14').checked;
	
	if(id_type_userdefined)
		{
		if(a1 || a2|| a3|| a4|| a5|| a6|| a7|| a8|| a9|| a10|| a11|| a12|| a13|| a14)
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
function validatename(id){
    var textInput = document.getElementById(id).value;
    textInput = textInput.replace(/[^A-Za-z ]/g, "");
    document.getElementById(id).value = textInput;
}
</script>

<script type="text/javascript">

$(function() {
	 var format="yy-mm-dd";
          $( "#datepicker" ).datepicker();
          
        });
$(function() {
	 var format="yy-mm-dd";
          $( "#datepicker1" ).datepicker();
          
        });

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



 function toggle1(value){
	alert(value);
	document.getElementById("reportdate").style.display="block";
    //var e1=document.getElementById("startdate");
    
if(value==2)
    {
	alert("jhsghjsa");
	document.getElementById("reportdate").style.display="block";

    }
if(value==0)
    {
	
	e1.style.display="none";
	e2.style.display="none";
  
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
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

  <jsp:include page="footer.jsp"></jsp:include>