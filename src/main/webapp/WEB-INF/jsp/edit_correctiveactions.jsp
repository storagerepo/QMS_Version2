<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" />

<script src="resources/js/jquery.min.js"></script>
 <script src="resources/js/jquery-ui.js"></script>
<jsp:include page="header.jsp"></jsp:include>

<form method="post" enctype="multipart/form-data"  action="updatecorrectiveAndPreventiveActions">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
       <td>
        <div>
  <ul class="horizmenu" style=" float:left;margin-left:190px; margin-middle:8px;">
						
						<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addcorrectiveAndPreventiveActions" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									Add Corrective And Preventive Actions
									
								</a>
							</li>
							
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="correctiveactions_list" class="<c:choose>
								<c:when test="${menu=='corrective'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									View Corrective And Preventive Actions
									
								</a>
							</li>
						
				         <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="capa_report" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									Reports
								</a>
							</li>
				            </ul>
				            
  </div>
       </td>
      </tr>
      <tr>
      
       <td valign="middle" align="left">
        
        
            <div class="headings altheading">
              <h2>Update Corrective And Preventive Actions Details</h2>
            </div>
            <div class="contentbox">
              <c:set value="${correctiveAndPreventiveActionsForm.correctiveAndPreventiveActions[0]}" var="correctiveAndPreventiveActions"> </c:set>
               <table cellpadding="0" cellspacing="0" border="0" width="100%" style="border:#993300  2px solid; padding:15px; margin-bottom:15px;">
             <!--  <div style="border:#993300  2px solid; padding:15px; margin-bottom:15px;">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
              --> <tr>
			<td align="left" valign="middle" width="50%" style="padding-right: 25px;">
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="30%">CAPA ID :</td>
                  <td valign="middle" align="left" class="input_txt" width="30%"><input type="text" name="capa_id" readonly="readonly" class="input_txtbx" value="<c:out value="${correctiveAndPreventiveActions.capa_id}"/>"/><br/><span style="color: red;"></span></td>
              	   <td valign="middle" align="left" class="input_txt"> NC ID :</td>
				  <td valign="middle" align="left" class="input_txt">
				   <select name="nc_id" id="nc_id" class="dropdown" onchange="doAjaxPost();">
               <option value="">--Select--</option>
               <c:forEach items="${nonConformanceForm.nonconformance}" var="nonconformance" varStatus="true">
               <%-- <option value="<c:out value="${nonconformance.id}"/>"><c:out value="${nonconformance.id}"/></option>
                --%><option value="${nonconformance.id}"<c:if test="${nonconformance.id== correctiveAndPreventiveActions.nc_id}"><c:out value="selected"/></c:if>>${nonconformance.id}</option>
               </c:forEach>
               </select>
               <!-- <select name="nc_id" class="input_txtbx" style="height:20px;">
				                  		<option value="1111">11111</option>
							</select>
							 --><span style="color: red;" id="iderror"></span><form:errors path="CorrectiveAndPreventiveActions.nc_id"></form:errors></td>			
              
                </tr>
                
                <tr class="row2">
				  <td valign="middle" align="left" class="input_txt" width="30%"> External ID :</td>
                  <td valign="middle" align="left" class="input_txt" width="30%">
                  		<input type="text" name="external_id" class="input_txtbx" id="inp_external_id"  onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value='<c:out value="${correctiveAndPreventiveActions.external_id}"></c:out>' onblur="ChangeCase(this);" onkeypress="return AlphabetsNumber(event,this);"/><br/><span style="color: red;" id="externalerror"></span><form:errors path="CorrectiveAndPreventiveActions.external_id"></form:errors></td>  
                  
                  <td valign="middle" align="left" class="input_txt" width="30%">Source of NC :</td>
                  <td valign="middle" align="left" class="input_txt" width="30%">
                  	<div id="source_of_nonconformance"> 
                  	<%-- <input type="text" name="source_of_nonconformance" id="source_of_nonconformance"  class="input_txtbx" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value='<c:out value="${correctiveAndPreventiveActions.source_of_nonconformance}"></c:out>' /><br/> --%> 
                  		
                </div>
                </td>
                </tr>
                  			
                <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="30%">Date Found :</td>
                  <td valign="middle" align="left" class="input_txt" width="30%">
                  <%-- <input type="text" name="date_found" class="input_txtbx" id="datepicker" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${correctiveAndPreventiveActions.date_found}" /><br/><span style="color: red;"><form:errors path="CorrectiveAndPreventiveActions.date_found"></form:errors></span></td> --%>
                  <select name="date_found" id="datepicker" class="dropdown">
                  <option value="">--Select--</option>
                  <c:forEach items="${nonConformanceForm.nonconformance}" var="nonconformance" varStatus="true">
                     <option value="${nonconformance.date_found}"<c:if test="${nonconformance.date_found == correctiveAndPreventiveActions.date_found}"><c:out value="selected"/></c:if>>${nonconformance.date_found}</option>
                  </c:forEach>
                  </select>
                  <br>
                  <span style="color: red;" id="datepickererr"><form:errors path="CorrectiveAndPreventiveActions.date_found"></form:errors></span>
                  </td>
                  

                  <td valign="middle" align="left" class="input_txt" width="30%"> Type of NC :</td>
                  <td valign="middle" align="left" class="input_txt" width="30%"><div id="type_of_nc">
                  <%-- <input type="text" name="type_of_nonconformance" class="input_txtbx" id="type_of_nc" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value='<c:out value="${correctiveAndPreventiveActions.type_of_nonconformance}"></c:out>' /><br/><span style="color: red;"><form:errors path="CorrectiveAndPreventiveActions.type_of_nonconformance"></form:errors></span>
                   --%></div>
                  </td>
                </tr>
                
			<tr class="row2">
				<td valign="middle" align="left" class="input_txt" width="30%">Temporary Action :</td>               
                <td valign="middle" align="left" class="input_txt" width="30%">
                <div id="temporary_action">
                <%-- <textarea class="input_txtbx1"  name="temporary_action"  style="width:55%; height: 70px;">${correctiveAndPreventiveActions.temporary_action}</textarea><span style="color: red;"><form:errors path="CorrectiveAndPreventiveActions.temporary_action"></form:errors></span>
                 --%></div>
                </td>
            	
            	<td valign="middle" align="left" class="input_txt" width="30%">Nature of NC :</td>      
				<td valign="middle" align="left" class="input_txt" width="30%"><div id="nature_of_nc">
				<textarea class="input_txtbx1"  id="nature_of_nc" name="nature_of_nc" style="width:100%; height: 70px;">${correctiveAndPreventiveActions.nature_of_nc}</textarea><span style="color: red;"><form:errors path="CorrectiveAndPreventiveActions.nature_of_nc"></form:errors></span>
				 </div>
				</td>
            </tr>
            <tr class="row2">
              <td valign="middle" align="left" class="input_txt"> CAPA Requestor :</td>
			  <td valign="middle" align="left" class="input_txt">
				           <select name="capa_requestor" class="dropdown"  id="capa_requestor">
						                  <option value="">--Select--</option>
						                  <option <c:if test="${correctiveAndPreventiveActions.capa_requestor eq 'name1'}"><c:out value="Selected"/></c:if> value="name1" >name1</option>
										  <option <c:if test="${correctiveAndPreventiveActions.capa_requestor eq 'name2'}"><c:out value="Selected"/></c:if> value="name1">name2</option>
										  <option  <c:if test="${correctiveAndPreventiveActions.capa_requestor eq 'name3'}"><c:out value="Selected"/></c:if> value="name3">name3</option>
				           </select><br> <span style="color: red;" id="capaerror"></span><form:errors path="CorrectiveAndPreventiveActions.capa_requestor"></form:errors></td>	
			  <td valign="middle" align="left" class="input_txt"> Use 5 Why's in system (Y/N)<span>&nbsp;(*Optional)</span> :</td>
		      <td><input type="checkbox" name="use_5_why_in_system" value="use_5_why_in_system" id="use_5_why_in_system" <c:if test="${correctiveAndPreventiveActions.use_5_why_in_system=='use_5_why_in_system'}"><c:out value="Checked"/></c:if>/></td>					
		<script>
		

if (document.getElementById("use_5_why_in_system").value.checked) {
document.getElementById("why").style.visibility = 'visible';


}
else  {
document.getElementById("why").style.visibility = 'hidden';


}

</script>
	</tr> 
				
            <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="30%"> Request Date :</td>
                  <td valign="middle" align="left" class="input_txt" width="30%"><input type="text" name="request_date" class="input_txtbx" id="datepicker2" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${correctiveAndPreventiveActions.request_date}" /><br><span style="color: red;" id="datepicker2err"></span><form:errors path="CorrectiveAndPreventiveActions.request_date"></form:errors></td>
                  
                  <td valign="middle" align="left" class="input_txt" id="why?" width="20" style="display:none;">Why's ?
				   	 &nbsp;<input type="checkbox" name="why1" value="why1" id="0"/></td>
				  <td valign="middle" align="left" class="input_txt" width="70% " id="5why">
					  <textarea class="input_txtbx"  name="why" id="why"  style="width:98%; height: 70px;" >${correctiveAndPreventiveActions.why}</textarea><br/><span style="color: red;" id="whyerr"></span><form:errors path="CorrectiveAndPreventiveActions.why"></form:errors></td>			
             </tr>	
             
            <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="30%"> CAPA Due Date :</td>
                  <td valign="middle" align="left" class="input_txt" width="30%"><input type="text" name="capa_due_date" class="input_txtbx" id="datepicker3" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${correctiveAndPreventiveActions.capa_due_date}" /><br><span style="color: red;" id="datepicker3err"></span><form:errors path="CorrectiveAndPreventiveActions.capa_due_date"></form:errors></td>
                 
              
                </tr>
            <tr class="row1">
              <td valign="middle" align="left" class="input_txt">Assigned Team Leader :</td>
						           <td valign="middle" align="left" class="input_txt">
				                  		<select name="assigned_team_leader" id="team_leader" class="dropdown">
						                  <option value="">--Select--</option>
						                       <option <c:if test="${correctiveAndPreventiveActions.assigned_team_leader eq 'name1'}"><c:out value="Selected"/></c:if> value="name1" >name1</option>
											<option <c:if test="${correctiveAndPreventiveActions.assigned_team_leader eq 'name2'}"><c:out value="Selected"/></c:if> value="name1">name2</option>
											<option  <c:if test="${correctiveAndPreventiveActions.assigned_team_leader eq 'name3'}"><c:out value="Selected"/></c:if> value="name3">name3</option>
				                 </select><br>
				                 <span style="color: red;" id="leadererror"></span><form:errors path="CorrectiveAndPreventiveActions.assigned_team_leader"></form:errors>
				                 
				                   	</td>	
                 </tr>
                  <tr class="row2">
                 <td valign="middle" align="left" class="input_txt" width="30%">Team Member (s) :</td>      

						         	 <td valign="middle" align="left" class="input_txt" width="30%"><textarea  class="input_txtbx" name="team_members"  id="team_member" style="width: 202px; height: 70px;" >${correctiveAndPreventiveActions.team_members}</textarea><br><span style="color: red;" id="membererror"></span><form:errors path="CorrectiveAndPreventiveActions.team_members"></form:errors></td>
                <td valign="middle" align="left" class="input_txt" width="30%">Root Cause Statement :</td>               
                  <td valign="middle" align="left" class="input_txt" width="30%"><textarea class="input_txtbx"  name="root_cause_statement"  id="root_cause_statement" style="width:100%; height: 70px;" >${correctiveAndPreventiveActions.root_cause_statement}</textarea><span style="color: red;" id="rooterror"><form:errors path="CorrectiveAndPreventiveActions.root_cause_statement"></form:errors></td>
               
              </tr>
                 <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="30%">Root-Cause Analysis File :</td>
                  
                  <td valign="middle" align="left" class="input_txt" width="30%"><input type="text" name="root_cause_analysis_file" class="input_txtbx" id="root_cause_analysis_file"  onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  value='<c:out value="${correctiveAndPreventiveActions.root_cause_analysis_file}"></c:out>' /><br/><span id="root1error" style="color: red;"></span><form:errors path="CorrectiveAndPreventiveActions.root_cause_analysis_file"></form:errors></td>
                         	  <td valign="middle" align="left" class="input_txt" width="32%">Upload External Analysis (Y/N)<span>(*Optional)</span> :</td>
				  <td valign="middle" align="left" class="input_txt" width="32%"> <input type="checkbox" class="externalfile" name="upload_external_analysis" value="upload_external_analysis" id="externalfile" <c:if test="${ correctiveAndPreventiveActions.upload_external_analysis =='upload_external_analysis'}"><c:out value="Checked=checked"/></c:if> />
				  <td>
				 
				  	 </tr>
				  	 
			 <tr class="row1" id="id_file" style="display:none;" >
			  
			 <td valign="middle" align="left" class="input_txt" width="30%"><input type="hidden"/></td>
			 <td valign="middle" align="left" class="input_txt" width="30%"><input type="hidden"/></td>
             <td valign="middle" align="left" class="input_txt" width="30%">Upload the File :</td>
             <td valign="middle" align="left" class="input_txt" width="30%"> <div   ><c:if test="${correctiveAndPreventiveActions.attachment_name ne 'null'}"> <c:out 

 value="${correctiveAndPreventiveActions.attachment_name}"  ></c:out></c:if></div><input name="attachments" id="attachments"   type="file"/><span style="color: red;" id="fileerror"></span></td>
                 
                   </tr>
						<!-- 
							</tr>
				
				 <td valign="middle" align="left" class="input_txt" width="30%" >Upload</td>
                  <td valign="middle" align="left" class="input_txt" width="30%">
                  
                  <input name="attachments"  id="id_file" type="file" /> 
                  </td>       	
          
           </tr>
           -->       
                 
                  </table>
                <br>
                <div style="border:#993300  2px solid; padding:15px; margin-bottom:15px;">
                 <table cellpadding="0" cellspacing="0" border="0" width="100%">
              <tr>
			<td align="left" valign="middle" width="50%" style="padding-right: 25px;">
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="20%">Action :</td>
                  <td valign="middle" align="left" class="input_txt" width="20%"><input type="text" name="action" id="action" class="input_txtbx"  value="<c:out value="${correctiveAndPreventiveActions.action}"/>"/><br/><span style="color: red;" id="actionerror"></span><form:errors path="CorrectiveAndPreventiveActions.action"></form:errors></td>
                <td valign="middle" align="left" class="input_txt" width="20%">Due Date :</td>
                  <td valign="middle" align="left" class="input_txt" width="20%"><input type="text" class="input_txtbx" id="datepicker6" name="due_date" value="<c:out value="${correctiveAndPreventiveActions.due_date}"/>"/><br/><span style="color: red;" id="datepicker6err"></span><form:errors path="CorrectiveAndPreventiveActions.due_date"></form:errors></td>
                <td valign="middle" align="left" class="input_txt" width="20%">Verified By :</td>
                  <td valign="middle" align="left" class="input_txt" width="20%"><input type="text" class="input_txtbx" name="verified_by" id="verified_by" onkeypress="return Alphabets(event,this);" value="<c:out value="${correctiveAndPreventiveActions.verified_by}"/>"/><br/><span style="color: red;" id="verifiedbyerror"></span><form:errors path="CorrectiveAndPreventiveActions.verified_by"></form:errors></td>
               </tr>
                    <tr class="row2">
                     <td valign="middle" align="left" class="input_txt" width="20%">Responsibity :</td>
                     <td valign="middle" align="left" class="input_txt"width="20%">
				                  		<select name="responsibility" class="dropdown" id="responsibility">
				                  		<option value="">--Select--</option>
<%-- 						        <!--         <option value="">--Select--</option>
						         -->          <c:forEach items="${hRandTrainingForm.hRandTrainings}" var="hrandtrainings" varStatus="true">
               <option value="<c:out value="${hrandtrainings.name}"/>"><c:out value="${hrandtrainings.name}"/></option>
               </c:forEach>
				                 </select>
				                 
				                 
 --%>				                 
				                 <c:forEach items="${hRandTrainingForm.hRandTrainings}" var="hrandtrainings" varStatus="status">
                  
        				       <option value="${hrandtrainings.name}"<c:if test="${hrandtrainings.name == correctiveAndPreventiveActions.responsibility}"><c:out value="selected"/></c:if>>${hrandtrainings.name}</option>
			                  </c:forEach></select><span style="color: red;" id="responsibilityerror"></span><form:errors path="CorrectiveAndPreventiveActions.responsibility"></form:errors>
				                   	</td>	
                     
                     <td valign="middle" align="left" class="input_txt" width="20%">Completion Date :</td>
                  <td valign="middle" align="left" class="input_txt" width="20%"><input type="text" id="datepicker4" class="input_txtbx" name="completion_date" value="<c:out value="${correctiveAndPreventiveActions.completion_date}"/>"/><br/><span style="color: red;" id="datepicker4err"></span><form:errors path="CorrectiveAndPreventiveActions.completion_date"></form:errors></td>
                <td valign="middle" align="left" class="input_txt" width="20%">Verification Date :</td>
                  <td valign="middle" align="left" class="input_txt" width="20%"><input type="text" id="datepicker5" class="input_txtbx" name="verification_date" value="<c:out value="${correctiveAndPreventiveActions.verification_date}"/>"/><br/><span style="color: red;" id="datepicker5err"></span><form:errors path="CorrectiveAndPreventiveActions.verification_date"></form:errors></td>
                 </tr>
                </table>
               </td>
               </tr>
               </table>
                </div>
                 
                 <br>
                 <table align="center" width="100%">
                <!--   <tr >
                  
                  <td valign="middle" align="center"></td>
				  <td valign="middle" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				  <input type="submit" value="Submit" class="submit_btn1" onclick="return validation();">
				  <td valign="middle" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Update" class="submit_btn1" onclick="return validation();">
				 </td>
                  </tr> -->
                    <tr class="row1">
                  <td valign="bottom" colspan="6"align="right">&nbsp;<input type="submit" value="Update" onclick="return validation();"class="submit_btn1"></td>
                 
                </tr>
                  </table>
                  </table>
                  </div>
                  
                  </td>
                  </tr></table></div>
                 
                  </form>
                  
                  
                  
<!-- <script>
  function doAjaxPost() {
	 alert("hi");
	document.getElementById('nc_id').style.display="block";
	 document.getElementById("source_of_nonconformance").style.display="inline";
	var filer_value = $('#nc_id').val();
	
	$.ajax({
		type : "POST",
		url : "/QMS_App/ajax_getnc",
		data : "nc_id=" + filer_value,
		success : function(response) {
			alert("response"+response);
		document.getElementById("source_of_nonconformance").value=response;
		/* document.getElementById("type_of_nc").value=response;
		document.getElementById("nature_of_nc").value=response;
			 */
			//$('#filter_value').hide();
			 
		var two_drop=response.split("<split>");
    	
		$('#source_of_nonconformance').html(two_drop[0]);
		$('#type_of_nc').html(two_drop[1]);
		$('#nature_of_nc').html(two_drop[2]);
		
		},
		error : function(e) {
			alert('Error: ' + e);
		}
	});
}
 
</script>     
   -->
   <script>
  
   function doAjaxPost() {
	 
	document.getElementById('nc_id').style.display="block";
	 document.getElementById("source_of_nonconformance").style.display="inline";
	var filer_value = $('#nc_id').val();
	
	$.ajax({
		type : "POST",
		url : "/QMS_App/ajax_getnc",
		data : "nc_id=" + filer_value,
		success : function(response) {
			
		var two_drop=response.split("<split>");
    	
		$('#source_of_nonconformance').html(two_drop[0]).value=response;
		$('#type_of_nc').html(two_drop[1]).value=response;
		$('#nature_of_nc').html(two_drop[2]).value=response;
		$('#temporary_action').html(two_drop[3]).value=response;
		
		},
		error : function(e) {
			alert('Error: ' + e);
		}
	});
}
 
</script>     
      
<script>
$('#externalfile').change(function() {
	
	 var e1=document.getElementById("id_file");
	   
	 if($(this).is(':checked')) {
		 e1.style.display="table-row";
		 document.getElementById("fileerror").style.display="none";
		 
			
     
     } else {
    	 e1.style.display="none";
 	 }
   
});

</script>
 <script>
$('#use_5_why_in_system').change(function() {
	 var e4=document.getElementById("5why");
	 var e5=document.getElementById("why?");
		  
	 if($(this).is(':checked')) {
		 e4.style.display="table-cell";
		 e5.style.display="table-cell";
     
     } else {
    	 e4.style.display="none";
    	 e5.style.display="none";
    	    	 
			 }
   
});

</script>
          
   <script>
 $(function() {
	 $( "#datepicker1" ).datepicker({dateFormat: 'yy-mm-dd'});
        });
 
</script>
<script>
 $(function() {
	 $( "#datepicker3" ).datepicker({dateFormat: 'yy-mm-dd'});
        });
 
</script>
<script>
 $(function() {
	 $( "#datepicker4" ).datepicker({dateFormat: 'yy-mm-dd'});
        });
 
</script>
<script>
 $(function() {
	 $( "#datepicker5" ).datepicker({dateFormat: 'yy-mm-dd'});
        });
 
</script>
<script>
 $(function() {
	 $( "#datepicker6" ).datepicker({dateFormat: 'yy-mm-dd'});
        });
 
</script>
   <script>
 $(function() {
           $( "#datepicker" ).datepicker({dateFormat: 'yy-mm-dd'});
         });
 
</script>
   <script>
 $(function() {
	 $( "#datepicker2" ).datepicker({dateFormat: 'yy-mm-dd'});
     
         });
 
</script>

<script>

$(function() {
	$("#inp_external_id").on("keypress", function(e) {
		if (e.which === 32 && !this.value.length)
	        e.preventDefault();
	});
	});	
$(function() {
	$("#root_cause_analysis_file").on("keypress", function(e) {
		if (e.which === 32 && !this.value.length)
	        e.preventDefault();
	});
	});	
$(function() {
	$("#action").on("keypress", function(e) {
		if (e.which === 32 && !this.value.length)
	        e.preventDefault();
	});
	});	
	
$(function() {
	$("#verified_by").on("keypress", function(e) {
		if (e.which === 32 && !this.value.length)
	        e.preventDefault();
	});
	});	
$(function() {
	$("#team_member").on("keypress", function(e) {
		if (e.which === 32 && !this.value.length)
	        e.preventDefault();
	});
	});	

$(function() {
	$("#root_cause_statement").on("keypress", function(e) {
		if (e.which === 32 && !this.value.length)
	        e.preventDefault();
	});
	});
$(function() {
	$("#why").on("keypress", function(e) {
		if (e.which === 32 && !this.value.length)
	        e.preventDefault();
	});
	});		
</script>


<script>
function validatename(id)
{
	var textInput = document.getElementById(id).value;
	textInput = textInput.replace(/[^A-Za-z ]/g, "");
	document.getElementById(id).value = textInput;
}
function validatealphanumeric(){

	var textInput = document.getElementById("inp_external_id").value;
    textInput = textInput.replace(/[^a-zA-Z0-9]/g, "");
    document.getElementById("inp_external_id").value = textInput;
}
function validatealphanumeric1(){

	var textInput = document.getElementById("team_member").value;
    textInput = textInput.replace(/[^a-zA-Z0-9]/g, "");
    document.getElementById("team_member").value = textInput;
}
function validatealphanumeric2(){

	var textInput = document.getElementById("why").value;
    textInput = textInput.replace(/[^a-zA-Z0-9]/g, "");
    document.getElementById("why").value = textInput;
}
function validatealphanumeric3(){

	var textInput = document.getElementById("root_cause_statement").value;
    textInput = textInput.replace(/[^a-zA-Z0-9]/g, "");
    document.getElementById("root_cause_statement").value = textInput;
}
</script>
<script>
function ChangeCase(elem)
{
    elem.value = elem.value.toUpperCase();
}


</script>
<script>
function validation()
{
	
	var error="";
	var date = /^\d{4}-(0?[1-9]|1[012])-(0?[1-9]|[12][0-9]|3[01])$/;
	var datepicker = document.getElementById('datepicker').value;
	var datepicker2 = document.getElementById('datepicker2').value;
	var datepicker3 = document.getElementById('datepicker3').value;
	var datepicker4 = document.getElementById('datepicker4').value;
	var datepicker5 = document.getElementById('datepicker5').value;
	var datepicker6 = document.getElementById('datepicker6').value;
	 var responsibility = document.getElementById('responsibility').value;
	var nc_id = document.getElementById('nc_id').value;
	var external = document.getElementById('inp_external_id').value;
	var capa = document.getElementById('capa_requestor').value;
	var team_leader = document.getElementById('team_leader').value;
	var team_member = document.getElementById('team_member').value;
	var root_cause_statement = document.getElementById('root_cause_statement').value;
	var root_cause_analysis_file = document.getElementById('root_cause_analysis_file').value;
	var action = document.getElementById('action').value;
	var verified_by = document.getElementById('verified_by').value;
	 var usewhy = document.getElementById('use_5_why_in_system').checked;
	var why = document.getElementById('why').value;
	var upload = document.getElementById('externalfile').checked;
	var file = document.getElementById('id_file').value;
	
 	if(usewhy!="")
		{
			if(why=="")
				{
	
		document.getElementById('whyerr').innerHTML="Required field should not be empty";
		error="true";
		}
		
	else if((why.length < 4) || (why.length > 400))
{

document.getElementById('whyerr').innerHTML="Required should be of length 4 to 400";	
error="true";
}
	else if((why.charAt(0)== " "))
	{
	
	document.getElementById("whyerr").innerHTML="Require field should not accept initial space";	
	error="true";
	}
	else
	{
	document.getElementById('whyerr').innerHTML="";
	}
			
			}
	else
		{
		document.getElementById('whyerr').innerHTML="";
		}
 	
 	if(!upload=="" )
 		{
 		if(file="")
 			{
 		
 		document.getElementById('fileerror').innerHTML="Please Upload a File";
 		error="true";
 		}
 		else
 		{
 		document.getElementById('fileerror').innerHTML="";
 		}	
 		}
 	else
 		{
 		document.getElementById('fileerror').innerHTML="";
 		}

	if(datepicker == "")
	 {
	 document.getElementById("datepickererr").innerHTML="Required field should not be empty";
	 error="true";
	 
	 }
	 
	 else
	 {
	 document.getElementById("datepickererr").innerHTML="";
	 }

	if(datepicker2 == "")
	 {
		
	 document.getElementById("datepicker2err").innerHTML="Required field should not be empty";
	 error="true";
	 
	 }
	 else if(datepicker2.match(date))
	 {
		 
	 document.getElementById("datepicker2err").innerHTML="";
	 }
	 else
	 {
	 document.getElementById("datepicker2err").innerHTML="Invalid Date";
	 error="true";
	 }

	if(datepicker3 == "")
	 {
	 document.getElementById("datepicker3err").innerHTML="Required field should not be empty";
	 error="true";
	 
	 }
	 else if(datepicker3.match(date))
	 {
	 document.getElementById("datepicker3err").innerHTML="";
	 }
	 else
	 {
	 document.getElementById("datepicker3err").innerHTML="Invalid Date";
	 error="true";
	 }
	if(datepicker4 == "")
	 {
	 document.getElementById("datepicker4err").innerHTML="Required field should not be empty";
	 error="true";
	 
	 }
	 else if(datepicker4.match(date))
	 {
	 document.getElementById("datepicker4err").innerHTML="";
	 }
	 else
	 {
	 document.getElementById("datepicker4err").innerHTML="Invalid Date";
	 error="true";
	 }

	if(datepicker5 == "")
	 {
	 document.getElementById("datepicker5err").innerHTML="Required field should not be empty";
	 error="true";
	 
	 }
	 else if(datepicker5.match(date))
	 {
	 document.getElementById("datepicker5err").innerHTML="";
	 }
	 else
	 {
	 document.getElementById("datepicker5err").innerHTML="Invalid Date";
	 error="true";
	 }

	if(datepicker6 == "")
	 {
	 document.getElementById("datepicker6err").innerHTML="Required field should not be empty";
	 error="true";
	 
	 }
	 else if(datepicker6.match(date))
	 {
	 document.getElementById("datepicker6err").innerHTML="";
	 }
	 else
	 {
	 document.getElementById("datepicker6err").innerHTML="Invalid Date";
	 error="true";
	 }

 	if(nc_id=="")
	{
 		
		
		document.getElementById("iderror").innerHTML="Required field should not be empty";	
		error="true";
		
	}
	else{
		
		document.getElementById('iderror').innerHTML="";
	}
	if(capa=="")
	{
		
		document.getElementById("capaerror").innerHTML="Required field should not be empty";	
		error="true";
		
	}
	else{
		document.getElementById('capaerror').innerHTML="";
	}
	if(external=="")
	{
		
		document.getElementById("externalerror").innerHTML="Required field should not be empty";	
		error="true";
		
	}
	else if((external.length < 4) || (external.length > 32))
	{
	
	document.getElementById('externalerror').innerHTML="Required field should be of length 4 to 32";	
	error="true";
	}
	else{
		document.getElementById('externalerror').innerHTML="";
	}
		if(team_leader=="")
	{
	
		document.getElementById("leadererror").innerHTML="Required field should not be empty";	
		error="true";
		
	}
	else if((team_leader.length < 4) || (team_leader.length > 45))
		{
		
		document.getElementById("leadererror").innerHTML="Required field should be of length 4 to 32";	
		error="true";
		}
	else{
		document.getElementById('leadererror').innerHTML="";
	}
		if(team_member=="")
		{
			document.getElementById("membererror").innerHTML="Required field should not be empty";	
			error="true";
			
		}
		else if((team_member.length < 4) || (team_member.length > 400))
			{
			
			document.getElementById("membererror").innerHTML="Required field should be of length 4 to 400";	
			error="true";
			}
		else if((team_member.charAt(0)== " "))
		{
		
		document.getElementById("membererror").innerHTML="Require field should not accept initial space";	
		error="true";
		}
		else{
			document.getElementById('membererror').innerHTML="";
		}
		
	if(root_cause_statement=="")
	{
		document.getElementById("rooterror").innerHTML="Required field should not be empty";	
		error="true";
		
	}
	else if((root_cause_statement.length < 4) || (root_cause_statement.length > 400))
		{
		
		document.getElementById("rooterror").innerHTML="Required field should be of length 4 to 400";	
		error="true";
		}
	else if((root_cause_statement.charAt(0)== " "))
	{
	
	document.getElementById("rooterror").innerHTML="Require field should not accept initial space";	
	error="true";
	}
	else{
		document.getElementById('rooterror').innerHTML="";
	}
	if(root_cause_analysis_file=="")
	{
		document.getElementById("root1error").innerHTML="Required field should not be empty";	
		error="true";
		
	}
	else if((root_cause_analysis_file.length < 4) || (root_cause_analysis_file.length > 45))
		{
		
		document.getElementById("root1error").innerHTML="Required field should be of length 4 to 32";	
		error="true";
		}
	else if((root_cause_analysis_file.charAt(0)== " "))
	{
	
	document.getElementById("root1error").innerHTML="Require field should not accept initial space";	
	error="true";
	}
	else{
		document.getElementById('root1error').innerHTML="";
	}
	if(action=="")
	{
		document.getElementById("actionerror").innerHTML="Required field should not be empty";	
		error="true";
		
	}
	else if((action.length < 4) || (action.length > 45))
		{
		document.getElementById("actionerror").innerHTML="Required field should be of length 4 to 32";	
		error="true";
		}
	else if((action.charAt(0)== " "))
	{
	
	document.getElementById("actionerror").innerHTML="Require field should not accept initial space";	
	error="true";
	}
	else{
		document.getElementById("actionerror").innerHTML="";
	}
	   if(verified_by=="")
	{
		document.getElementById("verifiedbyerror").innerHTML="Required field should not be empty";	
		error="true";
		
	}
	else if((verified_by.length < 4) || (verified_by.length > 45))
		{
		
		document.getElementById("verifiedbyerror").innerHTML="Required field should be of length 4 to 32";	
		error="true";
		}
	else if((verified_by.charAt(0)== " "))
	{
	
	document.getElementById("verifiedbyerror").innerHTML="Require field should not accept initial space";	
	error="true";
	}     
	else{
		document.getElementById('verifiedbyerror').innerHTML="";
	} 
	 if(responsibility=="")
	{
		document.getElementById("responsibilityerror").innerHTML="Required field should not be empty";	
		error="true";
		
	}
	else{
		document.getElementById('responsibilityerror').innerHTML="";
 	}
	
 
	  if(error == "true")
		{
		return false;
		}
}
	
</script>
<script type="text/javascript">
function externalchecked()
{
 var externalfile = document.getElementById('externalfile').checked;
 var e1=document.getElementById("id_file");
 if(externalfile)
	{
	 
	 e1.style.display="table-row"; 
	}
 else
	 {
	 e1.style.display="none";
	 }

}
</script>
<script>
function use5whychecked()
{
	
	var use_5_why_in_system = document.getElementById('use_5_why_in_system').checked; 
	var e4=document.getElementById('5why');
	var e5=document.getElementById('why?');
	
	 if(use_5_why_in_system)
		{ 
		 e4.style.display="table-cell";
			e5.style.display="table-cell";
	     
 		}
	 else 
	 {
	 e4.style.display="none";
	 e5.style.display="none";
	 }
}
</script>
<script>
window.onload = function() {
	doAjaxPost();
	externalchecked();
	use5whychecked();
};
</script>
<script>
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

	  	  
	  </script>
 <script>
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

	  
	  
	  
	  
	
	
	  
	  </script>
<jsp:include page="footer.jsp"></jsp:include>
