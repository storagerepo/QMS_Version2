<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="header.jsp"></jsp:include>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="js/ajaxpaging.js"></script>
<script src="resources/js/jquery_checkbox.js" type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product ID Details</title>
</head>
<body>
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
								<a href="" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>" rel="noncon">
									<span>Add Set-up</span>
								</a>
							</li>
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="" class="<c:choose>
								<c:when test="${menu=='nonconformance'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>"rel="noncon1">
									<span>View/Delete Set-up</span>
								</a>
							</li>
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="nonconformancedelete" class="<c:choose>
									<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
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
						<a title="Close" href="productidNC_list">
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
						<a title="Close" href="productidNC_list">
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
						<a title="Close" href="productidNC_list">
						<img alt="Success" src="resources/images/icons/icon_square_close.png"></a>
						</p>
					</div></td>
			</tr>
		</c:if>
		<tr><td>
		<form method="get" action="productidNC_list_search">
		<table>
		<tr><td width="1160" align="right" valign="middle">Product ID&nbsp;:&nbsp;&nbsp;&nbsp;<input type="text" value="${pid}" class="input_txtbx" onkeypress="return onlyAlphabets(event,this);" name="pid">&nbsp;&nbsp;&nbsp;</td>
		<td><input type="submit" class="submit_btn1" value="search"></td></tr></table></td></tr></form>
      	
      		<tr>
        		<td valign="top" align="left">
			        <div class="headings altheading">
			          <h2>Product ID List</h2>
			        </div>
			        <div class="contentbox">
	 
			      <form> 
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
				     <tr class="title">
							<td valign="top" align="left" width="20%">Product SNO</td>
							<td valign="top" align="left" width="20%">Product ID</td>
							<td valign="top" align="left" width="20%">Actions</td>
							</tr>
							<c:if test="${fn:length(productId_NC_Form.productIDNCs) gt 0}">
        				  <c:forEach items="${productId_NC_Form.productIDNCs}" var="products" varStatus="status">
        				       				<tr class="row1">
        				       				
        				       				
        				       				 <td valign="top" align="left"  width="10%">
        				       				
        				       				  ${products.auto_id}</td>
        				       				 <td valign="top" align="left" width="15%">${products.productid_nc}</td>
        				       				<td valign="top" align="left">
												<a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a><a href="<c:out value="edit_productidnc?auto_id=${products.auto_id}"/>" style="padding-right:10px;">Edit</a>
											<a href="#" title=""><img src="resources/images/icons/icon_delete.png" alt="Delete" /></a><a href="<c:out value="delete_productidnc?auto_id=${products.auto_id}"/>" onclick="return confirmation()">Remove</a>
											</td>
        				       				 </tr>
        				       				 </c:forEach>
        				       				 </c:if>
        				       				  </table>
        				       				</form>
       <c:if test="${fn:length(productId_NC_Form.productIDNCs) == 0}">	
							    	<c:if test="${justcame=='false'}">
							    	<tr class="row1">
							    	<td colspan="7" width="100%"><center><b style="color:red">No Records Found!!!</b></center></td>
							    	</tr>
							    	</c:if>
							    	</c:if> <!--   				       				
      <br><br><br><br><br>         
 -->

 
        				       				</div>
        				       				</td>
        				       				</tr>
        				       				<tr><td colspan="6">  
	<div class="extrabottom">
             <ul class="pagination">
        
             <c:if test="${currentpage!=1&&currentpage!=null}">
             <li class="page_unselect"><a href="viewproductidreport_page?page=${currentpage - 1}" >Prev</a></li> 
               </c:if>
              
            
               <c:forEach begin="1" end="${noofpages}" var="i">
                <c:choose>
                    <c:when test="${currentpage eq i}">
                      <li class="page"><a class="paging_select"><c:out value="${i}"></c:out></a></li>
                     </c:when>
                    <c:otherwise>
                        <li class="page_unselect"><a href="viewproductidreport_page?page=${i}"><c:out value="${i}"></c:out></a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>                   
            <c:if test="${currentpage!=noofpages}">
              <li class="page_unselect"><a href="viewproductidreport_page?page=${currentpage+1}">Next</a></li> 
                 </c:if>
              <c:choose>
              <c:when test="${button=='viewall'}">
                  <li class="page"><a href="viewallproductidreport" class="paging_select">ViewAll</a></li>
             </c:when>
                <c:otherwise>
                  <li class="page"><a href="producridNC_list" class="paging_select">Back</a></li>
              </c:otherwise>
              </c:choose>					
		 
		  </ul>
		  </div>
		  </td>
		  </tr><tr height="300"></tr>

        				       				
        				       				</table>
        				       				</div>
<jsp:include page="footer.jsp"></jsp:include>     
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
       if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123)|| (charCode==32))
           return true
       else
           return false;
   }
   catch (err) {
       alert(err.Description);
   }
}

function confirmation() {
	var answer = confirm("Are you sure want to remove product id?")
	if (answer){
		return true;
	}
	else{
		return false;
	}
}


</script> 
</body>
</html>