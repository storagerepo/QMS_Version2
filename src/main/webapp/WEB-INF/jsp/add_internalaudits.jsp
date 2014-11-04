<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" />

<script src="resources/js/jquery.min.js"></script>
 <script src="resources/js/jquery-ui.js"></script>
<jsp:include page="header.jsp"></jsp:include>
<script src="resources/js/jquery-1.7.2.min.js"></script>
<script src="resources/js/jquery-ui.js"></script>
<script src="resources/js/modal.js"></script>

<form method="post" action="add_internalaudits">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
       <td>
        <div>
  <ul class="horizmenu">
						<c:if test="${role==2}">
						<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addinternalaudits" class="<c:choose>
								<c:when test="${menu=='audits'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
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
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Reports</span>
									
								</a>
				            </ul>
							</li>
				            
  </div>
       </td>
      </tr>
      <tr>
        <td valign="top" align="left">
        
        
            <div class="headings altheading">
              <h2>Add Internal Audits Details</h2>
            </div>
            <div class="contentbox">
              <div style="border:#993300  2px solid; padding:15px; margin-bottom:15px;">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
              <tr>
			<td align="left" valign="top" width="50%">
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr class="row2">
	                  <td valign="middle" align="left" class="input_txt" width="30%">Audit ID :</td>
                  <td valign="top" align="left" class="input_txt" width="30%"><input type="text" name="id" readonly="readonly" id="auditid" class="input_txtbx"  onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"  value="<c:out value="${id}" />"/ ><br/>
                  <span id="auditiderror" style="color:red"class="err"></span></td>
                </tr>
                <tr class="row1">
						         	<td valign="top" align="left" class="input_txt"> Process :</td>
						          <td valign="top" align="left">
				                  		
				        	 <select name="process" id="id_inpprocess" onchange="doAjaxPost_for_process();" class="input_txtbx" >
               				<option value="">--Select--</option>
               				<c:forEach items="${processForm.processes}" var="processes" varStatus="true">
               				<option value="<c:out value="${processes.process_name}"/>"><c:out value="${processes.process_name}"/></option>
               				</c:forEach>
               				</select>
						           		<br/>
						           		<span id="inprocesserror" style="color:red"></span>
						           		<span class="err"><form:errors path="InternalAudits.process"></form:errors></span>
				                   	</td>	
						         </tr> 
			<tr class="row2">
               <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="30%"> Auditee name :</td>
                  <td valign="top" align="left" class="input_txt" width="30%">
                 <select name="auditee_name" id="auditeename" class="input_txtbx">
               <option value="">--Select--</option>
               <c:forEach items="${processForm.processes}" var="processes" varStatus="true">
               <option value="<c:out value="${processes.process_owner}"/>"><c:out value="${processes.process_owner}"/></option>
               </c:forEach>
               </select>
               <br><span id="auditeenameerror" style="color:red"></span>
               </td>         		
               </tr>
                  

								
                <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="30%">Audit start date :</td>
                  
                  <td valign="top" align="left" class="input_txt" width="30%"><input type="text" name="audit_start_date" class="input_txtbx" id="datepicker1" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"  onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value='<c:out value="${internalaudits.audit_start_date}"></c:out>' /><br/>
                  <span id="datepicker11" style="color:red"></span>
                  <span class="err"><form:errors path="InternalAudits.audit_start_date"></form:errors></span></td>
               
   
                </tr>
                 <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="30%">Audit due date :</td>
                  <td valign="top" align="left" class="input_txt" width="30%"><input type="text" name="audit_due_date" class="input_txtbx" id="datepicker"  onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"  onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${internalaudits.audit_due_date}" /><br/>
                   <span id="datepicker00" style="color:red"></span>
                  <span class="err"><form:errors path="InternalAudits.audit_due_date"></form:errors></span></td>
                </tr>
			<tr class="row1">
							         	<td valign="middle" align="left" class="input_txt"> Auditor :</td>
							           <td valign="top" align="left" class="input_txt">
					                  		<select name="auditor"id="auditor" class="input_txtbx">
							                <option value="">--Select--</option>
						                     <option <c:if test="${internalaudits.auditor eq 'name1'}"><c:out value="Selected"/></c:if> value="name1" >Name1</option>
											<option <c:if test="${internalaudits.auditor eq 'name2'}"><c:out value="Selected"/></c:if> value="name2">Name2</option>
											<option  <c:if test="${internalaudits.auditor eq 'name3'}"><c:out value="Selected"/></c:if> value="name3">Name3</option>
				                   	</select>
				                   	<br/>
				                   	<span id="auditorerror" style="color:red"></span>
				                   	<span class="err"><form:errors path="InternalAudits.auditor"></form:errors></span>
					                   	</td>	
							         </tr> 
						         </table>
						         </td>
						         <td align="left" valign="top">
 <table cellpadding="0" cellspacing="0" border="0" width="100%">
								
                      <tr class="row2">
                  <td valign="top" align="left" class="input_txt" width="30%">Auditor notes :</td>
                                
                  <td valign="top" align="left" class="input_txt" width="30%"><textarea class="input_txtbx"  name="auditor_notes" id="auditor_notes" style="height: 70px;">${internalaudits.auditor_notes}</textarea>
                 <br> <span id="auditornoteserror" style="color:red"></span>
                  <span class="err"><form:errors path="InternalAudits.auditor_notes"></form:errors></span></td>
                </tr>
                 <tr class="row1">
						         	<td valign="middle" align="left" class="input_txt">Finding :</td>
						           <td valign="top" align="left" class="input_txt">
				                  		<select name="finding" id="finding"class="input_txtbx">
						                  <option value="">--Select--</option>
						                       <option <c:if test="${internalaudits.finding eq 'ok'}"><c:out value="Selected"/></c:if> value="ok" >Ok</option>
											<option <c:if test="${internalaudits.finding eq 'area of improvement'}"><c:out value="Selected"/></c:if> value="area of improvement">Area Of Improvement </option>
											<option  <c:if test="${internalaudits.finding eq 'nonconformance'}"><c:out value="Selected"/></c:if> value="nonconformance">NonConformance</option>
				                 </select>
				                 <br/>
				                 <span id="findingerror"style="color:red"></span>
				                 <span class="err"><form:errors path="InternalAudits.finding"></form:errors></span>
				                 
				                   	</td>	
						         </tr> 
				
                <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="30%">Completion date :</td>
                  <td valign="top" align="left" class="input_txt" width="30%"><input type="text" name="completion_date" class="input_txtbx" id="datepicker2" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"  onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${internalaudits.completion_date}" />
                  <br> <span id="datepicker22" style="color:red"></span>
                  <span class="err"><form:errors path="InternalAudits.completion_date"></form:errors></span></td>
                </tr>
                <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="30%">Auditor's initials :</td>
                  <td valign="top" align="left" class="input_txt" width="30%"><input type="text" name="auditors_initials" class="input_txtbx" id="inp_auditors_initials" onmouseover="showTooltip('tooltip_id','inp_id3');" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"  onmouseout="hideTooltip('tooltip_id');" value="${internalaudits.auditors_initials}" onkeypress="return onlyAlphabets(event,this);"/>
                  <br><span id="auditorsinitialserror" style="color:red"></span>
                  <span class="err"><form:errors path="InternalAudits.auditors_initials"></form:errors></span></td>
                </tr>
               
                 
                  </table>
                
                  <table align="center" width="100%">
                 <!--  <tr >
                  
                  </br>
				  <td><input type="submit"  value="Submit" onclick="return validate();" class="submit_btn1">
				 </td>
                  </tr> -->
                    <tr class="row1">
                  <td valign="bottom" colspan="2"align="right">&nbsp;<input type="submit" value="Submit" onclick="return validate();"class="submit_btn1"></td>
                  <td valign="top" align="left"></td>
                </tr>
                  </table>
                  </table>
                  </div>
                  </div>
                  </td>
                  </tr></table></div>
                 
                  </form>
   <script>
   
   $(function() {
		$("#auditor_notes").on("keypress", function(e) {
		
		if (e.which === 32 && !this.value.length)
	        e.preventDefault();
	});
	});
   </script>               
<script type="text/javascript">
function validatename(id){
	
    var textInput = document.getElementById(id).value;
    textInput = textInput.replace(/[^A-Za-z. ]/g, "");
    document.getElementById(id).value = textInput;
}   
function validatename3(id){
	
    var textInput = document.getElementById(id).value;
    textInput = textInput.replace(/[^A-Z0-9 ]/g, "");
    document.getElementById(id).value = textInput;
}  
function validatename1(id){
	
    var textInput = document.getElementById(id).value;
    textInput = textInput.replace(/[ ]/g, "");
    document.getElementById(id).value = textInput;
}  
</script>
<script type="text/javascript">

function validate()
{
	var error="";
	var date = /^\d{4}-(0?[1-9]|1[012])-(0?[1-9]|[12][0-9]|3[01])$/;
	var auditornotes = document.getElementById('auditor_notes').value;
	var id_inpprocess =  document.getElementById('id_inpprocess').value;
	var auditeename = document.getElementById('auditeename').value;
	var datepicker1 = document.getElementById('datepicker1').value;
	var datepicker = document.getElementById('datepicker').value;
	var datepicker2 = document.getElementById('datepicker2').value;
	var finding =  document.getElementById('finding').value;
	var auditor = document.getElementById('auditor').value;
	var auditorsinitials = document.getElementById('inp_auditors_initials').value;
	
	
	if(auditornotes == "")
	{
	 document.getElementById("auditornoteserror").innerHTML="Required field should not be empty";
		error="true";
	}
	else if(auditornotes.charAt(0) == " ")
		{
		 document.getElementById("auditornoteserror").innerHTML="Should not accept initial space";
			error="true";
		}
else if((auditornotes.length<4)||(auditornotes.length>400))
	{
	
	 document.getElementById("auditornoteserror").innerHTML="Required field should be length of 4 to 400";
		error="true";
	}
else{
	 document.getElementById("auditornoteserror").innerHTML="";
}
	
	if(id_inpprocess =="")
		{
		 document.getElementById("inprocesserror").innerHTML="Required field should not be empty";
			error="true";
		}
	else{
		 document.getElementById("inprocesserror").innerHTML="";
	}
	
	
	if(auditeename =="")
	{
	 document.getElementById("auditeenameerror").innerHTML="Required field should not be empty";
		error="true";
	}
else{
	 document.getElementById("auditeenameerror").innerHTML="";
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
	 
	 
	 if(datepicker == "")
	 {
	 document.getElementById("datepicker00").innerHTML="Required field should not be empty";
	 error="true";
	 
	 }
	 else if(datepicker.match(date))
	 {
	 document.getElementById("datepicker00").innerHTML="";
	 }
	 else
	 {
	 document.getElementById("datepicker00").innerHTML="Invalid date";
	 error="true";
	 }
	 
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
	 if(finding =="")
		 {
		 document.getElementById("findingerror").innerHTML="Required field should not be empty";
		 error="true";
		 }
	 else{
		 document.getElementById("findingerror").innerHTML="";
	 }
	 
	 if(auditor =="")
	 {
	 document.getElementById("auditorerror").innerHTML="Required field should not be empty";
	 error="true";
	 }
 else{
	 document.getElementById("auditorerror").innerHTML="";
 }
	 
	 if(auditorsinitials == "")
		{
		 
		 document.getElementById("auditorsinitialserror").innerHTML="Required field should not be empty";
			error="true";
		}
	 else if(auditorsinitials.charAt(0) == " ")
		{
		 
		 document.getElementById("auditorsinitialserror").innerHTML="Should not accept initial space";
			error="true";
		}
	else if((auditorsinitials.length<=0)||(auditorsinitials.length>10))
		{
		
		 document.getElementById("auditorsinitialserror").innerHTML="Required field should be length of 1 to 10";
			error="true";
		}
	else{
		
		 document.getElementById("auditorsinitialserror").innerHTML="";
	}
	
	if(error == "true")
		{
		return false;
		}
	
	}


</script>
 <script>
 function doAjaxPost_for_process() {

		var proceee_name = $('#id_inpprocess').val();
		/*   var education = $('#education').val();	 */		
		$.ajax({
			type : "POST",
			url : "/QMS_App/ajax_getprocess",
			data : "process=" + proceee_name,
			success : function(response) {
				
				$('#process_owner_id').html(response);
			
			},
			error : function(e) {
				alert('Error: ' + e);
			}
		});
	}
 </script>                 
                  
                      
   <script>
 $(function() {
	 $( "#datepicker1" ).datepicker({dateFormat: 'yy-mm-dd'});
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
 
    function onlyAlphabets(e, t) {
        try {
            if (window.event) {
                var charCode = window.event.keyCode;
            }
            else if (e) {
                var charCode = e.which;
            }
            else { return true; }
            if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123)|| (charCode==32))
                return true;
            else
                return false;
        }
        catch (err) {
            alert(err.Description);
        }
    }
    
    function onlyAlphabetsnumeric(e, t) {
        try {
            if (window.event) {
                var charCode = window.event.keyCode;
            }
            else if (e) {
                var charCode = e.which;
            }
            else { return true; }
            if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123)|| (charCode==32) || (charCode > 47 && charCode < 58))
                return true;
            else
                return false;
        }
        catch (err) {
            alert(err.Description);
        }
    }
    
    </script>

 <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
      
      <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
      <jsp:include page="footer.jsp"></jsp:include>
