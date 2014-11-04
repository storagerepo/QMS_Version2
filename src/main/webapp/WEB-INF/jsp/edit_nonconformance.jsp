<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="header.jsp"></jsp:include>
<script src="resources/js/jquery-1.7.2.min.js"></script>
<link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" />
<script src="resources/js/jquery.min.js"></script>
 <script src="resources/js/jquery-ui.js"></script>

<script>
$(function() {
	 $( "#datepicker" ).datepicker({dateFormat: 'yy-mm-dd'});
      });


$(function() {
	 $( "#datepicker1" ).datepicker({dateFormat: 'yy-mm-dd'});
       });


 
</script>

<div id="right_content">
<form action="update_nonconformance" method="POST" name="update" id="update">

<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
     <tr>
     <td>
      <div>
  <ul class="horizmenu" style=" float:left;margin-left:190px; margin-top:8px;">
						
						<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="add_nonconformance" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Add Nonconformance</span>
									
								</a>
							</li>

							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="view_nonconformance" class="<c:choose>
								<c:when test="${menu=='nonconformance'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									<span>View Nonconformance</span>
									
								</a>
							</li>
							
								<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="nonconformance_report" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Reports</span>
									
								</a>
							</li>
				            </ul>
  </div>
     </td>
     </tr>
     
      <tr>
        <td valign="top" align="left">
        	
	            <div class="headings altheading">
	              <h2>Update Non Conformance Details</h2>
	            </div>
            <div class="contentbox">
            <c:set value="${nonConformanceForm.nonconformance[0]}" var="nonconformance"></c:set>
                    <table cellpadding="0" cellspacing="0" border="0" width="100%" style="border:#993300  2px solid; padding:15px; margin-bottom:15px;">

  				

                        		<tr class="row1">
				                  <td valign="top" align="left" class="input_txt" width="20%" style="height:50px"> Non-Conformance(ID)&nbsp;:</td>
				                  <td valign="top" align="left" class="input_txt" width="20%" height="20%">
				                 
				                 <input type="text" name="id" readonly="readonly" class="input_txtbx" value="<c:out value="${nonconformance.id}"/>"/>
				                   	<br><font color="Red" size="+1"></font>
				                  </td>
				                  
				                	<td valign="top" align="left" class="input_txt" id="external_label" style="display:block;" width="20%"> External ID&nbsp;: </td>
				                  	<td valign="top" align="left" class="input_txt" width="20%"><input type="text"  name="external_id"  onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}" value="<c:out value="${nonconformance.external_id}"/>"  maxlength="32" onblur="ChangeCase(this);" class="input_txtbx" style="display:block;" id="external_id" onkeypress="return onlyAlphabets1(event,this);" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"   />
				                  	<span style="color:red;" id="externalerror"></span>
				                  	</td>
				                </tr>
				                

								 <tr class="row2">
						         	<td valign="top" align="left" class="input_txt" width="20%" style="height:50px"> Source of NC&nbsp;: </td>
						           <td valign="top" align="left" class="input_txt" width="20%">
				                  		<select name="source_of_nonconformance" class="input_txtbx" id="source_of_nonconformance" onclick="showDiv()">
						                    <option <c:if test="${nonconformance.source_of_nonconformance eq 'Internal Audit'}"><c:out value="Selected"/></c:if> value="Internal Audit" >Internal Audit</option>
											<option <c:if test="${nonconformance.source_of_nonconformance eq 'Customer Audit'}"><c:out value="Selected"/></c:if> value="Customer Audit">Customer Audit</option>
											<option  <c:if test="${nonconformance.source_of_nonconformance eq 'Third Party Audit'}"><c:out value="Selected"/></c:if> value="Third Party Audit">Third Party Audit</option>
											<option <c:if test="${nonconformance.source_of_nonconformance eq 'Incoming Inspection'}"><c:out value="Selected"/></c:if> value="Incoming Inspection">Incoming Inspection</option>
				                   			<option <c:if test="${nonconformance.source_of_nonconformance eq 'Customer Complaint'}"><c:out value="Selected"/></c:if> value="Customer Complaint">Customer Complaint</option>
				                   	<c:forEach items="${conformance_SourceForm.conformance_Sources}" var="sources" varStatus="status">
        				       <option value="${sources.source_of_nc}"<c:if test="${sources.source_of_nc == nonconformance.source_of_nonconformance}"><c:out value="selected"/></c:if>>${sources.source_of_nc}</option>
			                  </c:forEach>
				                   		</select>
				                   		<br><span style="color: red;" id="sourcencerr"><form:errors path="Nonconformance.source_of_nonconformance"></form:errors></td>
						         	
					            	<td valign="top" align="left" class="input_txt" width="20%" > Product ID&nbsp;: </td>
					                      	<td valign="top" align="left" class="input_txt" width="20%">
					                      	<select name="product_id" class="input_txtbx" id="product_id">
				                  										<option value="">--Select--</option>
																		 <c:forEach items="${productId_NC_Form.productIDNCs}" var="products" varStatus="status">
        				      												 <option value="${products.productid_nc}"<c:if test="${products.productid_nc == nonconformance.product_id}"><c:out value="selected"/></c:if>>${products.productid_nc}</option>
			                 											 </c:forEach>
																	</select><br><span style="color: red;" id="producterr"><form:errors path="Nonconformance.product_id"></form:errors></span></td>
				           
					                  </tr>
								 
								<tr class="row1">
				                  	<td valign="top" align="left" class="input_txt" width="20%" style="height:50px"> Type of NC&nbsp;: </td>
				                  	<td valign="top" align="left" class="input_txt" width="20%">
				                  		<select name="type_of_nonconformance" class="input_txtbx" id="type_of_nonconformance" onchange="doAjaxPost();">
						                    <option <c:if test="${nonconformance.type_of_nonconformance eq 'Product Quality'}"><c:out value="Selected"/></c:if> value="Product Quality" >Product Quality</option>
											<option <c:if test="${nonconformance.type_of_nonconformance eq 'Service Quality'}"><c:out value="Selected"/></c:if>  value="Service Quality">Service Quality</option>
											<option  <c:if test="${nonconformance.type_of_nonconformance eq 'Late Delivery'}"><c:out value="Selected"/></c:if>  value="Late Delivery">Late Delivery</option>
											<option <c:if test="${nonconformance.type_of_nonconformance eq 'Early Delivery'}"><c:out value="Selected"/></c:if> value="Early Delivery">Early Delivery</option>
				                	<c:forEach items="${type_of_NC_Form.type_of_NCs}" var="types" varStatus="status">
        				       <option value="${types.type_of_nc}"<c:if test="${types.type_of_nc == nonconformance.type_of_nonconformance}"><c:out value="selected"/></c:if>>${types.type_of_nc}</option>
			                  </c:forEach>
				                   		</select><span style="color: red;" id="typencerr"><form:errors path="Nonconformance.type_of_nonconformance"></form:errors>
				                   	</td>
				                 	<td valign="top" align="left" class="input_txt"> Quantity Suspect&nbsp;: </td>
				                    <td valign="top" align="left" class="input_txt">
				                    <input type="text" value="${nonconformance.quantity_suspect}" maxlength="32" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}" class="input_txtbx" onkeypress="return onlyAlphabets(event,this);"  id="quantity" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  name="quantity_suspect" /><br>
				                    <span id="quantitysuspect" style="color: red;"></span>
				                    <span style="color: red;"><form:errors path="Nonconformance.quantity_suspect"></form:errors></span>
				                    </td>
				    	</tr>
						
				                <tr class="row2">
									<td valign="top" align="left" class="input_txt" width="20%"> Nature Of NC&nbsp;: </td>
				                  	<td valign="top" align="left" class="input_txt" width="20%">
				               
				                <textarea class="input_txtbx" id="natureofnc"  name="nature_of_nonconformance" maxlength="400" value="${nonconformance.nature_of_nonconformance}" style= "height: 55px;"  >${nonconformance.nature_of_nonconformance}</textarea>
								<br>
								<span id="nature" style="color: red;"></span>
								<span style="color: red;"><form:errors path="Nonconformance.nature_of_nonconformance"></form:errors></span></td>
				                	
			                  <td valign="top" align="left" class="input_txt" width="20%"> Disposition Required(Y/N)&nbsp;: </td>
			        		        
			        		        <td valign="top" align="left" class="input_txt" width="20%">
                	                            <input type="radio" name="disposition_required" value="Yes" onchange="toggle3(this.value);"  id="disposition_required_yes"<c:if test="${nonconformance.disposition_required=='Yes'}"><c:out value="Checked=checked"/></c:if>>Yes&nbsp;&nbsp;&nbsp;
                	                            <input type="radio" name="disposition_required" value="No" id="disposition_required_no" onchange="toggle3(this.value);"  <c:if test="${nonconformance.disposition_required=='No'}"><c:out value="Checked=checked"/></c:if>>No&nbsp;&nbsp;&nbsp;<br/><span class="err"></span></td>
                	           </tr>
								 <tr class="row1">
				                 	<td valign="top" align="left" class="input_txt" width="20%"> Date Found&nbsp;: </td>
				                  	<td valign="top" align="left" class="input_txt" width="20%">
				                  	<input type="text" value="${nonconformance.date_found}"  onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}" class="input_txtbx" id="datepicker" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  name="date_found" /><br>
				                  	<span id="datepicker2" style="color: red;"></span>
				                  <span style="color: red;"><form:errors path="Nonconformance.date_found"></form:errors></span></td>
				  
				                
                	          
				                  	<td valign="top" align="left" class="input_txt" width="10%" > Disposition&nbsp;: </td>
				                  	
				                  	<td valign="top" align="left" class="input_txt" width="20%">
						                    						<table cellpadding="0" cellspacing="0"><tr>
						                    						
						                    						<td style="vertical-align:top;padding:0px;"><select name="disposition1" id="disid1" class="input_txtbx" onchange="show1();">
				                  										<option value="">--Select--</option>
				                  										<option <c:if test="${nonconformance.disposition1 eq 'Repair'}"><c:out value="Selected"/></c:if>="" value="Repair">Repair</option>
				                  										<option <c:if test="${nonconformance.disposition1 eq 'Discard'}"><c:out value="Selected"/></c:if>="" value="Discard">Discard</option>
																		<option <c:if test="${nonconformance.disposition1 eq 'Keep as is'}"><c:out value="Selected"/></c:if>="" value="Keep as is">Keep as is</option>
						                    						</select><br/><span style="color: red;" id="disid1err"></span><span style="color: red;" id="qua1"></span>
						                    							</td>
						                    							<td width="1%"></td>
						                    							<td align="left" style="padding:0px;">
						                    						
						                    				<input type="text" name="quality1" id="quality1" maxlength="32" class="input_txtbx" style="display:block; width:40px;" onkeypress="return validate(event)"; value="${nonconformance.quality1}" onchange="showbutton1();" />
						                    					</td><td align="left">
						                    					<label class="number_btn1"  id="button1"   style="display:block;">No's</label>
						                    					</td></tr>
						                    					<tr><td colspan="3">
						                    					</td></tr>
						                    					<tr>
						                    						<td style="vertical-align:top;padding:0px;"><select name="disposition2" id="disid2" class="input_txtbx" onchange="show2();" >
				                  										<option value="">--Select--</option>
				                  										<option
				                  										<c:if test="${nonconformance.disposition2 eq 'Repair'}"><c:out value="Selected"/></c:if>
																		value="Repair">Repair</option>
				                  										<option
				                  										<c:if test="${nonconformance.disposition2 eq 'Discard'}"><c:out value="Selected"/></c:if>
																		value="Discard">Discard</option>
																		<option
				                  										<c:if test="${nonconformance.disposition2 eq 'Keep as is'}"><c:out value="Selected"/></c:if>
																		value="Keep as is">Keep as is</option>
						                    						</select><br><span style="color: red;" id="disid2err"></span><span  id="qua2" style="color: red;"></span>
						                    						<td width="1%"></td>
						                    						<td align="left" style="padding:0px;"><input type="text" name="quality2" maxlength="32" id="quality2" style="display:block; width:40px;" class="input_txtbx"  onkeypress="return validate(event);"  value="${nonconformance.quality2}" onchange="showbutton2();" />
						                    						
						                    						</td>
						                    						<td align="left">
						                    						<label class="number_btn1"  id="button2"   style="display:block;">No's</label></td>
						                    						</tr><tr><td colspan="3" ></td></tr><tr>
						                    						
						                    						
						                    						<td style="vertical-align:top;padding:0px;"><select name="disposition3" id="disid3"class="input_txtbx" onchange="show3();">
				                  										<option value="">--Select--</option>
				                  											<option
				                  										<c:if test="${nonconformance.disposition3 eq 'Repair'}"><c:out value="Selected"/></c:if>
																		value="Repair">Repair</option>
				                  										<option
				                  										<c:if test="${nonconformance.disposition3 eq 'Discard'}"><c:out value="Selected"/></c:if>
																		value="Discard">Discard</option>
																		<option
				                  										<c:if test="${nonconformance.disposition3 eq 'Keep as is'}"><c:out value="Selected"/></c:if>
																		value="Keep as is">Keep as is</option>
						                    						</select><br/><span style="color: red;" id="disid3err"></span><span id="qua3" style="color: red;"></span>
						                    						</td>
						                    						<td width="1%"></td>
						                    					<td  align="left" style="padding:0px;"><input type="text" name="quality3" id="quality3" maxlength="32" style="display:block; width:40px;" class="input_txtbx" value="${nonconformance.quality3}" onkeypress="return validate(event)"; onchange="showbutton3();"/>
						                    					</td><td  align="left">
						                    					<label class="number_btn1"  id="button3"   style="display:block;">No's</label>
						                    						</td>
						                    						</tr><tr><td colspan="3"></td></tr></table>
						                    						
						                    						
																		</td>
																	</tr>
						                     					        
								<tr class="row2">
				                	<td valign="top" align="left" class="input_txt" style="height:50px"> Reported By&nbsp;: </td>
				                  	<td valign="top" align="left" class="input_txt">
				                  	<div id="reported_by">
				                    <input type="text" name="group_person" id="group_person" value="${nonconformance.reported_by}"/>
				                  	<select name="reported_by" class="input_txtbx" id="reported_by">
																			 <option value="">--Select--</option>
																			 <c:forEach items="${reportedByNCForm.reportedByNCs}" var="reportedByNCs" varStatus="status">
        				       <option value="${reportedByNCs.group_person}" <c:if test="${reportedByNCs.group_person == nonconformance.reported_by}"><c:out value="selected"/></c:if>>${reportedByNCs.group_person}</option>
			                  </c:forEach>
			                 </select></div><span style="color:red;" id="reporterr"></span>
			                 
			                <%--  
			                 <tr class="row2">
																		<td valign="top" align="left" class="input_txt" width="30%">Reported By: </td>
																		<td valign="top" align="left" class="input_txt" width="30%">
								 										 <div id="reported_by">
								 										 <select name="reported_by" id="reported_by">
								 										  <option value="">--Select--</option>
																			 <c:forEach items="${reportedByNCForm.reportedByNCs}" var="reportedByNCs" varStatus="status">
        				       <option value="${reportedByNCs.reported_by}" <c:if test="${reportedByNCs.reported_by == nonconformance.reported_by}"><c:out value="selected"/></c:if>>${reportedByNCs.reported_by}</option>
			                  </c:forEach>
								 										 
								 										 </select></div><br><span style="color:red;" id="reporterr"></span>
 														  
				              --%>     	</td> 
				                  	
				                  	 <td valign="top" align="left" class="input_txt"> Disposition Complete Date&nbsp;:</td>
			                        <td valign="top" align="left" class="input_txt"><input type="text" value="${nonconformance.disposition_complete_date}" class="input_txtbx" id="datepicker1" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  name="disposition_complete_date" /><br><span style="color: red;" id="completedate"><form:errors path="Nonconformance.disposition_complete_date"></form:errors></span></td>
				      
			          
				       	</tr>
						                 
   						  		<tr class="row1">
			   						<td valign="top" align="left" class="input_txt"> Temporary Action&nbsp;: </td>
               						<td valign="top" align="left"><textarea class="input_txtbx" id="tempaction"  name="temporary_action" maxlength="400" style= "height: 55px;" >${nonconformance.temporary_action}</textarea><br/>
               														<span id="temp" style="color: red;"></span>
               														 <span style="color: red;"><form:errors path="Nonconformance.temporary_action"></form:errors></span></td>
         </td>
         							<td valign="top" align="left" class="input_txt"> Disposition Responsibility&nbsp;: </td>
			                        <td valign="top" align="left" >
																			  <select class="input_txtbx" name="name_of_disposition_responsibility" id="name_of_disposition_responsibility" >
              																
																			 <c:forEach items="${hRandTrainingForm.hRandTrainings}" var="dispositionname" varStatus="status">
        				       												<option value="${dispositionname.name}"<c:if test="${dispositionname.name == nonconformance.name_of_disposition_responsibility}"><c:out value="selected"/></c:if>>${dispositionname.name}</option>
			                  												</c:forEach>
			                 												</select><br/>
			                 												<span id="responsibilityerror" style="color: red;"></span>
			                 												<span style="color: red;"><form:errors path="Nonconformance.name_of_disposition_responsibility"></form:errors>
				        		<tr height="10"></tr>
		  					
		  					<tr class="row2">
                  				   	<td valign="top" align="left" class="input_txt"> Corrective Action Required(Y/N)&nbsp;: </td>
                  				 
                  				                   <td valign="top" align="left" class="input_txt" width="20%">
                			 					<input type="radio" name="corrective_action_required" value="Yes" onchange="toggle3(this.value);"  id="corrective_action_required_yes" <c:if test="${nonconformance.corrective_action_required=='Yes'}"><c:out value="Checked=checked"/></c:if>>Yes&nbsp;&nbsp;&nbsp;
                			 					<input type="radio" name="corrective_action_required" value="No" id="corrective_action_required_no" onchange="toggle3(this.value);"  <c:if test="${nonconformance.corrective_action_required=='No'}"><c:out value="Checked=checked"/></c:if>>No&nbsp;&nbsp;&nbsp;<br/><span class="err"></span></td>
                			 
                			 
			    	                <td valign="top" align="left" class="input_txt"> Cost of NC&nbsp;: </td>
			   	                 	<td valign="top" align="left" class="input_txt"><input type="text" value="${nonconformance.cost_of_nonconformance}"  name="cost_of_nonconformance" onkeypress="return validate(event)";  class="input_txtbx" id="costofnc" onmouseover="showTooltip('tooltip_id','inp_id3');" maxlength="32" onmouseout="hideTooltip('tooltip_id');"   /><br/>
			   	                 	<span id="cost" style="color: red;"></span>
			   	                 <span style="color: red;"><form:errors path="Nonconformance.cost_of_nonconformance"></form:errors></span></td>
				          </tr>
     
               	 
            
              <tr class="row2">
                  <td valign="bottom" colspan="4"align="right" style="padding-right:150px;">&nbsp;<input type="submit" value="Update" onclick="return validation();" class="submit_btn1"></td>
                  
                </tr>
    </table>
    
   </div>
   </td>
   </tr>
   </table>
   </form>
    </div>
            

<script>
   function doAjaxPost() {
	 //alert("hi");
	document.getElementById('type_of_nonconformance').style.display="block";
	 document.getElementById("reported_by").style.display="inline";
	var filer_value = $('#type_of_nonconformance').val();
	var group_person=$('#group_person').val();
	//alert(group_person);
	//alert("hello");
	$.ajax({
		type : "POST",
		url : "/QMS_App/ajax_gettypenc",
		data : "type_of_nonconformance=" + filer_value+"&group_person="+group_person,
		success : function(response) {
	//	alert("response"+response);
		$('#reported_by').html(response);
			},
		error : function(e) {
			alert('Error: ' + e);
		}
	});
}
 
</script> 
<script type="text/javascript">   
$(function() {   
	
	//if(($('#source_of_nonconformance').val() == 'Customer Audit') && ($('#source_of_nonconformance').val() == 'Third Party Audit') && ($('#source_of_nonconformance').val() == 'Customer Complaint'))
	if($('#source_of_nonconformance').val() === 'Customer Audit')     
   {     
   $('#external_id').show();  
   $('#external_label').show();
   }     
else if($('#source_of_nonconformance').val() === 'Third Party Audit')
	{
	$('#external_id').show();  
	$('#external_label').show();
	}
else if($('#source_of_nonconformance').val() === 'Customer Complaint')
{
$('#external_id').show();  
$('#external_label').show();
}
else    
   {     
   $('#external_id').hide();
   $('#external_label').hide();
   }     
  
});     
$(document).ready(function() {     
$('#source_of_nonconformance').change(function(){     
	//if(($('#source_of_nonconformance').val() == 'Customer Audit') && ($('#source_of_nonconformance').val() == 'Third Party Audit') && ($('#source_of_nonconformance').val() == 'Customer Complaint'))
	if($('#source_of_nonconformance').val() === 'Customer Audit')     
   {     
   $('#external_id').show();  
   $('#external_label').show();
   }     
else if($('#source_of_nonconformance').val() === 'Third Party Audit')
	{
	$('#external_id').show();  
	$('#external_label').show();
	}
else if($('#source_of_nonconformance').val() === 'Customer Complaint')
{
$('#external_id').show();  
$('#external_label').show();
}
else    
   {     
   $('#external_id').hide();
   $('#external_label').hide();
   }     
});     
});     
</script>     
<script>
function showbutton1()
{
	var val = document.getElementById("quality1").value;
	var numbers = /^[-+]?[0-9]+$/; 
if(val!="" && val.match(numbers))
	{
	document.getElementById("button1").style.display = 'block';
	}
else
	{
	document.getElementById("button1").style.display='none';
	}	
	}

function showbutton2()
{
	var val = document.getElementById("quality2").value;
	var numbers = /^[-+]?[0-9]+$/; 
if(val!="" && val.match(numbers))
	{
	document.getElementById("button2").style.display = 'block';
	}
else
	{
	document.getElementById("button2").style.display='none';
	}
	}
function showbutton3()
{
	var val = document.getElementById("quality3").value;
	var numbers = /^[-+]?[0-9]+$/; 
if(val!="" && val.match(numbers))
	{
	document.getElementById("button3").style.display = 'block';
	}
else
	{
	document.getElementById("button3").style.display='none';
	}
	}
</script>

<script>
function showDiv() {

        	
        	var element1 = document.getElementById('disposition').value;
        //	var element2 = document.getElementById('quality1').value;
        
            if (element1 == '') {
            	document.getElementById('quality1').style.display="none";
            	}
            	else
            	{
            	document.getElementById('quality1').style.display="block";
            	}
            }
           
</script>
      


<script>
 $(window).load(function(){
	 
	  $("#quality1").keyup(function() {
			
			 $("#quality1err").html(''); 
			/* var regex=/(^\d{5}$)|(^\d{5}-\d{4}$)/; */
			var intRegex = /^\d+$/;
			if(intRegex.test($(this).val())||$(this).val()=='') 
			{
				var $in = $(this).val();		 
			}
			else if($(this).val()!='')
				{
				
				$("#quality1err").html(' enter a number!!!!');
				}
		}).keydown(function() {
		    oldValue = $(this).val();
		})
 $("#quality2").keyup(function() {
			
			 $("#quality2err").html(''); 
			/* var regex=/(^\d{5}$)|(^\d{5}-\d{4}$)/; */
			var intRegex = /^\d+$/;
			if(intRegex.test($(this).val())||$(this).val()=='') 
			{
				var $in = $(this).val();		 
			}
			else if($(this).val()!='')
				{
				
				$("#quality2err").html(' enter a number!!!!');
				}
		}).keydown(function() {
		    oldValue = $(this).val();
		})
 $("#quality3").keyup(function() {
			
			 $("#quality3err").html(''); 
			/* var regex=/(^\d{5}$)|(^\d{5}-\d{4}$)/; */
			var intRegex = /^\d+$/;
			if(intRegex.test($(this).val())||$(this).val()=='') 
			{
				var $in = $(this).val();		 
			}
			else if($(this).val()!='')
				{
				
				$("#quality3err").html('enter a number!!!!');
				}
		}).keydown(function() {
		    oldValue = $(this).val();
		})

});

</script>
      
 <script language="JavaScript">
 function show1()
 {
 	var val = document.getElementById('disid1').value;
 	
 	if(val !="")
 		{
 		document.getElementById('quality1').style.display='block';
 		document.getElementById('button1').style.display='block';
 		}
 	
 	else
 		{
 	document.getElementById('quality1').style.display='none';
 	document.getElementById("button1").style.display='none';
 	}
 }
 
  function show2()
 {
 	var val = document.getElementById('disid2').value;
 	
 	if(val !="")
 		{
 		document.getElementById('quality2').style.display='block';
 		document.getElementById("button2").style.display='block';
 		}
 	else
 		{
 	document.getElementById('quality2').style.display='none';
 	document.getElementById("button2").style.display='none';
 	}	
 }
 function show3()
 {
 	var val = document.getElementById('disid3').value;
 	
 	if(val !="")
 		{
 		document.getElementById('quality3').style.display='block';
 		document.getElementById("button3").style.display='block';
 		}
 	else
 		{
 	document.getElementById('quality3').style.display='none';
 	document.getElementById("button3").style.display='none';
 	}	
 }
function CreateGroup()
{
	document.update.action = 'index.php?do=creategroup&type=1';
	document.update.submit();
}

$(function() {
	 var format="yy-mm-dd";
           $( "#datepicker" ).datepicker();
           
         });
 
 $(function() {
           $( "#datepicker1" ).datepicker();
         });
</script> 
<script>
	
	window.onload = function(){
		show1();show2();show3();doAjaxPost();showbutton1();showbutton2();showbutton3();
	};
		</script>
		
<script>
function ChangeCase(elem)
{
    elem.value = elem.value.toUpperCase();
}
function onlyAlphabets1(e, t) {
    try {
        if (window.event) {
            var charCode = window.event.keyCode;
        }
        else if (e) {
            var charCode = e.which;
        }
        else { return true; }
        if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123)|| (charCode > 47 && charCode < 58))
            return true;
        else
            return false;
    }
    catch (err) {
        alert(err.Description);
    }
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
        if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123)|| (charCode == 32))
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
	
	//update.submit();
	var error="";
	var date = /^\d{4}-(0?[1-9]|1[012])-(0?[1-9]|[12][0-9]|3[01])$/;
   	var datefound = document.getElementById('datepicker').value;
	var complete = document.getElementById('datepicker1').value;
	var quantity = document.getElementById('quantity').value;
	var costnc = document.getElementById('costofnc').value;
	var action = document.getElementById('tempaction').value;
	
	var naturenc = document.getElementById('natureofnc').value;
	var quality1 = document.getElementById('quality1').value;
	var quality2 = document.getElementById('quality2').value;
	var quality3 = document.getElementById('quality3').value;
	
	
	var typenc = document.getElementById('type_of_nonconformance').value;
	var sourcenc = document.getElementById('source_of_nonconformance').value;
	var product = document.getElementById('product_id').value;
	var responsibility = document.getElementById('name_of_disposition_responsibility').value;
	var external = document.getElementById('external_id').value;
	
	var reported_by = document.getElementById('reported_id').value;
	
	var dispid1 = document.getElementById('disid1').value;
 	var dispid2 = document.getElementById('disid2').value;
	var dispid3 = document.getElementById('disid3').value; 
 
	
	 if(typenc!="")
		{
		 
		 if(reported_by=="")
		{		

		document.getElementById('reporterr').innerHTML="Required field should not be empty";
	error="true";
		}

	 else
		 {
		 document.getElementById('reporterr').innerHTML="";
		 }
		}
	 
 
	 if((sourcenc=="Customer Complaint") || (sourcenc=="Customer Audit") || (sourcenc=="Third Party Audit"))
	{
	
	if(external=="")
		{
	document.getElementById("externalerror").innerHTML="Required field should not be empty";
	error="true";
	}
	else if(external.length<4)
	{
	document.getElementById("externalerror").innerHTML="Required field should be length of 4to 32";
	error="true";
	}
	else
		{
		document.getElementById("externalerror").innerHTML="";
		}
	}

 if(dispid1=="")
 {
 document.getElementById('disid1err').innerHTML="Required field should not be empty";
 error="true";
 }

else
	 {
	 document.getElementById('disid1err').innerHTML="";
	 }
	if(dispid1!="")
		{
	if(quality1=="")
		{
					
		 document.getElementById("qua1").innerHTML="Required no's field should not be empty";
		 error="true";
	 } 
		
	    
		else if(document.getElementById("quality1").value.substring(0,1)==" ")
		{
		document.getElementById("qua1").innerHTML="Should not accept initial space";
		 error="true";
		}
		else if(quality1!="")
			{
			document.getElementById("qua1").innerHTML="";
			}
		}

if(dispid2=="")
 {
 document.getElementById('disid2err').innerHTML="Required field should not be empty";
 error="true";
 }
else
 {
 document.getElementById('disid2err').innerHTML="";
 }
if(dispid2!="")
{
if(quality2=="")
{
					
 document.getElementById("qua2").innerHTML="Required no's field should not be empty";
 error="true";
} 


else if(document.getElementById("quality2").value.substring(0,1)==" ")
{
document.getElementById("qua2").innerHTML="Should not accept initial space";
 error="true";
}
else if(quality2!="")
	{
	document.getElementById("qua2").innerHTML="";
	}
}

if(dispid3=="")
 {
 document.getElementById('disid3err').innerHTML="Required field should not be empty";
 error="true";
 }
else
 {
 document.getElementById('disid3err').innerHTML="";
 }
if(dispid3!="")
{
if(quality3=="")
{
				
 document.getElementById("qua3").innerHTML="Required no's field should not be empty";
 error="true";
} 


else if(document.getElementById("quality3").value.substring(0,1)==" ")
{
document.getElementById("qua3").innerHTML="Should not accept initial space";
 error="true";
}
else if(quality3!="")
	{
	document.getElementById("qua3").innerHTML="";
	}
}

if(datefound == "")
	 {
	 document.getElementById("datepicker2").innerHTML="Required field should not be empty";
	 error="true";
	 
	 }
 	 else if(datefound.match(date))
	 {
	 document.getElementById("datepicker2").innerHTML="";
	 }
	 else
	 {
	 document.getElementById("datepicker2").innerHTML="Invalid date";
	 error="true";
	 }


	if(complete == "")
	 {
	 document.getElementById("completedate").innerHTML="Required field should not be empty";
	 error="true";
	 
	 }
	 else if(complete.match(date))
	 {
	 document.getElementById("completedate").innerHTML="";
	 }
	 else
	 {
	 document.getElementById("completedate").innerHTML="Invalid date";
	 error="true";
	 }
  	if(typenc =="")
	 {

		 document.getElementById("typencerr").innerHTML="Required field should not be empty";
		 error="true";
	 } 
  	else
  		{
		document.getElementById("typencerr").innerHTML="";
  		}
		if(sourcenc =="")
		 {
		
			 document.getElementById("sourcencerr").innerHTML="Required field should not be empty";
			 error="true";
		 }
		else{
			document.getElementById("sourcencerr").innerHTML="";
		}
			if(product =="")
			 {
			
				 document.getElementById("producterr").innerHTML="Required field should not be empty";
				 error="true";
			 }
			else
				{
				document.getElementById("producterr").innerHTML="";
				}

  	
  	if(quantity =="")
	 {
	
		 document.getElementById("quantitysuspect").innerHTML="Required field should not be empty";
		 error="true";
	 } 
		
  	else if(document.getElementById("quantity").value.length<4 || document.getElementById("quantity").value.length>=32)
	    {
	    	
	    	document.getElementById("quantitysuspect").innerHTML="Required field should be length of 4to 32";
	    	 error="true";
	    } 
	
	
	    else if(document.getElementById("quantity").value.substring(0,1)==" ")
		{
		document.getElementById("quantitysuspect").innerHTML="Should not accept initial space";
		 error="true";
		}
	    else
	    	{
	    	document.getElementById("quantitysuspect").innerHTML="";
	    	}
	
	 	if(document.getElementById("costofnc").value=="")
		 {
		
			 document.getElementById("cost").innerHTML="Required field should not be empty";
			 error="true";
		 } 
			
	 	else if(document.getElementById("costofnc").value==0)
		    {
		    	
		    	document.getElementById("cost").innerHTML="Should be greater than 0";
		    	 error="true";
		    } 
		
		
	 	else if(document.getElementById("costofnc").value.substring(0,1)==" ")
			{
			document.getElementById("cost").innerHTML="Should not accept initial space";
			 error="true";
			}
	 	else
	 		{
	 		document.getElementById("cost").innerHTML="";
	 		}
		 	
		
		 	if(naturenc =="")
			 {
			
				 document.getElementById("nature").innerHTML="Required field should not be empty";
				 error="true";
			 } 
				
		 	else if(document.getElementById("natureofnc").value.length<4)
			    {
			    	
			    	document.getElementById("nature").innerHTML="Required field should be length of 4to 400";
			    	 error="true";
			    } 

		    else if(document.getElementById("natureofnc").value.substring(0,1)==" ")
			{
			document.getElementById("nature").innerHTML="Should not accept initial space";
			 error="true";
			}
		 	else{
		 		document.getElementById("nature").innerHTML="";	
		 	}
		 	
 	
			 	if(action =="")
				 {
				
					 document.getElementById("temp").innerHTML="Required field should not be empty";
					 error="true";
				 } 
					
					else if(document.getElementById("tempaction").value.length<4)
				    {
				    	
				    	document.getElementById("temp").innerHTML="Required field should be length of 4to 400";
				    	 error="true";
				    } 
				
				
					else if(document.getElementById("tempaction").value.substring(0,1)==" ")
					{
					document.getElementById("temp").innerHTML="Should not accept initial space";
					 error="true";
					}
					else
						{
						document.getElementById("temp").innerHTML="";
						}
			 	
			 	if(responsibility =="")
				 {
				
					 document.getElementById("responsibilityerror").innerHTML="Required field should not be empty";
					 error="true";
				 } 
					
					else if(document.getElementById("name_of_disposition_responsibility").value.length<4 || document.getElementById("name_of_disposition_responsibility").value.length>=32)
				    {
				    	
				    	document.getElementById("responsibilityerror").innerHTML="Should be of length 4 to 32";
				    	 error="true";
				    } 
				
				
					else if(document.getElementById("name_of_disposition_responsibility").value.substring(0,1)==" ")
					{
					document.getElementById("responsibilityerror").innerHTML="Should not accept initial space";
					 error="true";
					}
					else
						{
						document.getElementById("responsibilityerror").innerHTML="";
						}		
				 	
				 	/* if(quality1 =="")
					 {
					
						 document.getElementById("qua1").innerHTML="Required field should not be empty";
						 error="true";
					 } 
						
					    
						else if(document.getElementById("quality1").value.substring(0,1)==" ")
						{
						document.getElementById("qua1").innerHTML="Initial space not allowed";
						 error="true";
						}
						else
							{
							document.getElementById("qua1").innerHTML="";}
							
						 if(quality2 =="")
						 {
						
							 document.getElementById("qua2").innerHTML="Required field should not be empty";
							 error="true";
						 } 
						 else
							 {
								document.getElementById("qua2").innerHTML="";
							 }
							 
						 	if(quality3 =="")
							 {
							
								 document.getElementById("qua3").innerHTML="Required field should not be empty";
								 return false;
							 } 
						 	else{
						 	document.getElementById("qua3").innerHTML="";
								}	
 */
								  if(error == "true")
									{
									return false;
									}
}
</script>

<script>
  $(function() {
	$("#quantity").on("keypress", function(e) {
		if (e.which === 32 && !this.value.length)
	        e.preventDefault();
	});
	});	

</script>
<script>
  $(function() {
	$("#costofnc").on("keypress", function(e) {
		if (e.which === 32 && !this.value.length)
	        e.preventDefault();
	});
	});	

</script>
<script>
  $(function() {
	$("#natureofnc").on("keypress", function(e) {
		if (e.which === 32 && !this.value.length)
	        e.preventDefault();
	});
	});	

</script>
<script>
  $(function() {
	$("#tempaction").on("keypress", function(e) {
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

<script type="text/javascript">
// Numbers only validation for disposition field
       function validate(event) {
          
           var regex = new RegExp("^[0-9]+$");
           var key = String.fromCharCode(event.charCode ? event.which : event.charCode);
           if (!regex.test(key)) {
             // document.getElementById("cmaerr").innerHTML="enter numerics or decimals only";
               event.preventDefault();
               error="true";
           }
       }
</script>
<script>
// alphanumeric validation for product id field
function validatealphanumeric(){

	var textInput = document.getElementById("external_id").value;
    textInput = textInput.replace(/[^A-Za-z0-9]/g, "");
    document.getElementById("external_id").value = textInput;
}

</script>

<script>
function validate(event) {
	   
    var regex = new RegExp("^[0-9.]+$");
    var key = String.fromCharCode(event.charCode ? event.which : event.charCode);
    if (!regex.test(key)) {
      // document.getElementById("cmaerr").innerHTML="enter numerics or decimals only";
        event.preventDefault();
        return false;
    }
}  

</script>


<jsp:include page="footer.jsp"></jsp:include>