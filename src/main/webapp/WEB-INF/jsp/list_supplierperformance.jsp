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
								<a href="add_supplierperformance" class="<c:choose>
								<c:when test="${menu=='supplier'}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Add SupplierPerformance</span>
									
								</a>
							</li>
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="view_supplierperformance" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
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
              <h2>Supplier Performance Details</h2>
            </div>
            <div class="contentbox">
            <div style="border:#993300  2px solid; padding:15px; margin-bottom:15px;">
              <table cellpadding="0" cellspacing="0" border="0" width="100%" style="padding-left:30px; padding-right: 30px;">
              <c:set value="${supplierPerformanceForm.supplierperformance[0]}" var="supplierperformance"></c:set>
               <tr class="row2">

                  <td valign="middle" align="left" class="input_txt" width="20%">Supplier ID : </td>
					<td valign="top" align="left" class="input_txt" width="20%">${supplierperformance.supplier_id}</br><span class="err"></span></td>
               <td valign="middle" align="left" class="input_txt" width="20%"> Website :</td>
               <td valign="top" align="left" class="input_txt" width="20%">${supplierperformance.website}
               </td>
                </tr>
                 <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="20%">Supplier name :</td>
                  <td valign="top" align="left" class="input_txt" width="20%">${supplierperformance.supplier_name}</br><span class="err"></span></td>
               <td valign="middle" align="left" class="input_txt" width="20%"> Certified to :</td>
               <td valign="top" align="left" class="input_txt" width="20%">${supplierperformance.certified_to}
               </td>
                </tr>
                 <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="20%">Category :</td>
                  <td valign="top" align="left" class="input_txt" width="20%">${supplierperformance.category}</br><span class="err"></span></td>
               <td valign="middle" align="left" class="input_txt" width="20%"> Contact name :</td>
               <td valign="top" align="left" class="input_txt" width="20%">${supplierperformance.contact_name}
               </td>
                </tr>
                 <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="20%">Address :</td>
                  <td valign="top" align="left" class="input_txt" width="20%">${supplierperformance.address}</br><span class="err"></span></td>
               <td valign="middle" align="left" class="input_txt" width="20%"> Contact title :</td>
               <td valign="top" align="left" class="input_txt" width="20%">${supplierperformance.contact_title}
               </td>
                </tr>
                 <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="20%"> City :</td>
                  <td valign="top" align="left" class="input_txt" width="20%">${supplierperformance.city}</br><span class="err"></span></td>
               <td valign="middle" align="left" class="input_txt" width="20%"> Phone :</td>
               <td valign="top" align="left" class="input_txt" width="20%">${supplierperformance.phone}
               </td>
                </tr>
                <tr class="row1">
                 <td valign="middle" align="left" class="input_txt" width="20%"> State :</td>
                  <td valign="top" align="left" class="input_txt" width="20%">${supplierperformance.state}
               <td valign="middle" align="left" class="input_txt" width="20%"> Fax :</td>
               <td valign="top" align="left" class="input_txt" width="20%">${supplierperformance.fax}
               </td>   
                  
                  </tr>
                   <tr class="row2">
                 <td valign="middle" align="left" class="input_txt" width="20%">  Postal code :</td>
                  <td valign="top" align="left" class="input_txt" width="20%">${supplierperformance.postalcode}</td>
                    <td valign="middle" align="left" class="input_txt" width="20%"> Email address :</td>
               <td valign="top" align="left" class="input_txt" width="20%">${supplierperformance.email_address}
               </td>
                  </tr>
                   <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="20%"> Country :</td>
               <td valign="top" align="left" class="input_txt" width="20%">${supplierperformance.country}
               </td>
                </tr>
                  </table>
                  </div>
            </div>
            </td>
            </tr>
            </table>
            </div>
            
            </form>
           <br><br><br><br><br><br><br><br><br><br><br><br><br><br>
           <br><br><br><br><br><br><br><br><br><br><br><br>
           <br><br><br><br><br><br><br><br><br><br><br><br>
           
<jsp:include page="footer.jsp"></jsp:include>            