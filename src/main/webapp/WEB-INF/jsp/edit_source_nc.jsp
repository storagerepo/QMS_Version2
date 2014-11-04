<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="resources/js/jquery-1.7.2.min.js"></script>
<script src="resources/js/jquery-ui.js"></script>
<script src="resources/js/modal.js"></script>
<jsp:include page="header.jsp"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="resources/js/jquery.min.js"></script>
 <script src="resources/js/jquery-ui.js"></script>
 <link rel="stylesheet" href="resources/css/jquery-ui.css"type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Source of NC</title>
</head>
<script type="text/javascript">
              $(function() {
          		$("#sourceofnc").on("keypress", function(e) {
          			if (e.which === 32 && !this.value.length)
          		        e.preventDefault();
          		});
          		});
              function validateAlpha4(){
             	    var textInput = document.getElementById("sourceofnc").value;
             	    textInput = textInput.replace(/[^A-Za-z ]/g, "");
             	    document.getElementById("sourceofnc").value = textInput;
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
            	   var chars = /[A-Za-z ]+$/;
            	   var sourceofnc = document.getElementById('sourceofnc').value;
            	   if(sourceofnc == "")
            		   {
            		   document.getElementById("sourceofnc1").innerHTML="Required field should not be empty";
            			 return false;
            		   }
            	   else if(sourceofnc.charAt(0)==" ")
            		   {
            		   document.getElementById("sourceofnc1").innerHTML="Should not accept initial space";
          			 return false;
            		   }
            	   else if(sourceofnc.length<4)
        		   {
        		   document.getElementById("sourceofnc1").innerHTML="Required field should be of length 4 to 32";
      			 return false;
        		   }
            	   else if(sourceofnc.match(chars))
            		   {
            		   document.getElementById("sourceofnc1").innerHTML="";
            		   }
            	   else
            		   {
            		   document.getElementById("sourceofnc1").innerHTML="Required field should be alphabates";
            			 return false;
            		   
            		   }
            	   
            	   
               }
               </script>  
<body>
<form method="post" action="update_source">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
        <td>
        <div>
  <ul class="horizmenu">
						
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addsourcenc" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span >Add Source of NC</span>
									
								</a>
							</li>
						<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="sourceNC_list" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									<span >View Source of NC</span>
								</a>
							</li>
				          
							</ul>
  </div>
        </td>
      </tr>
      <tr>
        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2 style="padding-left: 55px">Update Source of NC</h2>
            </div>  <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
               <c:set value="${conformance_SourceForm.conformance_Sources[0]}" var="sources"> </c:set>
             
              <tr>
			<td align="left" valign="top" width="50%" style="padding-right: 25px;">
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr class="row2">
                
                  <td valign="top" align="left" class="input_txt" width="30%" style="padding-left: 60px">Source of NC :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">
                  <input type="hidden" name="auto_id" value="${sources.auto_id}"/>
                  <input type="text" maxlength="32" name="source_of_nc" class="input_txtbx" id="sourceofnc" onblur="toggle(this.value)"onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${sources.source_of_nc}" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"onkeypress="return onlyAlphabets(event,this);"	 />
                   <br> <span id="sourceofnc1" style="color:red">
                   <c:if test="${success=='exist'}">Source of NC already exist</c:if></span>
                  <span class="err"><form:errors path="Non_Conformance_Source.source_of_nc"></form:errors></span>
                  
                  </td>
                </tr>
                <tr height="10"></tr>
                  <tr class="row1">
                  <td valign="top" align="right">&nbsp;</td>
                  <td valign="top" align="left"><input type="submit" value="Update" onclick="return validation();"class="submit_btn1"></td>
                </tr>
                <tr height="350"><Td></Td></tr>
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
               
</body>

</html>
