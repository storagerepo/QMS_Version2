<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>

<form method="post" action="supplierperformance">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
      <td>
      <div>
  <ul class="horizmenu">
						
				<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addhr" class="<c:choose>
								<c:when test="${menu=='hr'}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Add HR & Training</span>
									
								</a>
							</li>
						
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="viewhr" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									<span>View HR & Training</span>
									
								</a>
							</li>
							</ul>
			
							
  </div>
      </td>
      </tr>
      <tr>
        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2>HR & Training List</h2>
            </div>
            <div class="contentbox">
            <div style="border:#993300  2px solid; padding:15px; margin-bottom:15px;">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
              <c:set value="${hRandTrainingForm.hRandTrainings[0]}" var="hRandTrainings"/>
              <tr class="row2">
                  <td valign="top" align="left" class="input_txt" width="20%"><label>ID :</label></td>
                  <td valign="top" align="left" class="input_txt" width="20%">${hRandTrainings.id }</td>
                 </tr>
                <tr class="row1">
                  <td valign="top" align="left" class="input_txt" width="20%">Name :</td>
                  <td valign="top" align="left" class="input_txt" width="20%">${hRandTrainings.name}
               	</td>
                <td valign="top" align="left" class="input_txt" width="20%"> Trainer :</td>
                  <td valign="top" align="left" class="input_txt" width="20%">${hRandTrainings.trainer}
                  </td>
                 </tr>
		<tr class="row2">
                  <td valign="top" align="left" class="input_txt" width="20%">Job Title :</td>
               	<td valign="top" align="left" class="input_txt" width="20%">${hRandTrainings.job_title}
            <td valign="top" align="left" class="input_txt" width="20%">Qualified By :</td>
                  <td valign="top" align="left" class="input_txt" width="20%">${hRandTrainings.qualified_by}
			   	</tr>
               	
               	<tr class="row1">
                <td valign="top" align="left" class="input_txt" width="20%">Training Effectiveness Notes :</td>
                 <td valign="top" align="left" class="input_txt" width="20%">${hRandTrainings.training_effectiveness_notes}</td>
 					<td valign="top" align="left" class="input_txt" width="20%">Type :</td>
                  <td valign="top" align="left" class="input_txt" width="20%">${hRandTrainings.type_of_training}
															</td>
                </tr>    
               	
                
				<tr class="row1">
                  <td valign="top" align="left" class="input_txt" width="20%">Date Hired :</td>
                  <td valign="top" align="left" class="input_txt" width="20%">${hRandTrainings.date_hired}
                   </td>
                <td valign="top" align="left" class="input_txt" width="20%">Due Date :</td>
                  <td valign="top" align="left" class="input_txt" width="20%">${hRandTrainings.training_due_date}
                </tr>
                <tr class="row2">
                  <td valign="top" align="left" class="input_txt" width="20%">Attachments :</td>
                  <td valign="top" align="left" class="input_txt" width="20%" >${hRandTrainings.attachment_name}
                  </td>
                  

                  
                  
                   <td valign="top" align="left" class="input_txt" width="20%">Completion Date :</td>
                  <td valign="top" align="left" class="input_txt" width="20%">${hRandTrainings.training_completion_date}
                   
                  </td>
                </tr>
                
           
             <tr class="row2">
              <td valign="top" align="left" class="input_txt" width="20%">Functions Needs :</td>
                 <td valign="top" align="left" class="input_txt" width="20%">
               
<c:if test="${hRandTrainings.calibration!='null'}"><c:out value="${hRandTrainings.calibration}"></c:out></c:if><br/>   
<c:if test="${hRandTrainings.responsibility!='null'}"><c:out value="${hRandTrainings.responsibility}"></c:out></c:if><br/>
<c:if test="${hRandTrainings.disposition!='null'}"><c:out value="${hRandTrainings.disposition}"></c:out></c:if><br/> 
               
            <%--      Calibration:${hRandTrainings.calibration}            
                 Responsibility:${hRandTrainings.responsibility}<br/>
                 Disposition:${hRandTrainings.disposition} --%>
                 </td>
                  
                  <td valign="top" align="left" class="input_txt" width="20%">Documented In :</td>
                  <td valign="top" align="left" class="input_txt" width="20%">${hRandTrainings.documented_in}
                  </tr>
                
                <tr class="row1">
                 <td valign="top" align="left" class="input_txt" width="20%"> Review Due Date :</td>
                  <td valign="top" align="left" class="input_txt" width="20%">${hRandTrainings.training_effectiveness_review_due_date}
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
               