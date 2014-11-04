<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="header.jsp"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="/QMS_App/resources/js/jquery.js"></script>
<link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" />
<link rel="stylesheet" href="http://s.codepen.io/assets/reset/normalize.css" type="text/css" />
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/jquery-ui.js"></script>  	
<title>Insert title here</title>
</head>
<body>
<script>

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
if(document.getElementById("frequency_maintenance").value=="")
	{
	document.getElementById("frequency_maintenanceerr").innerHTML="Required field should not be empty";
	error="true";
	}
else if(document.getElementById("frequency_maintenance").value.length<4)
{
document.getElementById("frequency_maintenanceerr").innerHTML="Required field should be of length 4 to 32";
error="true";
}
else if(document.getElementById("frequency_maintenance").value.substring(0,1)==' ')
{
document.getElementById("frequency_maintenanceerr").innerHTML="Should not accept initial space";
error="true";
}
if(error=="true")
	{
	return false;
	}
}
function validateAlpha4(){
    var textInput = document.getElementById("frequency_maintenance").value;
    textInput = textInput.replace(/[^A-Za-z ]/g, "");
    document.getElementById("frequency_maintenance").value = textInput;
}


</script>
<form method="post" enctype="multipart/form-data" action="insert_reference">
<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
      <td>
      <div>
  <ul class="horizmenu" style=" float:left;margin-left:205px;">
										<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="add_referenceMaintenance" class="<c:choose>
								<c:when test="${menu=='nonconformance'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									<span>Reference Attachment</span>
									
								</a>
							</li>		
				          </ul>
  </div>
      </td>
      </tr>
      <tr>
        <td valign="top" align="left">
            <div class="headings altheading">
              <h2 style="padding-left: 60px">Instruction Reference</h2>
            </div>
    <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
              <tr>
			<td align="left" valign="top" width="50%" style="padding-right: 25px;">
			<table cellpadding="0" cellspacing="0" border="0">
                <tr class="row2">
                	 <td valign="middle" align="left" class="input_txt" width="25%" style="padding-left: 65px"><span class="err">Type of NC :</td>
               		<td valign="middle" align="left" class="input_txt" width="20%"><input type="text" name="frequency_maintenance" id="frequency_maintenance" class="input_txtbx"  maxlength="32" style="width:200px;" value="" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"
onkeypress="return onlyAlphabets(event,this);"/><br/><font size="+1" color="red"><span  id="frequency_maintenanceerr"></font><form:errors path="Reference.frequency_maintenance"></form:errors></span></td>
              		<td></td>
              		<td></td>
              		</tr>
              		<tr class="row1">
              		<td valign="middle" align="left" id="id_location_txt" class="input_txt" width="25%"></td>
              		<td valign="middle" align="left" id="id_location_txt" class="input_txt" width="25%">
              		 <input name="attachments" id="id_file" type="file" /> <br/>
              </td>
              </tr>
  
               <tr class="row2">
               <td></td>
             <td align="right">
             <input align="left" class="submit_btn1" type="submit" id="submit"  name="submit" value="Submit" onclick="return validation('this')" ></td>
             <td>
           <!--  <input align="middle" class="submit_btn1" type="reset" id="reset_export" name="reset_export" value="Reset" ></td> -->
           
              </tr>
               </table>
              </td>
              </tr>
              </table>
              </div>
              </td>
              </table>
</form>
</body>
</html>