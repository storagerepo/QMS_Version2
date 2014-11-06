   <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="header.jsp"></jsp:include>
	<script src="/QMS_App/resources/js/jquery.js"></script>
	<link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" />
<script src="resources/js/jquery.min.js"></script>
 <script src="resources/js/jquery-ui.js"></script>
 <form method="post" enctype="multipart/form-data" action="updateform" id="newformid">
 
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
     <tr>
        <td>
        <div>
  <ul class="horizmenu" style=" float:left;margin-left:190px; margin-top:8px;">
						  <li  style=" float:left;margin-right:10px;text-transform:uppercase;">
								<a href="addform" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									Add Form
									
								</a>
							</li>
							 <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
                <a href="view_formdetails" class="<c:choose>
                <c:when test="${menu=='document'}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
                  <span>View Revisions</span>
                </a>
              </li>
				            <li  style=" float:left;margin-right:10px;text-transform:uppercase;">
								<a href="view_form" class="<c:choose>
								<c:when test="${menu=='document'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactiveactive</c:otherwise></c:choose>">
									View Form
									
								</a>
							</li>
				            <li  style=" float:left;margin-right:10px;text-transform:uppercase;">
								<a href="form_report" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									Reports
									
								</a>
							</li>
							 
				            </ul>
  </div>
        </td>
      </tr>
      <tr>
        <td valign="top" align="left">
            <div class="headings altheading">
              <h2>&nbsp;&nbsp;Update Forms</h2>
            </div>
            <div class="contentbox">
         <!--    <h1 style="color:#7A3A3A;font-size:20px;">Edit Form Details</h1> -->
    <c:set value="${formForm.form[0]}" var="form"/>        
	<table cellpadding="0" cellspacing="0" border="0" width="100%" style="border:#993300  2px solid; padding:15px; margin-bottom:15px;">
	
	          <tr class="row2">
                            <td valign="top" align="left" class="input_txt" width="30%">Form/Rec ID :</td>
	
		<td valign="top" align="left" class="input_txt" width="40%">
			<a id="formid">
			<input type="hidden" id="formid" onmouseover="showTooltip('tooltip_id','inp_id3');" 
					onmouseout="hideTooltip('tooltip_id');" name="form_or_rec_id" />${form.form_or_rec_id}</a>
		       <input type="hidden" name="form_or_rec_id" id="generated_id" value=""/> 
               <select disabled name="document_type_id" id="document_type_id" class="input_txtbx"  style="width:115px;display:none;">
      
			                <c:forEach items="${formFormPrefix.formPrefixs}" var="formprefix" varStatus="status">
        				       <option value="${formprefix.form_prefix}">${formprefix.form_prefix}</option>
			                  </c:forEach>
               </select>              
                  <input type="text" readonly="readonly"  value="" class="input_txtbx" id="form_or_rec_id"  style="height:22px;width:79px;display:none;" onblur="change_to_label();" maxlength="32"onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}" onkeypress="return onlynumeric(event,this);"/>
               <span id="changeafter"></span>  
               <span id="change" style="display: none;" ></span><a href="#" style="text-decoration: none;" onclick="show_edit()">&nbsp;&nbsp;<!-- Change --></a>
               <br><c:if test="${success=='exist'}"><span style="color:red">Form ID already Exist</span></c:if>   
             </td>
               
            <!--     <label id="changeafter" style="display:none;" ></label> 
                
                  <input type="text" value="" id="form_or_rec_id"  style="display:none;height:22px;background-color:lightgrey;width:50px;border:none;"  onblur="change_to_label()" onInput="return validatename3(id);"/><span id="quality3err" style="color:red;"></span>
                <input type="hidden" name=form_or_rec_id id="generated_id"  value=""/> 
               <label id="change" ><a href="#" style="text-decoration: none;" onclick="show_edit()">&nbsp;&nbsp;Change</a>  </label>
            <label id="changeafter" style="color:red;"></label>
            <span id="formiderror" style="color:red"></span>
            <span style="color:red;"><form:errors path="Form.form_or_rec_id"></form:errors></span>
            
             --> 
             
                            
             
             <c:choose>
                <c:when test="${form.media_type=='hardcopy'}">
               <td valign="top" id="id_location_lbl" align="left" class="input_txt" width="30%" width="20%"><label id="location_label" >Location :</label><br><label id="file_upload_label" style="display:none;">Upload File :</label></td>
               <td valign="top" align="left" id="id_location_txt" class="input_txt" width="30%" width="25%">
               <select id="location_text" name="location" class="input_txtbx" style="width:200px;" disabled="disabled">
              <option value="">--Select--</option>
                <c:forEach items="${formLocationForm.formLocations}" var="formlocation" varStatus="status">
                  
        				       <option value="${formlocation.form_location}"<c:if test="${formlocation.form_location == form.location}"><c:out value="selected"/></c:if>>${formlocation.form_location}</option>
			                  </c:forEach>
			                   </select><br>
			                   <span id="hard" style="color:red"></span>
              <input name="attachments" style="display:none;" id="id_file" type="file" disabled="disabled"/> <br/> 
              <span id="attach" style="color:red"></span>
              <span style="color:red;"><form:errors path="form.location"></form:errors></span>
               </td>
              </c:when>
               </c:choose>
               <c:choose>
                <c:when test="${form.media_type=='electronic'}">
               <td valign="top" id="id_location_lbl" align="left" class="input_txt" width="30%" width="20%"><label id="location_label" style="display:none"> Location:</label><br><label id="file_upload_label">Upload File:</label></td>
               <td valign="top" align="left" id="id_location_txt" class="input_txt" width="30%" width="25%">
               <select id="location_text" name="location" class="input_txtbx" style="display:none;width:200px;" disabled="disabled">
              
              <option value="">--Select--</option>
                  <c:forEach items="${formLocationForm.formLocations}" var="formlocation" varStatus="status">
                  
        				       <option value="${formlocation.form_location}"<c:if test="${formlocation.form_location == form.location}"><c:out value="selected"/></c:if>>${formlocation.form_location}</option>
			                  </c:forEach>
               </select><br>
              
               <label id="label1" >
              <input name="filename" type="hidden" id="file_name"/>${form.attachment_name}
               <input name="attachments" id="id_file" type="file" style="display:none;" value="${form.attachment_name }"/><span style="color:red;"><form:errors path="Form.attachment_name"></form:errors></span>
               
              <label id="change_label" ><a href="#" style="color:red;" onclick="change_file()">Change</a></label></label>
              <span style="display:none;"><form:errors path="form.location"></form:errors></span>
               </td>
              </c:when>
             
              <c:when test="${form.media_type=='both'}">
              <td valign="top" id="id_location_lbl" align="left" class="input_txt" width="30%" width="20%"><label id="location_label"> Location:</label><br><br><label id="file_upload_label"><span class="err">*</span> Upload File:</label></td>
               <td valign="top" align="left" id="id_location_txt" class="input_txt" width="30%" width="25%">
               <select id="location_text" name="location" class="input_txtbx" disabled="disabled">
              <option value="">--Select--</option>
                <c:forEach items="${formLocationForm.formLocations}" var="formlocation" varStatus="status">
                  
        				       <option value="${formlocation.form_location}"<c:if test="${formlocation.form_location == form.location}"><c:out value="selected"/></c:if>>${formlocation.form_location}</option>
			                  </c:forEach></select><br><br>
               <input name="filename" type="hidden" id="file_name"/>${form.attachment_name}
               <input name="attachments" id="id_file" type="file" style="display:none;" value="${form.attachment_name}"/>
              <label id="change_label" ><a href="#" onclick="change_file()">Change</a></label>
              <span style="color:red;"><form:errors path="form.location"></form:errors></span>
               </td>
              </c:when>
               </c:choose>
															
             
																		              
				
																		
																		<td valign="top" align="left" class="input_txt" width="30%">																	
																		</td>
																		

             </tr>
              
              <tr class="row1">
               <td valign="top" align="left" class="input_txt" width="30%">Form/Rec Title :</td>
																		<td valign="top" align="left" class="input_txt" width="30%"><input
																			type="text" class="input_txtbx" id="form_or_rec_title"
																			onmouseover="showTooltip('tooltip_id','inp_id3');"
																			onmouseout="hideTooltip('tooltip_id');"
																			name="form_or_rec_title" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"onkeypress="return onlyAlphabetsnumeric(event,this);"
																			value="${form.form_or_rec_title}"  readonly="readonly"/><br/>
																			<span id="title1" style="color:red"></span>
																			<span style="color:red;"><form:errors path="Form.form_or_rec_title"></form:errors></span>
																		
																		</td>
																		
																		<td valign="top" align="left" class="input_txt" width="30%" width="40%">Media Type :</td>
               <td valign="top" align="left" class="input_txt" width="30%">
               
                
                 <c:choose>
               <c:when test="${form.media_type=='hardcopy'}">
                <input type="radio" name="media_type" onchange="toggle2(this.value);" value="hardcopy"   id="id_hardcopy"  checked disabled/>Hard Copy&nbsp;
                <input type="radio" name="media_type" onchange="toggle2(this.value);" value="electronic"  id="id_electronic" onchange="toggle2(this.value);" disabled/>Electronic&nbsp;
                <input type="radio" name="media_type" onchange="toggle2(this.value);" value="both"  id="id_both" onchange="toggle2(this.value);" disabled/> Both&nbsp;&nbsp;&nbsp;<br/><span class="err"></span>    
               </c:when>
               <c:when test="${form.media_type=='electronic'}">
               <input type="radio" name="media_type" onchange="toggle2(this.value);" value="hardcopy"   id="id_hardcopy" disabled/>Hard Copy&nbsp;
                <input type="radio" name="media_type" onchange="toggle2(this.value);" value="electronic"  id="id_electronic" onchange="toggle2(this.value);" checked  disabled/>Electronic&nbsp;
                <input type="radio" name="media_type" onchange="toggle2(this.value);" value="both"  id="id_both" onchange="toggle2(this.value);" disabled/> Both&nbsp;&nbsp;&nbsp;<br/><span class="err"></span>    
            	   </c:when>
               <c:when test="${form.media_type=='both'}">
               <input type="radio" name="media_type" onchange="toggle2(this.value);" value="hardcopy"   id="id_hardcopy" />Hard Copy&nbsp;
                <input type="radio" name="media_type" onchange="toggle2(this.value);" value="electronic"  id="id_electronic" onchange="toggle2(this.value);"  disabled/>Electronic&nbsp;
                <input type="radio" name="media_type" onchange="toggle2(this.value);" value="both"  id="id_both" onchange="toggle2(this.value);" checked disabled/> Both&nbsp;&nbsp;&nbsp;<br/><span class="err"></span>    
               </c:when>
               </c:choose>
               </td>
                			
																		
               
																		
																		<td valign="top" align="left" class="input_txt" width="30%">																	
																		</td>
																		<td valign="top" align="left" class="input_txt" width="30%">																	
																		</td> 
               <td valign="top" align="left" class="input_txt" width="30%" width="20%"></td>
																		
				             </tr>
              
              <tr class="row2"> 
               
			   <td valign="top" align="left" class="input_txt" width="30%" width="20%">Process :</td>
               <td valign="top" align="left" class="input_txt" width="30%" >
               
               
                <select name="process" id="id_inpprocess" onchange="doAjaxPost_for_process();" class="input_txtbx" disabled>
							 <option value="">--Select--</option>
			                <c:forEach items="${processForm.processes}" var="processes" varStatus="status">
        				       <option value="${processes.process_name}"<c:if test="${processes.process_name == form.process}"><c:out value="selected"/></c:if>>${processes.process_name}</option>
			                  </c:forEach>
			                 </select>
			                 <br/><span id="inprocesserror" style="color:red"></span>
			                 <span style="color:red;"><form:errors path="Form.process"></form:errors></span></td>
			                 
			                 
              <td valign="top" align="left" class="input_txt" width="30%">Responsibility :</td>
			  <td valign="top" align="left" class="input_txt" width="30%"><input type="text" class="input_txtbx" id="responsibility"
																			onmouseover="showTooltip('tooltip_id','inp_id3');"
																			onmouseout="hideTooltip('tooltip_id');"
																			name="responsibility" 
																			value="${form.responsibility}"  readonly="readonly"/><br/>
																			<span id="responsibility1" style="color:red"></span>
																			<span style="color:red;"><form:errors path="Form.responsibility"></form:errors></span>
																		
																		</td>
         
               </tr>
               
               <tr class="row1">
																		 <td valign="top" align="left" class="input_txt" width="30%">Retention Time:</td>
																		<td valign="top" align="left" class="input_txt" width="30%"><%-- <input
																			type="text" class="input_txtbx" id="inp_external_id"
																			onmouseover="showTooltip('tooltip_id','inp_id3');"
																			onmouseout="hideTooltip('tooltip_id');"
																			name="retention_time"
																			value="${form.retention_time}" /> --%>
																			 <select id="retention" name="retention_time" class="input_txtbx" style="width:200px;" disabled>
              <option value="">--Select--</option>
               <option value="1Week" <c:if test="${form.retention_time=='1Week'}"><c:out value="Selected"/></c:if>>1Week</option>
               <option value="1Month" <c:if test="${form.retention_time=='1Month'}"><c:out value="Selected"/></c:if>>1Month</option>
               <option value="1Year" <c:if test="${form.retention_time=='1Year'}"><c:out value="Selected"/></c:if>>1Year</option>
               </select>
               <br><span id="retentionerr" style="color:red;"></span>
               <span style="color:red;"><form:errors path="Form.retention_time"></form:errors></span>
																		
																		</td>
																		<td valign="top" align="left" class="input_txt" width="30%">Is this a Form?</td>
														
																		<td valign="top" align="left" class="input_txt" width="30%">

															<input type="radio" name="form" value="Yes" id="yesform" disabled class="input_txt" width="30%"   <c:if test="${form.form=='Yes'}"><c:out value="Checked=checked"/></c:if>>Yes&nbsp;&nbsp;&nbsp;
				  											<input type="radio" name="form" value="No" id="noform" disabled class="input_txt" width="30%"  <c:if test="${form.form=='No'}"><c:out value="Checked=checked"/></c:if>>No&nbsp;&nbsp;&nbsp;
				  </td>
			     </tr>
         </table>
         </div>
                <div class="contentbox">
           <h1 style="color:#7A3A3A;font-size:20px;">Update Revision Details</h1>
             <div style="border:#993300  2px solid; padding:15px; margin-bottom:15px;">
             <table cellpadding="0" cellspacing="0" border="0" width="100%" id="displayold">
             <tr class="row2">
             <td valign="top" align="left" width="15%">
            <!--  <a href="#" style="padding-right:10px;" onclick="reset_form()">Enter New Revision</a> -->
             <input type="button" value="Enter New Revision" class="submit_btn1" style="width:160px;" onclick="reset_form()"/>
             </td>
             </tr>
              <tr class="row1">
                         
																		  <td valign="top" align="left" class="input_txt" width="30%">Revision No. (optional) :</td>
																		<td valign="top" align="left" class="input_txt" width="40%">
																		<span id="valueTempe" style="font-weight: bold; width:28px;">${form.revision_id}</span>
																		<button id="plus" href="#" style="height: 18px; width:18px;" value="">+</button>
																   <input type="hidden" name="revision_id" id="revisionid" value=""  class="input_txtbx" >
																  
																   
                  													<br/><span style="color:red;"><form:errors path="Form.revision_id"></form:errors></span>
																		</td>
																		              <td valign="top" align="left" class="input_txt" width="30%">Effective Date :</td>
																		<td valign="top" align="left" class="input_txt" width="30%"><input
																			type="text" class="input_txtbx" id="datepicker123"
																			onmouseover="showTooltip('tooltip_id','inp_id3');"
																			onmouseout="hideTooltip('tooltip_id');"
																			name="effective_date"
																			value="${form.effective_date}" /><br/>
																			<span id="datepicker1234" style="color:red"></span>
																			<input
																			type="hidden" class="input_txtbx" id="inp_external_id"
																			onmouseover="showTooltip('tooltip_id','inp_id3');"
																			onmouseout="hideTooltip('tooltip_id');"
																			name="auto_no"
																			value="${form.auto_number}" />
																			
																			<span style="color:red;"><form:errors path="Form.effective_date"></form:errors></span>
																		</td>  
																		<td valign="top" align="left" class="input_txt" width="30%">																	
																		</td>
																		<td valign="top" align="left" class="input_txt" width="30%">																	
																		</td>      
																		  <td valign="top" align="left" class="input_txt" width="30%">																	
																		</td>
																		</tr>
              
              <tr class="row2">
              																	 <td valign="top" align="left" class="input_txt" width="25%">Form/Rec ID :</td>
																		<td valign="top" align="left" class="input_txt" width="30%"><input
																			type="text" class="input_txtbx" id="form_id"
																			onmouseover="showTooltip('tooltip_id','inp_id3');"
																			onmouseout="hideTooltip('tooltip_id');"
																			name="document_id"
																			value="${form.form_or_rec_id}" readonly="readonly" />
																			<b id="hide_id"></b><br/><span class="err"> <form:errors path="Form.document_id"></form:errors></span>
																		</td>
                          
																		              <td valign="top" align="left" class="input_txt" width="30%">Approved by Process owner :</td>
																		<td valign="top" align="left" class="input_txt" width="30%">
																		
																		<%-- <span id="process_owner_id"></span>
				<input type="hidden" class="input_txtbx" id="inp_external_id" name="approver1" onchange="Approver1();" value="${form.approver1}" /> ${form.approver1}
																			
																			 --%>
																			  <select name="approver1" class="input_txtbx" id="approver">
																			  <option value="">--Select--</option>
             																<c:forEach items="${employeeowner.employees}" var="employeeowner" varStatus="true">
             															     <option value="<c:out value="${employeeowner.name}"/>" <c:if test="${form.approver1==employeeowner.name}"><c:out value="Selected"/></c:if>><c:out value="${employeeowner.name}"/></option>
              																 </c:forEach>    
               
             															  </select>  
																			<br/><span id="filter1error" style="color:red"></span>
																			<span style="color:red;"><form:errors path="Form.approver1"></form:errors></span>
																		</td>
																		<td valign="top" align="left" class="input_txt" width="30%">																	
																		</td>
																		<td valign="top" align="left" class="input_txt" width="30%">																	
																		</td>
																		<td valign="top" align="left" class="input_txt" width="30%">																	
																		</td> </tr>
              
              <tr class="row1">
                            <td valign="top" align="left" class="input_txt" width="25%">Issuer :</td>
																		<td valign="top" align="left" class="input_txt" width="30%">
																			 <select name="issuer" id="issuer" class="input_txtbx" >
               <!-- <option value="">--Select--</option>  --><option value="">--Select--</option>
               <c:forEach items="${employeeForm.employees}" var="employees" varStatus="true">
               <option value="<c:out value="${employees.name}"/>" <c:if test="${form.issuer==employees.name}"><c:out value="Selected"/></c:if>><c:out value="${employees.name}"/></option>
               </c:forEach>              
               </select>
																			<br/><span id="filtererror" style="color:red"></span>
																			<span style="color:red;"><form:errors path="Form.issuer"></form:errors></span>
																		</td>
																		
																		
																		 <td valign="top" align="left" class="input_txt" width="30%">Comments :</td>
																		<td valign="top" align="left" class="input_txt" width="30%">
																	<textarea class="input_txtbx"  name="comments" id="comments" style="height: 50px;" >${form.comments}</textarea><br/>
																	<span id="comments1" style="color:red"></span>
																	<span style="color:red;"><form:errors path="Form.comments"></form:errors></span></td>
																		<td valign="top" align="left" class="input_txt" width="30%">																	
																		</td>
																		<td valign="top" align="left" class="input_txt" width="30%">																	
																		</td>
																		<td valign="top" align="left" class="input_txt" width="30%">																	
																		</td>
              </tr>
              
             
                   
             <!--  <tr class="row1">
              <td colspan="3" align="right">
             <input type="submit" id="export"  name="export" value="Update" onclick="return validation();"  class="submit_btn1"></td>
            </tr> -->
  
     </table>   
       <tr class="row1"  align="right" >
                  <td valign="bottom"  style="padding-right:105px" align="right">&nbsp;<input type="submit" value="Update" onclick="return validation();"class="submit_btn1"></td>
                 
                </tr>
     </div>
     </div>
     </td>
     </tr>
    
     </table>
     </div>
     </form>
     <script>
     $('#newformid').on('submit', function() {
    	 
 	    $('#location_text').attr('disabled', false);
 	    $('#id_location_lbl').attr('disabled', false);
 	    $('#id_file').attr('disabled', false);
 	   $('#id_hardcopy').attr('disabled', false);
	    $('#id_electronic').attr('disabled', false);
	    $('#id_both').attr('disabled', false);
	    $('#id_inpprocess').attr('disabled', false);
 	    $('#retention').attr('disabled', false);
 	    $('#yesform').attr('disabled', false);
 	   $('#noform').attr('disabled', false);
 	});
     $(function() {
    	 
         $( "#datepicker" ).datepicker();
         $( "#datepicker123" ).datepicker();
       });
function change_file(){
		document.getElementById("id_file").style.display="block";
		document.getElementById("file_name").style.display="none";
		
	}
</script>
   <script type="text/javascript">
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
function toggle2(value){

  var e = document.getElementById('location_label');
  var e1 = document.getElementById('file_upload_label');
  var e2=document.getElementById('location_text');
  var e3=document.getElementById('id_file');
if(value=='electronic')
  {
	e.style.display="none";
	e1.style.display="block";
	e2.style.display="none";
	e3.style.display="block";
	document.getElementById('label1').style.display="block";
	
	
  }
else if(value=='hardcopy')
  {
	e.style.display="block";
	e1.style.display="none";
	e2.style.display="block";
	e3.style.display="none";
	document.getElementById('label1').style.display="none";

  }
else if(value=='both')
{
e.style.display="block";
e1.style.display="block";
e2.style.display="block";
e3.style.display="block";
}
  
}
</script>
<script type="text/javascript">
var start = "false";
	function show_edit()
	{
		start = "true";
		var element = document.getElementById('document_type_id');
		var element1 = document.getElementById('formid');
		var element2 = document.getElementById('change');
		var element3 = document.getElementById('form_or_rec_id');
		var element4 = document.getElementById('form_id');
		var element5 = document.getElementById('hide_id');
		
			element.style.display="inline";
			element3.style.display="inline";

			element1.style.display="none";
			element2.style.display="none";
			//element4.style.display="none";
			element5.style.display="none";
			document.getElementById("changeafter").style.display="none";
			document.getElementById("form_or_rec_id").focus();
	}

	function change_to_label()
	{
		
	  
		var type=document.getElementById("document_type_id");	
		
		var doc_id=document.getElementById("form_or_rec_id");	
		
		//alert("doc_id");
		document.getElementById("changeafter").style.display="inline";
		
		if(doc_id.value == ""){
				var color = "Required field should not be empty";
			var result = color.fontcolor("red");
			document.getElementById("changeafter").innerHTML=result;
		}
		
		else if((doc_id.value.length < 4) || (doc_id.value.length > 32))
			{
			var color = "Required field should be length of 4 to 32";
			var result = color.fontcolor("red");
			document.getElementById("changeafter").innerHTML=result;
			}
		else{
			document.getElementById("changeafter").innerHTML = type.value+-+doc_id.value;
			}
			
		
		var gen_id=document.getElementById("generated_id");
		gen_id.value=type.value+-+doc_id.value;
		
		
		document.getElementById('document_type_id').style.display="none";
		document.getElementById('form_or_rec_id').style.display="none";
		document.getElementById("change").style.display="inline";
		if((gen_id.value)!= null)
		{
		//alert("form_id");
		//alert(gen_id.value);
     	form_id.value=gen_id.value;  
     	
		}


		}
	
		
		
			
	var valueElement = $('#valueTempe');
	var intgert = /^[0-9].[0-9]$/;
	var intalpha = /^[0-9].[a-z]$/;
	var alphaint =  /^[a-z].[0-9]$/;
	var alphaalpha = /^[a-z].[a-z]$/;
	var intgrt = /^[0-9]$/;
	var alphab = /^[a-z]$/;

	

	function incrementValue(e){
		
		if(intgert.test(valueElement.text()))
			{
			alert("int");
		if(valueElement.text() < 100){
			var value = valueElement.text(Math.max(parseFloat(valueElement.text()) + e.data.increment).toFixed(1)); 
			var id = document.getElementById('revisionid');
			
			id.value = Math.max(parseFloat(valueElement.text()).toFixed(1));
			
		}
			}
		if(intalpha.test(valueElement.text()))
			{
			var alpha =  ["0","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]; 
			var print = ["0"];
			var i,j;

			for(i=0;i<=26;i++)
			{
			  for(j=1;j<=26;j++)
			  {
				print.push(i + "." + alpha[j]);
			  }
			}
			var c=document.getElementById("valueTempe").innerHTML;
			 a=print.indexOf(c);
			
			 b=a+1;
			
			 document.getElementById("valueTempe").innerHTML = print[b];
			 var id = document.getElementById('revisionid');
			 
			 id.value = print[b];
			
			}
		if(alphaint.test(valueElement.text()))
			{
			
			
			var number =  ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]; 
			var display1 =["a"];
			var i,j;

			for(i=0;i<=9;i++)
			{
			  for(j=0;j<=9;j++)
			  {
				display1.push(number[i] + "." + j);
			  }
			}
			var c=document.getElementById("valueTempe").innerHTML;
			
			 a=display1.indexOf(c);
			
			 b=a+1;
			 document.getElementById("valueTempe").innerHTML = display1[b];
			 var id = document.getElementById('revisionid');
			 
			 id.value = display1[b];
			
			}
		if(alphaalpha.test(valueElement.text()))
			{
			var number =  ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]; 
			var display1 =["a"];
			var i,j;

			for(i=0;i<=25;i++)
			{
			  for(j=0;j<=25;j++)
			  {
				display1.push(number[i] + "." + number[j]);
			  }
			}
			var c=document.getElementById("valueTempe").innerHTML;
			
			 a=display1.indexOf(c);
			
			 b=a+1;
			 document.getElementById("valueTempe").innerHTML = display1[b];
			 var id = document.getElementById('revisionid');
			 
			 id.value = display1[b];
			
			
			}
		if(intgrt.test(valueElement.text()))
			{
						
			var value=valueElement.text();
			var id = document.getElementById('revisionid');
			var inc = parseFloat('1');
			
			  id.value = parseInt(value)+parseFloat(inc);
					  var value1 = valueElement.text(id.value); 
			
			}
		if(alphab.test(valueElement.text()))
			{
			
			var alpha =  ["0","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]; 
			var print = ["0"];
			var i,j;

			
			  for(j=1;j<=26;j++)
			  {
				print.push(alpha[j]);
			  }
			
			var c=document.getElementById("valueTempe").innerHTML;
			 a=print.indexOf(c);
			
			 b=a+1;
			
			 document.getElementById("valueTempe").innerHTML = print[b];
			 var id = document.getElementById('revisionid');
			 
			 id.value = print[b];
			
			}
		
	    return false;
	}


	$('#plus').bind('click', {increment: 0.1}, incrementValue);	
					
			
				/* var value = revisionid.value;
				
				var inc = parseFloat('1');
			  revisionid.value = parseInt(value)+parseFloat(inc); */
			
	
</script>	
<script language="JavaScript">
function reset_form()
{
	
	document.getElementById('valueTempe').innerHTML="0";
	
	document.getElementById('datepicker123').value="";
	
	document.getElementById('issuer').value="";
	
	document.getElementById('approver').value="";
	
	document.getElementById('comments').value="";
	
  
}

</script>
 <script>

 /* $(window).load(function(){
 $("#form_or_rec_id").keyup(function() {
		
	 $("#quality3err").html(''); 
	/* var regex=/(^\d{5}$)|(^\d{5}-\d{4}$)/;
	var intRegex = /^\d+$/;
	if(intRegex.test($(this).val())||$(this).val()=='') 
	{
		var $in = $(this).val();		 
	}
	else if($(this).val()!='')
		{
		
		$("#quality3err").html('enter a number!!!!');
		}
}).keydown(function() {
    oldValue = $(this).val();
})

}); */
 </script>

  <script type="text/javascript">
function validatename(id){
	
    var textInput = document.getElementById(id).value;
    textInput = textInput.replace(/[^A-Za-z0-9 ]/g, "");
    document.getElementById(id).value = textInput;
}  
function validatename3(id){
	
	 var textInput = document.getElementById(id).value;
	    textInput = textInput.replace(/[^0-9]/g, "");
	    document.getElementById(id).value = textInput;
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
        if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123)|| (charCode > 47 && charCode < 58) || (charCode==32))
            return true;
        else
            return false;
    }
    catch (err) {
        alert(err.Description);
    }
}

function onlynumeric(e, t) {
    try {
        if (window.event) {
            var charCode = window.event.keyCode;
        }
        else if (e) {
            var charCode = e.which;
        }
        else { return true; }
        if ((charCode > 47 && charCode < 58))
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
  $(function() {
	$("#form_or_rec_title").on("keypress", function(e) {
		if (e.which === 32 && !this.value.length)
	        e.preventDefault();
	});
	});	
  $(function() {
		$("#responsibility ").on("keypress", function(e) {
			if (e.which === 32 && !this.value.length)
		        e.preventDefault();
		});
		});	

  $(function() {
		$("#comments ").on("keypress", function(e) {
			if (e.which === 32 && !this.value.length)
		        e.preventDefault();
		});
		});	
  $(function() {
		$("#form_or_rec_id ").on("keypress", function(e) {
			if (e.which === 32 && !this.value.length)
		        e.preventDefault();
		});
		});	
$(function() {
		$("#form_or_rec_id ").on("keypress", function(e) {
			if (e.which === 32 && !this.value.length)
		        e.preventDefault();
		});
		});

</script>



<script>
function validation()
{

//	var date = /^(0?[1-9]|1[012])[\/](0?[1-9]|[12][0-9]|3[01])[\/]\d{4}$/;
var date = /^(0?[1-9]|1[012])[\/](0?[1-9]|[12][0-9]|3[01])[\/]\d{4}$/;
var spl =  /^[A-Za-z0-9]*$/;
	
	var rec_id=document.getElementById('form_or_rec_id').value;
	 var title = document.getElementById('form_or_rec_title').value;
	 var responsibility = document.getElementById('responsibility').value;
	 var error ="";
	
	 var id_hardcopy = document.getElementById('id_hardcopy').checked;
	 var id_electronic = document.getElementById('id_electronic').checked;
	 var id_both = document.getElementById('id_both').checked;
	 var location_text = document.getElementById('location_text').value;
	 
	 var id_inpprocess = document.getElementById('id_inpprocess').value;
	 var issuer = document.getElementById('issuer').value;
 	var approver = document.getElementById('approver').value;
 	 var datepicker123=document.getElementById('datepicker123').value;
	 var e2=document.getElementById('location_text').value;
	 var e3=document.getElementById('id_file').value;
	 var comments = document.getElementById('comments').value;
	var retention = document.getElementById('retention').value;
	if(retention=="")
		{
		
		document.getElementById('retentionerr').innerHTML = "Required field should not be empty";
		error = "true";
		}
	else
		{
		document.getElementById('retentionerr').innerHTML = "";
		}
	
	/* if(rec_id =="")
	 {
		 document.getElementById("changeafter").innerHTML="Required field should not be empty";
		 error="true";
	 } 
	else if((rec_id.length < 4) || (rec_id.length > 400) )
	 {
	 document.getElementById("changeafter").innerHTML="Required field should be length 4 to 32";
	 error ="true";
	 }
	 */
	if(title =="")
	 {
		 document.getElementById("title1").innerHTML="Required field should not be empty";
		 error="true";
	 } 
	 else if(title.charAt(0)==" ")
	 {
	 
	 document.getElementById("title1").innerHTML="Should not accept initial spaces";	
	 error="true";
	 }
	 else if((title.length < 4) || (title.length > 400) )
	 {
	 document.getElementById("title1").innerHTML="Required field should be length 4 to 32";
	 error ="true";
	 }

	 else if(!title.match(spl))
 		 {
 		 document.getElementById("title").innerHTML="Special Characters are Not allowed";
 		error="true";
 		 }
 	 else
 		 {
 		 document.getElementById("title1").innerHTML="";
 		 }
    
	 if(comments =="")
	 {
		
		 document.getElementById("comments1").innerHTML="Required field should not be empty";
		 error="true";
	 }
	 else if(comments.charAt(0)==" ")
	 {
		 document.getElementById("comments1").innerHTML="Should not accept initial spaces";
		 error="true";
	 }

	 else if((comments.length < 4) || (comments.length > 400) )
		 {
		 document.getElementById("comments1").innerHTML="Required field should be length 4 to 400";
		 error ="true";
		 }
	 else if(!comments.match(spl))
		 {
		 document.getElementById("comments11").innerHTML="Special characters are not allowed";
		
		 }
	 else 
		 {
		document.getElementById("comments1").innerHTML="";
		 }
  
	    if(responsibility =="")
		 {
			 
			 document.getElementById("responsibility1").innerHTML="Required field should not be empty";
			 error="true";
		 }
	    else if(responsibility.charAt(0)==" ")
		 {
			 document.getElementById("responsibility1").innerHTML="Should not accept initial spaces";
			 error="true";
		 }
	    else if((responsibility.length < 4) || (responsibility.length > 400) )
		 {
		 document.getElementById("responsibility1").innerHTML="Required field should be of length 4 to 32";
		 error ="true";
		 }
	    
	   
 	 else
 		 {
 		document.getElementById("responsibility1").innerHTML="";
 		 }  
	        
	    
	     if(datepicker123 == "")
		 {
			
	    	 
		 document.getElementById("datepicker1234").innerHTML="Required field should not be empty";
		 error ="true";
		 
		 }
		 else if(datepicker123.match(date))
		 {
		 document.getElementById("datepicker1234").innerHTML="";
		 }
		 else
		 {
		 document.getElementById("datepicker1234").innerHTML="Invalid date";
		 error ="true";
		 }
	 
	     if(start == "true")
     	{
     		
     	var form_id	= document.getElementById('form_or_rec_id').value;
     		if(form_id == "")
     		{
     			document.getElementById('formiderror').innerHTML = "Required field should not be empty";
     			error = "true";
     		}
     		else
     			{
     			document.getElementById('formiderror').innerHTML = "";
     			}
     	}
    	 if(document.getElementById('id_hardcopy').checked)
    	 {
    		if(e2=="")
    			{
    			document.getElementById("hard").innerHTML="Required field should not be empty";
    			error = "true";
    			}
    		else{
    			document.getElementById("hard").innerHTML="";
    		}
    	 }
    	 //eight
    	
    	 if(document.getElementById('id_electronic').checked)
    		{
    		 if(e3=="")
    			 {
    			
    			 document.getElementById("attach").innerHTML="Required field should not be empty";
    			 error = "true";
    			 }
    		 else{
    			 document.getElementById("attach").innerHTML="";
    		 }
    		}
    	 //nine
    	
    	if(document.getElementById('id_both').checked)
    		{
    	
    		if(e2=="")
    		{
    			
    		document.getElementById("hard").innerHTML="Required field should not be empty";
    		error = "true";
    		}
    		else{
    			document.getElementById("hard").innerHTML="";
    		}
    		if(e3=="")
			 {
			
			 document.getElementById("attach").innerHTML="Required field should not be empty";
			 error = "true";
			 }
		 else{
			 document.getElementById("attach").innerHTML="";
		 }
    	}
		
	
		if(id_inpprocess == "")
		{
			 
			 document.getElementById("inprocesserror").innerHTML="Please select one";
			 error ="true";
		}
		else
		{
			 document.getElementById("inprocesserror").innerHTML="";
		}
		
	  
		 if(issuer == "")
			{
			
				 document.getElementById("filtererror").innerHTML="Required field should not be empty";
					error ="true";
			}
	  else
		  {
		 document.getElementById("filtererror").innerHTML="";
		  }
			
				
	 //six
	 
			 if(approver == "")
				{
				 
					 document.getElementById("filter1error").innerHTML="Required field should not be empty";
						error ="true";
				}
			 else
				 {
				 document.getElementById("filter1error").innerHTML="";
				 }
			 if(error == "true")
			 {
			 
		 return false;
			 }
	
	}

</script>


 <jsp:include page="footer.jsp"></jsp:include>   
      
