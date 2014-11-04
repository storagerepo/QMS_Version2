<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="header.jsp"></jsp:include>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="resources/js/jquery.min.js"></script>
 <script src="resources/js/jquery-ui.js"></script>
 <link rel="stylesheet" href="resources/css/jquery-ui.css"
	type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Form Process</title>
</head>
<body>
<form method="post" action="update_process">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
        <td>
        <div>
  <ul class="horizmenu">
						
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="add_process" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span >Add Process</span>
									
								</a>
							</li>
						<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="process_list" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									<span >View Process</span>
								</a>
							</li>
				          
							</ul>
  </div>
        </td>
      </tr>
      <tr>
        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2 style="padding-left: 50px">Update Process</h2>
            </div>  <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
               <c:set value="${processForm.processes[0]}" var="process"> </c:set>
             
              <tr>
			<td align="left" valign="top" width="50%" style="padding-right: 25px;">
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr class="row2">
                
                  <td valign="middle" align="left" class="input_txt" width="30%" style="padding-left: 55px">Process ID :</td>
               
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="hidden" name="auto_id" class="input_txtbx" id="auto_id" value="${process.auto_id}"><input type="text" name="process_id" class="input_txtbx" id="processid" onblur="toggle(this.value)"onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${process.process_id}" readonly="readonly" /><span class="err"><form:errors path="Process.process_id"></form:errors></span>
                  <c:if test="${success=='exist'}"><span style="color:red">Process ID already Exist</span></c:if>
                  </td>
                </tr>
                <tr height="10"></tr>
                 <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="30%" style="padding-left: 55px">Process Name :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="process_name" maxlength="32" class="input_txtbx" id="processname"onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${process.process_name}" onkeypress="return onlyAlphabets(event,this);"	 />
                  <br><FONT SIZE="+1" color="red"> <span id="processname2" style="color: red"> 
                  <c:if test="${success=='exists'}">Process Name already exist</c:if>
                <form:errors path="Process.process_name"></form:errors></span></td></FONT>
                </tr>
                 <tr height="10"></tr>
                 <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="30%" style="padding-left: 55px">Process Owner :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="process_owner" maxlength="32"  class="input_txtbx" id="processowner"onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${process.process_owner}" onkeypress="return onlyAlphabets(event,this);"	 />
               <br>  <FONT SIZE="+1" color="red">  <span id="processowner2"></span></FONT>
                  <span class="err"><form:errors path="Process.process_owner"></form:errors></span></td>
                </tr>
                 <tr height="10"></tr>
                 <tr class="row1">
                  <td valign="top" align="right">&nbsp;</td>
                  <td valign="top" align="left"><input type="submit" value="Update" onclick="return validation();"class="submit_btn1"></td>
                </tr>
             </table>
             </td>
             </tr>
             </table>
             </div>
             </div>
             </td>
             </tr>
             <tr><td height="350"></td></tr>
             </table>
             </div>
             </form>
           <script type="text/javascript">
           $(function() {
       		$("#processname").on("keypress", function(e) {
       			if (e.which === 32 && !this.value.length)
       		        e.preventDefault();
       		});
       		});
        $(function() {
       		$("#processowner").on("keypress", function(e) {
       			if (e.which === 32 && !this.value.length)
       		        e.preventDefault();
       		});
       		});
       		function validateAlpha(){
	    var textInput = document.getElementById("processid").value;
	    textInput = textInput.replace(/[^A-Z0-9]/g, "");
	    document.getElementById("processid").value = textInput;
	}
 function validateAlpha1(){
	    var textInput = document.getElementById("processname").value;
	    textInput = textInput.replace(/[^A-Za-z ]/g, "");
	    document.getElementById("processname").value = textInput;
	}
 function validateAlpha2(){
	    var textInput = document.getElementById("processowner").value;
	    textInput = textInput.replace(/[^A-Za-z ]/g, "");
	    document.getElementById("processowner").value = textInput;
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
         if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123)|| (charCode==32))
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
	 var number = /^[A-Za-z0-9]*$/;
	 var chars = /[A-Za-z ]+$/;
	 var processid = document.getElementById('processid').value;
	 var processname = document.getElementById('processname').value;
	 var processowner = document.getElementById('processowner').value;	
	
	 document.getElementById("processname2").innerHTML="";
	 document.getElementById("processowner2").innerHTML="";
	 
	/*  if(processid=="")
		 {
		 document.getElementById("processid1").innerHTML=msg;
		 error="true";
		 }
	 else if(processid.charAt(0)==" ")
	 {
	 document.getElementById("processid1").innerHTML=spmsg;
	 error="true";
	 }
	 else if(processid.length<4)
	 {
		 document.getElementById("processid1").innerHTML=ermsg;
		 error="true";
	 } */
	 if(processname=="")
		 {
		 document.getElementById("processname2").innerHTML="Required field should not be empty";
		 error="true";
		 }
	 else if(processname.charAt(0)==" ")
	 {
	 document.getElementById("processname2").innerHTML="Should not accept initial space";
	 error="true";
	 }
	 else if(processname.length<4)
	 {
		 document.getElementById("processname2").innerHTML="Required field should be of length 4 to 32";
		 error="true";
	 }
	 
	 if(processowner=="")
		 {
		 document.getElementById("processowner2").innerHTML="Required field should not be empty";
		 error="true";
		 }
	 else if(processowner.charAt(0)==" ")
	 {
	 document.getElementById("processowner2").innerHTML="Should not accept initial space";
	 error="true";
	 }
	 else if(processowner.length<4)
	 {
		 document.getElementById("processowner2").innerHTML="Required field should be of length 4 to 32";
		 error="true";
	 }	
	
	 if(error=="true")
		 {
		 return false;
		 }
	 
 }

 
 </script>     
</body>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<jsp:include page="footer.jsp"></jsp:include> 
</html>