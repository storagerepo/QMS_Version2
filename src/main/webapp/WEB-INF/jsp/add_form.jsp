<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" />
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/jquery-ui.js"></script>
<form method="post" enctype="multipart/form-data" action="addform">

 
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
     <tr>
        <td>
        <div>
  <ul class="horizmenu" >
						
  <li  style=" float:left;margin-right:10px;text-transform:uppercase;">
								<a href="addform" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									Add Form
									
								</a>
									
								</a>
							</li>

                <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
                <a href="view_formdetails" class="<c:choose>
                <c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
                  <span>View Revisions</span>
                </a>
              </li>


				            <li  style=" float:left;margin-right:10px;text-transform:uppercase;">
								<a href="view_form" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									View Forms </span>
									
								</a>
							</li>
				            <li  style=" float:left;margin-right:10px;text-transform:uppercase;">
								<a href="form_report" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									Reports</span>
									
								</a>
							</li>
						    </ul>
  </div>
        </td>
      </tr>
      
      <tr>
        <td valign="top" align="left">
        <!--  <div class="headings altheading">
              <h2>&nbsp;&nbsp;Form Details</h2>
            </div> -->
            <div class="contentbox">
            <h1 style="color:#7A3A3A;font-size:20px;">Add Form Details</h1>
                    
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
              <td colspan="3">
            <!--  <div id="child_table" style="display:none;"> -->
<br>
              
             <div style="border:#993300  2px solid; padding:15px; margin-bottom:15px;">
             <table cellpadding="0" cellspacing="0" border="0" width="100%" >
    		
    	     <tr class="row1">
    		 <td valign="top" align="left" class="input_txt" width="20%"></span>Form/Rec ID :</td>
              
               <td valign="top" align="left" class="input_txt1"  id="lable_td" style="display:none;" >
               <label id="document_id_full_lbl"></label><a href="#" style="text-decoration: none;" onclick="show_edit()">&nbsp;&nbsp;Change</a>            
               <br/>
                     
              
               <td valign="top" align="left" id="edit_td" class="input_txt1" >
               <select name="document_type_id" id="document_type_id" class="input_txtbx" style="width:100px;">
               
             <!--   <option value = "">Select Form Prefix</option> -->
			              <c:forEach items="${formFormPrefix.formPrefixs}" var="formprefix" varStatus="status">
        				       <option value="${formprefix.form_prefix}">${formprefix.form_prefix}</option>
			                  </c:forEach>
               </select>
               
            
               
              <input type="hidden" value="${docform.form_or_rec_id}" id="generated_id90" /> 
               <input type="hidden" name="document_id_hidden" id="generated_id" class="input_txtbx" style="width:100px;" value="" /> 
              <input type="text" value="" id="form_or_rec_id" class="input_txtbx" onkeypress="return validate(event);" style="height:22px;width:100px;" name="form_or_rec_id" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"onblur="change_to_label();" maxlength="32"/>
              <br><span id="formiderror" style="color:red"></span>
              <span style="color:red;"><form:errors path="Form.form_or_rec_id"></form:errors></span>
              <span id="quality3err" style="color:red;">
                 <c:if test="${success=='exist'}"><span style="color:red">Form ID already Exist</span></c:if></span>
              </td>
             
             <%-- <td valign="top" align="left" class="input_txt" ></span>Auto Number:</td>
                  <td valign="top" align="left" class="input_txt" ><input type="hidden" name="auto_number" value="<c:out value="${id }"/>"/><c:out value="${id }"/><br/></span></td>
			 --%>
			 
			 
			<td valign="top" id="id_location_lbl" align="left" class="input_txt" width="20%" ><label id="location_label" ></span> Location :</label><br><label id="file_upload_label" style="display:none;"><span style="color:red;"></span> Upload File:</label></td>
               <td valign="top" align="left" id="id_location_txt" class="input_txt" width="35%">
               
               <select id="location_text" name="location" class="input_txtbx" style="width:200px;">
              <option value = "">--Select--</option>
			               <c:forEach items="${formLocationForm.formLocations}" var="formlocation" varStatus="status">
                  			 <option value="${formlocation.form_location}"<c:if test="${formlocation.form_location == docform.location}"><c:out value="selected"/></c:if>>${formlocation.form_location}</option>
			                  </c:forEach></select><span style="color:red;"><form:errors path="Form.location"></form:errors></span>
			                  <span id="hard"style="color:red"></span>
               <br>
				 <input name="attachments" style="display:none;" id="id_file" type="file" />	
				 <span id="attach" style="color:red"></span>
				 </td>										
				
				<td valign="top" align="right" class="input_txt"></td>
				<td valign="top" align="right" class="input_txt"></td>
				<td valign="top" align="right" class="input_txt"></td>
				
				</tr>
				<!-- 														<td valign="top" align="right" class="input_txt">																	
																		</td>
																		<td valign="top" align="right" class="input_txt">																	
																		</td>
																		</tr>
                -->
              
              <tr class="row2">	
				  <td valign="top" align="left" class="input_txt" width="20%"></span>Form/Rec Title :</td>
				  <td valign="top" align="left" class="input_txt" width="30%"><input
																			type="text" class="input_txtbx" id="form_or_rec_title"
																			onmouseover="showTooltip('tooltip_id','inp_id3');"
																			onmouseout="hideTooltip('tooltip_id');"
																			name="form_or_rec_title"
																			value="${docform.form_or_rec_title }" onkeypress="return onlyAlphabetsnumeric(event, this);" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"maxlength="32"/>
																			<br/>
																			<span id="title1" style="color:red"></span><span style="color:red;"><form:errors path="Form.form_or_rec_title"></form:errors></span>
																		
																		</td>
				
				 													              <td valign="top" align="left" class="input_txt" width="20%"><span
																			class="err"></span>Responsibility :</td>
																		<td valign="top" align="left" class="input_txt" width="35%"><input
																			type="text" class="input_txtbx" id="responsibility"
																			onmouseover="showTooltip('tooltip_id','inp_id3');"
																			onmouseout="hideTooltip('tooltip_id');"
																			name="responsibility"
																			value="${docform.responsibility}"  maxlength="32"/><br/>
																			<span id="responsibility1" style="color:red"></span>
																			<span style="color:red;"><form:errors path="Form.responsibility"></form:errors></span>
																		
																		</td>
<!-- 																		<td valign="top" align="left" class="input_txt">																	
																		</td>
																		<td valign="top" align="left" class="input_txt">																	
																		</td>
																		
 -->
             </tr>
              
<tr class="row2">
               
            
               <td valign="top" align="left" class="input_txt"></span>Process:</td>
               <td valign="top" align="left" class="input_txt" >
               
               <select name="process" id="id_inpprocess" onchange="doAjaxPost_for_process();" class="input_txtbx">
               <option value="">--Select--</option>
             	<c:forEach items="${processForm.processes}" var="processes" varStatus="status">
        				       <option value="${processes.process_name}"<c:if test="${processes.process_name == docform.process}"><c:out value="selected"/></c:if>>${processes.process_name}</option>
			                  </c:forEach>
           	 	</select><br/>
           	 	<span id="inprocesserror" style="color:red"></span>
           	 	<span style="color:red;"><form:errors path="Form.process"></form:errors></span></td>
               
          		<td valign="top" align="left"  class="input_txt">Media Type :</td>
               <td valign="top" align="left" class="input_txt"> 
         
                 <input type="radio" name="media_type" onchange="toggle2(this.value);" value="hardcopy" id="id_hardcopy" checked <c:if test="${docform.media_type=='hardcopy'}"><c:out value="checked" /></c:if>/>Hard Copy&nbsp;
                <input type="radio" name="media_type" value="electronic"  id="id_electronic" onchange="toggle2(this.value);" <c:if test="${docform.media_type=='electronic'}"><c:out value="checked" /></c:if>/>Electronic&nbsp;<span class="err"></span>
                <input type="radio" name="media_type" value="both"  id="id_both" onchange="toggle2(this.value);" <c:if test="${docform.media_type=='both'}"><c:out value="checked" /></c:if>/>Both&nbsp;<span class="err"></span>
               <span id="mediatypeerror" style="color:red"></span>
               <span class="err" style="color:red"><form:errors path="Form.media_type"></form:errors></span>
               </td>
               </tr>
              
              <tr class="row2">
              <td valign="top" align="left" class="input_txt" width="20%"></span>Retention Time :</td>
			  <td valign="top" align="left" class="input_txt" width="30%">		
																		 
               <select id="retention" name="retention_time" class="input_txtbx">
           <option value="">--Select--</option>
               <option value="1Week" <c:if test="${docform.retention_time=='1Week'}"><c:out value="Selected"/></c:if>>1Week</option>
               <option value="1Month" <c:if test="${docform.retention_time=='1Month'}"><c:out value="Selected"/></c:if>>1Month</option>
               <option value="1Year" <c:if test="${docform.retention_time=='1Year'}"><c:out value="Selected"/></c:if>>1Year</option>
               </select><br/><span id="retentionerr" style="color:red;"></span>
				    <span style="color:red;"><form:errors path="Form.retention_time"></form:errors></span>
               </td>
               <td valign="top" align="left" class="input_txt" width="20%">Is this a Form?</td>
			   <td valign="top" align="left" class="input_txt" width="35%">
			   <input type="radio" name="form" value="Yes" class="input_txt" checked >Yes&nbsp;&nbsp;&nbsp;
			   <input type="radio" name="form" value="No" class="input_txt" >No
               </tr>
               </table>
               </div>
               </td>
               
         <!-- 
            <div class="contentbox">
             <h2><b>&nbsp;&nbsp;Revision Details</b></h2>
                     -->
                    
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
          <td colspan="3">
              <div id="childsection" style="display:none;">
            <!--  <div id="child_table" style="display:none;"> -->
<br>
             
           <!--   <h1 style="color:#7A3A3A;font-size:20px;">Add Revision Details</h1> -->
<br>
             <div style="border:#993300  2px solid; padding:15px; margin-bottom:15px;">
             <table cellpadding="0" cellspacing="0" border="0" width="100%" >
             <tr class="row2">
             <td valign="top" align="left" class="input_txt" width="20%">Form/Rec ID :</td>
			 <td valign="top" align="left" class="input_txt" width="30%">
			 <input type="text" class="input_txtbx" id="form_id" readonly="readonly" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" name="document_id"
			  value="" /><br/><span style="color:red;"><form:errors path="Form.form_or_rec_id"></form:errors></span>
			 </td>
			 
   			   <td valign="top" align="left" class="input_txt" width="20%">Approved by Process owner :</td>
               <td valign="top" align="left" id="edit_td_issuer1" class="input_txt" width="35%">
               <input type="hidden" value="${docform.approver1}" id="appro">
               <select name="filter" id="filter_value1" class="input_txtbx" onchange="AjaxProcessOwner(this.value);" onblur="change_to_label_issuer1();">
               	<option value="">--Select--</option>
                <option value="ABCD">A-D</option>
              	<option value="EFGH">E-H</option>
              	<option value="IJKL">I-L</option>
              	<option value="MNO">M-O</option>
              	<option value="PQR">P-R</option>
              	<option value="STUV">S-V</option>
              	<option value="WXYZ">W-Z</option>
              
               </select>
                <span id="issuer_generate1">
              
               </span>
               <label id="issuer_full_lbl1"></label><a href="#" style="text-decoration: none;" onclick="show_edit_issuer1()">&nbsp;&nbsp;Change</a>            
               <br><span id="filter1error" style="color:red"></span>
               <span style="color:red;"><form:errors path="Form.approver1"></form:errors></span>
			   </td>
			   
																		
																		<td valign="top" align="left" class="input_txt">																	
																		</td>
																		
																		<td valign="top" align="left" class="input_txt">																	
																		</td>
																		<td valign="top" align="left" class="input_txt">																	
																		</td>
			   </tr>
              
    			<tr class="row1">			             
				<td valign="top" align="left" class="input_txt" >Effective Date :</td>
				<td valign="top" align="left" class="input_txt" width="30%">
				<input type="hidden" id="auto_no" name="auto_no" value="${id }"/>
				<input type="text" class="input_txtbx" id="datepicker123" name="effective_date" value="${docform.effective_date}" />
				<br/>
				<span id="datepicker1234" style="color:red"></span>
				<span style="color:red;"><form:errors path="Form.effective_date"></form:errors></span>
				</td>  
				
												
				<td valign="top" align="left" class="input_txt">Comments :</td>
				<td valign="top" align="left" class="input_txt" >
				<textarea class="input_txtbx" id="comments" name="comments" onInput="return validatename(comments)" style="height: 60px;" >${docform.comments}</textarea><br/>
				<span id="comments1" style="color:red"></span>
				<span style="color:red;"><form:errors path="Form.comments"></form:errors></span></td>
				</tr>
              
              	<tr class="row1">
                <td valign="top" align="left" class="input_txt" >Issuer :</td>
                <td valign="top" align="left" id="edit_td_issuer" class="input_txt" width="30%">
                 <input type="hidden" value="${docform.issuer}" id="issu"/>
                 <select name="filter" id="filter_value" class="input_txtbx" onchange="doAjaxPost(this.value);" onblur="change_to_label_issuer();" >
                 <option value="">--Select--</option>
                 <option value="ABCD">A-D</option>
              	 <option value="EFGH">E-H</option>
              	 <option value="IJKL">I-L</option>
              	 <option value="MNO">M-O</option>
              	 <option value="PQR">P-R</option>
              	 <option value="STUV">S-V</option>
              	 <option value="WXYZ">W-Z</option>
              </select>
                <span id="issuer_generate"> 
               </span>
               <label id="issuer_full_lbl"></label><a href="#" style="text-decoration: none;" onclick="show_edit_issuer()">Change</a>      
               <br/>
               <span id="filtererror" style="color:red"></span>
               <span style="color:red;"><form:errors path="Form.issuer"></form:errors></span>
              </td>
					</tr >
					
					<!-- <tr class="row2">
					<td></td>
					<td></td>
					 <td  align="left">
                   <input type="submit" id="export" onclick="return validation();"  name="export" value="Submit" class="submit_btn1"></td>
             
					</tr> -->
					</div>
					</table>
					
					</div>
					</td>
					
					<table id="hidebutton"style="float:right;margin-top:20px;">
    <tr class="row1" >
                  <td valign="bottom" colspan="2"align="right">&nbsp;<input type="submit" onclick="return validationmain();" value="Submit"  class="submit_btn1"></td>
                  <!-- onclick="return validation();" -->
                  <td valign="top" align="left">
                  <input type="button" value="Enter/Modify Revision Details" onclick="showchildsection();"class="submit_btn1" style="width:350px;"> 
				</td>
                  
                </tr>
     </table><br/><br/>
     <table id="showbutton" style="display:none;float:right;margin-top:-33px">
      <tr class="row1" >
                  <td valign="bottom" colspan="3"align="right">&nbsp;
                  <input type="submit" onclick="return validation();" value="Submit"  class="submit_btn1">
				</td>
                  <td valign="top" align="left">
                   <input type="button" value="Hide Enter/Modify Revision Details" onclick="hidechildsection();"class="submit_btn1" style="width:350px;">
                  </td>
                </tr></table>
                
					 <!--  <tr class="row1">
                  <td valign="bottom" colspan="4"align="right" style="padding-right:165px">&nbsp;<input type="submit" value="Submit"name="export" onclick="return validation();"class="submit_btn1"></td>
                 
                </tr>  -->
					</table>
					
				
              <tr class="row1">
              
             
             <!-- <td colspan="1">
            <input type="reset" id="reset_export" name="reset_export" value="Reset" class="submit_btn1"></td> -->
</tr>
</table>
</div>
</td>
</tr>
</table>
</div>
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
  
  
<script type="text/javascript">
var ajax_issuer = "false";
var issuerchange = "false";
var ajax_issuer1 = "false";
var issuerchange1 = "false";
var letter  = "-";
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
	//document.getElementById('label1').style.display="block";
	
    }
else if(value=='hardcopy')
    {
	e.style.display="block";
	e1.style.display="none";
	e2.style.display="block";
	e3.style.display="none";
	//document.getElementById('label1').style.display="none";
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
<script>
function validatename(id)
{
	var textInput = document.getElementById(id).value;
	textInput = textInput.replace(/[^A-Za-z0-9 ]/g, "");
	document.getElementById(id).value = textInput;
}
function validateresponsibility(id)
{
	var textInput = document.getElementById("responsibility").value;
	textInput = textInput.replace(/[^A-Za-z]/g, "");
	document.getElementById("responsibility").value = textInput;
}
function validatename(comments)
{
	var textInput = document.getElementById(comments).value;
	textInput = textInput.replace(/[^A-Za-z0-9, ]/g, "");
	document.getElementById(comments).value = textInput;
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

</script>
<script type="text/javascript">
       function validate(event) {
          
           var regex = new RegExp("^[0-9]+$");
           var key = String.fromCharCode(event.charCode ? event.which : event.charCode);
           if (!regex.test(key)) {
             // document.getElementById("cmaerr").innerHTML="enter numerics or decimals only";
               event.preventDefault();
               return false;
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
<script type="text/javascript">
function labelvalidate(id){
	 alert("caall");
	var form_or_rec_id=document.getElementById(id).value;
	alert(form_or_rec_id);
	if(form_or_rec_id == "")
	 {
	
	 document.getElementById("formiderror").innerHTML="Required field should not be empty";
		error ="true";
	 }
	else(){
		document.getElementById("formiderror").innerHTML="";
	}
}
</script>

 <script>
    function validationmain()
    {
       //alert("calling");
        var error="";
     
      document.getElementById("formiderror").innerHTML="";
      document.getElementById("hard").innerHTML="";
      document.getElementById("title1").innerHTML="";
      document.getElementById("responsibility1").innerHTML="";
      document.getElementById("inprocesserror").innerHTML="";
      document.getElementById("retentionerr").innerHTML="";


       if(document.getElementById("form_or_rec_id").value=="")
      {
        //alert("hai");
         document.getElementById("formiderror").innerHTML="Required field should not be empty";
         error=true; 
      } 

    if(document.getElementById("location_text").value=="")
      {
        //alert("hai");
         document.getElementById("hard").innerHTML="Required field should not be empty";
         error=true; 
      } 

      if(document.getElementById("form_or_rec_title").value=="")
      {
        //alert("hai");
         document.getElementById("title1").innerHTML="Required field should not be empty";
         error=true; 
      } 
       if(document.getElementById("responsibility").value=="")
      {
        //alert("hai");
         document.getElementById("responsibility1").innerHTML="Required field should not be empty";
         error=true; 
      } 
       if(document.getElementById("responsibility").value!="")
      {
         if(document.getElementById("responsibility").value.length < 4 || document.getElementById("responsibility").value.length > 32){
         //alert("calling");
                    document.getElementById("responsibility1").innerHTML="Required field should be length 4 to 32";
                    error=true; 
                }
        }
       if(document.getElementById("id_inpprocess").value=="")
      {
        //alert("hai");
         document.getElementById("inprocesserror").innerHTML="Required field should not be empty";
         error=true; 
      } 

      if(document.getElementById("retention").value=="")
      {
        //alert("hai");
         document.getElementById("retentionerr").innerHTML="Required field should not be empty";
         error=true; 
      } 
     /* if(document.getElementById("job_role").value!="")
      {
         if(document.getElementById("job_role").value.length < 6 || document.getElementById("job_role").value.length > 32){
                    document.getElementById("job_titleerror").innerHTML="Job title count 6 to 32 characters";
                    error=true; 
                }
        }*/
       
    
       
       if(error==true)
       {
         return false;
        
       }
       else{
        return true;
       }

    }

    </script>
<script>
function validation()
{

//	var date = /^(0?[1-9]|1[012])[\/](0?[1-9]|[12][0-9]|3[01])[\/]\d{4}$/;
var date = /^(0?[1-9]|1[012])[\/](0?[1-9]|[12][0-9]|3[01])[\/]\d{4}$/;
var spl =  /^[A-Za-z0-9]*$/;
	
	 var title = document.getElementById('form_or_rec_title').value;
	 var responsibility = document.getElementById('responsibility').value;
	 var error ="";
	 var form_id = document.getElementById('form_or_rec_id').value;
	 var id_hardcopy = document.getElementById('id_hardcopy').checked;
	 var id_electronic = document.getElementById('id_electronic').checked;
	 var id_both = document.getElementById('id_both').checked;
	 //var location_text = document.getElementById('location_text').value;
	 
	 var id_inpprocess = document.getElementById('id_inpprocess').value;
	 var filter_value = document.getElementById('filter_value').value;
	 var filter_value1 = document.getElementById('filter_value1').value;
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
	 else if(!title.match(spl))
 		 {
 		 document.getElementById("title").innerHTML="Special characters are not allowed";
 		error="true";
 		 }

	 else if((title.length < 4) || (title.length > 32))
		 {
		 document.getElementById("title1").innerHTML="Required field should be Length 4 to 32";
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
		 document.getElementById("comments").innerHTML="Special characters are not allowed";
		
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

		 else if((responsibility.length < 4) || (responsibility.length > 32))
			 {
			 document.getElementById("responsibility1").innerHTML="Required field should be length 4 to 32";
			 error="true";
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
	 
		 if(form_id == "")
		 {
		
		 document.getElementById("formiderror").innerHTML="Required field should not be empty";
			error ="true";
		 }
		 else if((form_id.length < 4) || (form_id.length > 32))
			 {
			 document.getElementById("formiderror").innerHTML="Required field should be length 4 to 32";
			 error="true";
			 } 
	 else
		{
		 document.getElementById("formiderror").innerHTML= "";
		}
	  if(!(document.getElementById('id_hardcopy').checked) &&  !(document.getElementById('id_electronic').checked) && !(document.getElementById('id_both').checked) )
	{
		
		 document.getElementById("mediatypeerror").innerHTML="Required field should not be empty";
			error ="true";
	}
	 else
		 {
		 document.getElementById("mediatypeerror").innerHTML= "";
		 }
		 
	if(document.getElementById('id_hardcopy').checked)
	 {
		if(e2=="")
			{
			
			document.getElementById("hard").innerHTML="Required field should not be empty";
			error ="true";
			}
		else{
			document.getElementById("hard").innerHTML="";
			
		}
	 }
	 
	 
	 
	 
	 
	 if(document.getElementById('id_electronic').checked)
	{
		 if(e3=="")
			 {
			
			 document.getElementById("attach").innerHTML="Please uploaded a file";
			 error ="true";
			 }
		 else{
			 document.getElementById("attach").innerHTML="";
		 }
	}
	 
	 
	 
	 
	if(document.getElementById('id_both').checked)
		{
		if(e2=="")
		{
			 
		document.getElementById("hard").innerHTML="Required field should not be empty";
		error ="true";
		}
		else{
			document.getElementById("hard").innerHTML="";
		}
		 if(e3=="")
		 {
			 
		 document.getElementById("attach").innerHTML="Please uploaded a file";
		 error ="true";
		 }
		 else{
			 document.getElementById("attach").innerHTML="";
		 }
		 
		}
	
	
		if(ajax_issuer == "false")
		{
			
			
			if(filter_value == "-")
			{
				
				 document.getElementById("filtererror").innerHTML="Required field should not be empty";
					error ="true";
			}
			else
				{
				 document.getElementById("filtererror").innerHTML="Required field should not be empty";
					error ="true";
				}
			
	
		}	
		if(id_inpprocess == "")
		{
			 
			 document.getElementById("inprocesserror").innerHTML="Required field should not be empty";
			 error ="true";
		}
		else
		{
			 document.getElementById("inprocesserror").innerHTML="";
		}
		
	  
	  if(ajax_issuer == "true")
		{
		 
		var issuer1 = document.getElementById("issuer1").value;
		if(issuer1.length > 2)
		{
			document.getElementById("filtererror").innerHTML="";
		}	
		
		else if(issuer1.length < 2){
			 document.getElementById("filtererror").innerHTML="Issuer doesn't exit";
				error ="true";
		 }
		 else if(filter_value.length == 1){
			 document.getElementById("filtererror").innerHTML="Please select issuer";
				error ="true";
		 }
		 else{
		  document.getElementById("filtererror").innerHTML="";
		 }
		 
	}	
				
		if(ajax_issuer1 == "false")
		{
			
			
			if(filter_value1 == "-")
			{
				
				 document.getElementById("filter1error").innerHTML="Required field should not be empty";
					error ="true";
			}
			else
				{
				 document.getElementById("filter1error").innerHTML="Required field should not be empty";
					error ="true";
				}
			
	
		}	
	  
	  if(ajax_issuer1 == "true")
		{
		 
		var issuer1 = document.getElementById("approver1").value;
		if(issuer1.length > 2)
		{
			document.getElementById("filter1error").innerHTML="";
		}	
		
		else if(issuer1.length < 2){
			 document.getElementById("filter1error").innerHTML="Approver doesn't exit";
				error ="true";
		 }
		 else if(filter_value1.length == 1){
			 document.getElementById("filter1error").innerHTML="Please select approver";
				error ="true";
		 }
		 else{
		  document.getElementById("filter1error").innerHTML="";
		 }
		 
	}	
		 if(error == "true")
		 {
		 
	 return false;
		 }
		 var docprefix=document.getElementById("generated_id").value;
		 var auto_no=document.getElementById("auto_no").value;
		
		 $.ajax({
				type : "POST",
				url : "/QMS_App/ajax_formexisterror",
				data : "auto_no="+auto_no+"&document_id_hidden="+ docprefix,
				success : function(response) {
				//	alert("response"+response);	
				
		    	
		    		//	alert("if loop 0");
		    		if(response!=''){
		    		
		    		alert(response);}
		    		
		    		if(response=='')
		    			{
		    			document.forms[0].method = "POST";
		    			document.forms[0].action = "addform";
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
window.onload = function(){
	var name = document.getElementById('appro').value;
	var issu = document.getElementById('issu').value;
	if(name=="")
		{
		
		}
	else{
	AjaxProcessOwner(name.charAt(0));
	}
	if(issu == "")
		{
		
		}
	else{
		
		doAjaxPost(issu.charAt(0));
	}
	if(document.getElementById('id_hardcopy').checked)
		{
	
		var value1 = document.getElementById('id_hardcopy').value;
		toggle2(value1);
		}
	if(document.getElementById('id_electronic').checked){
		
		
		var value1 = document.getElementById('id_electronic').value;
		toggle2(value1);
	}
	if(document.getElementById('id_both').checked){
		
		
		var value1 = document.getElementById('id_both').value;
		toggle2(value1);
	}
	var fomid= document.getElementById('generated_id90').value;
	if(fomid=="")
		{
		
		}
	else{
	var res = fomid.split("-");
	document.getElementById("form_or_rec_id").focus();
    document.getElementById("form_or_rec_id").value = res[1];
	}

};
	</script>
<script>
  $('input[type=text]').on("focusout", function() {
    var dest = $(this);
    dest.val(jQuery.trim(dest.val()));        
    dest.val(dest.val().replace(/[ ]{2,}/, ' ')); 
     });

   
 
});
</script>
<script type="text/javascript">
function doAjaxPost(value) {
	document.getElementById('filter_value').style.display="none";
	 document.getElementById("issuer_generate").style.display="inline";
	var filer_value = value;
	
	$.ajax({
		type : "POST",
		url : "/QMS_App/ajax_getissuer",
		data : "filter_val=" + filer_value,
		success : function(response) {
			
			$('#issuer_generate').html(response);
			//$('#filter_value').hide();
		},
		error : function(e) {
			alert('Error: ' + e);
		}
	});
}
function AjaxProcessOwner(value) {
	document.getElementById('filter_value1').style.display="none";
	 document.getElementById("issuer_generate1").style.display="inline";
	var filer_value1 = value;
	
	$.ajax({
		type : "POST",
		url : "/QMS_App/ajax_getprocessowner",
		data : "filter_val=" + filer_value1,
		success : function(response) {
			
			$('#issuer_generate1').html(response);
			//$('#filter_value').hide();
		},
		error : function(e) {
			alert('Error: ' + e);
		}
	});
}
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
}/* 
function change_to_label_issuer()
{
	
    
	var type=document.getElementById("filter_value");	
	
	document.getElementById("lable_td_issuer").style.display="block";
	document.getElementById("edit_td_issuer").style.display="none";
	
	document.getElementById("issuer_full_lbl").innerHTML=type.value;
	
	}
function change_to_label_issuer1()
{
	
    
	var type=document.getElementById("filter_value1");	
	
	document.getElementById("lable_td_issuer").style.display="block";
	document.getElementById("edit_td_issuer1").style.display="none";
	
	document.getElementById("issuer_full_lbl1").innerHTML=type.value;
	
	}
function show_edit_issuer()
{
	  document.getElementById("issuer_generate").style.display="none";
	  document.getElementById("issuer_full_lbl").style.display="none";
document.getElementById("filter_value").style.display="block";

	
	}
function show_edit_issuer1()
{
	  document.getElementById("issuer_generate1").style.display="none";
	  document.getElementById("issuer_full_lbl1").style.display="none";
document.getElementById("filter_value1").style.display="block";

	
	}
 */

 function change_to_label_issuer()
 {
 	
 	ajax_issuer  = "true";
 	var type=document.getElementById("filter_value");	
 	letter = type.value;
 	
 	document.getElementById("lable_td_issuer").style.display="block";
 	document.getElementById("edit_td_issuer").style.display="none";
 	
 	document.getElementById("issuer_full_lbl").innerHTML=type.value;
 	
 	}
 function change_to_label_issuer1()
 {
 	
 	ajax_issuer1  = "true";
 	var type=document.getElementById("filter_value1");	
 	
 	document.getElementById("lable_td_issuer").style.display="block";
 	document.getElementById("edit_td_issuer1").style.display="none";
 	
 	document.getElementById("issuer_full_lbl1").innerHTML=type.value;
 	
 	}
 function show_edit_issuer()
 {
 	var let = letter;
 	issuerchange = "true";
 	ajax_issuer  = "false";
 	  document.getElementById("issuer_generate").style.display="none";
 	  document.getElementById("issuer_full_lbl").style.display="none";
 document.getElementById("filter_value").style.display="block";

 	
 	}
 function show_edit_issuer1()
 {
 	issuerchange1 = "true";
 	ajax_issuer1  = "false";
 	  document.getElementById("issuer_generate1").style.display="none";
 	  document.getElementById("issuer_full_lbl1").style.display="none";
 document.getElementById("filter_value1").style.display="block";

 	
 	}

 function change_to_label()
{
	
	var numbers = /^[0-9]+$/; 
	var type=document.getElementById("document_type_id");	
	var doc_id=document.getElementById("form_or_rec_id");	
	//var form_error_id=document.getElementById("form_or_rec_id");
	document.getElementById("lable_td").style.display="block";
	document.getElementById("edit_td").style.display="none";
	if(doc_id.value.length == ""){
		
		var color = "Required field should not be empty";
		var result = color.fontcolor("red");
		document.getElementById("document_id_full_lbl").innerHTML=result;
	}
	
	else if(doc_id.value.match(numbers))
	{
		if((doc_id.value.length < 4) || (doc_id.value.length > 15))
			{
			var color = "Required field should be a length of 4 to 15";
			var result = color.fontcolor("red");
			document.getElementById("document_id_full_lbl").innerHTML=result;
			}
		else{
	document.getElementById("document_id_full_lbl").innerHTML=type.value+-+doc_id.value;
			}
	}
	//document.getElementById("document_id_full_lbl").innerHTML=type.value+-+doc_id.value;
	var gen_id=document.getElementById("generated_id");
	gen_id.value=type.value+-+doc_id.value;
	 
	if((gen_id.value)!= null)
		{
       	form_id.value=gen_id.value;
       
		}

	}
 
function show_edit()
{
	
document.getElementById("lable_td").style.display="none";
	document.getElementById("edit_td").style.display="block";
	
	}
function show_lable()
{
	
	var doc_id3=document.getElementById("user_def_document_id");	
	var doc_id4=document.getElementById("user_def_document_id1");
	var gen_id1=document.getElementById("generated_id");
	gen_id1.value=doc_id3.value+-+doc_id4.value;
	document.getElementById("lable_td").style.display="block";
	document.getElementById("edit_td").style.display="none";
	document.getElementById("user_defined_td").style.display="none";
	document.getElementById("document_id_full_lbl").innerHTML=doc_id3.value+-+doc_id4.value;	
	
	} 
  function show_userdefined()
{
	
document.getElementById("lable_td").style.display="none";
	document.getElementById("edit_td").style.display="none";
	document.getElementById("user_defined_td").style.display="block";
	} 
  function hide_userdefined()
  {
  	
  document.getElementById("lable_td").style.display="none";
  	document.getElementById("edit_td").style.display="block";
  	document.getElementById("user_defined_td").style.display="none";
  	} 
  </script>
  <script>
 $(function() {
	 
           $( "#datepicker123" ).datepicker();
         });
 function toggle(value){
            	
            if(value!=null)
            	form_id.value=value;
            
            }
 

 </script>
 
 <script>

 $(window).load(function(){
 $("#form_or_rec_id").keyup(function() {
		
	 $("#quality3err").html(''); 
	/* var regex=/(^\d{5}$)|(^\d{5}-\d{4}$)/; */
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

});
 </script>
  
      <jsp:include page="footer.jsp"></jsp:include>
       