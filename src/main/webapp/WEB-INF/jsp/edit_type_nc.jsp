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
 <link rel="stylesheet" href="resources/css/jquery-ui.css"type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Type of NC</title>
</head>
<body>
<form method="post" action="update_type">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
        <td>
        <div>
  <ul class="horizmenu">
						
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addtypenc" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span >Add Type of NC</span>
									
								</a>
							</li>
						<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="typeNC_list" class="<c:choose>
								<c:when test="${menu=='admin'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									<span >View Type of NC</span>
								</a>
							</li>
				          
							</ul>
  </div>
        </td>
      </tr>
      <tr>
        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2 style="padding-left: 55px">Update Type of NC</h2>
            </div>  <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
               <c:set value="${type_of_NC_Form.type_of_NCs[0]}" var="types"> </c:set>
             
              <tr>
			<td align="left" valign="top" width="50%" style="padding-right: 25px;">
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr class="row2">
                
                  <td valign="middle" align="left" class="input_txt" width="30%" style="padding-left: 60px">Type of NC :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">
                  <input type="hidden" name="auto_id" value="${types.auto_id}"/>
                  <input type="text" name="type_of_nc"  maxlength="32" class="input_txtbx"  id="typeofnc" onblur="toggle(this.value)"onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${types.type_of_nc}" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"onkeypress="return onlyAlphabets(event,this);"	 />
                 <br> <span id="typeofnc1" style="color:red">
                 <c:if test="${success=='exist'}">Type of NC already exist</c:if></span>
                  <span class="err"><form:errors path="Type_of_NC.type_of_nc"></form:errors></span>
                  
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
             <tr><td height="350"></td></tr>
             </table>
             </div>
             </form>
            <script type="text/javascript">
            $(function() {
          		$("#typeofnc").on("keypress", function(e) {
          			if (e.which === 32 && !this.value.length)
          		        e.preventDefault();
          		});
          		});
              function validateAlpha4(){
            	    var textInput = document.getElementById("typeofnc").value;
            	    textInput = textInput.replace(/[^A-Za-z ]/g, "");
            	    document.getElementById("typeofnc").value = textInput;
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
            	   var typeofnc = document.getElementById('typeofnc').value;
            	   if(typeofnc == "")
            		   {
            		   
            		   document.getElementById("typeofnc1").innerHTML="Required Field Should not be Empty";
            		  
            			 return false;
            		   }
            	   else if(typeofnc.charAt(0)==" ")
            		   {
            		   document.getElementById("typeofnc1").innerHTML="Should not accept initial space";
            		
          			 return false;
            		   }
            	   else if((typeofnc.length<4) || (typeofnc.length > 15))
        		   {
            		  
        		   document.getElementById("typeofnc1").innerHTML="Required and must be of length 4 to 15";
        	
        		         			 return false;
        		   }
            	   else if(typeofnc.match(chars))
            		   {
            		   document.getElementById("typeofnc1").innerHTML="";
            		   }
            	   else
            		   {
            		   document.getElementById("typeofnc1").innerHTML="Required Field Should be Alphabates";
            	
            			 return false;
            		   
            		   }
            	   
            	   
               }
               </script>      
</body>
<jsp:include page="footer.jsp"></jsp:include> 
</html>