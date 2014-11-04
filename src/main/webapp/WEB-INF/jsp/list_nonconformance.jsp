<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>

<form method="post" action="nonconformance">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
      <td>
      <div>
  <ul class="horizmenu">
						
						<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="add_nonconformance" class="<c:choose>
								<c:when test="${menu=='nonconformance'}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Add Nonconformance</span>
									
								</a>
							</li>

							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="view_nonconformance" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
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
        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2>Nonconformance List</h2>
            </div>
            			<div class="contentbox">
			  <div style="border:#993300  2px solid; padding:15px; margin-bottom:15px;">
						
				<table cellpadding="0" cellspacing="0" border="0" width="100%">
              <c:set value="${nonConformanceForm.nonconformance[0]}" var="nonconformance"></c:set>
               <tr class="row2">

                  <td valign="top" align="left" class="input_txt" width="30%">ID&nbsp;: </td>
					<td valign="top" align="left" class="input_txt" width="20%">${nonconformance.id}</br><span class="err"></span></td>
                  <td valign="top" align="left" class="input_txt" width="30%">External Id&nbsp;:</td>
                  <td valign="top" align="left" class="input_txt" width="20%" style="padding-left:23px">${nonconformance.external_id}</br><span class="err"></span></td>
               
                </tr>
                 <tr class="row1">
                  <td valign="top" align="left" class="input_txt" width="20%">Source of Nonconformance&nbsp;:</td>
                  <td valign="top" align="left" class="input_txt" width="20%">${nonconformance.source_of_nonconformance}</br><span class="err"></span></td>
                  <td valign="top" align="left" class="input_txt" width="20%"> Product Id&nbsp;:</td>
                  <td valign="top" align="left" class="input_txt" width="20%" style="padding-left:23px">${nonconformance.product_id}</br><span class="err"></span></td>
                </tr>
                 
                 <tr class="row1">
                  <td valign="top" align="left" class="input_txt" width="20%">Type Of Nonconformance&nbsp;:</td>
                  <td valign="top" align="left" class="input_txt" width="20%">${nonconformance.type_of_nonconformance}</br><span class="err"></span></td>
                 <td valign="top" align="left" class="input_txt" width="20%"> Quantity Suspect&nbsp;:</td>
                  <td valign="top" align="left" class="input_txt" width="20%" style="padding-left:23px">${nonconformance.quantity_suspect}
                 </td>
                  </tr>
                
                <tr class="row1">
               <td valign="top" align="left" class="input_txt" width="20%">Disposition Required(Y/N)&nbsp;:</td>
               <td valign="top" align="left" class="input_txt" width="20%">${nonconformance.disposition_required}
               <td valign="top" align="left" class="input_txt" width="20%">Nature Of Nonconformance&nbsp;:</td>
               <td valign="top" align="left" class="input_txt" width="20%" style="padding-left:23px">${nonconformance.nature_of_nonconformance}
               </td>
               </tr>
               
                   <tr class="row2">
                 <td valign="top" align="left" class="input_txt" width="20%"> Date Found&nbsp;:</td>
                  <td valign="top" align="left" class="input_txt" width="20%" >${nonconformance.date_found}
               <td valign="top" align="left" class="input_txt" width="20%" >Disposition&nbsp;:</td>
             <td>
             <table border="0"> 
              <tr>
               <td>${nonconformance.disposition1}</td>
               <td>${nonconformance.quality1}</td>
               
               </tr>
               <tr>
               <td>${nonconformance.disposition2}</td>
               <td>${nonconformance.quality2}</td>
               </tr>
               
               <tr>
               <td>${nonconformance.disposition3}</td>
               <td>${nonconformance.quality3}</td>
               </tr>
              </table>
              </td>
                   <tr class="row1">
               <td valign="top" align="left" class="input_txt" width="20%"> Reported By&nbsp;:</td>
               <td valign="top" align="left" class="input_txt" width="20%">${nonconformance.reported_by}
               </td>
               <td valign="top" align="left" class="input_txt" width="20%">Disposition Complete Date&nbsp;:</td>
               <td valign="top" align="left" class="input_txt" width="20%" style="padding-left:23px">${nonconformance.disposition_complete_date}
               </td>
                </tr>
                 <tr class="row1">
               <td valign="top" align="left" class="input_txt" width="20%">Temporary Action&nbsp;:</td>
               <td valign="top" align="left" class="input_txt" width="20%">${nonconformance.temporary_action}
               <td valign="top" align="left" class="input_txt" width="20%">Name of Disposition Responsibility&nbsp;:</td>
               <td valign="top" align="left" class="input_txt" width="20%" style="padding-left:23px">${nonconformance.name_of_disposition_responsibility}
               </td>
                </tr>
                <tr class="row1">
               <td valign="top" align="left" class="input_txt" width="20%">Corrective Action Required(Y/N)&nbsp;:</td>
               <td valign="top" align="left" class="input_txt" width="20%">${nonconformance.corrective_action_required}
               </td>
               <td valign="top" align="left" class="input_txt" width="20%">Cost of Nonconformance&nbsp;:</td>
               <td valign="top" align="left" class="input_txt" width="20%" style="padding-left:23px">${nonconformance.cost_of_nonconformance}
               </td>
                </tr>
                
               </table>
               </div>
               </div>
               </div>
               </td>
               </tr>
               <tr height="200"></tr>
               </table>
               </div>
               </form>
                          
             
     

<jsp:include page="footer.jsp"></jsp:include>