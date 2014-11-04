<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>

<form method="post" action="internalaudits">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
      <td>
      <div>
  <ul class="horizmenu" style=" float:left;margin-left:190px; margin-top:8px;">
						
						<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addinternalaudits" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Add Internal Audits</span>
									
								</a>
							</li>
							
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="view_internalaudits" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									<span>View Internal Audits </span>
									
								</a>
							</li>
						
				         <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="internalaudit_report" class="<c:choose>
								<c:when test="${menu=='audits'}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
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
              <h2>Internal Audits Details</h2>
            </div>
            <div class="contentbox">
              
            
                <div style="border:#993300  2px solid; padding:15px; margin-bottom:15px;">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
              <tr>
			<td align="left" valign="top" width="50%">
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
			  <c:set value="${internalAuditsForm.internalAudits[0]}" var="internalaudits"></c:set>
                <tr class="row2">

                  <td valign="middle" align="left" class="input_txt" width="30%">Audit ID : </td>
					<td valign="top" align="left" class="input_txt" width="30%">${internalaudits.id}</br><span class="err"></span></td>
                </tr>
                 <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="30%">Process :</td>
                  <td valign="top" align="left" class="input_txt" width="30%">${internalaudits.process}</br><span class="err"></span></td>
                </tr>
                 <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="30%">Audit start date :</td>
                  <td valign="top" align="left" class="input_txt" width="30%">${internalaudits.audit_start_date}</br><span class="err"></span></td>
                </tr>
                 <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="30%">Audit due date :</td>
                  <td valign="top" align="left" class="input_txt" width="30%">${internalaudits.audit_due_date}</br><span class="err"></span></td>
                </tr>
                 <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="30%"> Auditor :</td>
                  <td valign="top" align="left" class="input_txt" width="30%">${internalaudits.auditor}</br><span class="err"></span></td>
              </tr> 
						         </table>
						         </td>
						         <td align="left" valign="top">
 <table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="30%">Auditee name :</td>
               <td valign="top" align="left" class="input_txt" width="30%">${internalaudits.auditee_name}
               </td>
                </tr>	
                      <tr class="row2">
                 <td valign="middle" align="left" class="input_txt" width="30%"> Audit notes :</td>
                  <td valign="top" align="left" class="input_txt" width="30%">${internalaudits.auditor_notes}
                  
                  <br/><span class="err"></span></td>
                  </tr>
                   <tr class="row2">
                 <td valign="middle" align="left" class="input_txt" width="30%">  Finding :</td>
                  <td valign="top" align="left" class="input_txt" width="30%">${internalaudits.finding}
                  
                  <br/><span class="err"></span></td>
                  </tr>
                   <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="30%"> Completion date :</td>
               <td valign="top" align="left" class="input_txt" width="30%">${internalaudits.completion_date}
               </td>
                </tr>
                 <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="30%">Auditors initials :</td>
               <td valign="top" align="left" class="input_txt" width="30%">${internalaudits.auditors_initials}
               </td>
                </tr>
                
              </table>
              </td>
              </tr>
              </table>
              </div>
              </div>
              </div>
              </td>
              </tr>
              </table>
              </div>
              </form>
              

                       
           
            