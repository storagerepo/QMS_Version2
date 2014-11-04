<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" />
<script src="resources/js/jquery.min.js"></script>
 <script src="resources/js/jquery-ui.js"></script>
  
 <form method="post" enctype="multipart/form-data" action="insert_documents">
 
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
     <tr>
        <td>
        <div>
  
					<ul class="horizmenu">
						<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="adddocument" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									Add Document
									
								</a>
							</li>
						
				          <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="viewdocuments" class="<c:choose>
								<c:when test="${menu=='document'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									View Document
									
								</a>
							</li>
				            <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="document_report" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									Document report
									
								</a>
							</li>
							
			            </ul>
						
				            
				             
				          
  </div>
        </td>
      </tr>
     
      <tr>
        <td valign="top" align="left">
            
            <div class="contentbox">
                    
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
              <td colspan="3">
            <!--  <div id="child_table" style="display:none;"> -->
<br>
			 <h1 style="color:#7A3A3A;font-size:20px;">Document Details</h1>
			 <div style="border:#993300  2px solid; padding:15px; margin-bottom:15px;">
             <table cellpadding="0" cellspacing="0" border="0" width="100%" >
             <c:set value="${documentMainForm.documentMains[0]}" var="documentMain"> </c:set>
    
    
             <tr class="row1">
             
              <td valign="middle" align="left" class="input_txt" width="15%"><b>Document ID:</b></td>
               <td valign="top" align="left" class="input_txt1" width="15%">${documentMain.document_id}</td>
               
               <td valign="middle" align="left" class="input_txt" width="20%"><b>Media Type:</b></td>
               <td valign="top" align="left" class="input_txt" width="20%">${documentMain.media_type}
               <!-- <select name="media_type" class="input_cmbbx1" onchange="">
               <option onclick="toggle2(this.value);" value="Hard Copy">Hard Copy</option>
               <option onclick="toggle2(this.value);" value="Electronic">Electronic</option>
               </select> -->
               
           <td valign="top" align="left" class="input_txt" width="20%"></td>
              
             </tr>  
              <tr class="row2">
              
               <td valign="middle" align="left" class="input_txt" width="25%"><b>Document Title:</b></td>
               <td valign="top" align="left" class="input_txt" width="20%">${documentMain.document_title}</td>
                <c:choose>
                <c:when test="${documentMain.media_type=='hardcopy'}">
               <td valign="middle" id="id_location_lbl" align="left" class="input_txt" width="20%"><b>Location:</b></td>
               <td valign="top" align="left" id="id_location_txt" class="input_txt" width="25%">${documentMain.location}
               </td></c:when>
               <c:when test="${documentMain.media_type=='electronic'}">
               <td valign="middle" id="id_location_lbl" align="right" class="input_txt" width="20%"><b>Upload File:</b></td>
               <td valign="top" align="left" id="id_location_txt" class="input_txt" width="25%">${documentMain.attachment_name}
              </c:when>
               </c:choose>
           <td valign="middle" id="softcopy_file_label" style="display:none;" align="right" class="input_txt" width="20%"></td>
               <td valign="top" id="softcopy_file_upload" style="display:none;" align="left" class="input_txt" width="25%"><div ><br/><span class="err"></span></div></td>
     
          
           <td valign="top" align="left" class="input_txt" width="20%"></td>
              
             </tr> 
             <tr class="row1">
              
               <td valign="middle" align="left" class="input_txt" width="25%"><b>Document Type:</b></td>
               <td valign="top" align="left" class="input_txt" width="20%">${documentMain.document_type}
               
               </td>
               <td valign="middle" align="left" class="input_txt" width="20%"><b>Process:</b></td>
               <td valign="top" align="left" class="input_txt" width="25%">${documentMain.process}
              </td>
            <td valign="top" align="left" class="input_txt" width="20%"></td>
              
             </tr> 
             <tr class="row2">
              
               <td valign="middle" align="left" class="input_txt" width="25%">
               <td valign="top" align="left" class="input_txt" width="20%">
               <td valign="middle" align="left" class="input_txt" width="20%"><b>External Document(Y/N):</b></td>
               <td valign="top" align="left" class="input_txt" width="25%">${documentMain.external}
               </td>
            <td valign="top" align="left" class="input_txt" width="20%"><span class="err"></span></td>
              
             </tr>  
             
		      <tr class="row1" style="border:none;">
           
            
            <td valign="top" align="left" class="input_txt" width="20%"><span class="err"></span></td>
             </tr>
             
             
               
             <li>
             </li>
             <li>
             </li>
            </table>
           
            </td>
           
            </table>
          
      </td>
      </tr>
              <td colspan="1">
            <!--  <div id="child_table" style="display:none;"> -->
<br>
                <div class="contentbox">
                             <h1 style="color:#7A3A3A;font-size:20px;">Revision Details</h1><br>
                <div style="border:#993300  2px solid; padding:15px; margin-bottom:15px;">
             <table cellpadding="0" cellspacing="0" border="0" width="100%" >
    		
           <tr class="row2">
                            <td valign="left" align="left" class="input_txt"><strong>Document Id</strong></td>
               <td valign="top" align="left" class="input_txt" width="25%">${documentMain.document_id}
               </td>
           <td valign="middle" align="left" class="input_txt" width="25%"><b>Date:</b></td>
               <td valign="top" align="left" class="input_txt" width="20%">${documentMain.date}</td>
               
               
               </td>
           
             <tr class="row1" style="border:none;">
           
           <td valign="middle" align="left" class="input_txt" width="25%"><b>Issuer:</b></td>
               <td valign="top" align="left" class="input_txt" width="20%">${documentMain.issuer}
               
               
               </td>
            
                <td valign="middle" align="left" class="input_txt" width="20%"><b>Approver 1(Process Owner):</b></td>
               <td valign="top" align="left" class="input_txt" width="25%">${documentMain.approver1}
               <!-- <select name="approver1" id="approver1" class="input_cmbbx1" style="width:200px;">
               <option value="">--Select--</option>
               <option value="Apporver name1">Approver name 1</option>
               <option value="Approver name2">Approver name 2</option>
               <option value="Approver name3">Approver name 3</option>
               </select>    -->   
               
               </td>
              <td valign="top" align="left" class="input_txt" width="20%"><span class="err"></span></td>
                 </tr>  
              <tr class="row2" style="border:none;">
              
                <td valign="middle" align="left" class="input_txt" width="25%"><b>Revision Level:</b></td>
               <td valign="top" align="left" class="input_txt" width="20%">${documentMain.revision_level}</td>
               <td valign="middle" align="left" class="input_txt" width="20%"><b>Approver 2(Doc Control):</b></td>
               <td valign="top" align="left" class="input_txt" width="25%">${documentMain.approver2}
               
 				</td>
            <td valign="top" align="left" class="input_txt" width="20%"><span class="err"></span></td>
             </tr>
             <tr class="row1" style="border:none;">
              
               <td valign="middle" align="left" class="input_txt" width="25%"><b>Date:</b></td>
               <td valign="top" align="left" class="input_txt" width="20%">${documentMain.date}</td>
               <td valign="top" align="left" class="input_txt" width="25%"><b>Approver 3(Mgmt Report):</b></td>
           <td valign="top" align="left" class="input_txt" width="20%">${documentMain.approver3}<span class="err"></span></td>
             </tr>  
              <tr class="row2" style="border:none;">
                 <td valign="middle" align="left" class="input_txt"><b>Comments:</b></td>
               <td valign="top" align="left" class="input_txt" width="20%">${documentMain.comments}</td>
         
               <td valign="top" align="left" class="input_txt" width="20%"><b>Status:</b></td>
               <td valign="top" align="left" class="input_txt" width="25%">${documentMain.status}
               
              </td>
                <td valign="middle" align="left" class="input_txt" width="20%">
               <span class="err"></td>
               <td valign="top" align="left" class="input_txt" width="25%">
            
             </tr>
             
             </table></div>
             </div>
             <tr class="row1" >
             <td colspan="2" align="right">
             <input type="button" id="submit"  name="submit" value="Back" class="submit_btn1" onclick="window.location.href='viewdocuments'"></td>
            
</tr></table></div></form>


      <jsp:include page="footer.jsp"></jsp:include>