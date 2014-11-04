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
<title>Edit Form Location</title>
</head>
<body>
<form method="post" action="update_formlocation">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
        <td>
        <div>
  <ul class="horizmenu">
						
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="add_formlocation" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span >Add Location</span>
									
								</a>
							</li>
						<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="formlocation_list" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									<span>View Locations</span>
								</a>
							</li>
				          
							</ul>
  </div>
        </td>
      </tr>
      <tr>
        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2 style="padding-left: 45px">Update Form Location</h2>
            </div>  <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
               <c:set value="${formLocationForm.formLocations[0]}" var="formlocation"> </c:set>
             
              <tr>
			<td align="left" valign="top" width="50%" style="padding-right: 25px;">
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr class="row2">
                
                  <td valign="middle" align="left" class="input_txt" width="30%" style="padding-left: 50px">Location Name :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="form_location" maxlength="32"  class="input_txtbx" id="formlocation" onblur="toggle(this.value)"onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${formlocation.form_location}" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"onkeypress="return onlyAlphabets(event,this);" />
                <br> <span id="formlocation1" style="color:red">
                <c:if test="${success=='exist'}">Location already exist</c:if></span>
                  <span class="err"><form:errors path="FormLocation.form_location"></form:errors></span>
                  <input type="hidden" name="location_id" id="locationid" value="${formlocation.location_id}"/>
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
             </form>
             
             <script type="text/javascript">
             $(function() {
         		$("#formlocation").on("keypress", function(e) {
         			if (e.which === 32 && !this.value.length)
         		        e.preventDefault();
         		});
         		});
             function validateAlpha4(){
         	    var textInput = document.getElementById("formlocation").value;
         	    textInput = textInput.replace(/[^A-Za-z ]/g, "");
         	    document.getElementById("formlocation").value = textInput;
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
	 var  chars = /[A-Za-z ]+$/;
	 var formlocation = document.getElementById('formlocation').value;
	 if(formlocation == "")
		 {
		 document.getElementById("formlocation1").innerHTML="Required field should not be empty";
		 return false;
		 }
	 else if(formlocation.charAt(0) == " ")
		 {
		 document.getElementById("formlocation1").innerHTML="Should not accept initial space";
		 return false;
		 }
	 else if(formlocation.length<4)
	 {
	 document.getElementById("formlocation1").innerHTML="Required field should be of length 4 to 32.";
	 return false;
	 }
	 else if(formlocation.match(chars))
		 {
		 document.getElementById("formlocation1").innerHTML="";
		 }
	 else
		 {
		 document.getElementById("formlocation1").innerHTML="Required field should be alphabates";
		 return false;
		 }
 }
 
 </script>
       <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>         


   