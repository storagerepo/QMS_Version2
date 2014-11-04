<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="header.jsp"></jsp:include>

<script type="text/javascript" src="js/ajaxpaging.js"></script>

 
<script src="resources/js/jquery_checkbox.js" type="text/javascript"></script>
<div id="right_content">
	

       <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      		<tr>
      		<td>
      		 <div>

 			 <div id="ddtopmenubar1">
				<div class="menu_container">
					<div class="menu_c">
						  <ul class="horizmenu" >
						  	<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="#" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>" rel="document">
									<span>Add Set-up</span>
								</a>
							</li>
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="#" class="<c:choose>
									<c:when test="${menu=='document'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>"rel="document1">
									<span>List/Delete Set-up</span>
							</a>
							</li>
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="#" class="<c:choose>
									<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>" rel="deletedoc">
									<span>Delete</span>
							</a>
							</li>
							
				            
						</ul>  
						</div>
						
  <div class="clear"></div>
						<div>
						</div>						
					</div>					
				</div>
			</div>
			</td></tr>

			<c:if test="${success=='true'}">
			<tr>
				<td valign="top" align="left" style="padding: 5px 0 10px 200px;">&nbsp;
					<div id="success_statusbar" class="status success">
						<p class="closestatus">
						<img alt="Success" src="resources/images/icons/inserted.png">
						<a title="Close" href="formprefix_list">
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
						<a title="Close" href="formprefix_list">
						<img alt="Success" src="resources/images/icons/icon_square_close.png"></a>
						</p>
					</div></td>
			</tr>
		</c:if>
		<c:if test="${success=='delete'}">
			<tr>
				<td valign="top" align="left" style="padding: 5px 0 10px 200px;">&nbsp;
					<div id="success_statusbar" class="status success">
						<p class="closestatus">
						<img alt="Success" src="resources/images/icons/removed.png"/>
						<a title="Close" href="formprefix_list">
						<img alt="Success" src="resources/images/icons/icon_square_close.png"></a>
						</p>
					</div></td>
			</tr>
		</c:if>
      		<tr>
      		<tr><td>
		<form method="get" action="formprefix_list_search">
		<table>
		<tr><td width="1160" align="right" valign="middle">Form Prefix&nbsp;:&nbsp;&nbsp;&nbsp;<input type="text" value="${fprefix}" onkeypress="return onlyAlphabets(event,this);" onblur="ChangeCase(this)"  class="input_txtbx" name="dprefix">&nbsp;&nbsp;&nbsp;</td>
		<td><input type="submit" class="submit_btn1" value="search"></td></tr></table></td></tr></form>
      		<tr>
        		<td valign="top" align="left">
			        <div class="headings altheading">
			          <h2>Form Prefix List</h2>
			        </div>
			        <div class="contentbox">
	<!-- 	<form action="search_prefix" name="dashboard" method="GET">
<div style="border:#ccc 2px solid; padding:15px; margin-bottom:15px;">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr>
							    <td align="left" valign="middle" width="8%">ID:</td>
							    <td align="left" valign="middle" width="5%"><input type="text" name="equipment_id" class="input_txtbx2" id="equipment_id"></td>
							    <td align="left" valign="middle" width="30%">&nbsp;&nbsp;&nbsp;&nbsp;Form Name:</td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="equipment_name" class="input_txtbx2" id="equipment_name"></td>
							  	<td align="center" valign="middle" width="30%">
							  	<input type="submit" class="submit_btn1" value="Find" id="id_submit" name="search_maintenance"/></td>
							 	<td align="center" valign="middle" width="30%">
							  <input type="button" class="submit_btn1" name="clear" id="id_clear" value="clear">
							  </tr>
							</table>
						</div>
</form>
			   -->   
			      <form action="formprefix_list" method="POST"> 
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
				     <tr class="title">
							<td valign="top" align="left" width="20%">ID</td>
								<td valign="top" align="left" width="20%">Form Prefix</td>
							<td valign="top" align="left" width="20%">Description</td>						
							<td valign="top" align="left" width="20%">Actions</td>
							</tr>
							<c:if test="${fn:length(formFormPrefix.formPrefixs) gt 0}">
        				  <c:forEach items="${formFormPrefix.formPrefixs}" var="formprefix" varStatus="status">
        				       				<tr class="row1">
        				       				
        				       				
        				       				 <td valign="top" align="left"  width="10%"> ${formprefix.id}</td>
        				       				 <td valign="top" align="left" width="15%">${formprefix.form_prefix}</td>
        				       				 <td valign="top" align="left" width="15%">${formprefix.form_name}</td>
        				       				
        				       					<td valign="top" align="left">
												<a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a><a href="<c:out value="edit_formprefix?id=${formprefix.id}"/>" style="padding-right:10px;">Edit</a>
											<a href="#" title=""><img src="resources/images/icons/icon_delete.png" alt="Delete" /></a><a href="<c:out value="delete_formprefix?id=${formprefix.id}"/>" onclick="return confirmation()">Remove</a>
											</td>
        				       				 </tr>
        				       				 </c:forEach>
        				       				 </c:if>
        				       				
        				       				  <c:if test="${fn:length(formFormPrefix.formPrefixs) == 0}">	
							    	 <c:if test="${justcame=='false'}">
							    	<tr class="row1">
							    	<td colspan="7" width="100%"><center><span style="color:red;"><b>No Records Found!!!</b></span></center></td>
							    		
							    	</tr></c:if>
							    	</c:if> 
        				       				 </table>
        				       				
        				       				</form>
        				       				</div>
        				       				</td>
        				       				</tr>
        				       				<tr><td colspan="6">  
	<div class="extrabottom">
             <ul class="pagination">
        
             <c:if test="${currentpage!=1&&currentpage!=null}">
             <li class="page_unselect"><a href="viewprefixreport_page?page=${currentpage - 1}" >Prev</a></li> 
               </c:if>
              
             <%-- <c:forEach var="count" begin="1" end="${noofrows}"> --%> 
               <c:forEach begin="1" end="${noofpages}" var="i">
                <c:choose>
                    <c:when test="${currentpage eq i}">
                      <li class="page"><a class="paging_select"><c:out value="${i}"></c:out></a></li>
                     </c:when>
                    <c:otherwise>
                        <li class="page_unselect"><a href="viewprefixreport_page?page=${i}"><c:out value="${i}"></c:out></a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>          
            <c:if test="${currentpage!=noofpages}">
              <li class="page_unselect"><a href="viewprefixreport_page?page=${currentpage+1}">Next</a></li> 
                 </c:if>
              <c:choose>
              <c:when test="${button=='viewall'}">
                  <li class="page"><a href="viewallprefixreport" class="paging_select">ViewAll</a></li>
             </c:when>
                <c:otherwise>
                  <li class="page"><a href="formprefix_list" class="paging_select">Back</a></li>
              </c:otherwise>
              </c:choose>					
		 
		  </ul>
		  </div>
		  </td>
		  </tr>
		  <tr height="50"></tr>

        				       				
        				       				</table>
        				       				</div>
<script language="javascript">
function ChangeCase(elem)
{
    elem.value = elem.value.toUpperCase();
}
function onlyAlphabets(e, t) {
   try {
       if (window.event) {
           var charCode = window.event.keyCode;
       }
       else if (e) {
           var charCode = e.which;
       }
       else { return true; }
       if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123))
           return true
       else
           return false;
   }
   catch (err) {
       alert(err.Description);
   }
}

function confirmation() {
	var answer = confirm("Are you sure want to remove form prefix?")
	if (answer){
		return true;
	}
	else{
		return false;
	}
}


</script> 
        	 <br><br><br><br><br><br><br><br><br><br>	 <br><br><br><br><br><br><br><br><br><br> <br><br><br><br><br><br><br><br><br><br>
        	  <br><br><br><br><br><br><br><br>		       		
        				       		  <jsp:include page="footer.jsp"></jsp:include> 