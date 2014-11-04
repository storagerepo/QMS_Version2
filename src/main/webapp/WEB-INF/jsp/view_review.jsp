<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>

<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
	<tr>
		<td>
			<div>
				<ul class="horizmenu" style=" float:left;margin-left:215px; margin-top:8px;">
<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addmanagementreview" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Add Management Review</span>
									
								</a>
							</li>
							
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="viewmanagementreview" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									<span>View Management Review</span>
									
								</a>
							</li>
						
				         <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="managementreview_report" class="<c:choose>
								<c:when test="${menu=='review'}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Reports</span>
									
								</a>
							</li>
							</ul>
			</div></td>
	</tr>
	<tr>

 <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table" >
      <tr>
        <td valign="top" align="left" style="padding:5px 0 10px 0;"></td>
      </tr>
      <tr>
        <td valign="top" align="left"><div>
         <font color="Red" size="+1"></font>
            <div class="headings altheading">
              <h2 style="padding-left:30px">Management Review Details</h2>
            </div>
            <div class="contentbox">
            <div style="border:#993300  2px solid; padding:15px; margin-bottom:15px; margin-left:30px;">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
                
              <c:set value="${managementreviewform.managementreviewdetails[0]}" var="managementreviewdetails"> </c:set>
                <tr class="row2" valign="right">
			    <td valign="middle" align="left" class="input_txt" width="20%">Review Id: </td>
			    <td valign="top" align="left" class="input_txt" width="20%">${managementreviewdetails.review_id}
			    <br/><span class="err"></span></td>
               
                  <td valign="middle" align="left" class="input_txt" width="20%">Management Review Date :</td>
                  <td valign="top" align="left" class="input_txt" width="20%">${managementreviewdetails.management_review_date}
                  <br/><span class="err"></span></td>
                </tr>
                 <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="20%">Attendee List With TITLES :</td>
                  <td valign="top" align="left" class="input_txt" width="20%">${managementreviewdetails.attendee_list_with_titles}
                  <br/><span class="err"></span></td>
               
                  <td valign="middle" align="left" class="input_txt" width="20%">Next Management Review By :</td>
                  <td valign="top" align="left" class="input_txt" width="20%">${managementreviewdetails.next_management_review_by}
                  <br/><span class="err"></span></td>
                </tr>
                 <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="20%">Category :</td>
                  <td valign="top" align="left" class="input_txt" width="20%">${managementreviewdetails.category}
                  <br/><span class="err"></span></td>
                </tr>
                <tr class="row1">
                 <td valign="middle" align="left" class="input_txt" width="20%"> Assessment :</td>
                  <td valign="top" align="left" class="input_txt" width="20%">${managementreviewdetails.assessment}
 			        <br/><span class="err"></span></td>
                  
                 <td valign="middle" align="left" class="input_txt" width="20%"> Report_link :</td>
                  <td valign="top" align="left" class="input_txt" width="20%">${managementreviewdetails.report_link}
                  <br/><span class="err"></span></td>
                  </tr>
                  <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="20%">Action Needed:</td>
               <td valign="top" align="left" class="input_txt" width="20%">${managementreviewdetails.action_needed}
               </td>
               
                 <td valign="middle" align="left" class="input_txt" width="20%">Action Detail :</td>
                  <td valign="top" align="left" class="input_txt" width="20%">${managementreviewdetails.action_detail}
                   <br/><span class="err"></span></td>
                  </tr>
                   <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="20%">Action Due Date :</td>
                  <td valign="top" align="left" class="input_txt" width="20%">${managementreviewdetails.action_due_date}
                  <br/><span class="err"></span></td>
              
                  <td valign="middle" align="left" class="input_txt" width="20%">Responsibility :</td>
                  <td valign="top" align="left" class="input_txt" width="20%">${managementreviewdetails.responsibility}
                  <br/><span class="err"></span></td>
                </tr>
                <tr class="row1">
              
               <td valign="middle" align="left" class="input_txt">Completion Date:</td>
               <td valign="top" align="left">${managementreviewdetails.completion_date}
               <br/><span class="err"></span></td>
          
                  <td valign="middle" align="left" class="input_txt" width="20%">Continuous Improvement Project :</td>
                  <td valign="top" align="left" class="input_txt" width="20%">${managementreviewdetails.continuous_improvement_project}
                  <br/><span class="err"></span></td>
                </tr>
                </table>
                </div>
                </div>
                </div>
                </td>
                </tr>
                </table>
               </div>
               </tr>
               </table>
               <br><br><br><br><br><br><br><br><br><br><br><br><br><br>
              
                <jsp:include page="footer.jsp"></jsp:include>
    