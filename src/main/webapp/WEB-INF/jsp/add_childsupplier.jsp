<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page import="qms.model.ChildSupplier"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>
<html>
<head>
<link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" />
<script src="resources/js/jquery.min.js"></script>
 <script src="resources/js/jquery-ui.js"></script>
 <STYLE type="text/css">
  P#mypar {font-style:calibri;
  line-height:18px;}
  
  </STYLE>
 <script>
 $(function() {
           $( "#datepicker1" ).datepicker();
         });
 $(function() {
     $( "#datepicker2" ).datepicker();
   });
 $(function() {
     $( "#datepicker3" ).datepicker();
   });
 
 </script>
 </head>
 <body>
<form method="post" action="addchildsupplier">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
        <td valign="top" align="left" style="padding:5px 0 10px 0;"></td>
      </tr>
      <tr>
        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2>Add Child Supplier</h2>
            </div>
            <div class="contentbox">
            <c:choose>
            <c:when test="${empty child}">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
   				 <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>PO #:</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="hidden" name="po" id="inp_id" value="<c:out value="${id }"/>"/><c:out value="${id }"/><br/><span class="err"><form:errors path="ChildSupplier.po"></form:errors></span></td>
                </tr>
                  <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Receipt Date :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="receipt_date" class="input_txtbx" id=datepicker1 onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /><br/><span class="err"><form:errors path="ChildSupplier.receipt_date"></form:errors></span></td>
                </tr>
                <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"> Type Of Problem :</td>
               <td valign="top" align="left" class="input_txt"><select	name="type_of_problem" class="input_cmbbx1">
                  										<option
															<c:if test="${childsupplier.type_of_problem eq 'No Problem'}"><c:out value="Selected"/></c:if>
															value="No Problem">No Problem</option>
														<option
															<c:if test="${childsupplier.type_of_problem eq 'Quality'}"><c:out value="Selected"/></c:if>
															value="Quality">Quality</option>
														<option
															<c:if test="${childsupplier.type_of_problem eq 'Delivery'}"><c:out value="Selected"/></c:if>
															value="Delivery">Delivery</option>
														<option
															<c:if test="${childsupplier.type_of_problem eq 'Customer Service'}"><c:out value="Selected"/></c:if>
															value="Customer Service">Customer Service</option>	

															</select></td>
                                  
                </tr>
                <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"> Problem Details :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="problem_details" class="input_txtbx" id="inp_problem_details" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /><br/><span class="err"><form:errors path="ChildSupplier.problem_details"></form:errors></span></td>
                </tr>
                <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"> Problem Found At :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="problem_found_at" class="input_txtbx" id="inp_problem_found_at" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /><br/><span class="err"><form:errors path="ChildSupplier.problem_found_at"></form:errors></span></td>
                </tr>
				<tr class="row2">
				  <td valign="middle" align="right" class="input_txt" width="30%"> Request Corrective Action :</td>
				  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="request_corrective_action" class="input_txtbx" id="inp_request_corrective_action" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /><br/><span class="err"><form:errors path="ChildSupplier.request_corrective_action"></form:errors></span></td>
                </tr>
				  

              <tr class="row1">
              <td valign="middle" align="right" class="input_txt" width="30%"> Due Date for Corrective Action :</td>
                <td valign="top" align="left"><textarea class="input_txtbx1" id="inp_notes" name="due_date_for_corrective_action" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  style="width: 177px; height: 89px;" name="note">
						</textarea><br/><font color="Red" size="+1"></font><form:errors path="ChildSupplier.due_date_for_corrective_action"></form:errors></td>
			</tr>
                <tr class="row2">
				<td valign="middle" align="right" class="input_txt" width="30%">Deduction for Issue :</td>
				<td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="deduction_for_issue" class="input_txtbx" id="inp_deduction_for_issue" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /><br/><span class="err"><form:errors path="ChildSupplier.deduction_for_issue"></form:errors></span></td>
                </tr>
				<tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"> Recorded By :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="recorded_by" class="input_txtbx" id="inp_recorded_by" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /><br/><span class="err"><form:errors path="ChildSupplier.recorded_by"></form:errors></span></td>
                </tr><tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"> Recording Date :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="recording_date" class="input_txtbx" id="datepicker2" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /><br/><span class="err"><form:errors path="ChildSupplier.recording_date"></form:errors></span></td>
                </tr>
                 <tr class="row2">
                  <td valign="top" align="right">&nbsp;</td>
                  <td valign="top" align="left"><input type="submit" value="Add ChildSupplier" class="submit_btn2"></td>
                </tr>
              </table>
              </c:when>
              <c:otherwise>
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
   				 <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>PO #:</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="hidden" name="po" id="inp_id" value="<c:out value="${id }"/>"/><c:out value="${id }"/><br/><span class="err"><form:errors path="ChildSupplier.po"></form:errors></span></td>
                </tr>
                  <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Recipt Date :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="receipt_date" class="input_txtbx" id=datepicker1 onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${child.receipt_date}" /><br/><span class="err"><form:errors path="ChildSupplier.receipt_date"></form:errors></span></td>
                </tr>
                <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"> Type Of Problem :</td>
                  <td valign="top" align="left" class="input_txt"><select	name="type_of_problem" class="input_cmbbx2">									
														<option
															<c:if test="${childsupplier.type_of_problem eq 'No Problem'}"><c:out value="Selected"/></c:if>
															value="No Problem">No Problem</option>
														<option
															<c:if test="${childsupplier.type_of_problem eq 'Quality'}"><c:out value="Selected"/></c:if>
															value="Quality">Quality</option>
														<option
															<c:if test="${childsupplier.type_of_problem eq 'Delivery'}"><c:out value="Selected"/></c:if>
															value="Delivery">Delivery</option>
														<option
															<c:if test="${childsupplier.type_of_problem eq 'Customer Service'}"><c:out value="Selected"/></c:if>
															value="Customer Service">Customer Service</option>													
                  											</select></td>
                  
                </tr>
		        <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"> Problem Details :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="problem_details" class="input_txtbx" id="inp_problem_details" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${child.problem_details}" /><br/><span class="err"><form:errors path="ChildSupplier.problem_details"></form:errors></span></td>
                </tr>
                <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"> Problem Found At :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="problem_found_at" class="input_txtbx" id="inp_problem_found_at" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${child.problem_found_at}" /><br/><span class="err"><form:errors path="ChildSupplier.problem_found_at"></form:errors></span></td>
                </tr>
				<tr class="row2">
				  <td valign="middle" align="right" class="input_txt" width="30%"> Request Corrective Action :</td>
				  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="request_corrective_action" class="input_txtbx" id="inp_request_corrective_action" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${child.request_corrective_action}" /><br/><span class="err"><form:errors path="ChildSupplier.request_corrective_action"></form:errors></span></td>
                </tr>
				  

              <tr class="row1">
              <td valign="middle" align="right" class="input_txt" width="30%"> Due Date for Corrective Action :</td>
                <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="due_date_for_corrective_action" class="input_txtbx" id="inp_due_date_for_corrective_action" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${child.due_date_for_corrective_action}" /><br/><span class="err"><form:errors path="ChildSupplier.recorded_by"></form:errors></span></td>
                </tr>
                <tr class="row2">
				<td valign="middle" align="right" class="input_txt" width="30%">Deduction for Issue :</td>
				<td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="deduction_for_issue" class="input_txtbx" id="inp_deduction_for_issue" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${child.deduction_for_issue}" /><br/><span class="err"><form:errors path="ChildSupplier.deduction_for_issue"></form:errors></span></td>
                </tr>
				<tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"> Recorded By :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="recorded_by" class="input_txtbx" id="inp_recorded_by" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${child.recorded_by}" /><br/><span class="err"><form:errors path="ChildSupplier.recorded_by"></form:errors></span></td>
                </tr><tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"> Recording Date :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="recording_date" class="input_txtbx" id="datepicker2" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${child.recording_date}" /><br/><span class="err"><form:errors path="ChildSupplier.recording_date"></form:errors></span></td>
                </tr>
                 <tr class="row2">
                  <td valign="top" align="right">&nbsp;</td>
                  <td valign="top" align="left"><input type="submit" value="Add ChildSupplier" class="submit_btn2"></td>
                </tr>
              </table>
              </c:otherwise>
                </c:choose>
 
              
              
            </div>
          </div></td>
      </tr>
      </table>
      </div>
      
</form>
</body>
</html>
      <jsp:include page="footer.jsp"></jsp:include>
