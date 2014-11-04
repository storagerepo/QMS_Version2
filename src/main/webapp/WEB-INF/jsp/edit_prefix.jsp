<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" />

<script src="resources/js/jquery.min.js"></script>
 <script src="resources/js/jquery-ui.js"></script>

<jsp:include page="header.jsp"></jsp:include>
<div id="right_content">
<form action="updateprefix" method="POST" name="update" id="update">

<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
      <td>
      <div>
  <ul class="horizmenu">
						
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addprefix" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span class="buttonsub blue">Add Documents</span>
									
								</a>
							</li>
							
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="viewprefix" class="<c:choose>
								<c:when test="${menu=='audits'}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span class="buttonsub blue">View Documents </span>
									
								</a>
							</li>
							</ul>
				            
  </div>
      </td>
      </tr>
       <!--  <td valign="top" align="left" style="padding:5px 0 10px 0;">&nbsp;
		<div class="status success" style="display: none;">
            <p class="closestatus"><a title="Close" href="">x</a></p>
            <p><img alt="Success" src="images/icons/icon_success.png"><span>Success!</span>.</p>
          </div>
      </tr>-->
      <tr> 
        <td valign="top" align="left">
        	<div class="headings altheading">
	              <h2>Document Process</h2>
	            </div>
	            <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
              <c:set value="${documentPrefixForm.documentprefix[0]}" var="documentprefix"></c:set>
            
              <tr>
			<td align="left" valign="top" width="50%" style="padding-right: 25px;">
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
                
                <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Auto Id:</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="auto_id" value="<c:out value="${documentprefix.auto_id}"/>"/><c:out value="${documentprefix.auto_id}"/><br/><span class="err"></span></td>
                </tr>
                <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Document Type:</td>
                 <%--  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="document_type" value="<c:out value="${documentprefix.document_type}"/>"/><c:out value="${documentprefix.document_type}"/><br/><span class="err"></span></td>
                 --%>
                                <td valign="top" align="left" class="input_txt">
				                  		<select name="document_type" class="input_cmbbx1">
				                  		<option value="">--Select--</option>
						                  <option <c:if test="${documentprefix.document_type eq 'Manual'}"><c:out value="Selected"/></c:if> value="Manual" >Manual</option>
											<option <c:if test="${documentprefix.document_type eq 'Procedure'}"><c:out value="Selected"/></c:if> value="Procedure">Procedure</option>
											<option  <c:if test="${documentprefix.document_type eq 'Work Instruction'}"><c:out value="Selected"/></c:if> value="Work Instruction">Work Instruction</option>
				               				<option  <c:if test="${documentprefix.document_type eq 'Work Standard'}"><c:out value="Selected"/></c:if> value="Work Standard">Work Standard</option>
				                   			<option  <c:if test="${documentprefix.document_type eq 'Work Government Reg'}"><c:out value="Selected"/></c:if> value="Work Government Reg">Process3</option>
				                   	    	<option  <c:if test="${documentprefix.document_type eq 'Specification'}"><c:out value="Selected"/></c:if> value="Specification">Specification</option>
				                   	</select>
				                   	</td>
				                   	</tr>
                <tr class="row1">
						         	<td valign="top" align="right" class="input_txt"> Prefix :</td>
						          <%-- <td valign="top" align="left" class="input_txt"><input type="text" name="prefix" value="<c:out value="${documentprefix.prefix}"/>"/><c:out value="${documentprefix.prefix}"/><br/><span class="err"></span></td>
		         --%> 
		         <td valign="top" align="left" class="input_txt" width="70%">
               <select name="prefix" class="input_cmbbx1">
				                  		<option value="">--Select--</option>
						                  <option <c:if test="${documentprefix.prefix eq 'PM'}"><c:out value="Selected"/></c:if> value="PM" >PM</option>
											<option <c:if test="${documentprefix.prefix eq 'QSP'}"><c:out value="Selected"/></c:if> value="QSP">QSP</option>
											<option  <c:if test="${documentprefix.prefix eq 'WI'}"><c:out value="Selected"/></c:if> value="WI">WI</option>
				               				<option  <c:if test="${documentprefix.prefix eq 'SD'}"><c:out value="Selected"/></c:if> value="SD">SD</option>
				                   			<option  <c:if test="${documentprefix.prefix eq 'GR'}"><c:out value="Selected"/></c:if> value="GR">GR</option>
				                   	    	<option  <c:if test="${documentprefix.prefix eq 'SP'}"><c:out value="Selected"/></c:if> value="SP">SP</option>
                </select>
                </td>
		         </tr> 
               
                 
                  </table>
                
                  <table align="center" width="100%">
                  <tr >
                  
                  <td valign="top" align="center"></td>
				  <td valign="top" align="center"><input type="submit" class="submit_btn2" value="Update" class="submit_btn1">
				 </td>
                  </tr>
                  </table>
                  </table>
                  </div>
	            
                      	</td>
  		</tr>
 	</table>
</form>
</div>
 <script>
 $(function() {
	 $( "#datepicker1" ).datepicker({dateFormat: 'yy-mm-dd'});
        });
 
</script>
   <script>
 $(function() {
           $( "#datepicker" ).datepicker({dateFormat: 'yy-mm-dd'});
         });
 
</script>
   <script>
 $(function() {
	 $( "#datepicker2" ).datepicker({dateFormat: 'yy-mm-dd'});
     
         });
 
</script>
 <script language="JavaScript">
function CreateGroup()
{
	document.update.action = 'index.php?do=creategroup&type=1';
	document.update.submit();
}
</script>
<jsp:include page="footer.jsp"></jsp:include>