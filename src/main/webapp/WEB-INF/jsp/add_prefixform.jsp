<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="header.jsp"></jsp:include>
<script src="resources/js/jquery-1.7.2.min.js"></script>
<script src="resources/js/jquery-ui.js"></script>
<script src="resources/js/modal.js"></script>
<html>
<div id="right_content">
<form method="post" action="add_formprefix">
  <!-- <div id="right_content" style="background-color:lightgrey;"> -->
  
       <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      		<tr>
      		<td>
      		 <div>

 			 <div id="ddtopmenubar1">
				<div class="menu_container">
					<div class="menu_c">
						  <ul class="horizmenu" >
						  	<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="#" class="<c:choose>
								<c:when test="${menu=='document'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>" rel="document">
									<span>Add Set-up</span>
								</a>
							</li>
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="#" class="<c:choose>
									<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>"rel="document1">
									<span>List/Delete Set-up</span>
							</a>
							</li>
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="#" class="<c:choose>
									<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>" rel="deletedoc">
									<span>Delete</span>
							</a>
							</li>
							
				            
						</ul>  
						</div>
						
  <div class="clear"></div>
						<div>
						</div>						
					</div>					
				</div>
			</div>
			</td></tr>	
    <c:if test="${success=='insert'}">
			<tr>
				<td valign="top" align="left" style="padding: 5px 50px 10px 220px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<div id="success_statusbar" class="status success">
						<p class="closestatus">
						<img alt="Success" src="resources/images/icons/inserted.png">
						<a title="Close" href="add_prefixform">
						<img alt="Success" src="resources/images/icons/icon_square_close.png"></a>		
						</p>
					</div></td>
			</tr>
		</c:if>   	
      <tr>
        <td valign="top" align="left">
            <div class="headings altheading">
              <h2 style="padding-left: 50px">Add Form Prefix</h2>
            </div>
    <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
            
              <tr>
			<td align="left" valign="top" width="50%" style="padding-right: 25px;">
			<table cellpadding="0" cellspacing="0" border="0">
               <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" style="padding-left: 55px">Form Prefix :</td>
                  <td valign="top" align="left" class="input_txt"><input type="text" name="form_prefix" class="input_txtbx" maxlength="32" id="formprefix" value="${formPrefix.form_prefix}" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"onblur="ChangeCase(this);" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  onkeypress="return onlyAlphabets(event,this);""/>
                   <br> <span id="docprefix1" style="color:red">                           
                <c:if test="${success=='exist'}">Form Prefix already exists</c:if>
                 <form:errors path="FormPrefix.form_prefix"></form:errors></span></td>
                </tr>
                <tr height="10"></tr>
                <tr class="row2">
                  <td valign="top" align="left" class="input_txt" width="50%" style="padding-left: 55px">Description :</td>
                  <td valign="top" align="left" class="input_txt" >
                   <textarea   cols="27" rows="5" class="input_txtarea"  maxlength="400" name="form_name" id="formname">${formPrefix.form_name}</textarea>
                 <%--  <input type="text" name="form_name" maxlength="200" class="input_txtbx" id="formname" onblur="toggle(this.value)"onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${formprefix.form_name}" onInput="validateAlpha1();"/> --%>
                  <br> <span id="document_id1" style="color:red"></span>
                  <span class="err"><form:errors path="FormPrefix.form_name"></form:errors></span></td>
                </tr>
                  <tr height="10"></tr>
                 <tr class="row1">
                  <td valign="top" align="left">&nbsp;</td>
                  <td valign="top" align="left"><input type="submit" value="Submit" onclick="return validation();"class="submit_btn1"></td>
                </tr>
          
                
 </table>
 </td>
 </tr>
 </table>
 </div>
 </td>
 </tr>
 </table>
 </form>
 
 <script type="text/javascript">
 $(function() {
		$("#formprefix").on("keypress", function(e) {
			if (e.which === 32 && !this.value.length)
		        e.preventDefault();
		});
		});
$(function() {
		$("#formname").on("keypress", function(e) {
			if (e.which === 32 && !this.value.length)
		        e.preventDefault();
		});
		});
function validateAlpha(){
    var textInput = document.getElementById("formprefix").value;
    textInput = textInput.replace(/[^A-Za-z]/g, "");
    document.getElementById("formprefix").value = textInput;
}
/* function validateAlpha1(){
    var textInput = document.getElementById("formname").value;
    textInput = textInput.replace(/[^A-Za-z ]/g, "");
    document.getElementById("formname").value = textInput;
} */
function ChangeCase(elem)
{
    elem.value = elem.value.toUpperCase();
}
function onlyAlphabets(e, t) {
    try {
        if (window.event) {
            var charCode = window.event.keyCode;
        }
        else if (e) {
            var charCode = e.which;
        }
        else { return true; }
        if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123))
            return true;
        else
            return false;
    }
    catch (err) {
        alert(err.Description);
    }
}
 function validation()
 {
	
	var error="";
	 var cap = /[A-Z]+$/;
	 var desc = /[A-Za-z ]+$/;
	 var formprefix = document.getElementById('formprefix').value;
	 var formname= document.getElementById('formname').value;
	 document.getElementById("document_id1").innerHTML="";
	
	 
	 if(formname =="")
	 {
	 document.getElementById("document_id1").innerHTML="Required field should not be empty";
	 error="true";
	 }
 else if(formname.charAt(0)==" ")
	 {
	 document.getElementById("document_id1").innerHTML="Should not accept initial space";
	 error="true";
	 }
	
 else if(formname.length<4)
	 {
	 document.getElementById("document_id1").innerHTML="Required field should be of length 4 to 400.";
	 error="true";
	 }
	 
 else if(formname.match(desc))
	 {
	 	 document.getElementById("document_id1").innerHTML="";
	 }

	 
	 
	 if(formprefix =="")
	 {
	 document.getElementById("docprefix1").innerHTML="Required field should not be empty";
	 error="true";
	 }
 else if(formprefix.charAt(0)==" ")
	 {
	 document.getElementById("docprefix1").innerHTML="Should not accept initial space";
	 error="true";
	 }
 else if(formprefix.length<4)
	 {
	 document.getElementById("docprefix1").innerHTML="Required field should be of length 4 to 15.";
	 error="true";
	 }
 else if(formprefix.match(cap))
	 {
	 	 document.getElementById("docprefix1").innerHTML="";
	 }
	 
 
	 if(error=="true")
		 {
		 return false;
		 }
 
 }
 
 </script>
 
 <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
 </div>
      <jsp:include page="footer.jsp"></jsp:include> 
 </html>