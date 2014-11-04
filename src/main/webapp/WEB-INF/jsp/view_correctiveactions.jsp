<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" />

<script src="resources/js/jquery.min.js"></script>
 <script src="resources/js/jquery-ui.js"></script>
<jsp:include page="header.jsp"></jsp:include>

<form method="post" enctype="multipart/form-data"  action="updatecorrectiveAndPreventiveActions">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
       <td>
        <div>
  <ul class="horizmenu">
						
						<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addcorrectiveAndPreventiveActions" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									Add Corrective And Preventive Actions
									
								</a>
							</li>
							
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="correctiveactions_list" class="<c:choose>
								<c:when test="${menu=='corrective'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									View Corrective And Preventive Actions
									
								</a>
							</li>
						
				         <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="capa_report" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									Reports
								</a>
							</li>
				            </ul>
				            
  </div>
       </td>
      </tr>
      <tr>
      
       <td valign="middle" align="left">
        
        
            <div class="headings altheading">
              <h2> Search Corrective and Preventive Actions Details</h2>
            </div>
            <div class="contentbox">
              <c:set value="${correctiveAndPreventiveActionsForm.correctiveAndPreventiveActions[0]}" var="correctiveAndPreventiveActions"> </c:set>
               <table cellpadding="0" cellspacing="0" border="0" width="100%" style="border:#993300  2px solid; padding:15px; margin-bottom:15px;">
             <!--  <div style="border:#993300  2px solid; padding:15px; margin-bottom:15px;">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
              --> <tr>
			<td align="left" valign="middle" width="50%" style="padding-right: 25px;">
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="30%">CAPA ID :</td>
                  <td valign="middle" align="left" class="input_txt" width="30%">${correctiveAndPreventiveActions.capa_id}<br/></td>
              	   <td valign="middle" align="left" class="input_txt"> NC ID :</td>
				  <td valign="middle" align="left" class="input_txt">${correctiveAndPreventiveActions.nc_id}
			</td>			
              
                </tr>
                
                <tr class="row2">
				  <td valign="middle" align="left" class="input_txt" width="30%"> External ID :</td>
                  <td valign="middle" align="left" class="input_txt" width="30%">
                  		${correctiveAndPreventiveActions.external_id}<br/></td>  
                  
                  <td valign="middle" align="left" class="input_txt" width="30%">Source of NC :</td>
                  <td valign="middle" align="left" class="input_txt" width="30%">${correctiveAndPreventiveActions.source_of_nonconformance}
                  	
                </td>
                </tr>
                  			
                <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="30%">Date Found :</td>
                  <td valign="middle" align="left" class="input_txt" width="30%">
                 ${correctiveAndPreventiveActions.date_found}
                   </td>
                  

                  <td valign="middle" align="left" class="input_txt" width="30%"> Type of NC :</td>
                  <td valign="middle" align="left" class="input_txt" width="30%">
                 ${correctiveAndPreventiveActions.type_of_nonconformance}<br/>
                                    </td>
                </tr>
                
			<tr class="row2">
				<td valign="middle" align="left" class="input_txt" width="30%">Temporary Action :</td>               
                <td valign="middle" align="left" class="input_txt" width="30%">
                ${correctiveAndPreventiveActions.temporary_action}
                 
                </td>
            	
            	<td valign="middle" align="left" class="input_txt" width="30%">Nature of NC :</td>      
				<td valign="middle" align="left" class="input_txt" width="30%">${correctiveAndPreventiveActions.nature_of_nc}
				 
				</td>
            </tr>
            <tr class="row2">
              <td valign="middle" align="left" class="input_txt"> CAPA Requestor :</td>
			  <td valign="middle" align="left" class="input_txt">${correctiveAndPreventiveActions.capa_requestor}
				</td>        
						                  
				                 
										  
							  
				 	
			  <td valign="middle" align="left" class="input_txt"> Use 5 Why's in system (Y/N)<span>&nbsp;(*Optional)</span> :</td>
		      <td><c:if test="${correctiveAndPreventiveActions.use_5_why_in_system=='use_5_why_in_system'}"><c:out value="Yes"/></c:if></td>					
		
	</tr> 
				
            <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="30%"> Request Date :</td>
                  <td valign="middle" align="left" class="input_txt" width="30%">${correctiveAndPreventiveActions.request_date}</td>
                  
                  <td valign="middle" align="left" class="input_txt" id="why?" width="20" style="display:none;">Why's ?
				   	 &nbsp;</td>
				  <td valign="middle" align="left" class="input_txt" width="70% " id="5why">
					 Why's ?</td>
					<td valign="middle" align="left" class="input_txt" width="70% " id="5why">
					  ${correctiveAndPreventiveActions.why}</td>  			
             </tr>	
             
            <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="30%"> CAPA Due Date :</td>
                  <td valign="middle" align="left" class="input_txt" width="30%">${correctiveAndPreventiveActions.capa_due_date}</td>
                 
              
                </tr>
            <tr class="row1">
              <td valign="middle" align="left" class="input_txt">Assigned Team Leader :</td>
						           <td valign="middle" align="left" class="input_txt">
				                  	${correctiveAndPreventiveActions.assigned_team_leader}	
				                 
				                   	</td>	
                 </tr>
                  <tr class="row2">
                 <td valign="middle" align="left" class="input_txt" width="30%">Team Member (s) :</td>      
						         	 <td valign="middle" align="left" class="input_txt" width="30%">${correctiveAndPreventiveActions.team_members}</td>
                <td valign="middle" align="left" class="input_txt" width="30%">Root Cause Statement :</td>               
                  <td valign="middle" align="left" class="input_txt" width="30%">${correctiveAndPreventiveActions.root_cause_statement}</td>
               
              </tr>
                 <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="30%">Root-Cause Analysis File :</td>
                  
                  <td valign="middle" align="left" class="input_txt" width="30%">${correctiveAndPreventiveActions.root_cause_analysis_file}</td>
               <!-- <td valign="middle" align="left" class="input_txt" > Upload External Analysis(Y/N)<span>(*Optional)</span></td>
				                   	<td><input type="checkbox" name="upload_external_analysis" id="externalfile" value="upload_external_analysis" id="0"/></td>
						 -->             	  <td valign="middle" align="left" class="input_txt" width="32%">Upload External Analysis (Y/N)<span>(*Optional)</span> :</td>
				  <td valign="middle" align="left" class="input_txt" width="32%"><c:if test="${ correctiveAndPreventiveActions.upload_external_analysis =='upload_external_analysis'}"><c:out value="Yes"/></c:if>
				  </td>
				 
				  	 </tr>
				  	 
			 <tr class="row1" id="id_file">
			  
			 <td valign="middle" align="left" class="input_txt" width="30%"><input type="hidden"/></td>
			 <td valign="middle" align="left" class="input_txt" width="30%"><input type="hidden"/></td>
             <td valign="middle" align="left" class="input_txt" width="30%">Upload the File :</td>
             <td valign="middle" align="left" class="input_txt" width="30%">${correctiveAndPreventiveActions.attachment_name}</td>
                 
                   </tr>
						<!-- 
							</tr>
				
				 <td valign="middle" align="left" class="input_txt" width="30%" >Upload</td>
                  <td valign="middle" align="left" class="input_txt" width="30%">
                  
                  <input name="attachments"  id="id_file" type="file" /> 
                  </td>       	
          
           </tr>
           -->       
                 
                  </table>
                <br>
                <div style="border:#993300  2px solid; padding:15px; margin-bottom:15px;">
                 <table cellpadding="0" cellspacing="0" border="0" width="100%">
              <tr>
			<td align="left" valign="middle" width="50%" style="padding-right: 25px;">
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="20%">Action :</td>
                  <td valign="middle" align="left" class="input_txt" width="20%">${correctiveAndPreventiveActions.action}</td>
                <td valign="middle" align="left" class="input_txt" width="20%">Due Date :</td>
                  <td valign="middle" align="left" class="input_txt" width="20%">${correctiveAndPreventiveActions.due_date}</td>
                <td valign="middle" align="left" class="input_txt" width="20%">Verified By :</td>
                  <td valign="middle" align="left" class="input_txt" width="20%">${correctiveAndPreventiveActions.verified_by}</td>
               </tr>
                    <tr class="row2">
                     <td valign="middle" align="left" class="input_txt" width="20%">Responsibity :</td>
                     <td valign="middle" align="left" class="input_txt"width="20%">${correctiveAndPreventiveActions.responsibility}
				                  		
				                   	</td>	
                     
                     <td valign="middle" align="left" class="input_txt" width="20%">Completion Date :</td>
                  <td valign="middle" align="left" class="input_txt" width="20%">${correctiveAndPreventiveActions.completion_date}</td>
                <td valign="middle" align="left" class="input_txt" width="20%">Verification Date :</td>
                  <td valign="middle" align="left" class="input_txt" width="20%">${correctiveAndPreventiveActions.verification_date}</td>
                 </tr>
                </table>
               </td>
               </tr>
               </table>
                </div>
                 
                 <br>
                 <table align="center" width="100%">
                  <tr >
                  
                  <td valign="middle" align="center"></td>
				  <td valign="middle" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<!-- <input type="submit" value="Submit" class="submit_btn1" onclick="return validation();"> -->
				 </td>
                  </tr>
                  </table>
                  </table>
                  </div>
                  
                  </td>
                  </tr></table></div>
                 
                  </form>
                  
                  
                  

<jsp:include page="footer.jsp"></jsp:include>
