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
<form method="post" enctype="multipart/form-data" action="insert_instruction">
<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
      <td>
      <div>
  <ul class="horizmenu" style=" float:left;margin-left:205px;">
						
					
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="add_instructionMaintenance" class="<c:choose>
								<c:when test="${menu=='admin'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									<span>Instruction Attachment</span>
									
								</a>
							</li>		
				          </ul>
  </div>
      </td>
      </tr>
      <tr>
        <td valign="top" align="left">
            <div class="headings altheading">
              <h2 style="padding-left: 50px">Instruction Attachment</h2>
            </div>
    <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
              <tr>
			<td align="left" valign="top" width="50%" style="padding-right: 25px;">
			<table cellpadding="0" cellspacing="0" border="0">
                
              		<tr class="row1">
              		<td valign="middle" align="left" id="id_location_txt" class="input_txt" width="25%" style="padding-left: 55px">Instruction Attachment</td>
              		<td valign="middle" align="left" id="id_location_txt" class="input_txt" width="25%">
              		 <input name="attachments" id="id_file" type="file" /> <br/>
              </td>
              </tr>
  
               <tr class="row2">
               <td></td>
             <td align="left">
             <input class="submit_btn1" type="submit" id="submit"  name="submit" value="Submit" ></td>
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