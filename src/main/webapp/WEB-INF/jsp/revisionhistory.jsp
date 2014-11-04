<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>

<form method="post" action="documentMains" method="post ">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
      <td>
      <div>
 	<ul class="horizmenu">
						<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="adddocument" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span class="buttonsub blue">Add Document</span>
									
								</a>
							</li>
						
				          <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="viewdocuments" class="<c:choose>
								<c:when test="${menu=='document'}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span class="buttonsub blue">View Document</span>
									
								</a>
							</li>
				            <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="document_report" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span class="buttonsub blue">Document report</span>
									
								</a>
							<%-- </li>
				             <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addform" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Add Form</span>
									
								</a>
							</li>
				            <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="view_form" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>View Form</span>
									
								</a>
							</li>
				            <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="form_report" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Form Report</span>
									
								</a>
							</li> --%>
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
               <tr class="row2">

<!--                   <td valign="middle" align="left" class="input_txt" width="20%">Equipment Id: </td>
 -->
                  <td valign="middle" align="left" class="input_txt" width="20%">Document ID:</td>

                  <td valign="top" align="left" class="input_txt" width="70%">${documentMain.document_id}</br><span class="err"></span></td>
                </tr>
                 <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="20%">Issuer:</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${documentMain.issuer}</br><span class="err"></span></td>
                </tr>
                 <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="20%">Approver 1(Process Owner):</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${documentMain.approver1}</br><span class="err"></span></td>
                </tr>
                 <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="20%">Revision Level:</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${documentMain.revision_level}</br><span class="err"></span></td>
                </tr>
                 <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="20%">Approver 2(Doc Control):</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${documentMain.approver2}</br><span class="err"></span></td>
                </tr>
                <tr class="row1">
                 <td valign="middle" align="left" class="input_txt" width="20%"> Date:</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${documentMain.date}
                  
                  <br/><span class="err"></span></td>
                  </tr>
                   <tr class="row2">
                 <td valign="middle" align="left" class="input_txt" width="20%"> Approver 3(Mgmt Report):</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${documentMain.approver3}
                  
                  <br/><span class="err"></span></td>
                  </tr>
                   <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="20%">Comments</td>
               <td valign="top" align="left" class="input_txt" width="70%">${documentMain.comments}
               </td>
                </tr>
                <tr class="row2">
                 <td valign="middle" align="left" class="input_txt" width="20%"> Status:</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${documentMain.status}
                  
                  <br/><span class="err"></span></td>
                  </tr>
                  
              
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
                <tr>
                <td align="right"><input type="button" value="Back" onclick="window.location.href='viewdocuments'" class="submit_btn1">
                </td>
                </tr>
            </table>
            </div>
            </td>
            </tr>
            </table>
            </div>
            </div>
            </td>
            </tr>
            </table></div>
            </form>
            <!--  <script type="text/javascript">
function toggle3(value){
     
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
       
}
</script> -->
            