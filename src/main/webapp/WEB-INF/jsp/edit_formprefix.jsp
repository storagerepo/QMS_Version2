<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="header.jsp"></jsp:include>
<script src="resources/js/jquery.min.js"></script>
 <script src="resources/js/jquery-ui.js"></script>
 <link rel="stylesheet" href="resources/css/jquery-ui.css"
	type="text/css" />
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Form Prefix</title>
</head>
<body>
<form method="post" action="update_formpref">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
        <td>
        <div>
  <ul class="horizmenu">
						
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="add_prefixform" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span >Add Prefix</span>
									
								</a>
							</li>
						<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="formprefix_list" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									<span >View Prefixes</span>
								</a>
							</li>
				          
							</ul>
  </div>
        </td>
      </tr>
      <tr>
        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2 style="padding-left: 50px">Update Form Prefix</h2>
            </div>  <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
               <c:set value="${formFormPrefix.formPrefixs[0]}" var="formprefix"> </c:set>
             
              <tr>
			<td align="left" valign="top" width="50%" style="padding-right: 25px;">
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
              
                 <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="30%" style="padding-left: 55px">Form Prefix :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="form_prefix" class="input_txtbx" id="formprefix"onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" 
                	  onblur="ChangeCase(this);" maxlength="32" value="${formprefix.form_prefix}" onkeypress="return onlyAlphabets(event,this);"	/>
                 <br>    <span id="formprefix1" style="color:red"></span> <span id="docprefix1" style="color:red">
                 <c:if test="${success=='exist'}">FormPrefix already exists</c:if>
                <form:errors path="FormPrefix.form_prefix"></form:errors></span></td>
                </tr><tr height="10"></tr>
                  <tr class="row2">
                
                  <td valign="top" align="left" class="input_txt" width="30%" style="padding-left: 55px">Description :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">
                   <textarea   cols="27" rows="5" class="input_txtarea"  maxlength="400" name="form_name" id="formname">${formprefix.form_name}</textarea>
               
                 <br>  <span id="document_id1" style="color:red"></span>  <span id="formname1" style="color:red"></span>
                  <span class="err"><form:errors path="FormPrefix.form_name"></form:errors></span>
                  <input type="hidden" name="id" id="id" value="${formprefix.id}"/>
                  </td>
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
             </table>
             </div>
             <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
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
      	document.getElementById("docprefix1").innerHTML="";
      	
      	 
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
      	 document.getElementById("document_id1").innerHTML="Required field should be of length 4 to  400.";
      	 error="true";
      	 }
      	 
       else if(formname.match(desc))
      	 {
      	 	 document.getElementById("document_id1").innerHTML="";
      	 }
     /*   else {
      	 
      	 document.getElementById("document_id1").innerHTML="Required Field Should be only Letters";
      	 error="true";
          }
      	 
      	  */
      	 
      	 
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
      	 document.getElementById("docprefix1").innerHTML="Required field should be of length 4 to 32.";
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
</body>

 
</html>