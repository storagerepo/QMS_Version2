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
				<ul class="horizmenu" style=" float:left;margin-left:205px; margin-top:8px;" >

					<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="add_supplierperformance" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Add SupplierPerformance</span>
									
								</a>
							</li>
						
				          <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="view_supplierperformance" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>View SupplierPerformance</span>
									
								</a>
							</li>
				            <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="supplierperformance_report" class="<c:choose>
								<c:when test="${menu=='supplier'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
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
							<a title="Close" href="supplierperformance_list">x</a>
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
					<h2>Supplier Performance Details Reports</h2>
				</div>
				<div class="contentbox">
					<form method="post" action="generate_supplierperformance_report">
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
							
							<br></br>
							<tr class="row1" id="document_type_table">
								<td valign="middle" align="right" class="input_txt" width="30%">
								Select supplierperformance type :
								</td>
								<td valign="middle" align="left" class="input_txt" width="100%">
								<!-- <input type="radio" name="doc_type" value="0" id="id_type_manual" checked/><br/> -->
								
								<input type="radio" onchange="validation1()" name="doc_type" value="0" id="id_open_supplierperformance" checked/>&nbsp;Open SupplierPerformance<br/>
								<!-- <input type="radio"  onclick="validation1()"  name="doc_type" value="1" id="id_disposition"/>No Disposition Over 30 Days<br/>
								 <input type="radio" onclick="validation()" name="doc_type" value="2" id="id_cost_of_nonconformance"/>Cost of Non-Conformance<br/> 
								 -->
								</td>
								</tr>
								
    							
    							
    						
			
								<tr class="row2">
								<td valign="middle" align="right" class="input_txt" width="30%">
									Select report type :</td>
								<td valign="top" align="left" class="input_txt" width="100%">
									<input type="radio" onchange="toggle3(this.value)" name="report_type" value="0" id="id_type_standard" checked/>&nbsp;Standard Report&nbsp;&nbsp;&nbsp;
								<input type="radio" onchange="toggle3(this.value)" name="report_type" value="1" id="id_type_userdefined"/>&nbsp;User Defined Report<br/>
									
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
								<td valign="middle" align="right" class="input_txt" width="30%">
									Enter the name to appear on the report :</td>
								<td valign="top" align="left" class="input_txt" width="50%">
									<input type="text" name="supplier_name" class="input_txtbx" id="report_title" value=""/>
								</td>
								
							</tr>
							<tr class="row2" id="userdefined_fields" style="display:none;">
								<td valign="top" align="right" style="margin-top:2px;" class="input_txt" width="30%">
									Enter the fields required on the report :
									<br/><span id="userdefineerror" style="color:red;"></span></td>
								<td valign="top" align="left" class="input_txt" width="100%">
								<table cellpadding="0" cellspacing="0" border="0" width="100%" style="margin-left:-10px;">
								
								<tr>
								<td><input type="checkbox" id="select_all"/>&nbsp;Select all</td>
								</tr>
								
								
								<tr>
								<td><input type="checkbox" name="report_field[]" value="supplier_id" id="1"/>&nbsp;ID</td>
								<td><input type="checkbox" name="report_field[]" value="supplier_name" id="2"/>&nbsp;Name</td>
								<td><input type="checkbox" name="report_field[]" value="category" id="3"/>&nbsp;Category</td>
					      		
					      		</tr>
					      		<tr>
								<td><input type="checkbox" name="report_field[]" value="city" id="4"/>&nbsp;City</td>
								<td><input type="checkbox" name="report_field[]" value="state" id="5"/>&nbsp;State</td>
								<td><input type="checkbox" name="report_field[]" value="postalcode" id="6"/>&nbsp;Postalcode</td>
					      		</tr>
					      		<tr>
								<td><input type="checkbox" name="report_field[]" value="country" id="7"/>&nbsp;Country</td>
								<td><input type="checkbox" name="report_field[]" value="website" id="8"/>&nbsp;Website</td>
								<td><input type="checkbox" name="report_field[]" value="certified_to" id="9"/>&nbsp;Certified To</td>
					      		</tr>
					      		<tr>
								<td><input type="checkbox" name="report_field[]" value="contact_name" id="10"/>&nbsp;Contact Name</td>
								<td><input type="checkbox" name="report_field[]" value="contact_title" id="11"/>&nbsp;Contact Title</td>
								<td><input type="checkbox" name="report_field[]" value="phone" id="12"/>&nbsp;Phone</td>
					      		</tr>
					      		<tr>
								<td><input type="checkbox" name="report_field[]" value="fax" id="13"/>&nbsp;Fax</td>
								<td><input type="checkbox" name="report_field[]" value="email_address" id="14"/>&nbsp;Email Address</td>
								<td><input type="checkbox" name="report_field[]" value="address" id="15"/>&nbsp;Address</td>
								</tr>
								</table>
								
								</td>
								
							</tr>
							<tr >
             <td  colspan="2" style="padding-left:325px;" width="30%">
             <table><tr style="padding:10px;"><td style="padding:10px;"><input type="submit" id="export"  name="export" value="Generate" onclick="return validate();" class="submit_btn1">
             </td><td style="padding:10px;">
              <input type="reset" id="reset_export" name="reset_export" value="Reset" onclick="toggle3(0);" class="submit_btn1"></td>
            
             </tr></table>
            
           
             </tr>
            
							
						</table>
						</form>
					</div>
				</td></tr>
</table></td></tr></table>


<script type="text/javascript">
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
	var a15 = document.getElementById('15').checked;
	
	if(id_type_userdefined)
		{
		if(a1 || a2|| a3|| a4|| a5|| a6|| a7|| a8|| a9|| a10|| a11|| a12|| a13|| a14|| a15)
			{
			document.getElementById("userdefineerror").innerHTML="";
			}
		else{
			document.getElementById("userdefineerror").innerHTML="Please select atleast One";
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
	document.getElementById('report_title').value = "";
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

</script>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br>
  <jsp:include page="footer.jsp"></jsp:include>