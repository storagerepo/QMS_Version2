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
<form method="post" action="update_reportnc">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
        <td>
        <div>
  <ul class="horizmenu">
						
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addreportnc" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									Add Report NC</span>
									
								</a>
							</li>
						<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="reportNC_list" class="<c:choose>
								<c:when test="${menu=='admin'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									View Report NC</span>
								</a>
							</li>
				          
							</ul>
  </div>
        </td>
      </tr>
      <tr>
        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2 style="padding-left: 50px">Update Report NC</h2>
            </div>  <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
               <c:set value="${reportedByNCForm.reportedByNCs[0]}" var="reportedByNCs"> </c:set>
             
              <tr>
			<td align="left" valign="top" width="50%" style="padding-right: 25px;">
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr class="row2">
             
                  <td valign="middle" align="left" class="input_txt" width="20%" style="padding-left: 55px">Type of NC&nbsp;:</td>
                  <td valign="top" align="left" class="input_txt" width="20%">
                     <input type="hidden" name="auto_id" value="${reportedByNCs.auto_id}"/>
                  
				                  		<select name="type_of_nc" id="typeofNc" class="dropdown">
						                    <option <c:if test="${reportedByNCs.type_of_nc eq 'Product Quality'}"><c:out value="Selected"/></c:if> value="Product Quality" >Product Quality</option>
											<option <c:if test="${reportedByNCs.type_of_nc eq 'Service Quality'}"><c:out value="Selected"/></c:if>  value="Service Quality">Service Quality</option>
											<option  <c:if test="${reportedByNCs.type_of_nc eq 'Late Delivery'}"><c:out value="Selected"/></c:if>  value="Late Delivery">Late Delivery</option>
											<option <c:if test="${reportedByNCs.type_of_nc eq 'Early Delivery'}"><c:out value="Selected"/></c:if> value="Early Delivery">Early Delivery</option>
				                	<c:forEach items="${type_of_NC_Form.type_of_NCs}" var="types" varStatus="status">
        				       <option value="${types.type_of_nc}"<c:if test="${types.type_of_nc == reportedByNCs.type_of_nc}"><c:out value="selected"/></c:if>>${types.type_of_nc}</option>
			                  </c:forEach>
				                   		</select>
				                   		 <span id="typeofNc1" style="color:red"></span>
				                   	</td>
		
                
                  <td valign="middle" align="left" class="input_txt" width="10%" >Group Person&nbsp;:</td>
                  <td valign="top" align="left" class="input_txt" width="20%"><input type="text" name="group_person" maxlength="32" class="input_txtbx" id="groupperson" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${reportedByNCs.group_person}" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"onkeypress="return onlyAlphabets(event,this);"/>
                   <br>  <span id="groupperson1" style="color:red"> <c:if test="${success=='exist'}">Group person already exist</c:if></span>
                  <span class="err"><form:errors path="ReportedByNC.group_person"></form:errors></span></td>
                </tr><tr height="10"></tr>
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
                		$("#groupperson").on("keypress", function(e) {
                			if (e.which === 32 && !this.value.length)
                		        e.preventDefault();
                		});
                		});
                 function validateAlpha4(){
             	    var textInput = document.getElementById("groupperson").value;
             	    textInput = textInput.replace(/[^A-Za-z ]/g, "");
             	    document.getElementById("groupperson").value = textInput;
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
            	   document.getElementById("groupperson1").innerHTML="";
            	   document.getElementById("typeofNc1").innerHTML="";
            	 var error="";
            	   var chars = /[A-Za-z ]+$/;
            	   var typeofNc = document.getElementById('typeofNc').value;
            	   var groupperson = document.getElementById('groupperson').value;
            	   if(typeofNc == "")
            		   {
            		   document.getElementById("typeofNc1").innerHTML="Required field should not be empty";
          			 	error="true";
            		   }
            	   else{
            		   document.getElementById("typeofNc1").innerHTML="";
            	   }
            	   
            	 if(groupperson == "")
            		   {
            		   document.getElementById("groupperson1").innerHTML="Required field should not be empty";
         			 	error="true";
            		   }
            	   else if(groupperson.charAt(0)==" ")
            		   {
            		   document.getElementById("groupperson1").innerHTML="Should not accept initial space";
        			 	error="true";
            		   }
            	   else if(groupperson.length<4)
          		   {
          		   document.getElementById("groupperson1").innerHTML="Required field should be of length 4 to 32";
      			 	error="true";
          		   }
            	
            	  
            	 if(error=="true")
            		 {
            		 return false;
            		 }
            	   
               }
               </script>
</body>

</html>