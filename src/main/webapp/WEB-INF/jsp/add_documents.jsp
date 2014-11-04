<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="header.jsp"></jsp:include>
<script src="/QMS_App/resources/js/jquery.js"></script>
<link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" />
<link rel="stylesheet" href="http://s.codepen.io/assets/reset/normalize.css" type="text/css" />
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/jquery-ui.js"></script>  	
<script src="resources/js/jquery.min.js"></script>

<script src="resources/js/jquery-1.7.2.min.js"></script>

<script src="resources/js/jquery-ui.js"></script>

<script src="resources/js/modal.js"></script>

<script src="resources/js/popover.js"></script>

<script src="resources/js/transition.js"></script>
<form method="post" enctype="multipart/form-data" action="insert_documents">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" he class="margin_table">
     <tr>
        <td>
        <div>
  						<ul class="horizmenu">
						
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="adddocument" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									Add Document
									
								</a>
							</li>
						
				          <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="viewdocuments" class="<c:choose>
								<c:when test="${menu=='document'}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									View Document
									
								</a>
							</li>
				            <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="document_report" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									Document report
									
								</a>
							</li>
							
				             </ul>
  </div>
        </td>
      </tr>
    
      <tr>
        <td valign="top" align="left"><!-- <!-- 
            <div class="headings altheading">
              <h2>&nbsp;&nbsp;Document Details</h2> 
            </div> -->
            <div class="contentbox" >
           <h1 style="color:#7A3A3A;font-size:20px;">Add Document Details</h1>
                    
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
              <td colspan="3">
            <!--  <div id="child_table" style="display:none;"> -->
<br>
              
             <div style="border:#993300  2px solid; padding:15px; margin-bottom:15px;">
             <table cellpadding="0" cellspacing="0" border="0" width="100%" >
    		
                <tr class="row1">
                 <td valign="middle" align="left" class="input_txt" width="20%">Document ID :
               <input type="hidden" name="document_id_hidden" id="generated_id" class="input_txtbx"  value=""/>
               <input type="hidden" name="auto_number" value="<c:out value="${id }"/>"/> 
             
               </td>
               <td valign="top" align="left" class="input_txt1" width="15%" id="lable_td" style="display:none;">
               <label id="document_id_full_lbl"></label>
              
               <a href="#" style="text-decoration: none;" onclick="show_edit()">&nbsp;&nbsp;Change</a>            
               <br/><span id="documentidexit" style="color:red"></span>
               </td>          
              
               <td valign="top" align="left" id="edit_td" class="input_txt1" width="15%">
               <table style="" class="simple_table" border="0">
               <tr ><td align="left" height="10px" width="10%" valign="bottom">
               <select name="document_type_id" id="document_type_id" class="input_txtbx" style="width:110px; margin:0 0 0 -10px;margin-right:-1px;">
               <c:forEach items="${documentPrefixForm.documentPrefixs}" var="prefix" varStatus="status">
        	   <option value="${prefix.doc_prefix}">${prefix.doc_prefix}</option>
			   </c:forEach>
               </select></td><td align="left" width="10%">
              
               <input type="text" value="" class="input_txtbx" id="document_id" style="width:75px;margin:0 0 0 -10px;" min="4" maxlength="32" name="document_id" onblur="change_to_label();" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"onkeypress="return onlynumeric(event,this);"/>
               <input type="hidden"value="${documentMain.document_id}" id="document_id11" />
                 
               </td>
            
               </tr>
                <tr><td colspan="2"width="25%"><span id="documentiderror" style="color:red"></span></td></tr></table>
            
              <c:if test="${fail=='fail'}">
              <p class="closestatus">
						<span style="color:red">Required Field Should not be Blank</span>
						</p>
              </c:if>
              <br>
              <%--   <c:if test="${success=='exist'}"><span style="color:red">Document ID already Exist</span></c:if> --%>
              </td>
              
              
               <td valign="top" align="left" class="input_txt" width="5%">Media Type :</td>
               <td valign="top" align="left" class="input_txt" width="89px;">
               
             
               
                 <input type="radio" name="media_type" onchange="toggle1(this.value);" value="hardcopy" id="id_hardcopy" <c:if test="${documentMain.media_type=='hardcopy'}"><c:out value="checked" /></c:if>/>Hard Copy&nbsp;&nbsp;&nbsp;
                <input type="radio" name="media_type" value="electronic"  id="id_electronic" onchange="toggle1(this.value);" <c:if test="${documentMain.media_type=='electronic'}"><c:out value="checked" /></c:if>/>Electronic&nbsp;<span class="err"></span>
                <input type="radio" name="media_type"value="both"  id="id_both" onchange="toggle1(this.value);" <c:if test="${documentMain.media_type=='both'}"><c:out value="checked" /></c:if>/>Both&nbsp;&nbsp;&nbsp;<br/>
                <span id="mediatypeerror" style="color:red"></span>
               
                    <span class="err" style="color:red"><form:errors path="DocumentMain.media_type"></form:errors></span> 
               </td>
           <td valign="top" align="left" class="input_txt" width="20%"></td>
              
             </tr> 
             
             
            
             
             
              
              <tr class="row2">
              
               <td valign="middle" align="left" class="input_txt" >Document Title :</td>
               <td valign="middle" align="left" class="input_txt" width="30%"><input type="text" name="document_title" class="input_txtbx" id="documenttitle"  value="${documentMain.document_title}" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"onkeypress="return onlyAlphabetsnumeric(event,this);"/><br/>
                <span id="documenttitle1" style="color:red"></span>
                <span class="err"style="color:red" ><form:errors path="DocumentMain.document_title"></form:errors></span></td>
              
               <td valign="middle" id="id_location_lbl" align="left" class="input_txt" width="25%"><label id="location_label" >Location:</label><br><label id="file_upload_label" style="display:none;"> Upload File:</label></td>
               <td valign="middle" align="left" id="id_location_txt" class="input_txt" >
               
               <select id="location_text" name="location" class="input_txtbx">
              <option value = "">--Select Location--</option>
			                <c:forEach items="${formLocationForm.formLocations}" var="formlocation" varStatus="status">
        				       <option value="${formlocation.form_location}"<c:if test="${formlocation.form_location == documentMain.location}"><c:out value="selected"/></c:if>>${formlocation.form_location}</option>
			                  </c:forEach> </select>
			            <span id="hard" style="color:red"></span>
			                  <br>
              <input name="attachments" style="display:none;" id="id_file" type="file" /> <br/>
               <span id="attach" style="color:red"></span>
         
               </td>
          
           <td valign="middle" id="softcopy_file_label" style="display:none;" align="left" class="input_txt" width="20%"></td>
               <td valign="top" id="softcopy_file_upload" style="display:none;" align="left" class="input_txt" width="25%"><div ><br/></div></td>
     
          
           <td valign="top" align="left" class="input_txt" width="20%"></td>
              
             </tr> 
             <tr class="row1">
              
               <td valign="middle" align="left" class="input_txt">Document Type :</td>
              <td valign="top" align="left" class="input_txt" width="15%">
              <select name="document_type" id="documenttype" class="input_txtbx">
              <option value="">--Select--</option>
                <c:forEach items="${documentTypeForm.documentTypes}" var="documenttype" varStatus="status">
        				       <option value="${documenttype.document_type}"<c:if test="${documenttype.document_type == documentMain.document_type}"><c:out value="selected"/></c:if>>${documenttype.document_type}</option>
			                  </c:forEach> </select>
             <br/>
             
             <span  id="documenttypeerror" style="color:red" ></span>
             <span class="err"style="color:red" ><form:errors path="DocumentMain.document_type"></form:errors></span></td>
             <td valign="middle" align="left" class="input_txt" width="25%">Process :</td>
               <td valign="top" align="left" class="input_txt" width="25%">
               
               <select name="process" id="id_inpprocess" onchange="doAjaxPost_for_process();" class="input_txtbx" >
               <option value="">--Select--</option>
               <c:forEach items="${processForm.processes}" var="processes" varStatus="true">
               <option value="<c:out value="${processes.process_name}"/>" <c:if test="${documentMain.process==processes.process_name}"><c:out value="Selected"/></c:if>><c:out value="${processes.process_name}"/></option>
               </c:forEach>
               </select>
               <br/>
               
                <span id="inprocesserror" style="color:red"></span>
               <span class="err"style="color:red"><form:errors path="DocumentMain.process"></form:errors></span></td>
            <td valign="top" align="left" class="input_txt" width="20%"></td>
              
             </tr> 
             <tr class="row2">
              
               <td valign="middle" align="left" class="input_txt">
               <td valign="top" align="left" class="input_txt" width="20%"><br/>
               <td valign="middle" align="left" class="input_txt" width="20%"><span class="err">External Document ?(Y/N) :</td>
               <td valign="top" align="left" class="input_txt" width="25%">
               
              <input type="radio" name="external" value="Yes"  id="id_yesforexternal"checked>Yes&nbsp;&nbsp;&nbsp;
              <input type="radio" name="external" value="No" id="id_noforexternal"  >No&nbsp;&nbsp;&nbsp;<br/>
               <span class="err" style="color:red"><form:errors path="DocumentMain.external"></form:errors></span>
               </td>
            <td valign="top" align="left" class="input_txt" width="20%"><span class="err"></span></td>
              
             </tr>
               
            
            
            </table>
           
            </td>
           
            </table>
          
      </td>
      </tr>
      
     
              <td colspan="1">
            <!--  <div id="child_table" style="display:none;"> -->
<br><!-- 
 <div class="headings altheading">
              <h2>&nbsp;&nbsp;Revision Details</h2> -->
                <div class="contentbox">
           <h1 style="color:#7A3A3A;font-size:20px;">Add Revision Details</h1>
             <div style="border:#993300  2px solid; padding:15px; margin-bottom:15px;">
              
              
             <table cellpadding="0" cellspacing="0" border="0" width="100%" >
    		
    <tr class="row2">
                            <td valign="middle" align="left" class="input_txt">Document Id :</td>
																		<td valign="top" align="left" class="input_txt"><input
																			type="text" class="input_txtbx" readonly="readonly" id="documentid"
																			name="document_id"
																			value="" /><br/>
																		
																		<span class="err" style="color:red"><form:errors path="DocumentMain.document_id"></form:errors></span> 
																			</td>
																			
																		  <td valign="middle" align="left" class="input_txt" width="25%">Date:</td>
               <td valign="top" align="left" class="input_txt" width="20%"><input type="text" id="datepicker123" name="date" class="input_txtbx"  value="${documentMain.date}"/><br/>
               <span id="datepicker1234"style="color:red"></span>
               <span class="err"style="color:red"><form:errors path="DocumentMain.date"></form:errors></span> </td>
              	
								
</tr>             
             <tr class="row1" style="border:none;">
           
            <td valign="middle" align="left" class="input_txt" width="20%">Issuer :</td>
               <td valign="top" align="left" id="edit_td_issuer" class="input_txt" width="30%">
                <input type="hidden" value="${documentMain.issuer}" id="issu"/>
               <select name="filter" id="filter_value" class="input_txtbx" onchange="doAjaxPost(this.value);" onblur="change_to_label_issuer();" >
               <option value="-">--Select--</option>
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
                  <br>
                 
                <span id="filtererror" style="color:red"></span>
               <span class="err"style="color:red"><form:errors path="DocumentMain.issuer"></form:errors></span> 
              
                <label id="issuer_full_lbl"></label><a href="#" style="text-decoration: none;" onclick="show_edit_issuer()">&nbsp;&nbsp;Change</a>            
               <br/>
            
             
               </td> 
                <td valign="middle" align="left" class="input_txt" width="25%">Approved by Process owner :</td>
               <td valign="top" align="left" id="edit_td_issuer1" class="input_txt" width="20%">
               <input type="hidden" value="${documentMain.approver1}" id="appro">
               
               
               </input>
               <select name="filter" id="filter_value1" class="input_txtbx" onchange="AjaxProcessOwner(this.value);" onblur="change_to_label_issuer1();" >
            
               <option value="-">--Select--</option>
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
                    <br><span id="filter1error" style="color:red"></span>
                <span class="err"style="color:red"><form:errors path="DocumentMain.approver1"></form:errors></span> 
            
                <label id="issuer_full_lbl1"></label><a href="#" style="text-decoration: none;" onclick="show_edit_issuer1()">&nbsp;&nbsp;Change</a>            
               <br/>
               
              </td>
              <td valign="top" align="left" class="input_txt" width="20%"></td>
                 </tr>  
              <tr class="row2" style="border:none;">
              
            <%--     <td valign="middle" align="left" class="input_txt" width="25%">Revision Level:</td>
               <td valign="top" align="left" class="input_txt" width="20%">
               <select name="revision_level" id="revisionlevel" class="input_cmbbx1" >
              
                <c:forEach items="${documentRevisionLevelForm.documentRevisionLevels}" var="revisionlevel" varStatus="status">
        				       <option value="${revisionlevel.revision_level}">${revisionlevel.revision_level}</option>
			                  </c:forEach> </select>
             <br/>
             <span class="err"><form:errors path="DocumentMain.revision_level"></form:errors></span></td>--%>
             
                 <td valign="middle" align="left" class="input_txt">Revision Level :</td>
           
               <td valign="top" align="left" class="input_txt1" width="20%">
               <input type="text" name="revision_level" class="input_txtbx" id="revisionlevel"  value="${documentMain.revision_level}" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"onkeypress="return onlyAlphabetsnumeric(event,this);"/><br/>
               <span id="revisionlevel1" style="color:red"></span>
        <%--  <select name="revision_level" id="revisionlevel" class="input_cmbbx1" style="width:100%;height:18px;beckground:lightgrey;">
               				<option value="">--select--</option>
                              <c:forEach items="${documentRevisionLevelForm.documentRevisionLevels}" var="revisionlevel" varStatus="status">
        				       <option value="${revisionlevel.combined_output}">${revisionlevel.combined_output}</option>
			                  </c:forEach> </select>  --%>
              <span class="err"style="color:red"><form:errors path="DocumentMain.revision_level"></form:errors></span> 
             
            </td>
              
               <%-- <input type="text" id="revision_level" name="revision_level" class="input_txtbx1"  value="${documentMain.revision_level }"/><br/>
              <span class="err"style="color:red"><form:errors path="DocumentMain.revision_level"></form:errors></span> --%>
               <td valign="middle" align="left" class="input_txt" width="20%">Approved by Documents Control Admin :</td>
               <td valign="top" align="left" class="input_txt" width="25%">
                <select name="approver2" id="id_inpapprover2"  class="input_txtbx" >
               <option value="">--Select--</option>
               <c:forEach items="${employeeForm1.employees}" var="employees" varStatus="true">
               <option value="<c:out value="${employees.name}"/>"<c:if test="${documentMain.approver2==employees.name}"><c:out value="Selected"/></c:if>><c:out value="${employees.name}"/></option>
               </c:forEach>
               
               
               
               </select>
               
               <br/>
               <span id="approver2error" style="color:red"></span>
                <span class="err"style="color:red"><form:errors path="DocumentMain.approver2"></form:errors></span></td>
            <td valign="top" align="left" class="input_txt" width="20%"><span class="err"></span></td>
             </tr>
             <tr class="row1" style="border:none;">
               <td valign="top" align="left" class="input_txt" ><span class="err"></span></td>
              <td valign="top" align="left" class="input_txt" width="20%"><span class="err"></span></td>
                <td valign="middle" align="left" class="input_txt" width="20%">Approved by QMS Manager :</td>
               <td valign="top" align="left" class="input_txt" width="25%">
               <select name="approver3" id="id_inpapprover3"  class="input_txtbx" >
               <option value="">--Select--</option>
               <c:forEach items="${employeeForm2.employees}" var="employees" varStatus="true">
               <option value="<c:out value="${employees.name}"/>"<c:if test="${employees.name == documentMain.approver3}"><c:out value="selected"/></c:if>><c:out value="${employees.name}"/></option>
               </c:forEach>
              </select>
               
               <br/>
                <span id="approver3error" style="color:red"></span>
               <span class="err"style="color:red"><form:errors path="DocumentMain.approver3"></form:errors></span> </td>
          
             </tr>  
              <tr class="row2" style="border:none;">
                 <td valign="middle" align="left" class="input_txt">Comments :</td>
               <td valign="top" align="left"><textarea class="input_txtbx" id="comments"  name="comments"  style="height: 89px;" >${documentMain.comments}</textarea><br/>
              <span id="comments1" style="color:red"></span>
                <span class="err"style="color:red"><form:errors path="DocumentMain.comments"></form:errors></span></td>
         
               <td valign="top" align="left" class="input_txt" width="20%">Status :</td>
               <td valign="top" align="left" class="input_txt" width="25%">
              
               
              <select name="status" id="status" class="input_txtbx" >
              <option value="">--Select--</option>
               <option value="Draft" <c:if test="${documentMain.status=='Draft'}"><c:out value="Selected"/></c:if>>Draft</option>
               <option value="Active" <c:if test="${documentMain.status=='Active'}"><c:out value="Selected"/></c:if>>Active</option>
               <option value="Obsolete" <c:if test="${documentMain.status=='Obsolete'}"><c:out value="Selected"/></c:if>>Obsolete</option>
               </select>
                
               <br/>
               <span id="statuserror"style="color:red"></span>
               
               <span class="err"style="color:red"><form:errors path="DocumentMain.status"></form:errors></span> </td>
            <td valign="top" align="left" class="input_txt" width="20%"><span class="err"></span></td>
             </tr>
             
             </table></div>
             </div>
           <!--   <tr class="row1" >
             <td colspan="2" align="center">
             <input align="left" class="submit_btn1" type="submit" id="submit" onclick="return validation();" name="submit" value="Submit" style="margin-left:17%;"></td>
          	
          
</tr> -->
  <tr class="row1">
                  <td valign="bottom" colspan="4"align="right" style="padding-right: 135px">&nbsp;<input type="submit" value="Submit" onclick="return validation();"class="submit_btn1"></td>
                
                </tr>
</table></div></form>
<script>
$(function() {

	$("#document_id").on("keypress", function(e) {
		
		if (e.which === 32 && !this.value.length)
	        e.preventDefault();
	});
	});
$(function() {

	$("#documenttitle").on("keypress", function(e) {
		
		if (e.which === 32 && !this.value.length)
	        e.preventDefault();
	});
	});

$(function() {

	$("#revisionlevel").on("keypress", function(e) {
		
		if (e.which === 32 && !this.value.length)
	        e.preventDefault();
	});
	});

$(function() {

	$("#comments").on("keypress", function(e) {
		
		if (e.which === 32 && !this.value.length)
	        e.preventDefault();
	});
	});
	</script>
	
  <script type="text/javascript">
function validatename(id){
	
    var textInput = document.getElementById(id).value;
    textInput = textInput.replace(/[^A-Za-z0-9 ]/g, "");
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

<script type="text/javascript">
var ajax_issuer = "false";
var issuerchange = "false";
var ajax_issuer1 = "false";
var issuerchange1 = "false";
var letter  = "-";
function toggle1(value){
	
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
		
	    }
	else if(value=='hardcopy')
	    {
		e.style.display="block";
		e1.style.display="none";
		e2.style.display="block";
		e3.style.display="none";
	  
	    }
	else if(value=='both')
		{
		e.style.display="block";
		e1.style.display="block";
		e2.style.display="block";
		e3.style.display="block";
		}
	    
	}
	
	
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
function validaterevision(){
    var textInput = document.getElementById("revisionlevel").value;
    textInput = textInput.replace(/[^A-Za-z0-9.]/g, "");
    document.getElementById("revisionlevel").value = textInput;
}
	
function validation()
{
	
	
	var date = /^(0?[1-9]|1[012])[\/](0?[1-9]|[12][0-9]|3[01])[\/]\d{4}$/;
	var dotnumber = /^[a-zA-Z0-9]*$|[a-zA-Z0-9][\w\.]+[a-zA-Z0-9]$/;
	
	 var error ="";
	 var document_id = document.getElementById('document_id').value;
	 var id_hardcopy = document.getElementById('id_hardcopy').checked;
	 var id_electronic = document.getElementById('id_electronic').checked;
	 var id_both = document.getElementById('id_both').checked;
	 var location_text = document.getElementById('location_text').value;
	 var documenttype = document.getElementById('documenttype').value;
	 var id_inpprocess = document.getElementById('id_inpprocess').value;
	 var filter_value = document.getElementById('filter_value').value;
	 var filter_value1 = document.getElementById('filter_value1').value;
	 var datepicker123=document.getElementById('datepicker123').value;
	 var e2=document.getElementById('location_text').value;
	 var e3=document.getElementById('id_file').value;
	 var documenttitle = document.getElementById('documenttitle').value;
	 var revisionlevel = document.getElementById('revisionlevel').value;
	 var comments = document.getElementById('comments').value;
	 var id_inpapprover2 = document.getElementById('id_inpapprover2').value;
	 var id_inpapprover3 = document.getElementById('id_inpapprover3').value;
	var status = document.getElementById('status').value;
	document.getElementById("hard").innerHTML="";
	 document.getElementById("mediatypeerror").innerHTML= "";
	 document.getElementById("attach").innerHTML="";
	 if(id_inpapprover2 == "")
		{
		 
			 document.getElementById("approver2error").innerHTML="Required field should not be empty";
				error ="true";
		}
		 else
			 {
			 document.getElementById("approver2error").innerHTML="";
			 }
		 if(id_inpapprover3 == "")
			{
			 
				 document.getElementById("approver3error").innerHTML="Required field should not be empty";
					error ="true";
			}
			 else
				 {
				 document.getElementById("approver3error").innerHTML="";
				 }
		 
		 if(status == "")
			{
			
				 document.getElementById("statuserror").innerHTML="Required field should not be empty";
					error ="true";
			}
			 else
				 {
				 document.getElementById("statuserror").innerHTML="";
				 }
		
	 if(document_id == "")
		 {
		
		 document.getElementById("documentiderror").innerHTML="Required field should not be empty";
			error ="true";
		 }
	 else
		{
		 document.getElementById("documentiderror").innerHTML= "";
		}
	
	 if(document_id!=""){
		 if(document.getElementById("document_id").value.length<4 || document.getElementById("document_id").value.length>15 ){
			 document.getElementById("documentiderror").innerHTML="Required field should be length 4 to 15";
				error ="true";
			 } 
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
		
	 }
	 
	 
	 
	 
	 
	 if(document.getElementById('id_electronic').checked)
	{
		 if(e3=="")
			 {
			
			 document.getElementById("attach").innerHTML="No file uploaded";
			 error ="true";
			 }
		
	}
	 
	 
	 
	 
	if(document.getElementById('id_both').checked)
		{
		if(e2=="")
		{
			 
		document.getElementById("hard").innerHTML="Required field should not be empty";
		error ="true";
		}
	
		 if(e3=="")
		 {
			 
		 document.getElementById("attach").innerHTML="No file uploaded";
		 error ="true";
		 }
	
		}
	
	
	
	
	
	 if(documenttitle =="")
	 {
		 
		 document.getElementById("documenttitle1").innerHTML="Required field should not be empty";
		 error ="true";
	 }
	 else if(documenttitle.charAt(0) == " ")
	{
		 document.getElementById("documenttitle1").innerHTML="Should not accept initial space";
		 error ="true";
	}
	 else
	 {
		 if((documenttitle.length < 4) ||(documenttitle.length > 32))
	 	{
			 document.getElementById("documenttitle1").innerHTML="Required field should be length 4 to 32";
			   	error ="true";
 		 }
		 else
		 {
			 document.getElementById("documenttitle1").innerHTML= "";
		 }
	}
	
	if(documenttype == "")
	{
		
		 document.getElementById("documenttypeerror").innerHTML="Required field should not be empty";
		 error ="true";
	}
	else
	{
		 document.getElementById("documenttypeerror").innerHTML="";
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
	
	 if(revisionlevel == "")
		 {
		
		 document.getElementById("revisionlevel1").innerHTML="Required field should not be empty";
		 error ="true";
		 }
	 else if(revisionlevel.charAt(0) ==" ")
	 {
		 document.getElementById("revisionlevel1").innerHTML="Required field should not be spaces";
		 error ="true";
	 }	 
	 else if(revisionlevel.length > 10)
		{
		 document.getElementById("revisionlevel1").innerHTML="Required field should be length 1 to 10";
		 error ="true";
		}
	 else if(revisionlevel.match(dotnumber))
		 {
		 if(revisionlevel.charAt(0) ==("@" ) || revisionlevel.charAt(0) ==("!")||  revisionlevel.charAt(0) ==("#")
				 ||revisionlevel.charAt(0) ==("$")||revisionlevel.charAt(0) ==("%")||revisionlevel.charAt(0) ==("^")||revisionlevel.charAt(0) ==("&")
				 ||revisionlevel.charAt(0) ==("*")||revisionlevel.charAt(0) ==(")")||revisionlevel.charAt(0) ==("(")||revisionlevel.charAt(0) ==("'")||revisionlevel.charAt(0) ==(":")
						 ||revisionlevel.charAt(0) ==(";") || revisionlevel.charAt(0) ==('"'))
			 {
			 document.getElementById("revisionlevel1").innerHTML="Required field should be alpha-numeric";
			 error ="true";
			 }
		 else{
			 document.getElementById("revisionlevel1").innerHTML="";
			 }
		 }
	 
		 
	 else{
		 document.getElementById("revisionlevel1").innerHTML="Required field should be alpha-numeric";
		 error ="true";
	 }

		
	 
	
	 
	 
	 if(comments =="")
		 {
		
		 document.getElementById("comments1").innerHTML="Required field should not be empty";
		 error ="true";
		 }
	 else if(comments.charAt(0) ==" ")
	 {
		 document.getElementById("comments1").innerHTML="Required field should not be space";
		 error ="true";
	 }
	 else if((comments.length < 4) || (comments.length > 400) )
		 {
		 document.getElementById("comments1").innerHTML="Required field should be length 4 to 400";
		 error ="true";
		 }
	 	else{
				 document.getElementById("comments1").innerHTML="";
				 
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
				 document.getElementById("filtererror").innerHTML="Please select one";
					error ="true";
			 }
			 else{
			  document.getElementById("filtererror").innerHTML="";
			 }
			 
		}	
			/*  if(issuerchange == "true")
			{
				alert("change");
				alert(filter_value);
				alert(issuer1.charAt(0));
				var filter = "";
				var issuer1 = document.getElementById("issuer1").value;
				if(issuer1.charAt(0) == filter_value.charAt(0))
				{
				issuer1 = "";
				alert("empty");
				alert(issuer1);
				if(issuer1.length <= 1)
				{
					 document.getElementById("filtererror").innerHTML="Please Select Issuer";
						error ="true";
				}
				else
					{
					 document.getElementById("filtererror").innerHTML="";
					}
				}
			} */
		/*  if(filter_value1 == "-")
				{
				 
					 document.getElementById("filter1error").innerHTML="Required Field Should not be Empty";
						error ="true";
				}
			 else
				 {
				 document.getElementById("filter1error").innerHTML="";
				 } */
					
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
				 document.getElementById("filter1error").innerHTML="Process owner doesn't exit";
					error ="true";
			 }
			 else if(filter_value1.length == 1){
				 document.getElementById("filter1error").innerHTML="Please Select one";
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
		 var document_id = document.getElementById('generated_id').value;
		 //var equipment_id=document.getElementById("equipment_id").value;
		
		 $.ajax({
				type : "POST",
				url : "/QMS_App/ajax_documentcorrerror",
				data : "document_id_hidden="+document_id,
				success : function(response) {
				//	alert("response"+response);	
				
		    	
		    		//	alert("if loop 0");
		    	if(response!='')
		    		{
		    		alert(response);
		    		}
		    		if(response=='')
		    			{
		    			document.forms[0].method = "POST";
		    			document.forms[0].action = "insert_documents";
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
         $(function() {
        	 
             $( "#datepicker" ).datepicker();
             $( "#datepicker123" ).datepicker();
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
}

function change_to_label()
{
	
	var numbers = /^[0-9]+$/; 
	var type=document.getElementById("document_type_id");	
	var doc_id=document.getElementById("document_id");	
	document.getElementById("lable_td").style.display="block";
	document.getElementById("edit_td").style.display="none";
	if(doc_id.value.match(numbers))
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
	else{
		var color = "Please enter numeric values";
		var result = color.fontcolor("red");
		document.getElementById("document_id_full_lbl").innerHTML=result;
	}
	var gen_id=document.getElementById("generated_id");
	gen_id.value=type.value+-+doc_id.value;
	
	if((gen_id.value)!= null)
	{
   	documentid.value=gen_id.value;
   
	}

}

    function toggle(value){
    	
    if(value!=null)
    	documentid.value=value;
    
    }
   
function show_edit()
{
	
document.getElementById("lable_td").style.display="none";
	document.getElementById("edit_td").style.display="block";
	
	}
function show_lable()
{
	
	var doc_id3=document.getElementById("user_def_document_id1");	
	var doc_id4=document.getElementById("user_def_document_id2");
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
  function show_filter()
  {
  	
  document.getElementById("filter_value").style.display="inline";
  document.getElementById("issuer_generate").style.display="none";
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
			toggle1(value1);
			}
		if(document.getElementById('id_electronic').checked){
			
			
			var value1 = document.getElementById('id_electronic').value;
			toggle1(value1);
		}
		if(document.getElementById('id_both').checked){
			
			
			var value1 = document.getElementById('id_both').value;
			toggle1(value1);
		}
		var docid= document.getElementById('document_id11').value;
		if(docid=="")
			{
			
			}
		else{
		var res = docid.split("-");
		document.getElementById("document_id").focus();
	    document.getElementById("document_id").value = res[1];
		}
	}
		</script>
 		
      <jsp:include page="footer.jsp"></jsp:include>
 