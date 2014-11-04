<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="header.jsp"></jsp:include>

<script type="text/javascript" src="js/ajaxpaging.js"></script>

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
      		
			<c:if test="${success=='true'}">
			<tr>
				<td valign="top" align="left" style="padding: 5px 0 10px 200px;">&nbsp;
					<div id="success_statusbar" class="status success">
						<p class="closestatus">
						<img alt="Success" src="resources/images/icons/inserted.png">
						<a title="Close" href="viewhr">
						<img alt="Success" src="resources/images/icons/icon_square_close.png"></a>		
						</p>
					</div></td>
			</tr>
		</c:if>
		<c:if test="${success=='update'}">
			<tr>
				<td valign="top" align="left" style="padding: 5px 0 10px 200px;">&nbsp;
					<div id="success_statusbar" class="status success">
						<p class="closestatus">
						<img alt="Success" src="resources/images/icons/success.png"/>
						<a title="Close" href="viewhr">
						<img alt="Success" src="resources/images/icons/icon_square_close.png"></a>
						</p>
					</div></td>
			</tr>
		</c:if>
      		<tr>
				<td valign="top" align="left" style="padding:5px 0 10px 0;">
					<div class="del_div">
						<p><label style="padding: 0pt 20px 0pt 0pt;"><input type="submit" name="delete" value="" class="icon1" onclick="form.action='?do=deleteparticipant'" /></label></p>
	          		</div>
				</td>
			</tr>
			<tr>
        		<td valign="top" align="left">
			        <div class="headings altheading">
			          <h2>Search HR and Training Details</h2>
			        </div>
		        <div class="contentbox">
							<div style="border:#ccc 2px solid; padding:15px; margin-bottom:15px;">
							<form action="findhr" method="get">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr>
							    <td align="right" valign="middle" width="10%"> Type :&nbsp;</td>
							 
							     <td valign="middle" align="left" class="input_txt"><select	name="type_of_training" id="type"class="dropdown">
                 	<option value="">--Select--</option>
				                  									
                  										<option
                  											<c:if test="${'Classroom' eq type}"><c:out value="Selected"/></c:if>
															<%-- <c:if test="${HRandTraining.type_of_training eq 'Classroom'}"><c:out value="Selected"/></c:if> --%>
															value="Classroom">Classroom</option>
														<option
														<c:if test="${'Hands on' eq type}"><c:out value="Selected"/></c:if>
															<%-- <c:if test="${HRandTraining.type_of_training eq 'Hands on'}"><c:out value="Selected"/></c:if> --%>
															value="Hands on">Hands on</option>
														</select></td>
                
							     <td align="right" valign="middle" width="12%">Qualified By :&nbsp; </td>
							    <td valign=" middle" align="left" class="input_txt"><select	name="qualified_by" class="dropdown" id="qualified">
                  											<option value="">--Select--</option>
				                  									
                  										<option
                  											<c:if test="${'Education' eq qualifiedby}"><c:out value="Selected"/></c:if>
															<%-- <c:if test="${HRandTraining.qualified_by eq 'Education'}"><c:out value="Selected"/></c:if> --%>
															value="Education">Education</option>
														<option
															<c:if test="${'Experience' eq qualifiedby}"><c:out value="Selected"/></c:if>
															<%-- <c:if test="${HRandTraining.qualified_by eq 'Experience'}"><c:out value="Selected"/></c:if> --%>
															value="Experience">Experience</option>
														<option
															<c:if test="${'Training' eq qualifiedby}"><c:out value="Selected"/></c:if>
															<%-- <c:if test="${HRandTraining.qualified_by eq 'Training'}"><c:out value="Selected"/></c:if> --%>
															value="Training">Training</option>
														
															</select><span class="err"><form:errors path="HRandTraining.qualified_by"></form:errors></span></td>
               				<td align="right" valign="middle" width="12%"> Trainer :&nbsp;</td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="trainer" maxlength="32" class="input_txtbx" id="trainer" value="${trainer}" onInput="return  validatename(id);">
							     <br><span id="trainererror" style="color:red"></span>
							    </td>
							  
	<!-- 						    <td align="center" valign="middle"><input type="submit" class="submit_btn" value="Find"></td>
	 -->						  
							    <td align="center" valign="middle" width="38%"><input type="submit" class="submit_btn1" value="Search">
							    <br><span id="searcherror" style="color:red"></span>
							    
							    </td>
							  <!--    <td align="center" valign="middle"><input type="reset" class="submit_btn1" value="Clear"></td> -->
							  </tr>
							  </table>
							  </form>
							  </div>
							  
	 <table cellpadding="0" cellspacing="0" border="0" width="100%">
				        
				        
							<tr class="title">
								<td valign="top" align="left" width="10%">&nbsp;ID</td>
					         	<td valign="top" align="left" width="10%">Name</td>
					         	<td valign="top" align="left" width="10%">Type</td>
								<td valign="top" align="left" width="10%">Qualified By</td>
								<td valign="top" align="left" width="10%">Trainer</td>
          						<td valign="top" align="left" width="10%">Attachments</td>
          						<td valign="top" align="left" width="15%">Actions</td>
          					</tr>
						
						
						<% int i=1; %>
							       	
							       	<c:if test="${fn:length(hRandTrainingForm.hRandTrainings) gt 0}">	
									<c:forEach items="${hRandTrainingForm.hRandTrainings}" var="hRandTrainings" varStatus="status">
							       		<% if(i==1)
							       			i=2;
							       			else
							       			i=1;%>
							       		<tr class="row<%=i%>" ">
								           	<td valign="top" align="left"  width="10%">
								           	<a href="list_hr?id=${hRandTrainings.id}">${hRandTrainings.id}</td>
											<td valign="top" align="left" width="10%">${hRandTrainings.name}</td>
											<td valign="top" align="left" width="10%">${hRandTrainings.type_of_training}</td>											
											<td valign="top" align="left" width="10%">${hRandTrainings.qualified_by}</td>											
											<td valign="top" align="left" width="10%">${hRandTrainings.trainer}</td>
											<c:choose>
											<c:when test="${hRandTrainings.attachment_name!='null'}">
											<td valign="top" align="left" width="10%"><a href="<c:out value="downloadhrfile?id=${hRandTrainings.id}"></c:out>">Download</a></td>
										</c:when>
										<c:otherwise><td valign="top" align="center" width="10%">No Document</td>
										</c:otherwise>
										</c:choose>		
										 <td valign="top" align="left" width="15%">
												
												
											<a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a><a href="<c:out value="edithr?id=${hRandTrainings.id}"/>" style="padding-right:10px;">Edit</a>
											<%-- <a href="#" title=""><img src="resources/images/icons/icon_delete.png" alt="Delete" /></a><a href="<c:out value="deletehr?id=${hRandTrainings.id}"/>" onclick="return confirmation()">Remove</a> --%>
											
											
											</td> 
										</tr>
										</c:forEach>
										</c:if>
										<c:if test="${fn:length(hRandTrainingForm.hRandTrainings) == 0}">
										<c:if test="${justcame ne false}">
										<tr class="row1">
							    	<td colspan="7" width="100%"><center><b style="color:red">No Records Found!!!</b></center></td>
							    		
							    	</tr></c:if>
							    	</c:if>
							    	
							    	
									</table>
					</div>
				</td>
			</tr>	
										 <tr><td colspan="6">  
	<div class="extrabottom">
             <ul class="pagination">
        
             <c:if test="${currentpage!=1&&currentpage!=null}">
             <li class="page_unselect"><a href="viewhrreport_page?page=${currentpage - 1}&trainer=${trainer}&type_of_training=${type}&qualified_by=${qualifiedby}" >Prev</a></li> 
               </c:if>
              
            <%--  <c:forEach var="count" begin="1" end="${noofrows}">  --%>
               <c:forEach begin="1" end="${noofpages}" var="i">
                <c:choose>
                    <c:when test="${currentpage eq i}">
                      <li class="page"><a class="paging_select"><c:out value="${i}"></c:out></a></li>
                     </c:when>
                    <c:otherwise>
                        <li class="page_unselect"><a href="viewhrreport_page?page=${i}&trainer=${trainer}&type_of_training=${type}&qualified_by=${qualifiedby}"><c:out value="${i}"></c:out></a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>          
            <c:if test="${currentpage!=noofpages}">
              <li class="page_unselect"><a href="viewhrreport_page?page=${currentpage+1}&trainer=${trainer}&type_of_training=${type}&qualified_by=${qualifiedby}">Next</a></li> 
                 </c:if>
              <c:choose>
              <c:when test="${button=='viewall'}">
                  <li class="page"><a href="viewallhrreport?&trainer=${trainer}&type_of_training=${type}&qualified_by=${qualifiedby}" class="paging_select">ViewAll</a></li>
             </c:when>
                <c:otherwise>
                  <li class="page"><a href="viewhr" class="paging_select">Back</a></li>
              </c:otherwise>
              </c:choose>					
		 
		  </ul>
		  </div>
		  </td>
		  </tr>
										
							    	
						    	</table>
						    	</div>
						    	</td>
						    	</tr>
						    	</table>
						    	</div>
						 
<script>
$(function() {

	$("#trainer").on("keypress", function(e) {
		
		if (e.which === 32 && !this.value.length)
	        e.preventDefault();
	});
	});
	</script>
  <script type="text/javascript">
function validatename(id){
	
    var textInput = document.getElementById(id).value;
    textInput = textInput.replace(/[^A-Za-z ]/g, "");
    document.getElementById(id).value = textInput;
}  
</script>
<script type="text/javascript">
function validation()
{
	var error ="";
  var type= document.getElementById('type').value;
  var trainer = document.getElementById('trainer').value;
  var qualified = document.getElementById('qualified').value;
  document.getElementById("trainererror").innerHTML="";
  document.getElementById("searcherror").innerHTML="";
  if(type == "" && trainer == "" && qualified == "")
	  {
	  document.getElementById("searcherror").innerHTML="Input is empty";
		 error="true";
	  }
  else
	 {
	   if(trainer.length > 0)
		{
		   if(trainer.length < 4  || trainer.length > 32)
			   {
			   document.getElementById("trainererror").innerHTML="Required field should be length of 4 to 32";
				 error="true";
			   }
		}   
	 }
  	if(error == "true")
  		{
  		
  		return false;
  		}
}

</script>
<script>
function confirmation(val) {
	var answer = confirm("Are you Sure You Want to Delete Participant ?")
	if (answer){
		return true;
	}
	else{
		
		return false;
		
	}
}
</script>

<script language="javascript">

function selectall(field)
{
	//field.getElementByTagName('checkbox');
	if(document.grid.checkall.checked==true)
	{
		for (i = 0; i < field.length; i++)
			field[i].checked = true ;
	}
	else
	{
		for(i = 0; i < field.length; i++)
			field[i].checked = false;
	}
}

function validate(fname)
{
// alert(fname);
var chks = document.getElementsByName('checkbox[]');

var hasChecked = false;
for (var i = 0; i < chks.length; i++)
{
if (chks[i].checked)
{
hasChecked = true;
break;
}
}
if (hasChecked == false)
{
alert("Please select at least one.");
return false;
}
return true;
}

function findpart()
{
// alert(document.getElementById("moblie").value);
// alert(document.getElementById("group").value);
// alert(document.getElementById("city").value);
window.location="?do=viewparticipants&moblie="+document.getElementById("moblie").value+"&group="+document.getElementById("group").value+"&city="+document.getElementById("city").value;
}
</script>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<jsp:include page="footer.jsp"></jsp:include>