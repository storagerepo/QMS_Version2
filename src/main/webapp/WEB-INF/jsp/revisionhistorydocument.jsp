<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" />
<script src="resources/js/jquery.min.js"></script>
 <script src="resources/js/jquery-ui.js"></script>

<form method="post" action="documentMain" method="post">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
      <td>
      <div>
 	<ul class="horizmenu">
							
				             <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="adddocument" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Add Form</span>
									
								</a>
							</li>
				            <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="view_form" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									<span>View Form</span>
									
								</a>
							</li>
				            <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="form_report" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Form Report</span>
									
								</a>
							</li> 
				            </ul>
  </div>
      		</td>
      		</tr>
      		<c:if test="${success=='true' }">
      		<tr>
	        	<td valign="top" align="left">
					<div class="status success">
			            <p class="closestatus"><a title="Close" href="viewdocuments">x</a></p>
			            <p><img alt="Success" src="resources/images/icons/icon_success.png"><span><c:out value="${success_message}"/></span></p>
			          </div>
				</td>
      		</tr>
      		</c:if>
      	        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2>View Revision History  </h2>
            </div>
            <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
               <c:set value="${documentMainForm.documentMains[0]}" var="documentMain"> </c:set>
               
               <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="20%">Revision No :</td>
              <td valign="top" align="left"> <input type="hidden" id="document_id" value="${form.document_id}"/>
               <select name="revision_id" id="revisionid" onchange="doAjaxPost_for_process1();"  class="input_cmbbx1" style="width:200px;">
              
             <c:forEach items="${revisionDocumentForm.revisionDocuments}" var="revision" varStatus="true">
               
                
               <option value="${revision.revision_id}"<c:if test="${revision.revision_id == documentMain.revision_id}"><c:out value="selected"/></c:if>>${revision.revision_id}</option>
                
               </c:forEach>
               </select>
            </td>
            </tr>
               </table>
                <table cellpadding="0" cellspacing="0" border="0" width="100%">
               
               <tr class="row1">
               <td>
               <span id="documentname"></span>
               </td>
               </tr>
               </table>
               </div>
               </td>
               </table>
               </div>
               </form>
                
           
              
             <%--  <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="20%">Form/Rec Id :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="hidden" id="document_id" value="${form.document_id}"/>${form.document_id}</br><span class="err"></span></td>
                </tr> --%>
              
                <%--  <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="20%">Effective Date :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"> ${form.effective_date}</br><span class="err"></span></td>
                </tr>
                 
                 <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="20%">Approver1(Process Owner) :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${form.approver1} </br><span class="err"></span></td>
                </tr>
                 <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="20%">Issuer :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${form.issuer}</br><span class="err"></span></td>
                </tr>
                <tr class="row1">
                 <td valign="middle" align="left" class="input_txt" width="20%"> Comments :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${form.comments}
                 
                  <br/><span class="err"></span></td>
                  </tr> --%>
                                
              
<%-- 
                <tr>
             <td colspan="4">
            <!--  <div id="child_table" style="display:none;"> -->
             <table cellpadding="0" cellspacing="0" border="0" width="100%" >
            
        <!--  <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%">Equipment Id :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="equipmentid" class="input_txtbx" id="equipmentid" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /></br><span class="err"></span></td>
                </tr> -->
               <tr class="row1">
                 <td valign="middle" align="left" class="input_txt" width="20%"> Type of Maintenance :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${maintenance.type_of_maintenance}
                  
                <br/><span class="err"></span></td>
                  </tr>
                   <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="20%">Maintenance Frequency :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${maintenance.maintenance_frequency}</br><span class="err"></span></td>
                </tr>
                 <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="20%">Reference :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${maintenance.reference}</br><span class="err"></span></td>
                </tr>
                <tr class="row2">
              
               <td valign="middle" align="left" class="input_txt">Instructions:</td>
               <td valign="top" align="left"  colspan="3">${maintenance.instructions}<br/><span class="err"></span></td>
            </tr>
            <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="20%">Due Date :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${maintenance.due_date}</br><span class="err"></span></td>
                </tr>
                <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="20%">Completion Date :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${maintenance.completion_date}</br><span class="err"></span></td>
                </tr>
                <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="20%">Completed By :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${maintenance.completed_by}</br><span class="err"></span></td>
                </tr>
                <tr class="row2">
              
               <td valign="middle" align="left" class="input_txt">Notes:</td>
               <td valign="top" align="left"  colspan="3">${maintenance.notes}<br/><span class="err"></span></td>
            </tr>
 --%>            
                
          
             <script type="text/javascript">
             
             function doAjaxPost_for_process1() {
            		var revision_id = $('#revisionid').val();
            		var document_id= $('#document_id').val();
            		/*   var education = $('#education').val();	 */		
            		$.ajax({
            			type : "POST",/* 
            			url : "/QMS_App/ajax_getrevisiondoc", */
            			url : "/QMS_APP/ajax_getrevisiondoc",
            			data : "revision_id=" +revision_id+"&document_id="+document_id,
            				
            			success : function(response) {
            				
            				$('#documentname').html(response);
            			
            			},
            			error : function(e) {
            				alert('Error: ' + e);
            			}
            		});
            	}
/* function toggle3(value){
     
       var e = document.getElementById('child_table');
      // var e1=document.getElementById('employee');
if(value==0)
       {
	e.style.display="none";
       }
else
       {
	e.style.display="block";
       }
       
} */
</script> 

<script>
	
	window.onload = function(){
		doAjaxPost_for_process1();
		
	}
</script>	
            