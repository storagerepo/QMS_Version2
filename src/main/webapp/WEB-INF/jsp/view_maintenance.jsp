<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>

<form method="post" action="maintenance">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
      <td>
      <div>
  <ul class="horizmenu" style=" float:left;margin-left:205px; margin-top:8px;">
						
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="add_maintenance" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Add Maintenance</span>
									
								</a>
							</li>
						<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="maintenance_list" class="<c:choose>
								<c:when test="${menu=='maintenance'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									<span>View Maintenance</span>
								</a>
							</li>
				           <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="maintenance_report" class="<c:choose>
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
              <h2 style="padding-left:6px">Maintenance and Calibration Details</h2>
            </div>
            
    <div class="contentbox">
       <div style="border:#993300  2px solid; padding:15px; margin-bottom:15px; margin-left:10px;">
        <div>
           <table cellpadding="0" cellspacing="0" border="0" width="100%" >
              <tr>
			<td align="left" valign="top" width="50%" style="padding-right: 35px;">
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
               
               <c:set value="${maintenanceForm.maintenance[0]}" var="maintenance"> </c:set>
               <tr class="row2">

                  <td valign="middle" align="left" class="input_txt" width="50%">Equipment ID  : </td>

                  <td valign="top" align="left" class="input_txt" width="50%">${maintenance.equipment_id}</br><span class="err"></span></td>
                </tr>
                 <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="50%">Equipment Name  :</td>
                  <td valign="top" align="left" class="input_txt" width="50%">${maintenance.equipment_name}</br><span class="err"></span></td>
                </tr>
                 <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="50%">Equipment Model  :</td>
                  <td valign="top" align="left" class="input_txt" width="50%">${maintenance.equipment_model}</br><span class="err"></span></td>
                </tr>
                 <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="50%">Serial Number  :</td>
                  <td valign="top" align="left" class="input_txt" width="50%">${maintenance.serial_number}</br><span class="err"></span></td>
                </tr>
                  </table>
						         </td>
						         <td align="left" valign="top">
						         <table cellpadding="0" cellspacing="0" border="0" width="100%">
                
                 <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="50%">Date Acquired  :</td>
                  <td valign="top" align="left" class="input_txt" width="50%">${maintenance.date_acquired}</br><span class="err"></span></td>
                </tr>
                <tr class="row1">
                 <td valign="middle" align="left" class="input_txt" width="50%">Equipment Status  :</td>
                  <td valign="top" align="left" class="input_txt" width="50%">${maintenance.equipment_status}
                  
                  <br/><span class="err"></span></td>
                  </tr>
                   <tr class="row2">
                 <td valign="middle" align="left" class="input_txt" width="50%">Frequency of Maintenance  :</td>
                  <td valign="top" align="left" class="input_txt" width="50%">
                   <c:if test="${maintenance.frequency_maintenance_weekly != 'null'}">
                  ${maintenance.frequency_maintenance_weekly}
                  </c:if><br>
                  <c:if test="${maintenance.frequency_maintenance_monthly != 'null'}">
                  ${maintenance.frequency_maintenance_monthly}
                  </c:if><br>
                  <c:if test="${maintenance.frequency_maintenance_quarterly != 'null'}">
                  ${maintenance.frequency_maintenance_quarterly}
                  </c:if><br>
                  <c:if test="${maintenance.frequency_maintenance_semiannually != 'null'}">
                  ${maintenance.frequency_maintenance_semiannually}
                  </c:if><br>
                  <c:if test="${maintenance.frequency_maintenance_annually != 'null'}">
                  ${maintenance.frequency_maintenance_annually}
                  </c:if>
                 
                  
                  <br/><span class="err"></span></td>
                  </tr>
                   <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="50%">Calibration(Y/N)  :</td>
               <td valign="top" align="left" class="input_txt" width="50%">${maintenance.calibration}
               </td>
                </tr>
                 </table>
             </td>
              </tr>
            
            
        </table>
        </div>
       
         <div>
         <div style="border:#993300  2px solid; padding:15px; margin-bottom:15px; margin-left:10px;">
          <table cellpadding="0" cellspacing="0" border="0" width="100%">
              <tr>
			<td align="left" valign="top" width="50%" style="padding-right: 25px;">
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
               <tr class="row1">
                 <td valign="middle" align="left" class="input_txt" width="50%">Type of Maintenance  :</td>
                  <td valign="top" align="left" class="input_txt" width="50%">${maintenance.type_of_maintenance}
                  
                <br/><span class="err"></span></td>
                  </tr>
                   <tr class="row2">
                  <td valign="top" align="left" class="input_txt" width="50%">Frequency of Maintenance :</td>
                  <td valign="middle" align="left" class="input_txt" width="50%">
                 
                  ${maintenance.frequency_maintenance_list}
                  
                  
                  
                  <span class="err"></span></td>
                </tr>
                 <tr class="row1">
                  <td valign="top" align="left" class="input_txt" width="50%">Reference  :</td>
                  <td valign="middle" align="left" class="input_txt" width="50%">
                   <c:if test="${maintenance.reference1 != 'null'}">
                  ${maintenance.reference1}
                  </c:if>
                  <%--
                  <br>
                   <c:if test="${maintenance.reference1 != 'null'}">
                  ${maintenance.reference2}
                  </c:if> <br>
                   <c:if test="${maintenance.reference3 != 'null'}">
                  ${maintenance.reference3}
                  </c:if><br>
                   <c:if test="${maintenance.reference4 != 'null'}">
                  ${maintenance.reference4}
                  </c:if><br>
                   <c:if test="${maintenance.reference5 != 'null'}">
                  ${maintenance.reference5}
                  </c:if> --%>
              
               </td>
                </tr>
               
              </table>
        </td> 
            <td align="left" valign="top" width="50%" style="padding-right: 25px;">
          	<table cellpadding="0" cellspacing="0" border="0" width="100%">
           
           
            <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="50%">Due Date  :</td>
                  <td valign="top" align="left" class="input_txt" width="50%">${maintenance.due_date}</br><span class="err"></span></td>
                </tr>
                <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="50%">Completion Date  :</td>
                  <td valign="top" align="left" class="input_txt" width="50%">${maintenance.completion_date}</br><span class="err"></span></td>
                </tr>
                <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="50%">Completed By  :</td>
                  <td valign="top" align="left" class="input_txt" width="50%">${maintenance.completed_by}</br><span class="err"></span></td>
                </tr>
                <tr class="row2">
              
               <td valign="middle" align="left" class="input_txt">Notes  :</td>
               <td valign="top" align="left"  colspan="3">${maintenance.notes}<br/><span class="err"></span></td>
            </tr>
             <tr class="row2">
              
               <td valign="middle" align="left" class="input_txt">Instructions(Optional)  :</td>
               <td valign="top" align="left"  colspan="3">${maintenance.instructions}<br/><span class="err"></span></td>
            </tr>
         </table>
         </td>
         </tr>
         </table>
         </div>
         </div>
         </div>
         </div>
         </td>
         </tr>
         </table>
         </div>
         </form>
            <br><br><br>
           <jsp:include page="footer.jsp"></jsp:include>      
         
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
            