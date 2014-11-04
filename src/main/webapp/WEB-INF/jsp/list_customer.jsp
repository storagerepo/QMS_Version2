<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>

<form method="post" action="customer">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
      <td>
      <div>
  <ul class="horizmenu"style=" float:left;margin-left:190px; margin-top:8px;">
						
						<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addcustomer" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Add Customers</span>
									
								</a>
							</li>
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="viewcustomers" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									<span>View Customers</span>
									
								</a>
							</li>
						
				          <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addfeedback" class="<c:choose>
								<c:when test="${menu=='customer'}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Add Feedback</span>
									
								</a>
							</li>
				           <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="viewfeedback" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>View feedback</span>
									
								</a>
							</li>
				           <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="feedback_report" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Feedback Report</span>
									
								</a>
							</li>
							</ul>
			
							
  </div>
      </td>
      </tr>
      <tr>
        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2>Customers Details</h2>
            </div>
            <div class="contentbox">
            <div style="border:#993300  2px solid; padding:15px; margin-bottom:15px;">
          	<table cellpadding="0" cellspacing="0" border="0" width="100%">
              <c:set value="${customersForm.customers[0]}" var="customers"></c:set>
               <tr class="row2">

                  <td valign="middle" align="left" class="input_txt" width="20%">Customer Id : </td>
					<td valign="middle" align="left" class="input_txt" width="20%">${customers.customer_id}</br><span class="err"></span></td>
					 <td valign="middle" align="left" class="input_txt" width="20%"> Website :</td>
               <td valign="middle" align="left" class="input_txt" width="20%">${customers.website}
               </td>
                </tr>
                 <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="20%">Customer Name :</td>
                  <td valign="middle" align="left" class="input_txt" width="20%">${customers.customer_name}</br><span class="err"></span></td>
                   <td valign="middle" align="left" class="input_txt" width="20%">Contact Name :</td>
               <td valign="middle" align="left" class="input_txt" width="20%">${customers.contact_name}
               </td>
                </tr>
                 <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="20%">Address :</td>
                  <td valign="middle" align="left" class="input_txt" width="20%">${customers.address}</br><span class="err"></span></td>
                   <td valign="middle" align="left" class="input_txt" width="20%"> Title Of Contact :</td>
               <td valign="middle" align="left" class="input_txt" width="20%">${customers.title_of_contact}
               </td>
                </tr>
                 <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="20%">City :</td>
                  <td valign="middle" align="left" class="input_txt" width="20%">${customers.city}</br><span class="err"></span></td>
                   <td valign="middle" align="left" class="input_txt" width="20%"> Telephone :</td>
               <td valign="middle" align="left" class="input_txt" width="20%">${customers.telephone}
               </td>
                </tr>
                 <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="20%"> State :</td>
                  <td valign="middle" align="left" class="input_txt" width="20%">${customers.state}</br><span class="err"></span></td>
                    <td valign="middle" align="left" class="input_txt" width="20%"> Fax :</td>
               <td valign="middle" align="left" class="input_txt" width="20%">${customers.fax}
               </td>
                </tr>
                <tr class="row1">
                 <td valign="middle" align="left" class="input_txt" width="20%"> Country :</td>
                  <td valign="middle" align="left" class="input_txt" width="20%">${customers.country}<br/><span class="err"></span></td>
                     <td valign="middle" align="left" class="input_txt" width="20%"> Email Address :</td>
               <td valign="middle" align="left" class="input_txt" width="20%">${customers.email_address}
               </td>
                  </tr>
                   <tr class="row2">
                 <td valign="middle" align="left" class="input_txt" width="20%">  Zipcode :</td>
                  <td valign="middle" align="left" class="input_txt" width="20%">${customers.zipcode}
                  
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
          </form>
          
               <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
      
      <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
      <jsp:include page="footer.jsp"></jsp:include>
            