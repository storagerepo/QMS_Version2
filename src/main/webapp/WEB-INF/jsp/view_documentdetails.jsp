<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="header.jsp"></jsp:include>
<script src="/QMS_App/resources/js/jquery.js"></script>
	<link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" />
<script src="resources/js/jquery.min.js"></script>
 <script src="resources/js/jquery-ui.js"></script>

    <title></title>
    
    
<div id="right_content">

	
		<table cellpadding="0" cellspacing="0" border="0" width="98%"
			class="margin_table">
<tr>
<td>
<div>
  <ul class="horizmenu">
						
	<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="adddocument" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									Add Document
									
								</a>
							</li>
												
                <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
                <a href="view_documentdetails" class="<c:choose>
                <c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
                  <span>View Revisions</span>
                </a>
              </li>
				          <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="viewdocuments" class="<c:choose>
								<c:when test="${menu=='document'}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									View Document
									
								</a>
							</li>
				            <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="document_report" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									Document report
									
								</a>
							</li>
						
							
							</ul>
  </div>
</td>
</tr>

			
		
			<tr>
				<td valign="top" align="left"><div>
						<div class="headings altheading">
							<h2>View Document Details</h2>
						</div>
						 <div class="contentbox">
						

					<form >
					
							<table cellpadding="0" cellspacing="0" border="0" width="100%" id="report">
								<tr class="title">
								
									<td valign="top" align="left" width="10%">Document&nbsp;ID</td>
					         	<td valign="top" align="left" width="15%">Document Title</td>
					         	<td valign="top" align="left" width="15%">Document Type</td>

          						<td valign="top" align="left" width="10%">Process</td>
          						<td valign="top" align="center" width="10%">Document</td>
          						<td valign="top" align="center" width="15%">External Documents</td>
									
									</tr>

								
 						 <c:if test="${fn:length(documentMainForm.documentMains) gt 0}">	
								
								<% int i=1; %>
							       		
								<c:forEach items="${documentMainForm.documentMains}" var="documentMains" varStatus="status">
									
							       		<% if(i==1)
							       			i=2;
							       			else
							       			i=1;%>
							       			<table cellpadding="0" cellspacing="0" border="0" width="100%">
							       			<tr class="row<%=i%>" ">
								           	<td valign="top" align="left"  width="10%"><a href="list_documents?id=${documentMains.document_id}">${documentMains.document_id}</a></td>
											<td valign="top" align="left" width="10%">${documentMains.document_title}</td>
											<td valign="top" align="left" width="10%">${documentMains.document_type}</td>
											<td valign="top" align="left" width="10%">${documentMains.process}</td>
											
											<c:choose>
											<c:when test="${documentMains.media_type=='electronic'}">
											<td valign="top" align="center" width="10%"><a href="<c:out value="downloadMaindoc?id=${documentMains.document_id}"></c:out>">Download</a></td>
										</c:when>
										<c:when test="${documentMains.media_type=='hardcopy'}">
										<td valign="top" align="center" width="10%">Hard Copy </td>
										</c:when>
										<c:otherwise>
										<td valign="top" align="center" width="10%"><a href="<c:out value="downloadMaindoc?id=${documentMains.document_id}"></c:out>">Download</a>&nbsp;<label>and</</label>&nbsp;<label>Hard Copy </label></td>
										</c:otherwise>
										</c:choose>	
											<td valign="top" align="center" width="15%">
											<c:choose>
											<c:when test="${documentMains.external=='Yes'}">
											<c:out value="Yes"></c:out>
											</c:when>	
											<c:otherwise>
											<c:out value="No"></c:out>
											</c:otherwise>							
											</c:choose>
											</td>
											
									
									</tr>
									
						    	
										
										
										</table>
										
									
						    	
						    								    	</c:forEach>
							    	
						    	
										</c:if>
						    			 <%-- <c:if test="${fn:length(formForm.form) == 0}">	
							    	<c:if test="${justcame ne false}">
							    	<tr class="row1">
							    	<td colspan="7" width="100%"><span style="color:red;"><center><b>No Records Found!!!</b></center></span></td>
							    		</c:if>
							    	</tr>
							    	</c:if>		 --%>
						
							    	
						    	
								</table>
							
								
	<tr>	<td colspan="6">  
	<div class="extrabottom">
             <ul class="pagination">
        
             <c:if test="${currentpage!=1&&currentpage!=null}">
             <li class="page_unselect"><a href="view_documentdetails_page?page=${currentpage - 1}" >Prev</a></li> 
               </c:if>
              
             <%-- <c:forEach var="count" begin="1" end="${noofrows}"> --%> 
               <c:forEach begin="1" end="${noofpages}" var="i">
                <c:choose>
                    <c:when test="${currentpage eq i}">
                      <li class="page"><a class="paging_select"><c:out value="${i}"></c:out></a></li>
                     </c:when>
                    <c:otherwise>
                        <li class="page_unselect"><a href="view_documentdetails_page?page=${i}"><c:out value="${i}"></c:out></a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>          
            <c:if test="${currentpage!=noofpages}">
              <li class="page_unselect"><a href="view_documentdetails_page?page=${currentpage+1}">Next</a></li> 
                 </c:if>
              <c:choose>
              <c:when test="${button=='viewall'}">
                  <li class="page"><a href="viewalldocuments" class="paging_select">ViewAll</a></li>
             </c:when>
                <c:otherwise>
                  <li class="page"><a href="viewalldocuments" class="paging_select">Back</a></li>
              </c:otherwise>
              </c:choose>							
		 
		  </ul>
		  </div>
		  </td>
		  </tr>				</table></div>
		  
		 <c:if test="${display == 'show'}">
		  <div class='popup'>
											<div class='cnt223'>
									<!-- 		<img src='http://www.developertips.net/demos/popup-dialog/img/x.png' alt='quit' class='x' id='x' />
						    		 -->		<img src='resources/images/closebutton-md1.png' alt='quit' class='x' id='x' />
						    				
						    				<table cellpadding="0" cellspacing="0" border="0" width="100%">
						    					<tr id="tabledisplay">
									
									<td valign="top" align="center" width="10%"><b>Form/Rec ID</b></td>
									<td valign="top" align="center" width="10%"><b>Effective Date</b></td>
									<td valign="top" align="center" width="10%"><b>Approver1</b></td>
									<td valign="top" align="center" width="10%"><b>Issuer</b></td>
									<td valign="top" align="center" width="10%"><b>Comments</b></td>
									<td valign="top" align="center" width="10%"><b>Revision No</b></td>
									</tr>  			    	
						    			<c:forEach items="${revisionForms.revisionForms}" var="revision" varStatus="status">
										<%--  <c:if test="${revision.auto_no == form.auto_number}">
										 <td valign="top" align="left" width="10%"style="display:none"><input type="hidden" name="auto_no" id="autono" value="${revision.auto_no}"/>
									        ${revision.auto_no}</td>
										  <td valign="top" align="left" width="10%"style="display:none"><input type="hidden" name="auto_no" id="autonu" value="${form.auto_number}"/>
									        ${form.auto_number}</td>
										 </c:if> --%>
									<%-- 	<c:if test="${display == 'show'}">	
									<script>
									
									document.getElementById('tabledisplay').style.display="block";
									
									
									</script>
									</c:if>--%>
									
									
										<tr  class="row2" style="color:#0000A0; font-style: inherit;" cellspacing="30%" cellpadding="40%">
										
										 	
										 	<td valign="top" align="center" width="10%"> ${revision.document_id}</td>
											<td valign="top" align="center" width="10%">${revision.effective_date}</td>
											<td valign="top" align="center" width="10%">${revision.approver1}</td>
											<td valign="top" align="center" width="10%">${revision.issuer}</td>
											<td valign="top" align="center" width="10%">${revision.comments}</td>
											<td valign="top" align="center" width="10%">${revision.revision_id}</td>
									
										</tr>
									
										</c:forEach>
							</table>
							</div>
							</div>	
								</c:if>	
	 
	
	 <!--  <script type="text/javascript">
	<!--  <script type="text/javascript">
	    
	  $(function() {
		
		  var list = $('#process_owner_id').val();
		  alert(list);
		  
		  
		  
	});
	  </script> -->
	 
<style type="text/css">
#overlay {
position: fixed;
top: 0;
left: 0;
width: 100%;
height: 100%;
background: none;
filter: alpha(opacity=0);
-moz-opacity:0;
opacity:0;
z-index: 1001;
display: block;
border:5px solid #3366cc;
}
.cnt223 a{
text-decoration: none;
}

.popup{
background:#ccc;
/* left:220px;
top:290px; */
left:0%;
top:/*15%;*/0;
opacity:0.93;
width: 100%;
height: 100%;
margin: 0 auto;
display: none;
position: fixed;
z-index: 101;
overflow-y:scroll;
}
.cnt223{
min-width: 400px;
width: 65%;
min-height: 150px;
margin:/*100px auto;*/0 auto;
background: #fff;
border:2px solid #000;
box-shadow:inset 0px 20px 25px #ccc;
position: relative;
z-index: 103;
padding: 10px;
border-radius: 5px;
opacity: 1;
top: 100px;
}
.cnt223 p{
clear: both;
color: #555555;
text-align: justify;
}
.cnt223 p a{
color: #d91900;
font-weight: bold;
}
.cnt223 .x{
float: right;
height: 15px;
left: 10px;
position: relative;
top: -25px;
width: 15px;
}
.cnt223 .x:hover{
cursor: pointer;
}
</style>


<script>
/*  <style type="text/css">
#overlay {
position: fixed;
top: 0;
left: 0;
width: 100%;
height: 100%;
background-color: #000;
filter:alpha(opacity=70);
-moz-opacity:0.7;
-khtml-opacity: 0.7;
opacity: 0.7;
z-index: 100;
display: none;
}
.cnt223 a{
text-decoration: none;
}
.popup{
// background:red;
left:30px;
width: 1100px;
margin: 0 auto;
display: none;
position: fixed;
z-index: 101;
}
.cnt223{
min-width: 400px;
width: 60%;
min-height: 150px;
margin:150px auto;
background: #fff;
border:2px solid #ccc;
box-shadow:inset 0px 20px 25px #ccc;
position: relative;
z-index: 103;
padding: 10px;
border-radius: 5px;

}
.cnt223 p{
clear: both;
color: #555555;
text-align: justify;
}
.cnt223 p a{
color: #d91900;
font-weight: bold;
}
.cnt223 .x{
float: right;
height: 15px;
left: 10px;
position: relative;
top: -25px;
width: 15px;
}
.cnt223 .x:hover{
cursor: pointer;
}
</style> -->
 *//* <script type='text/javascript'>
 *//* 
$(function(){
	$("a[data-bind-action='toggle-content']").click(toggleContent);
	function toggleContent(){

$('element_to_pop_up').bPopup({
    contentContainer:'.content',
    loadUrl: 'review_history_form?auto_no=${form.auto_no}' //Uses jQuery.load()
});
	}
}); */
/* $(function(){
	$("a[data-bind-action='toggle-content']").click(toggleContent);
	function toggleContent(){ */
		function popupwindow()
	{
	//	alert("fsdf");
	var element = document.getElementById('autonu').value;
	var element1 = document.getElementById('autono').value;
	alert(element);
	alert(element1);
		self.setInterval("winClose()",20000);
	//alert("pop-up");
var overlay = $('<div id="overlay"></div>');
overlay.show();
overlay.appendTo(document.body);
//$('.popup').show();
//alert("sfjhsdfhg");
	}
	
	$('.popup').show();

$('.close').click(function(){
$('.popup').hide();

return false;
});

$('.x').click(function(){
$('.popup').hide();

return false;
});



</script>
	  <script type="text/javascript">
	          
	  function pop_up()
	  {
	  	var url="review_history_form?auto_no=${form.auto_no}";
	  	popupWindow = window.open(url,"shoulderpopUpWindow" ,'width=1500,height=700,resizable=yes,scrollbars=yes,toolbar=yes,menubar=no,location=no,directories=no,status=yes')
	  }
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
     </script>
						
<script>

function confirmation(val) {
	var answer = confirm("Are you Sure You Want to Form ?");
	if (answer){
		window.location = "?do=deleteparticipant&id="+val;
	}
	else{
		
	}
}
function subhide()

{
	document.getElementById('subrow').style.display="block";
}

</script>
<table height="90%">
			<tr height=90%;><td></td></tr></table>
 <jsp:include page="footer.jsp"></jsp:include> 