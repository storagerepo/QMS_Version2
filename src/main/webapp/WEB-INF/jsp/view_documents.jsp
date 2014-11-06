<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="header.jsp"></jsp:include>
<script src="/QMS_App/resources/js/jquery.js"></script>
	<link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" />
<script src="resources/js/jquery.min.js"></script>
 <script src="resources/js/jquery-ui.js"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js" type="text/javascript"></script>
 <script type="text/javascript" src="js/ajaxpaging.js">
    <script type="text/javascript">  
        $(document).ready(function(){
            $("#report tr:odd").addClass("odd");
            $("#report tr:not(.odd)").hide();
            $("#report tr:first-child").show();
            
            $("#report tr.odd").click(function(){
                $(this).next("tr").toggle();
                $(this).find(".arrow").toggleClass("up");
            });
            //$("#report").jExpand();
        });
    </script>   


<div id="right_content">
	
    	<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
    	
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
								<c:when test="${menu=='document'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
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
      		<c:if test="${success=='true'}">
			<tr>
				<td valign="top" align="left" style="padding: 5px 0 10px 200px;">&nbsp;
					<div id="success_statusbar" class="status success">
						<p class="closestatus">
						<img alt="Success" src="resources/images/icons/inserted.png">
						<a title="Close" href="viewdocuments">
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
						<a title="Close" href="viewdocuments">
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
			          <h2>Search Documents Details</h2>
			        </div>
			        <div class="contentbox">
						<form action="findDocument" method="get">
						<div style="border:#ccc 2px solid; padding:15px; margin-bottom:15px;">
							
							
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr>
							    <td align="left" valign="middle" width="10%"> Document Type : </td>
							    <td align="left" valign="middle" width="10%"><select name="document_type" id="search_document_type" class="input_txtbx" >
              					<option value="">--Select--</option>
                				<c:forEach items="${documentTypeForm.documentTypes}" var="documenttype" varStatus="status">
        				       <option value="${documenttype.document_type}" <c:if test="${documenttype.document_type==documentMain}"><c:out value="selected"></c:out></c:if>>${documenttype.document_type}</option>
			                  </c:forEach> </select>
			                  <br><span id="searcherror" style="color:red"></span>
			                  
			                  <input type="hidden" id="document_id" value=""/>
			                  </td>
             					  <td align="left" valign="middle" width="15%">
							    <td align="left" valign="middle" width="10%">Process Area :</td>
							    <td align="left" valign="middle" width="10%">
							    <select name="search_process" id="search_process"  class="input_txtbx">
               					<option value="">--Select--</option>
              					 <c:forEach items="${processForm.processes}" var="processes" varStatus="true">
              					 <option value="${processes.process_name}" <c:if test="${processes.process_name==documentMain1}"><c:out value="selected"></c:out></c:if>>${processes.process_name}</option>
             				  </c:forEach>
               					</select>
               					<br><span id="processerror" style="color:red"></span>
               					</td>   
							    <td align="center" valign="middle" width="38%"><input type="submit" value="Search" class="submit_btn1" >
							    
							    </td>
<!-- 							    <td align="center" valign="middle" width="38%"><input type="reset" value="Clear" class="submit_btn1"></td>
 -->							 </tr>
							</table>
							
						</div></form>
						<form name="grid"  action="" method="POST" name="dashboard">
				        <table cellpadding="0" cellspacing="0" border="0" width="100%" id="report">
				        
				        
							<tr class="title">
								<!-- <td valign="center" align="left" width="5%"><input type="checkbox" onclick="selectall(this.form)" value="" name="checkall"></td> -->
         						<td valign="top" align="left" width="10%">Document&nbsp;ID</td>
					         	<td valign="top" align="left" width="15%">Document Title</td>
					         	<td valign="top" align="left" width="15%">Document Type</td>

          						<td valign="top" align="left" width="10%">Process</td>
          						<td valign="top" align="center" width="10%">Document</td>
          						<td valign="top" align="center" width="15%">External Documents</td>
          						<td valign="top" align="left" width="20%">Actions</td>
        					</tr>
						 <c:if test="${fn:length(documentMainForm.documentMains) gt 0}">	
						
						<% int i=1; %>
							       		
									<c:forEach items="${documentMainForm.documentMains}" var="documentMains" varStatus="status">
							       		<% if(i==1)
							       			i=2;
							       			else
							       			i=1;%>
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
											<td valign="top" align="left" width="25%">
											
											<a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a><a href="<c:out value="edit_document?auto_number=${documentMains.auto_number}"></c:out>" style="padding-right:20px;">Edit</a>
										    <a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a><a class="toggles-popup" style="color:#7A3A3A;" href="<c:out value="review_history_document?auto_number=${documentMains.auto_number}"/>" >View Revision History</a>
									</td>
									
									</tr>
									<br/><br/>
										<c:forEach items="${revisionDocumentForm.revisionDocuments}" var="revision" varStatus="status">
										<c:if test="${revision.auto_number == documentMains.auto_number}">
											<tr class="row2" style="color:#0000A0; font-style: inherit;">
										
											<td valign="top" align="left" width="10%">${revision.document_id}</td>
											<td valign="top" align="left" width="10%">${revision.issuer}</td>
											<td valign="top" align="left" width="10%">${revision.revision_level}</td>
											<td valign="top" align="left" width="10%">${revision.date}</td>
											<td valign="top" align="left" width="10%">${revision.approver1}</td>
											<td valign="top" align="left" width="10%">${revision.approver2}</td>
											<td valign="top" align="left" width="10%">${revision.approver3}</td>
											<td valign="top" align="left" width="10%">${revision.comments}</td>
											<td valign="top" align="left" width="10%">${revision.status}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<td valign="top" align="left" width="10%">${revision.revision_id}</td>
									
									
										</tr>
										</c:if>
										 </c:forEach>
										 </c:forEach>
										 </c:if>
										  <c:if test="${fn:length(documentMainForm.documentMains) == 0}">	
										  <c:if test="${justcame ne false }">
							    	<tr class="row1">
							    	<td colspan="7" width="100%"><center><span style="color:red;"><b>No Records Found!!!</b></span></center></td>
							    		
							    	</tr>
							    	</c:if>
							    	</c:if>		
						
										</table>
									   
									    
								
							    	
						<tr><td colspan="6">  
	<div class="extrabottom">
             <ul class="pagination">
        
             <c:if test="${currentpage!=1&&currentpage!=null}">
             <li class="page_unselect"><a href="viewdocumentreport_page?page=${currentpage - 1}&documenttype=${documentMain}&processarea=${documentMain1}" >Prev</a></li> 
               </c:if>
              
             <%-- <c:forEach var="count" begin="1" end="${noofrows}"> --%> 
             
               <c:forEach begin="1" end="${noofpages}" var="i">
                <c:choose>
                    <c:when test="${currentpage eq i}">
                      <li class="page"><a class="paging_select"><c:out value="${i}"></c:out></a></li>
                     </c:when>
                    <c:otherwise>
                   
                        <li class="page_unselect"><a href="viewdocumentreport_page?page=${i}&documenttype=${documentMain}&processarea=${documentMain1}"><c:out value="${i}"></c:out></a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>          
            <c:if test="${currentpage!=noofpages}">
              <li class="page_unselect"><a href="viewdocumentreport_page?page=${currentpage+1}&documenttype=${documentMain}&processarea=${documentMain1}">Next</a></li> 
                 </c:if>
              <c:choose>
              <c:when test="${button=='viewall'}">
                  <li class="page"><a href="viewalldocumentreport?&documenttype=${documentMain}&processarea=${documentMain1}" class="paging_select">ViewAll</a></li>
             </c:when>
                <c:otherwise>
                  <li class="page"><a href="viewdocuments" class="paging_select">Back</a></li>
              </c:otherwise>
              </c:choose>					
		 
		  </ul>
		  </div>
		  </td>
		  </tr>
		  </table>
		  </div>
		  <c:if test="${display == 'show'}">
		  <div class='popup'>
											<div class='cnt223'>
									<!-- 		<img src='http://www.developertips.net/demos/popup-dialog/img/x.png' alt='quit' class='x' id='x' />
						    		 -->		
						    				<table cellpadding="0" cellspacing="0" border="0" width="100%">
						    				<img src='resources/images/closebutton-md1.png' alt='quit' class='x' id='x' /><br>
						<tr  id="tabledisplay">
							<tr>
							
							<td><input type="hidden" name = "pop_id" id="popid" value="" /></td>
							</tr> 	
									<td valign="top" align="center" width="10%"><b>Doc Id</b></td>
									<td valign="top" align="center" width="10%"><b>Issuer</b></td>
									<td valign="top" align="center" width="10%"><b>RevisionLevel</b></td>
									<td valign="top" align="center" width="10%"><b>Date</b></td>
									<td valign="top" align="center" width="10%"><b>Approver1</b></td>
									<td valign="top" align="center" width="10%"><b>Approver2</b></td>
									<td valign="top" align="center" width="10%"><b>Approver3</b></td>
									<td valign="top" align="center" width="10%"><b>Comments</b></td>
									<td valign="top" align="center" width="10%"><b>Status</b></td>
									<td valign="top" align="center" width="10%"><b>Revision No</b></td>
									</tr>  			    	
										<c:forEach items="${revisionDocumentForm.revisionDocuments}" var="revision" varStatus="status">
<%-- 										<c:if test="${revision.auto_number == documentMains.auto_number}">
 --%>										<%-- <c:if test="${revision.auto_no == form.auto_number}"> --%>
									<%-- 	<c:if test="${display == 'show'}">	
									<script>
									
									
									document.getElementById('tabledisplay').style.display="block";
									
									
									
									</script>
									</c:if>--%>
									
									
										<tr class="row2" style="color:#0000A0; font-style: inherit;">
										
											<td valign="top" align="left" width="10%">${revision.document_id}</td>
											<td valign="top" align="left" width="10%">${revision.issuer}</td>
											<td valign="top" align="left" width="10%">${revision.revision_level}</td>
											<td valign="top" align="left" width="10%">${revision.date}</td>
											<td valign="top" align="left" width="10%">${revision.approver1}</td>
											<td valign="top" align="left" width="10%">${revision.approver2}</td>
											<td valign="top" align="left" width="10%">${revision.approver3}</td>
											<td valign="top" align="left" width="10%">${revision.comments}</td>
											<td valign="top" align="left" width="10%">${revision.status}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<td valign="top" align="left" width="10%">${revision.revision_id}</td>
									
									
										</tr>
									
										</c:forEach>
							</table>
							</div>
							</div>	
								</c:if>	
	
		  

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

<script type="text/javascript">


function confirmation(val) {
	var answer = confirm("Are you Sure You Want to Delete?");
	if (answer){
		window.location = "?do=deleteparticipant&id="+val;
	}
	else{
		
	}
}
</script>

<script type="text/javascript">
$(".toggles-popup").click(function(evt){
	
popupTop = $(this).closest("td")[0].getClientRects()[0].bottom;
var popid = document.getElementById('popid');
popid.value=popupTop;

});
</script>

<script type="text/javascript">
$(function(){
	
	/* $(".toggles-popup").click(function(evt){
		//evt.preventDefault();
		//var context = $(this);
		alert("toogle");
		 popupTop = $(this).closest("td")[0].getClientRects()[0].bottom;
		 document.getElementById("popid").value=popupTop;
		 var id = document.getElementById("popid");
		 id.value = popupTop;
		 alert(id.value);
		 alert("popupvalue"+popupTop);
		var popup = $(".popup");
		$(".cnt223", popup).css({top: popupTop});
		popup.show();
		alert("show");
	});
	 */
	
	$(".popup .close, .popup .x").click(function(evt){
		
		evt.preventDefault();
		$(this).closest(".popup").hide();
	});
});

function popupwindow()
{
//	alert("fsdf");

	//self.setInterval(winClose,20000);
//alert("pop-up");
//var overlay = $('<div id="overlay"></div>');
//overlay.show();
//overlay.appendTo(document.body);
//$('.popup').show();
//alert("sfjhsdfhg");
}

$('.popup').show();

// you shouldn't be rebinding the same event if you're reusing your popup window because each handler will execute as many times as many times
// you'll show your popup.
$('.close, .x').click(function(){
	$('.popup').hide();
	
	return false;
});

/*$('.x').click(function(){
	$('.popup').hide();
	
	return false;
});*/



</script>
  <script type="text/javascript">
          
  function pop_up()
  {
  	var url="review_history_document?auto_no=${documentMains.auto_no}";
  	popupWindow = window.open(url,"shoulderpopUpWindow" ,'width=1500,height=700,resizable=yes,scrollbars=yes,toolbar=yes,menubar=no,location=no,directories=no,status=yes')
  }
 


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

</script>
<script type="text/javascript">


        $(function () {
			//alert("good");
			$("a[data-bind-action='toggle-content']").click(toggleContent);
			function toggleContent(){
	  	    	
	  	   var proceee_name = '';

	 // $('#autonumber1 tr').each(function() {
		
		 
	   //   $.each(this.cells, function(){
	/*   alert($(this).html()); */
	    	  if (proceee_name == '') {
			   var $td= $(this).closest('tr').children('td');  
			     
			     
			      proceee_name= $td.eq(0).text();  
			     
			  
			     }
			     else{
			    	
			      proceee_name = proceee_name + ',' + $(this).find("td").html();
			     }
			     
			   
	$.ajax({
		
		type : "POST",
		url : "/QMS_App/ajax_getrevisionsdoc",
		data : "auto_number=" + proceee_name,
		success : function(response) {
              
             // alert("response= "+response);
              
	       $('#process_owner_id').html(response);
      	    			},
		error : function(e) {
			alert('Error: ' + e);
		}
	});
	
	
	
			}
});


</script>
<script type="text/javascript">
function findpart()
{
// alert(document.getElementById("moblie").value);
// alert(document.getElementById("group").value);
// alert(document.getElementById("city").value);
window.location="?do=viewparticipants&moblie="+document.getElementById("moblie").value+"&group="+document.getElementById("group").value+"&city="+document.getElementById("city").value;
}



function subhide()

{
	document.getElementById('subrow').style.display="block";
}

</script>
<script type="text/javascript">
var error="";
function validation()
{
	var search_document_type = document.getElementById('search_document_type').value;
	var search_process = document.getElementById('search_process').value;
	if(search_document_type == "")
	{
		document.getElementById('searcherror').innerHTML = "Required field should not be empty";
		error="true";
	}
	else
	{
		document.getElementById('searcherror').innerHTML ="";
	}
	if(search_process == ""){
		document.getElementById('processerror').innerHTML = "Required field should not be empty";
		error="true";
	}
	else
	{
		document.getElementById('processerror').innerHTML ="";
	}
	if(error=="true"){
		return false;
	}
}

</script>

<jsp:include page="footer.jsp"></jsp:include>