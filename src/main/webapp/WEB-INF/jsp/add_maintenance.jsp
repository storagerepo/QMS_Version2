<%@page import="qms.model.Maintenance"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="header.jsp"></jsp:include>
<script src="resources/js/jquery.min.js"></script>
 <script src="resources/js/jquery-ui.js"></script>
 <link rel="stylesheet" href="resources/css/jquery-ui.css"
	type="text/css" />
<form method="post" action="add_maintenance">
 
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
       
      <tr>
      <td>
      <div id="right_content">
  <ul class="horizmenu" >
						
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="add_maintenance" class="<c:choose>
								<c:when test="${menu=='maintenance'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
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
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
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
              <h2 style="padding-left:30px">Add Maintenance and Calibration Details</h2>
            </div>
            
    <div style="padding-left:34px"class="contentbox">
       <div style="border:#993300  2px solid; padding:15px; margin-bottom:15px; margin-left:15px;">
        <div>
           <table cellpadding="0" cellspacing="0" border="0" width="100%" >
              <tr>
			<td align="left" valign="top" width="50%" style="padding-right: 35px;">
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr class="row2">
                  <td valign="middle" align="left" style="padding-left:38px" class="input_txt" width="45%">Equipment ID  :</td>
                  <td valign="top" align="left" class="input_txt" width="60%"><input type="text" maxlength="32" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}" value="" name="equipment_id" class="input_txtbx" id="equipment_id" onblur="ChangeCase(this);toggle(this.value);" onkeypress="return AlphabetsNumber(event,this);"onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" />
                  <br>
                  <span id="equipment_id1" style="color:red">
                  <c:if test="${success=='exist'}">Equipment ID already Exist</c:if></span>
                  <span class="err"><form:errors path="Maintenance.equipment_id"></form:errors></span></td>
                </tr>
                 <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="45%" style="padding-left:38px">Equipment Name  :</td>
                 <!--  <td valign="top" align="left" class="input_txt" width="40%"><input type="text" name="equipment_name" class="input_txtbx" id="equipment_name" onkeypress="return AlphabetsNumberSpace(event,this);"onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /> -->
                  <td valign="top" align="left" class="input_txt" width="40%"><input type="text" name="equipment_name"  onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}" value="" maxlength="32" class="input_txtbx" id="equipment_name" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  />
                  <br> <span id="equipment_name1" style="color:red"></span>
                  <span class="err"><form:errors path="Maintenance.equipment_name"></form:errors></span></td>
                </tr>
                 <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="40%" style="padding-left:38px">Equipment Model  :</td>
                  <td valign="top" align="left" class="input_txt" width="40%"><input type="text" value="" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}" name="equipment_model" maxlength="32" class="input_txtbx" id="equipment_model"onblur="ChangeCase(this);" onkeypress="return AlphabetsNumber(event,this);"onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  />
                 <br>  <span id="equipment_model1" style="color:red"></span>
                  <span class="err"><form:errors path="Maintenance.equipment_model"></form:errors></span></td>
                </tr>
                 <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="40%" style="padding-left:38px">Serial Number  :</td>
                  <td valign="top" align="left" class="input_txt" width="40%"><input type="text" name="serial_number" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}" value="" maxlength="32" class="input_txtbx" id="serial_number" onblur="ChangeCase(this);"onkeypress="return AlphabetsNumber(event,this);"onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  />
                   <br><span id="serial_number1" style="color:red"></span>
                  <span class="err"><form:errors path="Maintenance.serial_number"></form:errors></span></td>
                </tr>
                </table>
						         </td>
						         <td align="left" valign="top">
						         <table cellpadding="0" cellspacing="0" border="0" width="93%">
                
                 <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" style="padding-left: 85px">Date Acquired :</td>
                  <td valign="top" align="left" class="input_txt" width="42%"><input type="text" value="" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}" name="date_acquired" class="input_txtbx" id="datepicker1" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  />
                   <br> <span id="datepicker11" style="color:red"></span>
                  <span class="err"><form:errors path="Maintenance.date_acquired"></form:errors></span></td>
                </tr>
                <tr class="row1">
                 <td valign="middle" align="left" class="input_txt" width="42%" style="padding-left: 85px">Equipment Status  :</td>
                  <td valign="top" align="left" class="input_txt" width="40%">
                  <select name="equipment_status" class="dropdown" id="equipment_status">
                  <option value="">--Select--</option>
                  <option  value="Active">Active</option>
                  <option  value="Not Active">Not Active</option>
                  </select>
                  <br/>
                   <span id="equipment_status1" style="color:red"></span>
                  <span class="err"><form:errors path="Maintenance.equipment_status"></form:errors></span></td>
                  
                  </tr>
                  <tr class="row2">
                 <td valign="top" align="left" class="input_txt" style="padding-left: 85px">Frequency of Maintenance  :</td>
                  <td valign="top" align="left" class="input_txt">
                  <%-- <select name="frequency_maintenance" class="dropdown"  style="height:80px;"id="frequency_maintenance" multiple>
                  <c:if test="${fn:contains(groupnames,participantGroups.group_name)}"><c:out value="selected"/></c:if>
                  <option  value="Weekly">Weekly</option>
                  <option value="Monthly">Monthly</option>
                   <option value="Quarterly">Quarterly</option>
                   <option value="Semi-Annually">Semi-Annually</option>
                  <option value="Annually">Annually</option>
                  </select>
                   --%>
                  
                <input type="checkbox"   value="Weekly" id="frequency_maintenance_weekly" name="frequency_maintenance_weekly"/>&nbsp;Weekly   <br/>               
             	<input type="checkbox"  value="Monthly" id="frequency_maintenance_monthly" name="frequency_maintenance_monthly"/>&nbsp;Monthly<br/>
                <input type="checkbox"  value="Quarterly" id="frequency_maintenance_quarterly" name="frequency_maintenance_quarterly"/>&nbsp;Quarterly<br/>
                <input type="checkbox"  value="Semi-Annually" id="frequency_maintenance_semiannually" name="frequency_maintenance_semiannually"/>&nbsp;Semi-Annually<br/>
              	<input type="checkbox" value="Annually" id="frequency_maintenance_annually" name="frequency_maintenance_annually"/>&nbsp;Annually <br/>
                 
                   
                   <br/>
                  <span id="frequency_maintenance1" style="color:red"></span>
                  <span class="err"></span></td>
                  </tr>
                   <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="42%" style="padding-left: 85px">Calibration(Y/N)  :</td>
               <td valign="top" align="left" class="input_txt" width="40%">
               <input type="radio" name="calibration" value="Yes" onchange="toggle3(this.value);"  id="calibration_yes" checked>Yes&nbsp;&nbsp;&nbsp;
               <input type="radio" name="calibration" value="No" id="calibration_no" onchange="toggle3(this.value);"  >No&nbsp;&nbsp;&nbsp;<br/><span class="err"></span>
               </td>
               </tr>
               </table>
             </td>
              </tr>
            
            
        </table>
        </div>
       
         <div id="childsection" style="display:none;">
         <div style="border:#993300  2px solid; padding:15px; margin-bottom:15px; margin-left:10px;">
          <table cellpadding="0" cellspacing="0" border="0" width="100%">
              <tr>
			<td align="left" valign="top" style="padding-right: 25px;">
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr class="row2">
                  
                  <td valign="middle" align="left" class="input_txt" width="15%">Equipment ID  :</td>
                  <td valign="top" align="left" class="input_txt" width="30%"><input type="text" name="equipmentid" class="input_txtbx" id="equipmentid"readonly=readonly onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value=""/><span class="err"></span></td>
                </tr> 
               <tr class="row1">
                 <td valign="middle" align="left" class="input_txt" width="15%"> Type of Maintenance  :</td>
                  <td valign="top" align="left" class="input_txt" width="40%">
                  <select name="type_of_maintenance"  class="dropdown" >
                 
                  <option  value="Preventive">Preventive</option>
                  <option  value="Corrective">Corrective</option>
                   <option  value="Predictive">Predictive</option>
               </select>
                <br/><span class="err"></span></td>
                  </tr>
                   <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="15%">Frequency of Maintenance  :</td>
                  <td valign="top" align="left" class="input_txt" width="40%">
               <!--  <span id="wee"> <input type="checkbox"   value="weekly" id="weekly" onclick="toggleAjax1()" /><input type="hidden" name="weekly"></span>&nbsp;Weekly   <br/>               
             	<span id="mon"> <input type="checkbox"  value="monthly" id="monthly"onclick="toggleAjax2()" /><input type="hidden" name="monthly"></span>&nbsp;Monthly<br/>
                <span id="qua">   <input type="checkbox"  value="quarterly" id="quarterly"onclick="toggleAjax3()" /><input type="hidden" name="quarterly"></span>&nbsp;Quarterly<br/>
                <span id="semi">  <input type="checkbox"  value="semi-annually" id="semiannually" onclick="toggleAjax4()" /><input type="hidden" name="semiannually"></span>&nbsp;Semi-Annually<br/>
              <span id="annu"> <input type="checkbox" value="annually" id="annually" onclick="toggleAjax5()" /><input type="hidden" name="annually" ></span>&nbsp;Annually <br/>
            -->    
            <select name="frequency_maintenance_list" class="dropdown" id="frequency_maintenance_list" onChange="toggleAjax()">
                  <c:if test="${fn:contains(groupnames,participantGroups.group_name)}"><c:out value="selected"/></c:if>
                   <option  value="">--Select--</option>
                  <option  value="weekly">Weekly</option>
                  <option value="monthly">Monthly</option>
                   <option value="quarterly">Quarterly</option>
                   <option value="semi-annually">Semi-Annually</option>
                  <option value="annually">Annually</option>
                  </select>
                  <br>
               <span id="frequencyofmaintenance1" style="color:red"></span>
                 <%--  <span class="err"><form:errors path="Maintenance.maintenance_frequency"></form:errors></span> --%></td>
                </tr>
                 <tr class="row2">
              
               <td valign="top" align="left" class="input_txt"width="15%">Notes  :</td>
               <td valign="top" align="left"  class="input_txt"width="40%"><textarea class="input_txtbx"  name="notes" id="notes" style="height: 89px;" ></textarea><br/>
               <span id="notes1" style="color:red"></span>
               <span class="err"><form:errors path="Maintenance.notes"></form:errors></span></td>
            </tr>
                
                <tr class="row2">
              
               <td valign="top" align="left" class="input_txt"width="10%">Instructions(optional)  :</td>
               <td valign="top" align="left" width="20%"><!-- <div id="instruction"></div> -->
               <div id="reference1"><input type="hidden" name="reference1" value="null"></div>
                   
               <textarea class="input_txtbx"  name="instructions" id="instructions" style="height: 89px;" ></textarea><br/>
               
              <span id="instructions1" style="color:red"></span> 
               <span class="err"><form:errors path="Maintenance.instructions"></form:errors></span>
               
               
               </td>
           
            </tr>
        </table>
        </td> 
           <td align="left" valign="top" width="43%" style="padding-right: 25px;">
          	<table cellpadding="0" cellspacing="0" border="0" width="100%">
           
           
            <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="70%">Due Date  :</td>
                  <td valign="middle" align="left" class="input_txt" width="50%"><input type="text"  name="due_date" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}" value="" class="input_txtbx" id="datepicker2" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  />
                  <br><span id="datepicker22" style="color:red"></span>
                  <span class="err"><form:errors path="Maintenance.due_date"></form:errors></span></td>
                </tr>
                <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="40%">Completion Date  :</td>
                  <td valign="top" align="left" class="input_txt" width="40%"><input type="text" name="completion_date"  onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}" value="" class="input_txtbx" id="datepicker3" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" />
                <br>  <span id="datepicker33" style="color:red"></span>
                  <span class="err"><form:errors path="Maintenance.completion_date"></form:errors></span></td>
                </tr>
                <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="40%">Completed By  :</td>
                  <td valign="top" align="left" class="input_txt" width="40%">
                  
                   <select id="completed_by" name="completed_by" class="dropdown"  >
              <option value = "">--Select --</option>
			                <c:forEach items="${hRandTrainingForm.hRandTrainings}" var="calibrationname" varStatus="status">
        				       <option  value="${calibrationname.name}">${calibrationname.name}</option>
			                  </c:forEach> </select>
			                <br>  <span id="completed_by1" style="color:red"></span>
                 <!--  <input type="text" name="completed_by" class="input_txtbx" id="completed_by" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /> --><span class="err"><form:errors path="Maintenance.completed_by"></form:errors></span></td>
                </tr>
              
              <!--   <tr class="row1">
                
                  <td valign="top" align="left" class="input_txt" width="10%">Reference  :</td>
                  <td valign="top" align="left" class="input_txt" width="20%">
                  <div id="reference1"><input type="hidden" name="reference1" value="null"></div>
                   <div id="reference2"><input type="hidden" name="reference2" value="null"></div>
                  <div id="reference3"><input type="hidden" name="reference3" value="null"></div>
                  <div id="reference4"><input type="hidden" name="reference4" value="null"></div>
                  <div id="reference5"><input type="hidden" name="reference5" value="null"></div>
                   
                  </td>
               
                </tr> -->
               
          <tr class="row1">
                  <td valign="top" align="left">&nbsp;</td>
                   <td valign="top" align="left">&nbsp;</td>
                  </tr>
                    <tr class="row1">
                  <td valign="top" align="left">&nbsp;</td>
                   <td valign="top" align="left">&nbsp;</td>
                  </tr>
           <tr class="row1" height="150px">
                  <td valign="bottom" colspan="3"align="right">&nbsp;<input type="submit" value="Submit"  onclick="return validation();" class="submit_btn1"></td>
                  <!-- onclick="return validation();" -->
                  <td valign="top" align="left"></td>
                </tr>
       </table><br/><br/>
       </td>
       </tr>
       </table>
       </div><br/><br/>
  </div>
  	<table id="hidebutton"style="float:right;margin-top:20px;">
    <tr class="row1" >
                  <td valign="bottom" colspan="2"align="right">&nbsp;<input type="submit" onclick="return validationmain();" value="Submit"  class="submit_btn1"></td>
                  <!-- onclick="return validation();" -->
                  <td valign="top" align="left">
                  <input type="button" value="Enter/Modify Maintenance & Calibration" onclick="showchildsection();"class="submit_btn1" style="width:350px;"> 
				</td>
                  
                </tr>
     </table>
     <table id="showbutton" style="display:none;float:right;margin-top:-33px">
      <tr class="row1" >
                  <td valign="bottom" colspan="3"align="right">&nbsp;
                  <input type="button" value="Hide Enter/Modify Maintenance & Calibration" onclick="hidechildsection();"class="submit_btn1" style="width:350px;"> 
				</td>
                  <td valign="top" align="left"></td>
                </tr></table>
  </div>
  </div>
  </td>
  </tr>
  </table>
  
 
  </form>
  <script type="text/javascript">
 function showchildsection()
 {
	 document.getElementById('childsection').style.display="block";
	 document.getElementById('hidebutton').style.display="none";
	 document.getElementById('showbutton').style.display="block";
 }
 function hidechildsection()
 {
	 document.getElementById('childsection').style.display="none";
	 document.getElementById('hidebutton').style.display="block";
	 document.getElementById('showbutton').style.display="none";
 }
  </script>
             <script>
 $(function() {
	 $( "#datepicker1" ).datepicker({dateFormat: 'yy-mm-dd'});
        });
 
</script>
 <script>
 $(function() {
	 $( "#datepicker2" ).datepicker({dateFormat: 'yy-mm-dd'});
        });
 
</script>
 <script>
 $(function() {
	 $( "#datepicker3" ).datepicker({dateFormat: 'yy-mm-dd'});
        });
 
</script>
          
 <script>
$(document).ready(function()
{
$("#searchbox").keyup(function()
{
var sr=$("#searchbox").val();
$("#suggestion_box").val('');
$.ajax(
{
type:"post",
url:"add_maintenance.jsp",
data:"search="+ sr,
cache:false,
success:function(html)
{
$("#suggestion_box").html(html);
}
});
}); 
});
</script>
  
  <script>
   function toggleAjax5() {
	 
	   var weekly_main = document.getElementById('weekly').checked;
	   //alert("value");
	   		if(weekly_main)
		   {
			 weekly = $('#weekly').val();
		  document.getElementById("wee").innerHTML='<input type="checkbox" name="weekly" value="weekly" id="weekly" onclick="toggleAjax1()" checked/>';
	$.ajax({
		type : "POST",
		url : "/QMS_App/ajax_getAttach1",
		data : "weekly="+weekly,
		success : function(response) {
		//	alert("response"+response);	
		
    	
    		//	alert("if loop 0");
    		//alert(response);
    			document.getElementById("reference1").innerHTML=response;
    		
    		
    		
    		
    		  
		},
		error : function(e) {
			alert('Error: ' + e);
		}
	});

		   }
		   else
		   {
		   document.getElementById("wee").innerHTML='<input type="checkbox"  value="weekly" id="weekly" onclick="toggleAjax1()" /><input type="hidden" name="weekly" />';
		  document.getElementById("reference1").innerHTML='<input type="hidden" class="input_txtbx" id="reference" name="reference1">';
		   }
		                 	 
	
}
   function toggleAjax() {
		 
	   var frequency_maintenance_list =$('#frequency_maintenance_list').val();
	   
	   		if(frequency_maintenance_list == 'weekly')
		   {
			 weekly = $('#frequency_maintenance_list').val();
		
	$.ajax({
		type : "POST",
		url : "/QMS_App/ajax_getAttach1",
		data : "weekly="+weekly,
		success : function(response) {
		//	alert("response"+response);	
		
    	
    		//	alert("if loop 0");
    		//alert(response);
    			document.getElementById("reference1").innerHTML=response;
    		
    		
    		
    		
    		  
		},
		error : function(e) {
			//alert('Error: ' + e);
		}
	});

		   }
		   else if(frequency_maintenance_list == 'monthly')
		   {
			  monthly  = $('#frequency_maintenance_list').val();
		 
			$.ajax({
			type : "POST",
			url : "/QMS_App/ajax_getAttach2",
			data : "monthly="+monthly,
			success : function(response) {
		//	alert("response"+response);	
		
    	
    		//	alert("if loop 0");
    		//alert(response);
    		document.getElementById("reference1").innerHTML=response;
    		
    		
    		
    		
    		  
		},
		error : function(e) {
			//alert('Error: ' + e);
		}
	});

		   }
		   else if(frequency_maintenance_list == 'quarterly')
		   {
		  			 quarterly = $('#frequency_maintenance_list').val();
		
		$.ajax({
		type : "POST",
		url : "/QMS_App/ajax_getAttach3",
		data : "quarterly="+quarterly,
		success : function(response) {
		
    			document.getElementById("reference1").innerHTML=response;
    		},
		error : function(e) {
		//	alert('Error: ' + e);
		}
	});

		   }
		   else if(frequency_maintenance_list == 'semi-annually')
		   {
			 semiannually = $('#frequency_maintenance_list').val();
		 
		$.ajax({
		type : "POST",
		url : "/QMS_App/ajax_getAttach4",
		data : "semiannually="+semiannually,
		success : function(response) {
		
    			document.getElementById("reference1").innerHTML=response;
    		  
		},
		error : function(e) {
			//alert('Error: ' + e);
		}
	});

		   }
		   else if(frequency_maintenance_list == 'annually')
		   {
			 annually = $('#frequency_maintenance_list').val();
		 
	$.ajax({
		type : "POST",
		url : "/QMS_App/ajax_getAttach5",
		data : "annually="+annually,
		success : function(response) {
			document.getElementById("reference1").innerHTML=response;
    	},
		error : function(e) {
			//alert('Error: ' + e);
		}
	});

		   }
		   else
		   {
		   }
		                 	 
	
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
				//alert('Error: ' + e);
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

function validatename1(id){
	
    var textInput = document.getElementById(id).value;
    textInput = textInput.replace(/[ ]/g, "");
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

function AlphabetsName(e, t) {
    try {
        if (window.event) {
            var charCode = window.event.keyCode;
        }
        else if (e) {
            var charCode = e.which;
        }
        else { return true; }
        if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123)|| (charCode ==32))
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
	 
	var chars =  /^[A-Z0-9]+$/;
	var numbers =  /^[0-9]+$/;
	var letters =  /^[A-Za-z]+$/;
	var date = /^\d{4}-(0?[1-9]|1[012])-(0?[1-9]|[12][0-9]|3[01])$/;
	var dotnumber = /^[a-zA-Z0-9]|[a-zA-Z0-9][\w\.]+[a-zA-Z0-9]$/;
	var error="";
	var equipment_id = document.getElementById('equipment_id').value;
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
	/*  var weekly = document.getElementById('weekly').checked; */
	  
	
	  var completed_by = document.getElementById('completed_by').value;
	  var notes = document.getElementById('notes').value;
	  
	if(equipment_id == "")
		{
		document.getElementById("equipment_id1").innerHTML="Required field should not be empty";
		error="true";
		}
	else if(equipment_id.charAt(0) == " ")
		{
		document.getElementById("equipment_id1").innerHTML="Should not accept initial space";
		error="true";
		}
	else if(equipment_id.length < 4 || equipment_id.length > 15)
		{
		document.getElementById("equipment_id1").innerHTML="Required field should be length of 4 to 15";
		error="true";
		}
	else{
		document.getElementById("equipment_id1").innerHTML="";
		}
	
	if(equipment_name == "")
	{
	document.getElementById("equipment_name1").innerHTML="Required field should not be empty";
	error="true";
	}
	else if(equipment_name.charAt(0) == " ")
	{
	document.getElementById("equipment_name1").innerHTML="Should not accept initial space";
	error="true";
	}
	else if(equipment_name.length < 4 || equipment_name.length > 32)
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
	document.getElementById("equipment_model1").innerHTML="Should not accept initial space";
	error="true";
	}
	else if(equipment_model.length < 4 || equipment_model.length > 32)
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
	document.getElementById("serial_number1").innerHTML="Should not accept initial space";
	error="true";
	}
	else if(serial_number.length < 4 || serial_number.length > 32)
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
	 document.getElementById("datepicker11").innerHTML="Invalid date";
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
 	 else{
	 document.getElementById("frequency_maintenance1").innerHTML="Required field should not be empty";
	 error="true"; 
 	 }
		 
	 if(frequency_maintenance_list == "")
	 {
	 document.getElementById("frequencyofmaintenance1").innerHTML="Required field should not be empty";
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
	  else if(instructions.length < 4 || instructions.length > 400 )
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
	 document.getElementById("completed_by1").innerHTML="Required field should not be empty";
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
		document.getElementById("notes1").innerHTML="Should not accept initial space";
		error="true";
		}
		else if(notes.length < 4 || notes.length > 400 )
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
	 var equipment_id=document.getElementById("equipment_id").value;
	
	 $.ajax({
			type : "POST",
			url : "/QMS_App/ajax_existerror",
			data : "equipment_id="+ equipment_id,
			success : function(response) {
			//	alert("response"+response);	
			
	    	
	    		//	alert("if loop 0");
	    		
	    			document.getElementById("equipment_id1").innerHTML=response;
	    		if(response=='')
	    			{
	    			document.forms[0].method = "POST";
	    			document.forms[0].action = "add_maintenance";
	    			document.forms[0].submit();
	    			}
	    		
	    		
	    		
	    		  
			},
			error : function(e) {
				alert('Error: ' + e);
			}
		});
	 return false;
	 
	 
}

function ChangeCase(elem)
{
    elem.value = elem.value.toUpperCase();
}

</script> 
<script type="text/javascript">
function validationmain()
{
	 
	var chars =  /^[A-Z0-9]+$/;
	var numbers =  /^[0-9]+$/;
	var letters =  /^[A-Za-z]+$/;
	var date = /^\d{4}-(0?[1-9]|1[012])-(0?[1-9]|[12][0-9]|3[01])$/;
	var dotnumber = /^[a-zA-Z0-9]|[a-zA-Z0-9][\w\.]+[a-zA-Z0-9]$/;
	var error="";
	var equipment_id = document.getElementById('equipment_id').value;
	var equipment_name =  document.getElementById('equipment_name').value;
	var equipment_model = document.getElementById('equipment_model').value;
	var serial_number = document.getElementById('serial_number').value;
	var datepicker1 = document.getElementById('datepicker1').value;
	var equipment_status = document.getElementById('equipment_status').value;
	
	 var frequency_maintenance_weekly = document.getElementById('frequency_maintenance_weekly').checked;
	   var frequency_maintenance_monthly = document.getElementById('frequency_maintenance_monthly').checked;
	   var frequency_maintenance_quarterly = document.getElementById('frequency_maintenance_quarterly').checked;
	   var frequency_maintenance_semiannually = document.getElementById('frequency_maintenance_semiannually').checked;
	   var frequency_maintenance_annually = document.getElementById('frequency_maintenance_annually').checked;
	  
	if(equipment_id == "")
		{
		document.getElementById("equipment_id1").innerHTML="Required field should not be empty";
		error="true";
		}
	else if(equipment_id.charAt(0) == " ")
		{
		document.getElementById("equipment_id1").innerHTML="Should not accept initial space";
		error="true";
		}
	else if(equipment_id.length < 4 || equipment_id.length > 15)
		{
		document.getElementById("equipment_id1").innerHTML="Required field should be length of 4 to 15";
		error="true";
		}
	else{
		document.getElementById("equipment_id1").innerHTML="";
		}
	
	if(equipment_name == "")
	{
	document.getElementById("equipment_name1").innerHTML="Required field should not be empty";
	error="true";
	}
	else if(equipment_name.charAt(0) == " ")
	{
	document.getElementById("equipment_name1").innerHTML="Should not accept initial space";
	error="true";
	}
	else if(equipment_name.length < 4 || equipment_name.length > 32)
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
	document.getElementById("equipment_model1").innerHTML="Should not accept initial space";
	error="true";
	}
	else if(equipment_model.length < 4 || equipment_model.length > 32)
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
	document.getElementById("serial_number1").innerHTML="Should not accept initial space";
	error="true";
	}
	else if(serial_number.length < 4 || serial_number.length > 32)
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
	 document.getElementById("datepicker11").innerHTML="Invalid date";
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
 	 else{
	 document.getElementById("frequency_maintenance1").innerHTML="Required field should not be empty";
	 error="true"; 
 	 }
		 
	
		
	 if(error=="true")
		 {
		 return false;
		 } 
	 var equipment_id=document.getElementById("equipment_id").value;
	
	 $.ajax({
			type : "POST",
			url : "/QMS_App/ajax_existerror",
			data : "equipment_id="+ equipment_id,
			success : function(response) {
			//	alert("response"+response);	
			
	    	
	    		//	alert("if loop 0");
	    		
	    			document.getElementById("equipment_id1").innerHTML=response;
	    		if(response=='')
	    			{
	    			document.forms[0].method = "POST";
	    			document.forms[0].action = "add_maintenance";
	    			document.forms[0].submit();
	    			}
	    		
	    		
	    		
	    		  
			},
			error : function(e) {
				alert('Error: ' + e);
			}
		});
	 return false;
	 
	 
}
</script>
  <script>
            function toggle(value){
            	
            if(value!=null)
            	equipmentid.value=value;
            
            }
            </script>
<script>
	
	window.onload = function(){
		instructionAjax();
	}
		</script>   
		<br/><br/><br/><br/><br/><br/><br/>     
             <jsp:include page="footer.jsp"></jsp:include>
            <!--  <script type="text/javascript">
function toggle3(value){
     
       var e = document.getElementById('child_table');
      // var e1=document.getElementById('employee');
if(value==0)
       {
	e.style.display="none";
       }
else
       {
	e.style.display="block";
       }
       
}
</script> -->
            