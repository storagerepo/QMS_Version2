<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page import="qms.model.SupplierPerformance"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>
<script src="resources/js/jquery.min.js"></script>
 <script src="resources/js/jquery-ui.js"></script>
 <link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" />
 
<html>
<head>
 <STYLE type="text/css">
  P#mypar {font-style:calibri;
  line-height:18px;}
  
  </STYLE>

</head>
<body>
  <div id="right_content" style="height:100%">
<form method="post" action="updatesupplierperformance" name="calc" id="formid">

    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
        <td>
         <div>
  <ul class="horizmenu">
						
								<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="add_supplierperformance" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Add SupplierPerformance</span>
									
								</a>
							</li>
								<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="view_supplier" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>View Supplier</span>
									
								</a>
							</li>
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="view_supplierperformance" class="<c:choose>
								<c:when test="${menu=='supplier'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									<span>View SupplierPerformance</span>
									
								</a>
							</li>
				            <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="supplierperformance_report" class="<c:choose>
								<c:when test="${menu=='supplier'}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Reports</span>
									
								</a>
							</li>
				            
				            </ul>
  </div>
        </td>
      </tr>
      <tr>
        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2>Update Supplier Performance</h2>
            </div>
            <div class="contentbox">
              <div style="border:#993300  2px solid; padding:15px; margin-bottom:15px;">
            <c:set value="${supplierPerformanceForm.supplierperformance[0]}" var="supplierperformance"/>
              <table cellpadding="0" cellspacing="0" border="0" width="100%" style="padding-left: 30px; padding-right: 30px;">
              <tr class="row2">
                  <td valign="top" align="left" class="input_txt" width="20%">Supplier ID :</td>
                  <td valign="top" align="left" class="input_txt" width="30%"><input type="text" name="supplier_id" id="inp_id" class="input_txtbx" readonly="readonly" value="<c:out value="${supplierperformance.supplier_id }"/>"/><br/><span style="color: red;"><form:errors path="SupplierPerformance.supplier_id"></form:errors></span></td>
                  <td valign="top" align="left" class="input_txt" width="20%">Website :</td>
                  <td valign="top" align="left" class="input_txt" width="40%"><input type="text" name="website" placeholder="www.example.com" readonly="readonly" class="input_txtbx" id="inp_website" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${supplierperformance.website}" /><br/><span style="color: red;" id="websiteerror"><form:errors path="SupplierPerformance.website"></form:errors></span></td>
                
                </tr>                                                                                
                  <tr class="row1">
                  <td valign="top" align="left" class="input_txt" >Supplier name :</td>
                  <td valign="top" align="left" class="input_txt" ><input type="text" name="supplier_name" class="input_txtbx" id="inp_supplier_name" maxlength="32" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" onkeypress="return onlyAlphabets(event,this);" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"  value="${supplierperformance.supplier_name}" /><br/><span style="color: red;" id="nameerror"><form:errors path="SupplierPerformance.supplier_name"></form:errors></span></td>
                  <td valign="top" align="left" class="input_txt" >Certified to :</td>
				<td valign="top" align="left" class="input_txt">
													<select	name="certified_to" class="input_txtbx" id="certified" disabled="disabled">
                  										<option value="">--Select--</option>
                  											 
							 
			                <c:forEach items="${Certified_toform.certified_to}" var="certified" varStatus="status">
        				       <option value="${certified.certified_to}"<c:if test="${certified.certified_to == supplierperformance.certified_to}"><c:out value="selected"/></c:if>>${certified.certified_to}</option>
			                  </c:forEach>
			                 </select>
															<br/><span style="color: red;" id="certifiederror"><form:errors path="SupplierPerformance.certified_to"></form:errors></span></td>
                                  
                
                </tr>
		        <tr class="row2">
				  <td valign="top" align="left" class="input_txt" >Category :</td>
				<td valign="top" align="left" class="input_txt"><select	name="category" class="input_txtbx" id="category" disabled="disabled">
                  										<option value="">--Select--</option>
                  										 <c:forEach items="${addsuppliercategoryform.suppliercategory}" var="category" varStatus="status">
        				       <option value="${category.category}"<c:if test="${category.category == supplierperformance.category}"><c:out value="selected"/></c:if>>${category.category}</option>
			                  </c:forEach>
															</select>
															<br/><span style="color: red;" id="categoryerror"></span><form:errors path="SupplierPerformance.category"></form:errors></td>
                  <td valign="top" align="left" class="input_txt">Contact name :</td>
                  <td valign="top" align="left" class="input_txt" ><input type="text" name="contact_name" class="input_txtbx" id="inp_contact_name" maxlength="32" onkeypress="return onlyAlphabets(event,this);" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"  onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${supplierperformance.contact_name}" /><br/><span style="color: red;" id="contacterror"><form:errors path="SupplierPerformance.contact_name"></form:errors></span></td>
                                  
                </tr>
                <tr class="row1">
                  <td valign="top" align="left" class="input_txt" >Address :</td>
                  <td valign="top" align="left" class="input_txt" >
                  <%-- <input type="text" name="address" class="input_txtbx" id="inp_address" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${supplierperformance.address}" /><br/><span style="color: red;"><form:errors path="SupplierPerformance.address"></form:errors></span></td> --%>
                   <textarea class="input_txtbx" id="inp_address" name="address" readonly="readonly" style="height: 70px;">${supplierperformance.address}</textarea><br/>
				<span style="color: red;" id="addresserror"><form:errors path="supplierperformance.address"></form:errors></span></td>
			
                  <td valign="top" align="left" class="input_txt" >Title :</td>
                  <td valign="top" align="left" class="input_txt" ><input type="text" name="contact_title" readonly="readonly" class="input_txtbx" id="inp_contact_title" maxlength="32" onkeypress="return onlyAlphabetsnumeric(event,this);" onmouseover="showTooltip('tooltip_id','inp_id3');" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"  onmouseout="hideTooltip('tooltip_id');" value="${supplierperformance.contact_title}" /><br/><span style="color: red;" id="titleerror"><form:errors path="SupplierPerformance.contact_title"></form:errors></span></td>
                
                </tr>
				<tr class="row2">
				  <td valign="top" align="left" class="input_txt" >City :</td>
				  <td valign="top" align="left" class="input_txt" ><input type="text" name="city" readonly="readonly" class="input_txtbx" id="inp_city" maxlength="32" onkeypress="return onlyAlphabets(event,this);" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"  value="${supplierperformance.city}" /><br/><span style="color: red;" id="cityerror"><form:errors path="SupplierPerformance.city"></form:errors></span></td>
                  <td valign="top" align="left" class="input_txt" >Phone :</td>
                  <td valign="top" align="left" class="input_txt" ><input type="text" name="phone" readonly="readonly" class="input_txtbx" placeholder="9876543210" id="inp_phone" maxlength="10"  onkeypress="return validate(event)";  onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"  onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${supplierperformance.phone}" /><br/><span style="color: red;" id="phoneerror"><form:errors path="SupplierPerformance.phone"></form:errors></span></td>
                
                </tr>
              	<tr class="row1">
              	<td valign="top" align="left" class="input_txt" >State :</td>
              	<td valign="top" align="left" class="input_txt" ><input type="text" name="state" readonly="readonly" onkeypress="return onlyAlphabets(event,this);" maxlength="32" class="input_txtbx" id="inp_state" onmouseover="showTooltip('tooltip_id','inp_id3');" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"  onmouseout="hideTooltip('tooltip_id');" value="${supplierperformance.state}" /><br/><span style="color: red;" id="stateerror"><form:errors path="SupplierPerformance.state"></form:errors></span></td>
              	  <td valign="top" align="left" class="input_txt" >Fax :</td>
                  <td valign="top" align="left" class="input_txt" ><input type="text" maxlength="10" readonly="readonly"  placeholder="6143229928" onkeypress="return Number(event,this);" name="fax" class="input_txtbx" id="inp_fax" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"  onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${supplierperformance.fax}" /><br/><span style="color: red;" id="faxerror"><form:errors path="SupplierPerformance.fax"></form:errors></span></td>
                
              	</tr>
                <tr class="row2">
				<td valign="top" align="left" class="input_txt" >Postal code :</td>
				<td valign="top" align="left" class="input_txt" ><input type="text" name="postalcode" readonly="readonly" placeholder="OH 43230" maxlength="8" onblur="ChangeCase(this);" onkeypress="return AlphabetsNumber1(event,this);" class="input_txtbx" id="inp_postalcode"   onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"  onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${supplierperformance.postalcode}" /><br/><span style="color: red;" id="postalerror"><form:errors path="SupplierPerformance.postalcode"></form:errors></span></td>
                  <td valign="top" align="left" class="input_txt">Email :</td>
                  <td valign="top" align="left" class="input_txt" ><input type="text" name="email_address" readonly="readonly" class="input_txtbx" id="inp_email_address" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"  value="${supplierperformance.email_address}" /><br/><span style="color: red;"id="emailerror"><form:errors path="SupplierPerformance.email_address"></form:errors></span></td>
                
                </tr>
				<tr class="row1">
                  <td valign="top" align="left" class="input_txt" >Country :</td>
                  <td valign="top" align="left" class="input_txt" ><input type="text" name="country" readonly="readonly" class="input_txtbx" id="inp_country" maxlength="32" onkeypress="return onlyAlphabets(event,this);" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${supplierperformance.country}" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"  /><br/><span style="color: red;" id="countryerror"><form:errors path="SupplierPerformance.country"></form:errors></span></td>
                </tr>
                
                <tr class="row2">
                <td></td>
                <td></td>
                </tr>
                
                 			   <!--    <tr class="row1">
                  <td valign="top" align="left">&nbsp;</td>
                  <td valign="top" align="center" colspan="2"><input type="submit" value="Update" onclick="return checkSubmit();" class="submit_btn1"></td>
                </tr>
                  -->
               
              </table>
              
            </div>
            <div style="border:#993300  2px solid; padding:15px; margin-bottom:15px; margin-left:10px;">
          <table cellpadding="0" cellspacing="0" border="0" width="100%">
              <tr>
			<td align="left" valign="top" style="padding-right: 25px;">
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
                <input type="hidden" name="performance_id" class="input_txtbx" id="performanceid" readonly=readonly onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="<c:out value="${id}"/>"/>
                   <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="10%">Receipt Date  :</td>
                  <td valign="middle" align="left" class="input_txt" width="40%"><input type="text"  name="receipt_date" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}" value="${supplierperformance.receipt_date}" class="input_txtbx" id="datepicker2" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  />
                  <br><span id="datepicker22" style="color:red"></span>
                  <span class="err"><form:errors path="Maintenance.due_date"></form:errors></span></td>
                </tr>
          	 <tr class="row1">
                 <td valign="middle" align="left" class="input_txt" width="10%"> Type of Problem  :</td>
                  <td valign="top" align="left" class="input_txt" width="40%">
                  <select name= "type_of_problem" id="type_of_problem" class="dropdown" onchange="gettypeofproblem();">
                 
                  <option <c:if test="${supplierperformance.type_of_problem eq 'noproblem'}"><c:out value="Selected"/></c:if> value="noproblem">No Problem</option>
                  <option <c:if test="${supplierperformance.type_of_problem eq 'quality'}"><c:out value="Selected"/></c:if> value="quality">Quality</option>
                   <option <c:if test="${supplierperformance.type_of_problem eq 'delivery'}"><c:out value="Selected"/></c:if> value="delivery">Delivery</option>
                   <option <c:if test="${supplierperformance.type_of_problem eq 'customerservice'}"><c:out value="Selected"/></c:if> value="customerservice">Customer Service</option>
               </select>
                <br/><span class="err"></span></td>
                  </tr>
                <tr class="row2" id="quality_lable" style="display:none;">
                  <td valign="middle" align="left" class="input_txt" >Quality  :</td>
                  <td valign="top" align="left" class="input_txt" >
               
		            <select name="quality" class="dropdown" id="quality" onChange="toggleAjax()">
		                  <option <c:if test="${supplierperformance.quality eq '20'}"><c:out value="Selected"/></c:if> value="20">Critical</option>
		                  <option <c:if test="${supplierperformance.quality eq '10'}"><c:out value="Selected"/></c:if> value="10">Moderate</option>
		                   <option <c:if test="${supplierperformance.quality eq '5'}"><c:out value="Selected"/></c:if> value="5">Minor</option>
		            </select>
		            
                  </td>
                </tr>
                 <tr class="row2" id="delivery_lable" style="display:none;">
                  <td valign="middle" align="left" class="input_txt" width="15%">Delivery  :</td>
                  <td valign="top" align="left" class="input_txt" width="40%">
               
		            <select name="delivery" class="dropdown" id="delivery" onChange="toggleAjax()">
		                 
		                   
		                  <option <c:if test="${supplierperformance.delivery eq '10'}"><c:out value="Selected"/></c:if>  value="10">Late 1 day</option>
		                  <option <c:if test="${supplierperformance.delivery eq '20'}"><c:out value="Selected"/></c:if> value="20">Late 2+ day</option>
		                   <option <c:if test="${supplierperformance.delivery eq '5'}"><c:out value="Selected"/></c:if> value="5">Early 2+ days</option>
		                  </select>
                 </tr>
                 <tr class="row2" id="customerservice_lable" style="display:none;">
                  <td valign="middle" align="left" class="input_txt" width="15%">Customer Service  :</td>
                  <td valign="top" align="left" class="input_txt" width="40%">
               
		            <select name="customerservice" class="dropdown" id="customerservice" onChange="toggleAjax()">
		                  <option <c:if test="${supplierperformance.customerservice eq '15'}"><c:out value="Selected"/></c:if> value="15">Critical Issue</option>
		                  <option <c:if test="${supplierperformance.customerservice eq '10'}"><c:out value="Selected"/></c:if> value="10">Moderate Issue</option>
		                   <option <c:if test="${supplierperformance.customerservice eq '5'}"><c:out value="Selected"/></c:if> value="5">Minor Issue</option>
		            </select>
		            
                  </td>
                </tr>
                 <tr class="row2">
              
               <td valign="top" align="left" class="input_txt"width="15%">Problem Details  :</td>
               <td valign="top" align="left"  class="input_txt"width="40%"><textarea class="input_txtbx"  name="problemdetails" id="notes" style="height: 89px;" >${supplierperformance.problemdetails }</textarea><br/>
               <span id="notes1" style="color:red"></span>
               <span class="err"><form:errors path="Maintenance.notes"></form:errors></span></td>
            </tr>
             <tr class="row1">
                 <td valign="middle" align="left" class="input_txt" width="15%">Problem Found at  :</td>
                  <td valign="top" align="left" class="input_txt" width="40%">
                  <select name= "problem_found_at" id="problem_found_at" class="dropdown" onChange="toggleAjax();" >
                 
                  <option <c:if test="${supplierperformance.problem_found_at eq '1'}"><c:out value="Selected"/></c:if> value="1">Receiving</option>
                  <option <c:if test="${supplierperformance.problem_found_at eq '1.5'}"><c:out value="Selected"/></c:if> value="1.5">In-process</option>
                   <option <c:if test="${supplierperformance.problem_found_at eq '2'}"><c:out value="Selected"/></c:if> value="2">Customer</option>
               </select>
                <br/><span class="err"></span></td>
                  </tr>
                  
                 
        </table>
        </td> 
           <td align="left" valign="top" width="43%" style="padding-right: 25px;">
          	<table cellpadding="0" cellspacing="0" border="0" width="100%">
            <tr class="row2">
               <td valign="top" align="left" class="input_txt" width="40%">Request Corrective Action (Y/N)  :</td>
               <td valign="top" align="left" class="input_txt" width="40%">
               <input type="radio" name="correctiveaction" value="Yes"  onclick="Correctiveaction();" id="correctiveaction_yes"  <c:if test="${supplierperformance.correctiveaction=='Yes'}"><c:out value="Checked=checked"/></c:if>>Yes&nbsp;&nbsp;&nbsp;
               <input type="radio" name="correctiveaction" value="No" onclick="Correctiveaction();" id="correctiveaction_no"  <c:if test="${supplierperformance.correctiveaction=='No'}"><c:out value="Checked=checked"/></c:if>>No&nbsp;&nbsp;&nbsp;<br/><span class="err"></span>
               <br><span id="correctiveaction_error" style="color:red;"></span>
               </td>
               </tr>
              
             <tr class="row2" id="duedate_label">
                  <td valign="middle" align="left" class="input_txt" width="40%">Due Date for Corrective Action  :</td>
                  <td valign="top" align="left" class="input_txt" width="40%"><input type="text" name="dueaction_date"  onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}" value="${supplierperformance.dueaction_date}" class="input_txtbx" id="datepicker3" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" />
                <br>  <span id="datepicker33" style="color:red"></span>
                  <span class="err"><form:errors path="Maintenance.completion_date"></form:errors></span></td>
                </tr>
               
           <tr class="row2" id="deduction_label" >
                  <td valign="middle" align="left" class="input_txt" width="40%">Deduction for Issue  :</td>
                  <td valign="top" align="left" class="input_txt" width="40%">
                  
                  <input type="text" name="deduction" readonly="readonly"  value="${supplierperformance.deduction }" class="input_txtbx" id="deduction_for_issue" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" />
                  <!--  <input type="button" value="check"  id="check_for_issue" onclick="Find_deduction();" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" /> -->
                <br>  <span id="deduction_for_issueerror" style="color:red"></span>
                  <span class="err"><form:errors path="Maintenance.completion_date"></form:errors></span></td>
                </tr>
           
                <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="40%">Recorded By  :</td>
                  <td valign="top" align="left" class="input_txt" width="40%">
                    <input type="text" name="recordedby" value="${supplierperformance.recordedby}" class="input_txtbx" id="recordedby" maxlength="32" onkeypress="return onlyAlphabets(event,this);" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" />
                   <br>  <span id="recordedby_error" style="color:red"></span>
                   </td>
                </tr>
              
            <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="40%">Recording Date  :</td>
                  <td valign="middle" align="left" class="input_txt" width="40%"><input type="text"  name="recording_date" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}" value="${supplierperformance.recording_date }" class="input_txtbx" id="datepicker1" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  />
                  <br><span id="datepicker11" style="color:red"></span>
                  <span class="err"><form:errors path="Maintenance.due_date"></form:errors></span></td>
                </tr>
            
               
          <tr class="row1">
                  <td valign="top" align="left">&nbsp;</td>
                   <td valign="top" align="left">&nbsp;</td>
                  </tr>
                    <tr class="row1">
                  <td valign="top" align="left">&nbsp;</td>
                   <td valign="top" align="left">&nbsp;</td>
                  </tr>
         
       </table>
       </td>
       </tr>
       
       </table>
       </div>
    
          </div></td>
      </tr>
       <tr class="row1">
                  <td valign="bottom" colspan="4"align="right" style="padding-right:125px;">&nbsp;<input type="submit" value="Update" onclick="return validation();"class="submit_btn1"></td>
                
                </tr>
      </table>
      </form>
      </div>
  
<script type="text/javascript">
function Find_deduction()
{
	
	var problem_found_at1 = document.getElementById('problem_found_at').value;
	var deduction_for_issue = document.getElementById('deduction_for_issue');
	if(document.getElementById('type_of_problem').value == "noproblem")
		{
		deduction_for_issue.value = "N/A";
		}
	else if(document.getElementById('type_of_problem').value == "quality")
		{
		calc.deduction_for_issue.value = (calc.problem_found_at.value)*(calc.quality.value);
		}
	else if(document.getElementById('type_of_problem').value == "delivery")
	{
		
		calc.deduction_for_issue.value = (calc.problem_found_at.value)*(calc.delivery.value);
	}
	else if(document.getElementById('type_of_problem').value == "customerservice")
	{
		
		calc.deduction_for_issue.value = (calc.problem_found_at.value)*(calc.customerservice.value);
	}
	}
</script>
<script>	
function Correctiveaction()
{
	
	var yes = document.getElementById('correctiveaction_yes').checked;
	
	if(yes)
		{
				$("#duedate_label").toggle('slow');	
				
		}
	else
		{
		$("#duedate_label").hide('slow');
		document.getElementById('datepicker3').value="";
		
		}
	
}
function Correctiveaction1()
{
	
	var yes = document.getElementById('correctiveaction_yes').checked;
	
	if(yes)
		{
			
				
		}
	else
		{
		$("#duedate_label").hide('slow');
		document.getElementById('datepicker3').value="";
		
		}
	
}

            function gettypeofproblem(){
            	var value = document.getElementById('type_of_problem').value;
            
            if(value=="quality")
            {	
            	$("#delivery_lable").hide('slow');
            	$("#customerservice_lable").hide('slow');
            	$("#quality_lable").toggle('slow');
            	Find_deduction();
            }
            else if(value=="delivery")
            {	
            	$("#customerservice_lable").hide('slow');
            	$("#quality_lable").hide('slow');
            	$("#delivery_lable").toggle('slow');
            	Find_deduction();
            
            }
			else if(value=="customerservice")
            {	
				$("#quality_lable").hide('slow');
            	$("#delivery_lable").hide('slow');
            	$("#customerservice_lable").toggle('slow');
            	Find_deduction();
            }
			else if(value=="noproblem")
            {	
				$("#quality_lable").hide('slow');
            	$("#delivery_lable").hide('slow');
            	$("#customerservice_lable").hide('slow');
            	Find_deduction();
            }
           }
            
            </script>
<script>
function toggleAjax()
{
	
		Find_deduction();
		
}


</script>            
      
  <script>
  $(function() {
	$("#inp_supplier_name").on("keypress", function(e) {
		if (e.which === 32 && !this.value.length)
	        e.preventDefault();
	});
	});	
  $(function() {
		$("#inp_website").on("keypress", function(e) {
			if (e.which === 32 && !this.value.length)
		        e.preventDefault();
		});
		});	
  $(function() {
		$("#inp_contact_name").on("keypress", function(e) {
			if (e.which === 32 && !this.value.length)
		        e.preventDefault();
		});
		});	
  $(function() {
		$("#inp_address").on("keypress", function(e) {
			if (e.which === 32 && !this.value.length)
		        e.preventDefault();
		});
		});	
  $(function() {
		$("#inp_contact_title").on("keypress", function(e) {
			if (e.which === 32 && !this.value.length)
		        e.preventDefault();
		});
		});	
  $(function() {
		$("#inp_city").on("keypress", function(e) {
			if (e.which === 32 && !this.value.length)
		        e.preventDefault();
		});
		});	/* 
  $(function() {
		$("#inp_phone").on("keypress", function(e) {
			if (e.which === 32 && !this.value.length)
		        e.preventDefault();
		});
		});	 */
  $(function() {
		$("#inp_state").on("keypress", function(e) {
			if (e.which === 32 && !this.value.length)
		        e.preventDefault();
		});
		});	
  $(function() {
		$("#inp_fax").on("keypress", function(e) {
			if (e.which === 32 && !this.value.length)
		        e.preventDefault();
		});
		});	
  $(function() {
		$("#inp_postalcode").on("keypress", function(e) {
			if (e.which === 32 && !this.value.length)
		        e.preventDefault();
		});
		});	
  $(function() {
		$("#inp_email_address").on("keypress", function(e) {
			if (e.which === 32 && !this.value.length)
		        e.preventDefault();
		});
		});	
  $(function() {
		$("#inp_country").on("keypress", function(e) {
			if (e.which === 32 && !this.value.length)
		        e.preventDefault();
		});
		});	
  $(function() {
	  	$("#notes").on("keypress", function(e) {
	  	
	  	if (e.which === 32 && !this.value.length)
	          e.preventDefault();
	  });
	  });
	  $(function() {
			$("#recordedby").on("keypress", function(e) {
				if (e.which === 32 && !this.value.length)
			        e.preventDefault();
			});
			});	
</script>

<script>
function validatename(id)
{
	var textInput = document.getElementById(id).value;
	textInput = textInput.replace(/[^A-Za-z ]/g, "");
	document.getElementById(id).value = textInput;
}
</script>
<script>
function ChangeCase(elem)
{
    elem.value = elem.value.toUpperCase();
}
</script>
<script>
function AlphabetsNumber1(e, t) {
    try {
    
    	
        if (window.event) {
            var charCode = window.event.keyCode;
        }
        else if (e) {
            var charCode = e.which;
        }
        
        else { return true; }
       /*  if(t.value.substring(0,1))
        	{
        	alert()
        	alert(e.which);
        	} */
        if(t.value.length<2)
        	{
        if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123))
            return true;
        else
            return false;
        	}
        if(t.value.length==2)
        	{
        	
        	t.value+=" ";
        	}
        
        
        if(t.value.length>=2)
    	{
        	
    if ((charCode >47 && charCode < 58))
        return true;
    else
        return false;
    	
    	}
    }
    catch (err) {
        alert(err.Description);
    }
}
function Number(e, t) {
    try {
        if (window.event) {
            var charCode = window.event.keyCode;
        }
        else if (e) {
            var charCode = e.which;
        }
        else { return true; }
        if ((charCode >47 && charCode < 58))
            return true;
        else
            return false;
    }
    catch (err) {
        alert(err.Description);
    }
}


</script>

 <script>
i=0;
$(document).ready(function(){
$("#inp_fax").blur(function(){
var phone=document.getElementById("inp_fax").value;
phone = phone.replace(/(\d{3})(\d{3})(\d{4})/,'$1-$2-$3');
document.getElementById("inp_fax").value=phone;
 });  
$("#inp_fax").focus(function(){
	
	var phone=document.getElementById("inp_fax").value;
	phone = phone.replace("-","");
	phone = phone.replace("-","");
	document.getElementById("inp_fax").value=phone;
	 });
	 $("#inp_phone").blur(function(){
var phone=document.getElementById("inp_phone").value;
phone = phone.replace(/(\d{3})(\d{3})(\d{4})/,'$1-$2-$3');
document.getElementById("inp_phone").value=phone;
 });  
$("#inp_phone").focus(function(){
	
	var phone=document.getElementById("inp_phone").value;
	phone = phone.replace("-","");
	phone = phone.replace("-","");
	document.getElementById("inp_phone").value=phone;
	 }); 
});
</script>
<script>

$('#formid').on('submit', function() {
	
	    $('#certified').attr('disabled', false);
	    $('#category').attr('disabled', false);
	});
	
	function validation()
	{
		var contact = document.getElementById('inp_contact_name').value;
		var address = document.getElementById('inp_address').value;
		var title = document.getElementById('inp_contact_title').value;
		var city = document.getElementById('inp_city').value;
		var phone = document.getElementById('inp_phone').value;
		var state = document.getElementById('inp_state').value;
		var fax = document.getElementById('inp_fax').value;
		var postal = document.getElementById('inp_postalcode').value;
		var email = document.getElementById('inp_email_address').value;
		var country = document.getElementById('inp_country').value;
		var certified = document.getElementById('certified').value;
		var category = document.getElementById('category').value; 
		var error="";
		var mobile = /(\W|^)[(]{0,1}\d{3}[)]{0,1}[\s-]{0,1}\d{3}[\s-]{0,1}\d{4}(\W|$)/;
		var date = /^\d{4}-(0?[1-9]|1[012])-(0?[1-9]|[12][0-9]|3[01])$/;
		var datepicker2 = document.getElementById('datepicker2').value;
		var notes = document.getElementById('notes').value;
		var datepicker3 = document.getElementById('datepicker3').value;
		
		 var yes = document.getElementById('correctiveaction_yes').checked;
		 var datepicker1 = document.getElementById('datepicker1').value;
		 var recorded_by = document.getElementById('recordedby').value;
		 
		if(certified=="")
		{
		
		document.getElementById("certifiederror").innerHTML="Required field should not be empty";
		error="true";
		}
		else{
		document.getElementById("certifiederror").innerHTML="";
		}
		if(category=="")
		{
		
		document.getElementById("categoryerror").innerHTML="Required field should not be empty";
		error="true";
		}
		else{
		document.getElementById("categoryerror").innerHTML="";
		}
		if(document.getElementById("inp_supplier_name").value=="")
			{
			
			document.getElementById("nameerror").innerHTML="Required field should not be empty";
			error="true";
			}
		else if(document.getElementById("inp_supplier_name").value.substring(0,1)==" ")
		{
		document.getElementById("nameerror").innerHTML="Should not accept initial space";
		 error="true";
		}
		
		else if(document.getElementById("inp_supplier_name").value.length<4 || document.getElementById("inp_supplier_name").value.length>=32)
	    {
	    	
	    	document.getElementById("nameerror").innerHTML="Required field should be length of 4 to 32";
			error="true";
	    }

	    
	    else
	    	{
	    	document.getElementById("nameerror").innerHTML="";
	    	}		
		if(contact =="")
		 {
		
			 document.getElementById("contacterror").innerHTML="Required field should not be empty";
			 error="true";
		 }
		else if(document.getElementById("inp_contact_name").value.substring(0,1)==" ")
		{
		document.getElementById("contacterror").innerHTML="Should not accept initial space";
		 error="true";
		}
			
		else if(document.getElementById("inp_contact_name").value.length<4 || document.getElementById("inp_contact_name").value.length>=32)
		    {
		    	
		    	document.getElementById("contacterror").innerHTML="Required field should be length of 4 to 32";
		    	 error="true";
		    } 
		
		
		    else
		    	{
		    	document.getElementById("contacterror").innerHTML="";
		    	}
		if(address =="")
		 {
		
			 document.getElementById("addresserror").innerHTML="Required field should not be empty";
			 error="true";
		 }
		else if(document.getElementById("inp_address").value.substring(0,1)==" ")
		{
		document.getElementById("addresserror").innerHTML="Should not accept initial space";
		 error="true";
		}
			
		else if(document.getElementById("inp_address").value.length<4 || document.getElementById("inp_address").value.length>=500)
		    {
		    	
		    	document.getElementById("addresserror").innerHTML="Required field should be length of 4 to 500";
		    	 error="true";
		    } 
		
		
		    else
		    	{
		    	document.getElementById("addresserror").innerHTML="";
		    	}
		if(title =="")
		 {
		
			 document.getElementById("titleerror").innerHTML="Required field should not be empty";
			 error="true";
		 }
		else if(document.getElementById("inp_contact_title").value.substring(0,1)==" ")
		{
		document.getElementById("titleerror").innerHTML="Should not accept initial space";
		 error="true";
		}
			
		else if(document.getElementById("inp_contact_title").value.length<4 || document.getElementById("inp_contact_title").value.length>=32)
		    {
		    	
		    	document.getElementById("titleerror").innerHTML="Required field should be length of 4 to 32";
		    	 error="true";
		    } 
		
		    else
		    	{
		    	document.getElementById("titleerror").innerHTML="";
		    	}
		if(city =="")
		 {
		
			 document.getElementById("cityerror").innerHTML="Required field should not be empty";
			 error="true";
		 }
		else if(document.getElementById("inp_city").value.substring(0,1)==" ")
		{
		document.getElementById("cityerror").innerHTML="Should not accept initial space";
		 error="true";
		}
		
			
		else if(document.getElementById("inp_city").value.length<4 || document.getElementById("inp_city").value.length>=32)
		    {
		    	
		    	document.getElementById("cityerror").innerHTML="Required field should be length of 4 to 32";
		    	 error="true";
		    } 
		    else
		    	{
		    	document.getElementById("cityerror").innerHTML="";
		    	}
		if(state =="")
		 {
		
			 document.getElementById("stateerror").innerHTML="Required field should not be empty";
			 error="true";
		 }
		else if(document.getElementById("inp_state").value.substring(0,1)==" ")
		{
		document.getElementById("stateerror").innerHTML="Should not accept initial space";
		 error="true";
		}
		
			
		else if(document.getElementById("inp_state").value.length<4 || document.getElementById("inp_state").value.length>=32)
		    {
		    	
		    	document.getElementById("stateerror").innerHTML="Required field should be length of 4 to 32";
		    	 error="true";
		    } 
		    else
		    	{
		    	document.getElementById("stateerror").innerHTML="";
		    	}
		if(country =="")
		 {
		
			 document.getElementById("countryerror").innerHTML="Required field should not be empty";
			 error="true";
		 } 
		
		else if(document.getElementById("inp_country").value.substring(0,1)==" ")
		{
		document.getElementById("countryerror").innerHTML="Should not accept initial space";
		 error="true";
		}
		else if(document.getElementById("inp_country").value.length<4 || document.getElementById("inp_country").value.length>=32)
		    {
		    	
		    	document.getElementById("countryerror").innerHTML="Required field should be length of 4 to 32";
		    	 error="true";
		    } 
		
		    else
		    	{
		    	document.getElementById("countryerror").innerHTML="";
		    	}
	

		
		var mail = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,3}$/;
	    
		if(email=="")
		{
		document.getElementById("emailerror").innerHTML="Required field should not be empty";
		error="true";
		}
		
		else if(email.match(mail)==null)
	    {
	    	document.getElementById("emailerror").innerHTML="Invalid E-mail format";
	    	error="true";
	    }
		else if(email.substring(0,1)==" ")
		{
		document.getElementById("emailerror").innerHTML="Should not accept initial space";
		 error="true";
		}
		else
			{
			document.getElementById("emailerror").innerHTML="";
			}

		var zipcode =/^\d{5}$/;
		var zero = 00000;
	
	    if(postal=="")	
		{
		document.getElementById("postalerror").innerHTML="Required field should not be empty";
		error="true";
		}
	    
	    else if(document.getElementById("inp_postalcode").value.length<4 ||document.getElementById("inp_postalcode").value.length>8)
	    {
	    
	    	document.getElementById("postalerror").innerHTML="Field should be of length 5";
	    	 error="true";
	    } 

		/* else if(document.getElementById("inp_postalcode").value.match(zipcode)==null)
	    {
	    	document.getElementById("postalerror").innerHTML="Invalid postalcode format";
	    	error="true";
	    } */
	    else if(document.getElementById("inp_postalcode").value.match(zero))
	    	{
	    	document.getElementById("postalerror").innerHTML="invalid postalCode format";
	    	}
	    else
	    	{
	    	document.getElementById('postalerror').innerHTML="";
	    	}
	    
	     
 document.getElementById("faxerror").innerHTML=" ";
	
	if(document.getElementById("inp_fax").value=="")
	{
	document.getElementById("faxerror").innerHTML="Required field should not be empty";
	error="true";
	}
	 var faxreg = /^\(?([0-9]{3})\)?[-]?([0-9]{3})[-]?([0-9]{4})$/;  
	 //var faxreg = /\+1(|\.|\-)[2-9][0-9]{2}(|\.|\-)[0-9]{3}(|\.|\-)[0-9]{4}/;
	 if(document.getElementById("inp_fax").value!="") 
		 {
	 if(document.getElementById("inp_fax").value.match(faxreg)==null)
	    {
	    	document.getElementById("faxerror").innerHTML="Invalid fax number format";
	    	error="true";
	    }}

	   // var website = /(ftp|http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/;
		  
	     var website= /^[a-zA-Z0-9]+[a-zA-Z0-9.-]+\.[a-zA-Z]{2,3}$/;
	    if(document.getElementById("inp_website").value=="")	
		{
		document.getElementById("websiteerror").innerHTML="Required field should not be empty";
		error="true";
		}

	    else if(document.getElementById("inp_website").value.match(website)==null)
	    {
	    	document.getElementById("websiteerror").innerHTML="Invalid website Format";
	    	error="true";
	    }
	    else
	    	{
	    	document.getElementById("websiteerror").innerHTML="";
	    	}
	
	    if(phone =="")
		  {
		  document.getElementById("phoneerror").innerHTML="Required field should not be empty";
	    	error="true";
		  }
	  
	  else if(phone.match(mobile)){  
		  if((phone == "0000000000") || (phone == "1111111111"))
		   {
		   document.getElementById("phoneerror").innerHTML="Invalid Number";
	    	error="true";
			}
		  else
		   {
		   document.getElementById("phoneerror").innerHTML="";
		   }
	  }
	  else{
		  document.getElementById("phoneerror").innerHTML="Field should contain 10 digits";
	    	error="true";
	  }
	    if(datepicker2 == "")
		 {
		 document.getElementById("datepicker22").innerHTML="Required field should not be empty";
		 error="true";
		 
		 }
		 else if(datepicker2.match(date))
		 {
		 document.getElementById("datepicker22").innerHTML="";
		 }
		 else
		 {
		 document.getElementById("datepicker22").innerHTML="Invalid date";
		 error="true";
		 }

	    if(notes == "")
		{
		 
		document.getElementById("notes1").innerHTML="Required field should not be empty";
		error="true";
		}
	 else if(notes.charAt(0) == " ")
		{
		document.getElementById("notes1").innerHTML="Should not accept initial space";
		error="true";
		}
		else if(notes.length < 4 || notes.length > 400 )
			 {
			 document.getElementById("notes1").innerHTML="Required field should be length of 4 to 400";
			 error="true";
			 }
		 else{
		     document.getElementById("notes1").innerHTML="";
		     }
	   
		if(yes)
			{
			    if(datepicker3 == "")
				 {
				 document.getElementById("datepicker33").innerHTML="Required field should not be empty";
				 error="true";
				 
				 }
				 else if(datepicker3.match(date))
				 {
				 document.getElementById("datepicker33").innerHTML="";
				 }
				 else
				 {
				 document.getElementById("datepicker33").innerHTML="Invalid date";
				 error="true";
				 } 
			}  
	    
	    
	    if(datepicker1 == "")
		 {
		 document.getElementById("datepicker11").innerHTML="Required field should not be empty";
		 error="true";
		 
		 }
		 else if(datepicker1.match(date))
		 {
		 document.getElementById("datepicker11").innerHTML="";
		 }
		 else
		 {
		 document.getElementById("datepicker11").innerHTML="Invalid date";
		 error="true";
		 }
	    if(recorded_by =="")
		 {
		
			 document.getElementById("recordedby_error").innerHTML="Required field should not be empty";
			 error="true";
		 }
		else if(document.getElementById("recordedby").value.substring(0,1)==" ")
		{
		document.getElementById("recordedby_error").innerHTML="Should not accept initial space";
		 error="true";
		}
		
			
		else if(document.getElementById("recordedby").value.length<4 || document.getElementById("recordedby").value.length>=32)
		    {
		    	
		    	document.getElementById("recordedby_error").innerHTML="Required field should be length of 4 to 32";
		    	 error="true";
		    } 
		    else
		    	{
		    	document.getElementById("recordedby_error").innerHTML="";
		    	}
	    var yes = document.getElementById('correctiveaction_yes').checked;
	    var no = document.getElementById('correctiveaction_no').checked;
	    
	    if(!(yes) && !(no))
	    	{
	    	document.getElementById("correctiveaction_error").innerHTML="Required field should not be empty";
	    	 error="true";
	    	}
	    else
	    	{
	    	document.getElementById("correctiveaction_error").innerHTML="";
	    	}
	    if(error == "true")
	    	{
		return false;
		}
		
		
	}
	</script>

<script>

	function checkSubmit()
	{
		var mobile = /(\W|^)[(]{0,1}\d{3}[)]{0,1}[\s-]{0,1}\d{3}[\s-]{0,1}\d{4}(\W|$)/;
		var contact = document.getElementById('inp_contact_name').value;
		var address = document.getElementById('inp_address').value;
		var title = document.getElementById('inp_contact_title').value;
		var city = document.getElementById('inp_city').value;
		var phone = document.getElementById('inp_phone').value;
		var state = document.getElementById('inp_state').value;
		var fax = document.getElementById('inp_fax').value;
		var postal = document.getElementById('inp_postalcode').value;
		var email = document.getElementById('inp_email_address').value;
		var country = document.getElementById('inp_country').value;
		var certified = document.getElementById('certified').value;
		var category = document.getElementById('category').value; 
		var error="";
		
		if(category=="")	
		{
		
		document.getElementById("categoryerror").innerHTML="Required field should not be empty select one";
		error="true";
		}
		else{
		document.getElementById("categoryerror").innerHTML="";
		}
		if(certified=="")
		{
		
		document.getElementById("certifiederror").innerHTML="Required field should not be empty";
		error="true";
		}
		else{
		document.getElementById("certifiederror").innerHTML="";
		}
		document.getElementById("nameerror").innerHTML="";
		if(document.getElementById("inp_supplier_name").value=="")
			{
			
			document.getElementById("nameerror").innerHTML="Required field should not be empty";
			error="true";
			}
		else if(document.getElementById("inp_supplier_name").value.substring(0,1)==" ")
		{
		document.getElementById("nameerror").innerHTML="Should not accept initial space";
		 error="true";
		}
		else if(document.getElementById("inp_supplier_name").value.length<4 || document.getElementById("inp_supplier_name").value.length>=32)
	    {
	    	
	    	document.getElementById("nameerror").innerHTML="Required field should be length of 4 to 32";
			error="true";
	    }
		
	    else
	    	{
	    	document.getElementById("nameerror").innerHTML="";
	    	}		
		
		if(contact =="")
		 {
		
			 document.getElementById("contacterror").innerHTML="Required field should not be empty";
			 error="true";
		 } 
			
		else if(document.getElementById("inp_contact_name").value.substring(0,1)==" ")
		{
		document.getElementById("contacterror").innerHTML="Should not accept initial space";
		 error="true";
		}
		
		else if(document.getElementById("inp_contact_name").value.length<4 || document.getElementById("inp_contact_name").value.length>=32)
		    {
		    	
		    	document.getElementById("contacterror").innerHTML="Required field should be length of 4 to 32";
		    	 error="true";
		    } 
		
		    else
		    	{
		    	document.getElementById("contacterror").innerHTML="";
		    	}
		
		if(address =="")
		 {
		
			 document.getElementById("addresserror").innerHTML="Required field should not be empty";
			 error="true";
		 } 
		else if(document.getElementById("inp_address").value.substring(0,1)==" ")
		{
		document.getElementById("addresserror").innerHTML="Should not accept initial space";
		 error="true";
		}	
		else if(document.getElementById("inp_address").value.length<4 || document.getElementById("inp_address").value.length>=500)
		    {
		    	
		    	document.getElementById("addresserror").innerHTML="Required field should be length of 4 to 500";
		    	 error="true";
		    } 
		
		    else
		    	{
		    	document.getElementById("addresserror").innerHTML="";
		    	}
		if(title =="")
		 {
		
			 document.getElementById("titleerror").innerHTML="Required field should not be empty";
			 error="true";
		 } 
		
		else if(document.getElementById("inp_contact_title").value.substring(0,1)==" ")
		{
		document.getElementById("titleerror").innerHTML="Should not accept initial space";
		 error="true";
		}
		else if(document.getElementById("inp_contact_title").value.length<4 || document.getElementById("inp_contact_title").value.length>=32)
		    {
		    	
		    	document.getElementById("titleerror").innerHTML="Required field should be length of 4 to 32";
		    	 error="true";
		    } 
		
		    else
		    	{
		    	document.getElementById("titleerror").innerHTML="";
		    	}
		if(city =="")
		 {
		
			 document.getElementById("cityerror").innerHTML="Required field should not be empty";
			 error="true";
		 } 
		else if(document.getElementById("inp_city").value.substring(0,1)==" ")
		{
		document.getElementById("cityerror").innerHTML="Should not accept initial space";
		 error="true";
		}	
		else if(document.getElementById("inp_city").value.length<4 || document.getElementById("inp_city").value.length>=32)
		    {
		    	
		    	document.getElementById("cityerror").innerHTML="Required field should be length of 4 to 32";
		    	 error="true";
		    } 
		
		    else
		    	{
		    	document.getElementById("cityerror").innerHTML="";
		    	}
		
		if(state =="")
		 {
		
			 document.getElementById("stateerror").innerHTML="Required field should not be empty";
			 error="true";
		 } 
			
		else if(document.getElementById("inp_state").value.substring(0,1)==" ")
		{
		document.getElementById("stateerror").innerHTML="Should not accept initial space";
		 error="true";
		}
		else if(document.getElementById("inp_state").value.length<4 || document.getElementById("inp_state").value.length>=32)
		    {
		    	
		    	document.getElementById("stateerror").innerHTML="Required field should be length of 4 to 32";
		    	 error="true";
		    } 
		
		    else
		    	{
		    	document.getElementById("stateerror").innerHTML="";
		    	}
		if(country =="")
		 {
		
			 document.getElementById("countryerror").innerHTML="Required field should not be empty";
			 error="true";
		 } 
		
		else if(document.getElementById("inp_country").value.substring(0,1)==" ")
		{
		document.getElementById("countryerror").innerHTML="Should not accept initial space";
		 error="true";
		}
		else if(document.getElementById("inp_country").value.length<4 || document.getElementById("inp_country").value.length>=32)
		    {
		    	
		    	document.getElementById("countryerror").innerHTML="Required field should be length of 4 to 32";
		    	 error="true";
		    } 
		
		    else
		    	{
		    	document.getElementById("countryerror").innerHTML="";
		    	}
		var mail = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,3}$/;
	    
		if(email=="")
		{
		document.getElementById("emailerror").innerHTML="Required field should not be empty";
		error="true";
		}
		
		else if(email.match(mail)==null)
	    {
	    	document.getElementById("emailerror").innerHTML="Invalid E-mail format";
	    	error="true";
	    }
		else if(email.substring(0,1)==" ")
		{
		document.getElementById("emailerror").innerHTML="Should not accept initial space";
		 error="true";
		}
		else
			{
			document.getElementById("emailerror").innerHTML="";
			}


		//var zipcode =/^\d{5}$/;
		var zero = 00000;
	    
	    if(postal=="")	
		{
		document.getElementById("postalerror").innerHTML="Required field should not be empty";
		error="true";
		}
	    else if(document.getElementById("inp_postalcode").value.length<4 || document.getElementById("inp_postalcode").value.length>8)
	    {
	    
	    	document.getElementById("postalerror").innerHTML="Field should be of length 4 to 8";
	    	 error="true";
	    } 
		/* else if(document.getElementById("inp_postalcode").value.match(zipcode)==null)
	    {
	    	document.getElementById("postalerror").innerHTML="Invalid postalcode format";
	    	error="true";
	    } */
	    else if(document.getElementById("inp_postalcode").value.match(zero))
	    	{
	    	document.getElementById("postalerror").innerHTML="Invalid postalcode";
	    	}
	    else
	    	{
	    	document.getElementById('postalerror').innerHTML="";
	    	}
	    

	    document.getElementById("faxerror").innerHTML=" ";
	    if(document.getElementById("inp_fax").value!="")
	    	{
	   	if(document.getElementById("inp_fax").value=="")
	   	{
	   	document.getElementById("faxerror").innerHTML="Required field should not be empty";
	   	error="true"
	   	}}
	   	document.getElementById("faxerror").innerHTML=" ";
	   	 //var faxreg = /\+1(|\.|\-)[2-9][0-9]{2}(|\.|\-)[0-9]{3}(|\.|\-)[0-9]{4}/;
	   	  var faxreg = /^\(?([0-9]{3})\)?[-]?([0-9]{3})[-]?([0-9]{4})$/;  
	   	    if(document.getElementById("inp_fax").value.match(faxreg)==null)
	   	    {
	   	    	document.getElementById("faxerror").innerHTML="Invalid fax number format";
	   	     }

	    

	   // var website = /(ftp|http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/;
		  var website= /^[a-zA-Z0-9]+[a-zA-Z0-9.-]+\.[a-zA-Z]{2,3}$/;
	    if(document.getElementById("inp_website").value=="")	
		{
		document.getElementById("websiteerror").innerHTML="Required field should not be empty";
		error="true";
		}

	    else if(document.getElementById("inp_website").value.match(website)==null)
	    {
	    	document.getElementById("websiteerror").innerHTML="Invalid website format";
	    	error="true";
	    }
	    else
	    	{
	    	document.getElementById("websiteerror").innerHTML="";
	    	}
	

	    if(phone =="")
		  {
		  document.getElementById("phoneerror").innerHTML="Required field should not be empty";
	    	error="true";
		  }
	  
	  else if(phone.match(mobile)){  
		  if((phone == "0000000000") || (phone == "1111111111"))
		   {
		   document.getElementById("phoneerror").innerHTML="Invalid number";
	    	error="true";
			}
		  else
		   {
		   document.getElementById("phoneerror").innerHTML="";
		   }
	  }
	  else{
		  document.getElementById("phoneerror").innerHTML="Field should contain 10 digits";
	    	error="true";
	  }
  	

	    if(error == "true")
	    	{
		return false; 	 	
		}
		
		
	}
	</script>

<script type="text/javascript">
       function validate(event) {
          
           var regex = new RegExp("^[0-9]+$");
           var key = String.fromCharCode(event.charCode ? event.which : event.charCode);
           if (!regex.test(key)) {
             // document.getElementById("cmaerr").innerHTML="enter numerics or decimals only";
               event.preventDefault();
               return false;
           }
       }       
    </script>
  
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
    
    function onlyAlphabetsnumeric(e, t) {
        try {
            if (window.event) {
                var charCode = window.event.keyCode;
            }
            else if (e) {
                var charCode = e.which;
            }
            else { return true; }
            if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123)|| (charCode==32) || (charCode > 47 && charCode < 58))
                return true;
            else
                return false;
        }
        catch (err) {
            alert(err.Description);
        }
    }
    
    </script>  
       <script>
 $(function() {
	 $( "#datepicker2" ).datepicker({dateFormat: 'yy-mm-dd'});
        });
 
</script>
 <script>
 $(function() {
	 $( "#datepicker3" ).datepicker({dateFormat: 'yy-mm-dd'});
        });
 
</script>
             <script>
 $(function() {
	 $( "#datepicker1" ).datepicker({dateFormat: 'yy-mm-dd'});
        });
 
</script>
  <script>
	
	window.onload = function(){
		gettypeofproblem();Correctiveaction1();
	}
		</script>  

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>
<jsp:include page="footer.jsp"></jsp:include>
                
