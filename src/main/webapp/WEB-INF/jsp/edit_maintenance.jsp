<%@page import="qms.model.Maintenance"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="header.jsp"></jsp:include>
<script src="resources/js/jquery.min.js"></script>
 <script src="resources/js/jquery-ui.js"></script>
 <link rel="stylesheet" href="resources/css/jquery-ui.css"
	type="text/css" />
 <script>
 $(function() {
	 $( "#datepicker1" ).datepicker({dateFormat: 'yy-mm-dd'});
        });
 

 $(function() {
	 $( "#datepicker2" ).datepicker({dateFormat: 'yy-mm-dd'});
        });
 

 $(function() {
	 $( "#datepicker3" ).datepicker({dateFormat: 'yy-mm-dd'});
        });
 
</script>
<form method="post" action="update_maintenance" id="formid">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      
      <tr>
      <td>
      <div>
  <ul class="horizmenu" style=" float:left;margin-left:205px; margin-top:8px;">
						
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
								<c:when test="${menu==''}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
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
  </div>
        </td>
      </tr>
      <tr>
        <td valign="top" align="left">
            <div class="headings altheading">
              <h2 style="padding-left:6px">Update Maintenance and Calibration Details</h2>
            </div>  
            <div class="contentbox">
         <div style="border:#993300  2px solid; padding:25px; margin-bottom:15px; margin-left:10px;">
        <div>
        <table cellpadding="0" cellspacing="0" border="0" width="100%" >
         <c:set value="${maintenanceForm.maintenance[0]}" var="Maintenance"> </c:set>
             
              <tr>
			<td align="left" valign="top"   style="padding-right: 20px;padding-bottom:40px;">
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
			    <tr class="row2">
                  <td valign="middle" align="left" class="input_txt"style="padding-left: 39px;" width="36%">Equipment ID  :</td>
                  <td valign="top" align="left" class="input_txt"style="padding-left: 15px;" width="50%"><input type="hidden" name="equipment_id" class="input_txtbx" id="equipment_id"  onblur="toggle(this.value)"onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${Maintenance.equipment_id}" />${Maintenance.equipment_id}
                  <!--  <span id="equipment_id1" style="color:red"></span> -->
                  <span class="err"><form:errors path="Maintenance.equipment_id"></form:errors></span></td>
                </tr>
                 <tr class="row1">
                  <td valign="middle" align="left" class="input_txt"style="padding-left: 39px;" width="20%">Equipment Name  :</td>
                  <td valign="top" align="left" class="input_txt" style="padding-left: 15px;"width="50%"><input type="text" name="equipment_name" class="input_txtbx" readonly="readonly" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}" id="equipment_name" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${Maintenance.equipment_name}" />
                   <br> <span id="equipment_name1" style="color:red"></span>
                  <span class="err"><form:errors path="Maintenance.equipment_name"></form:errors></span></td>
                </tr>
                 <tr class="row2">
                  <td valign="middle" align="left" class="input_txt"style="padding-left: 39px;" width="20%">Equipment Model  :</td>
                  <td valign="top" align="left" class="input_txt"style="padding-left: 15px;" width="50%"><input type="text" name="equipment_model" maxlength="32" readonly="readonly" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}" class="input_txtbx" id="equipment_model"onblur="ChangeCase(this);" onkeypress="return AlphabetsNumber(event,this);"onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${Maintenance.equipment_model}" />
                    <span id="equipment_model1" style="color:red"></span>
                  <span class="err"><form:errors path="Maintenance.equipment_model"></form:errors></span></td>
                </tr>
                 <tr class="row1">
                  <td valign="middle" align="left" class="input_txt"style="padding-left: 39px;" width="20%">Serial Number  :</td>
                  <td valign="top" align="left" class="input_txt"style="padding-left: 15px;" width="50%"><input type="text" name="serial_number" maxlength="32" readonly="readonly" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}" class="input_txtbx" id="serial_number" onblur="ChangeCase(this);"onkeypress="return AlphabetsNumber(event,this);"onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${Maintenance.serial_number}" />
                   <span id="serial_number1" style="color:red"></span>
                  <span class="err"><form:errors path="Maintenance.serial_number"></form:errors></span></td>
                </tr>
                </table>
						         </td>
						         <td align="left" valign="top">
						         <table cellpadding="0" cellspacing="0" border="0" width="100%">
                
                 <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="30%">Date Acquired  :</td>
                  <td valign="top" align="left" class="input_txt"style="padding-left: 22px;" width="50%"><input type="text" name="date_acquired" readonly="readonly" class="input_txtbx" id="datepicker1" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${Maintenance.date_acquired}" />
                    <span id="datepicker11" style="color:red"></span>
                  <span class="err"><form:errors path="Maintenance.date_acquired"></form:errors></span></td>
                </tr>
                <tr class="row1">
                 <td valign="middle" align="left" class="input_txt" width="35%">Equipment Status  :</td>
                  <td valign="top" align="left" class="input_txt"style="padding-left: 22px;" width="50%">
                  <select name="equipment_status" id="equipment_status" disabled="disabled" class="dropdown">				  
                  <option value="">--Select--</option>
             	<option <c:if test="${Maintenance.equipment_status eq 'Active'}"><c:out value="Selected"/></c:if> value="Active" >Active</option>
                <option <c:if test="${Maintenance.equipment_status eq 'Not Active'}"><c:out value="Selected"/></c:if> value="Not Active" >Not Active</option>
                 
                   </select>
                   
                  <br/>
                   <span id="equipment_status1" style="color:red"></span>
                  <span class="err"></span></td>
                  </tr>
                   <tr class="row2">
                 <td valign="middle" align="left" class="input_txt" width="30%">Frequency of Maintenance  :</td>
                  <td valign="top" align="left" class="input_txt"style="padding-left: 22px;" width="50%">
              
                 <%--   <select name="frequency_maintenance" id="frequency_maintenance"class="dropdown" style="height:80px;" multiple>
                   <c:set var="theString" value="${Maintenance.frequency_maintenance}"/>

					
   					<option  <c:if test="${fn:contains(theString, 'Weekly')}"><c:out value="Selected"/></c:if>  value="Weekly" >Weekly</option>
               		<option  <c:if test="${fn:contains(theString, 'Monthly')}"><c:out value="Selected"/></c:if> value="Monthly" >Monthly</option>
                    <option <c:if test="${fn:contains(theString, 'Quarterly')}"><c:out value="Selected"/></c:if> value="Quarterly" >Quarterly</option>
               		<option <c:if test="${fn:contains(theString, 'Semi-Annually')}"><c:out value="Selected"/></c:if> value="Semi-Annually" >Semi-Annually</option>
                    <option <c:if test="${fn:contains(theString, 'Annually')}"><c:out value="Selected"/></c:if> value="Annually" >Annually</option>
                  
                  </select> --%>
                                 
             	    <input type="checkbox" value="Weekly" id="frequency_maintenance_weekly" name="frequency_maintenance_weekly" <c:if test="${Maintenance.frequency_maintenance_weekly=='Weekly'}"><c:out value="checked=checked"/></c:if>/>&nbsp;Weekly   <br/>               
             	<input type="checkbox"  value="Monthly" id="frequency_maintenance_monthly" name="frequency_maintenance_monthly"<c:if test="${Maintenance.frequency_maintenance_monthly=='Monthly'}"><c:out value="checked=checked"/></c:if>/>&nbsp;Monthly<br/>
                <input type="checkbox"  value="Quarterly" id="frequency_maintenance_quarterly" name="frequency_maintenance_quarterly"<c:if test="${Maintenance.frequency_maintenance_quarterly=='Quarterly'}"><c:out value="checked=checked"/></c:if>/>&nbsp;Quarterly<br/>
                <input type="checkbox"  value="Semi-Annually" id="frequency_maintenance_semiannually" name="frequency_maintenance_semiannually"<c:if test="${Maintenance.frequency_maintenance_semiannually=='Semi-Annually'}"><c:out value="checked=checked"/></c:if>/>&nbsp;Semi-Annually<br/>
              	<input type="checkbox" value="Annually" id="frequency_maintenance_annually" name="frequency_maintenance_annually"<c:if test="${Maintenance.frequency_maintenance_annually=='Annually'}"><c:out value="checked=checked"/></c:if>/>&nbsp;Annually <br/>
                 
                  <br/>
                   <span id="frequency_maintenance1" style="color:red"></span>
                  <span class="err"></span></td>
                  </tr>
                   <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="30%">Calibration(Y/N)  :</td>
               <td valign="top" align="left" class="input_txt" style="padding-left: 22px;"width="50%">
               <input type="radio" name="calibration" value="Yes" disabled onchange="toggle3(this.value);"  id="calibration_yes"  <c:if test="${Maintenance.calibration=='Yes'}"><c:out value="Checked=checked"/></c:if>>Yes&nbsp;&nbsp;&nbsp;
               <input type="radio" name="calibration" value="No" disabled id="calibration_no" onchange="toggle3(this.value);" <c:if test="${Maintenance.calibration=='No'}"><c:out value="Checked=checked"/></c:if>>No&nbsp;&nbsp;&nbsp;<br/><span class="err"></span>
               </td>
               </table>
             </td>
              </tr>
            
            
        </table>
        </div>
         <div>
         <div style="border:#993300  2px solid; padding:15px; margin-bottom:15px; margin-left:10px;">
          <table cellpadding="0" cellspacing="0" border="0" width="100%">
              <tr>
			<td align="left" valign="top" style="padding-right: 25px;">
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr class="row2">
                 <td valign="middle" align="left" class="input_txt" width="40%">Type of Maintenance  :</td>
                  <td valign="top" align="left" class="input_txt" width="50%">
                  <select name="type_of_maintenance" class="dropdown">
                 
                  <option <c:if test="${Maintenance.type_of_maintenance eq 'Preventive'}"><c:out value="Selected"/></c:if> value="Preventive" >Preventive</option>
                  <option <c:if test="${Maintenance.type_of_maintenance eq 'Corrective'}"><c:out value="Selected"/></c:if> value="Corrective" >Corrective</option>
                  <option <c:if test="${Maintenance.type_of_maintenance eq 'Predictive'}"><c:out value="Selected"/></c:if> value="Predictive" >Predictive</option>

               </select>
                <br/><span class="err"></span></td>
                  </tr>
                   <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="40%">Frequency of Maintenance  :</td>
                  <td valign="top" align="left" class="input_txt" width="50%">
                  
                 <%--  <input type="checkbox" name="weekly" value="weekly" id="weekly" onclick="toggleAjax()" <c:if test="${Maintenance.weekly=='weekly'}"><c:out value="checked=checked"/></c:if>/>&nbsp;Weekly  <br/>               
             	  <input type="checkbox" name="monthly" value="monthly" id="monthly" onclick="toggleAjax()" <c:if test="${Maintenance.monthly=='monthly'}"><c:out value="checked=checked"/></c:if>/>&nbsp;Monthly<br/>
                  <input type="checkbox" name="quarterly" value="quarterly" id="quarterly" onclick="toggleAjax()" <c:if test="${Maintenance.quarterly=='quarterly'}"><c:out value="checked=checked"/></c:if>/>&nbsp;Quarterly<br/>
                  <input type="checkbox" name="semiannually" value="semi-annually" id="semiannually" onclick="toggleAjax()" <c:if test="${Maintenance.semiannually=='semi-annually'}"><c:out value="checked=checked"/></c:if>/>&nbsp;Semi-Annually<br/>
                  <input type="checkbox" name="annually" value="annually" id="annually" onclick="toggleAjax()" <c:if test="${Maintenance.annually=='annually'}"><c:out value="checked=checked"/></c:if>/>&nbsp;Annually<br/>
              --%>     
               <select name="frequency_maintenance_list" id="frequency_maintenance_list" class="dropdown" onChange="toggleAjax()" >
                   <c:set var="theString" value="${Maintenance.frequency_maintenance_list}"/>

					
   					<option  <c:if test="${fn:contains(theString, 'weekly')}"><c:out value="Selected"/></c:if>  value="weekly" >Weekly</option>
               		<option  <c:if test="${fn:contains(theString, 'monthly')}"><c:out value="Selected"/></c:if> value="monthly" >Monthly</option>
                    <option <c:if test="${fn:contains(theString, 'quarterly')}"><c:out value="Selected"/></c:if> value="quarterly" >Quarterly</option>
               		<option <c:if test="${fn:contains(theString, 'semi-annually')}"><c:out value="Selected"/></c:if> value="semi-annually" >Semi-Annually</option>
                    <option <c:if test="${fn:contains(theString, 'annually')}"><c:out value="Selected"/></c:if> value="annually" >Annually</option>
                  
                  </select>
               <span id="frequencyofmaintenance1" style="color:red"></span>
                <%--   <input type="text" name="maintenance_frequency" class="input_txtbx" id="maintenance_frequency" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${Maintenance.maintenance_frequency}" /><span class="err"><form:errors path="Maintenance.maintenance_frequency"></form:errors></span></td> --%>
                </tr>
                  <tr class="row2">
              
               <td valign="middle" align="left" class="input_txt" width="40%">Notes  :</td>
               <td valign="middle" align="left" width="70%"><textarea class="input_txtbx"  name="notes"  id="notes" style="height:89px;" >${Maintenance.notes}</textarea><br/>
               <span id="notes1" style="color:red"></span>
               <span class="err"><form:errors path="Maintenance.notes"></form:errors></span></td>
            </tr>
                
                <tr class="row2">
              
               <td valign="top" align="left" class="input_txt">Instructions(optional)  :</td>
               <td valign="top" align="left" >
               <!-- <div id="instruction"></div> -->
               <div id="reference1"></div>
               <textarea class="input_txtbx" id="instructions" name="instructions"  style="height: 89px;" >${Maintenance.instructions}</textarea><br/>
               <span id="instructions1" style="color:red"></span>
                
               <span class="err"><form:errors path="Maintenance.instructions"></form:errors></span></td>
            </tr>
        </table>
        </td> 
            <td align="left" valign="top" style="padding-right: 25px;">
          	<table cellpadding="0" cellspacing="0" border="0" width="100%">
            <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="50%">Due Date  :</td>
                  <td valign="top" align="left" class="input_txt" width="50%"><input type="text" name="due_date" class="input_txtbx" id="datepicker2" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${Maintenance.due_date}" />
                <br>   <span id="datepicker22" style="color:red"></span>
                  <span class="err"><form:errors path="Maintenance.due_date"></form:errors></span></td>
                </tr>
                <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="50%">Completion Date  :</td>
                  <td valign="top" align="left" class="input_txt" width="50%"><input type="text" name="completion_date" class="input_txtbx" id="datepicker3" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"  onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${Maintenance.completion_date}" />
                   <br><span id="datepicker33" style="color:red"></span>
                  <span class="err"><form:errors path="Maintenance.completion_date"></form:errors></span></td>
                </tr>
                <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="50%">Completed By  :</td>
                  <td valign="top" align="left" class="input_txt" width="50%">
                    <select name="completed_by" id="completed_by"  class="dropdown">
							 
			                <c:forEach items="${hRandTrainingForm.hRandTrainings}" var="calibrationname" varStatus="status">
        				       <option value="${calibrationname.name}"<c:if test="${calibrationname.name == Maintenance.completed_by}"><c:out value="selected"/></c:if>>${calibrationname.name}</option>
			                  </c:forEach>
			                 </select><br>
			                 <span id="completed_by1" style="color:red"></span>
                  <span class="err"><form:errors path="Maintenance.completed_by"></form:errors></span></td>
                </tr>
               <!-- <tr class="row1">
                  <td valign="top" align="left" class="input_txt" width="50%">Reference  :</td>
                  <td valign="top" align="left" class="input_txt" width="50%">
                   <div id="reference1"></div><br>
                   </tr> -->
          
        
          
          </table>
            
                  <tr class="row1">
                  <td valign="bottom" colspan="2"align="right" style="padding-right: 40px">&nbsp;<input type="submit" value="Update" onclick="return validation();"class="submit_btn1"></td>
                  <td valign="top" align="left"></td>
                </tr>
          </td>
          </tr>
          </table>
          </div>
          </div>
          </div>
          </div>
          </td>
          </tr>
          </table>
          </div>
          </form>
          
              
           
 <script>
 
 $('#formid').on('submit', function() {
	 
	    $('#equipment_status').attr('disabled', false);
	    $('#calibration_yes').attr('disabled', false);
	    $('#calibration_no').attr('disabled', false);
	    
	    
	});
   function toggleAjax() {
	 
	   var weekly_main = $('#frequency_maintenance_list').val();
	 
	   var weekly ='',monthly='', quarterly='',semiannually='',annually='';
	   		if(weekly_main == "weekly")
		   {
			 weekly = $('#frequency_maintenance_list').val();
		   }
	   		else if(weekly_main == "monthly")
		   {
			 monthly = $('#frequency_maintenance_list').val();
		   }
	   		else if(weekly_main == "quarterly")
			{
	               quarterly = $('#frequency_maintenance_list').val();
			}
	   		else if(weekly_main == "semi-annually")
	        {
				 semiannually = $('#frequency_maintenance_list').val();
	        }
	   		else if(weekly_main == "annually")
			{
				 annually = $('#frequency_maintenance_list').val();
	        }
	            	 
	
	$.ajax({
		type : "POST",
		url : "/QMS_App/ajax_getAttach",
		data : "weekly="+weekly+"&monthly="+monthly+"&quarterly="+quarterly+"&semiannually="+semiannually+"&annually="+annually,
		success : function(response) {
		//	alert("response"+response);
		
    			$('#reference1').html(response);
    			
    		
		},
		error : function(e) {
		//	alert('Error: ' + e);
		}
	});
}
 
   
   
   function instructionAjax() {
		 
		
		var filer_value = $('#frequency_maintenance_list').val();
		
		$.ajax({
			type : "POST",
			url : "/QMS_App/ajax_getinstruction",
			data : "weekly=" + filer_value,
			success : function(response) {
	              
	             // alert("response= "+response);
	              
		       $('#instruction').html(response);
	      	    			},
			error : function(e) {
				alert('Error: ' + e);
			}
		});
	}   
  
 
</script> 
<script>
$(function() {
	$("#equipment_id").on("keypress", function(e) {
	
	if (e.which === 32 && !this.value.length)
        e.preventDefault();
});
});
$(function() {
	$("#equipment_name").on("keypress", function(e) {
	
	if (e.which === 32 && !this.value.length)
        e.preventDefault();
});
});
$(function() {
	$("#equipment_model").on("keypress", function(e) {
	
	if (e.which === 32 && !this.value.length)
        e.preventDefault();
});
});

$(function() {
	$("#serial_number").on("keypress", function(e) {
	
	if (e.which === 32 && !this.value.length)
        e.preventDefault();
});
});

$(function() {
	$("#instructions").on("keypress", function(e) {
	
	if (e.which === 32 && !this.value.length)
        e.preventDefault();
});
});

$(function() {
	$("#notes").on("keypress", function(e) {
	
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
    textInput = textInput.replace(/[^a-zA-Z0-9 ]/g, "");
    document.getElementById(id).value = textInput;
}  
function validatename3(id){
	
    var textInput = document.getElementById(id).value;
    textInput = textInput.replace(/[^0-9 ]/g, "");
    document.getElementById(id).value = textInput;
}  



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
function AlphabetsNumberSpace(e, t) {
    try {
        if (window.event) {
            var charCode = window.event.keyCode;
        }
        else if (e) {
            var charCode = e.which;
        }
        else { return true; }
        if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123)|| (charCode >47 && charCode < 58) ||(charCode == 32))
            return true;
        else
            return false;
    }
    catch (err) {
        alert(err.Description);
    }
}
</script>
<script type="text/javascript">
function validation()
{

	
	

	var date = /^\d{4}-(0?[1-9]|1[012])-(0?[1-9]|[12][0-9]|3[01])$/;
	
	var error="";

	var equipment_name =  document.getElementById('equipment_name').value;
	
	var equipment_model = document.getElementById('equipment_model').value;
	
	var serial_number = document.getElementById('serial_number').value;
	
	var datepicker1 = document.getElementById('datepicker1').value;
	
	var datepicker2 = document.getElementById('datepicker2').value;
	
	var datepicker3 = document.getElementById('datepicker3').value;
	
	var equipment_status = document.getElementById('equipment_status').value;
	
	 var frequency_maintenance_weekly = document.getElementById('frequency_maintenance_weekly').checked;
	   var frequency_maintenance_monthly = document.getElementById('frequency_maintenance_monthly').checked;
	   var frequency_maintenance_quarterly = document.getElementById('frequency_maintenance_quarterly').checked;
	   var frequency_maintenance_semiannually = document.getElementById('frequency_maintenance_semiannually').checked;
	   var frequency_maintenance_annually = document.getElementById('frequency_maintenance_annually').checked;
	
	
	 var frequency_maintenance_list = document.getElementById('frequency_maintenance_list').value;
	/*    var instructions=  document.getElementById('instructions').value; */
	 
	  var completed_by = document.getElementById('completed_by').value;
	 
	  var notes = document.getElementById('notes').value;
	
	if(equipment_name == "")
	{
	document.getElementById("equipment_name1").innerHTML="Required field should not be empty";
	error="true";
	}
	else if(equipment_name.charAt(0) == " ")
	{
	document.getElementById("equipment_name1").innerHTML="Should not accept initial spaces";
	error="true";
	}
	else if((equipment_name.length < 4) || (equipment_name.length > 32))
	{
	document.getElementById("equipment_name1").innerHTML="Required field should be length of 4 to 32";
	error="true";
	}
	else{
	document.getElementById("equipment_name1").innerHTML="";
	}

	
	
	
	if(equipment_model == "")
	{
	document.getElementById("equipment_model1").innerHTML="Required field should not be empty";
	error="true";
	}
	else if(equipment_model.charAt(0) == " ")
	{
	document.getElementById("equipment_model1").innerHTML="Should not accept initial spaces";
	error="true";
	}
	else if((equipment_model.length < 4) || (equipment_model.length > 32))
	{
	document.getElementById("equipment_model1").innerHTML="Required field should be length of 4 to 32";
	error="true";
	}
	else{
	document.getElementById("equipment_model1").innerHTML="";
	}


	
	
	if(serial_number == "")
	{
	document.getElementById("serial_number1").innerHTML="Required field should not be empty";
	error="true";
	}
	else if(serial_number.charAt(0) == " ")
	{
	document.getElementById("serial_number1").innerHTML="Should not accept initial spaces";
	error="true";
	}
	else if((serial_number.length < 4)|| (serial_number.length > 32))
	{
	document.getElementById("serial_number1").innerHTML="Required field should be length of 4 to 32";
	error="true";
	}
	else{
	document.getElementById("serial_number1").innerHTML="";
	}
	
	
	 if(datepicker1 == "")
	 {
	 document.getElementById("datepicker11").innerHTML="Required field should not be empty";
	 error="true";
	 
	 }
	 else if(datepicker1.match(date))
	 {
	 document.getElementById("datepicker11").innerHTML="";
	 }
	 else
	 {
	 document.getElementById("datepicker11").innerHTML="Invalid Date";
	 error="true";
	 }
	 
	 if(equipment_status == "")
		 {
		 document.getElementById("equipment_status1").innerHTML="Required field should not be empty";
		 error="true";
		 }
	 else
		 {
		 document.getElementById("equipment_status1").innerHTML="";
		 }
	 
	 
	 if((frequency_maintenance_weekly) || (frequency_maintenance_monthly) ||(frequency_maintenance_quarterly)||(frequency_maintenance_semiannually) || (frequency_maintenance_annually))
	 {
		 document.getElementById("frequency_maintenance1").innerHTML="";
	 }
	else
	 {
		 document.getElementById("frequency_maintenance1").innerHTML="Please check atleast one";
		 error="true";
	
	 }
	 
	 if(frequency_maintenance_list == "")
		 {
		 document.getElementById("frequencyofmaintenance1").innerHTML="Please check atleast one";
		 error="true";
		 
		 }
	 else{
		 document.getElementById("frequencyofmaintenance1").innerHTML="";
		 
	 }
	 
	/*  if(instructions == "")
		{
		 
		document.getElementById("instructions1").innerHTML="";
		
		}
	 else if(instructions.charAt(0) == " ")
		{
		document.getElementById("instructions1").innerHTML="Should not accept initial space";
		error="true";
		}
	  else if((instructions.length < 4) || (instructions.length > 400 ))
			 {
			 document.getElementById("instructions1").innerHTML="Required field should be length of 4 to 400";
			 error="true";
			 }
		 else{
		     document.getElementById("instructions1").innerHTML="";
		     }
	 	 */
	
	 
	 
	 
if(datepicker2 == "")
	 {
	 document.getElementById("datepicker22").innerHTML="Required field should not be empty";
	 error="true";
	 
	 }
	 else if(datepicker2.match(date))
	 {
	 document.getElementById("datepicker22").innerHTML="";
	 }
	 else
	 {
	 document.getElementById("datepicker22").innerHTML="Invalid date";
	 error="true";
	 }
	 
	 
	 if(datepicker3 == "")
	 {
	 document.getElementById("datepicker33").innerHTML="Required field should not be empty";
	 error="true";
	 
	 }
	 else if(datepicker3.match(date))
	 {
	 document.getElementById("datepicker33").innerHTML="";
	 }
	 else
	 {
	 document.getElementById("datepicker33").innerHTML="Invalid date";
	 error="true";
	 } 
	 
	 
	 if(completed_by == "")
	 {
	 document.getElementById("completed_by1").innerHTML="Please select";
	 error="true";
	 }
	else
	 {
	 document.getElementById("completed_by1").innerHTML="";
	 }
	 
	 
	 if(notes == "")
		{
		 
		document.getElementById("notes1").innerHTML="Required field should not be empty";
		error="true";
		}
	 else if(notes.charAt(0) == " ")
		{
		document.getElementById("notes1").innerHTML="Should not accept initial spaces";
		error="true";
		}
		else if((notes.length < 4) || (notes.length > 400 ))
			 {
			 document.getElementById("notes1").innerHTML="Required field should be length of 4 to 400";
			 error="true";
			 }
		 else{
		     document.getElementById("notes1").innerHTML="";
		     }
	 	
		
	 if(error=="true")
		 {
		 return false;
		 }
}

function ChangeCase(elem)
{
    elem.value = elem.value.toUpperCase();
}
</script>  
<script>
	
	window.onload = function(){
		instructionAjax();toggleAjax();
	}
		</script>            
 <jsp:include page="footer.jsp"></jsp:include>
          