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
<script src="resources/js/jquery.min.js"></script>
 <script src="resources/js/jquery-ui.js"></script>
<title>Insert title here</title>
</head>
<body>
<form method="post" enctype="multipart/form-data" action="update_referenceMaintenance">
<div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
        <td>
        <div>
  <ul class="horizmenu">
						
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="add_referenceMaintenance" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span >Add Reference Attachment</span>
									
								</a>
							</li>
						<li  style=" float:left;text-transform:uppercase;">
								<a href="view_referenceMaintenance" class="<c:choose>
								<c:when test="${menu=='admin'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									<span>View Reference Attachment</span>
									
								</a>
							</li>	
				          
							</ul>
  </div>
        </td>
      </tr>
      <tr>
        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2 style="padding-left: 50px">Update Reference Attachment</h2>
            </div>  <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
               <c:set value="${referenceMaintenance_Form.references[0]}" var="reference"> </c:set>
             
              <tr>
			<td align="left" valign="top" width="50%" style="padding-right: 25px;">
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr class="row2">
                
                  <td valign="top" align="left"  style="padding-left: 55px" class="input_txt" width="30%">Frequency of Maintenance :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">
                  <input type="hidden" name="auto_id" value="${reference.auto_id}"/>
                  <input type="hidden" name="frequency_maintenance" class="input_txtbx" id="sourceofnc" onblur="toggle(this.value)"onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${reference.frequency_maintenance}" />${reference.frequency_maintenance}<span class="err"><form:errors path="Reference.frequency_maintenance"></form:errors></span>
				</td>
                  <td></td>
              		<td></td>
              		</tr>
              		<tr class="row1">
              		<td valign="middle" align="left" id="id_location_txt" class="input_txt" width="25%"></td>
              		<td valign="middle" align="left" id="id_location_txt" class="input_txt" width="25%">
              		<input name="filename" type="hidden" id="file_name"/>${reference.attachment_name}
               <input name="attachments" id="id_file" type="file" value="${reference.attachment_name }"/>
               
                </tr>
                  <tr class="row1">
                  <td valign="top" align="right">&nbsp;</td>
                  <td valign="top" align="left"><input type="submit" value="Update" class="submit_btn1"></td>
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
</body>
</html>