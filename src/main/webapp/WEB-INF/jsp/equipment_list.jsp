<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" />

<script src="resources/js/jquery.min.js"></script>
 <script src="resources/js/jquery-ui.js"></script>

<script src="resources/js/jquery-1.7.2.min.js"></script>
<script src="resources/js/jquery-ui.js"></script>
<script src="resources/js/modal.js"></script>
<jsp:include page="header.jsp"></jsp:include>

<script type="text/javascript" src="js/ajaxpaging.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="resources/js/jquery_checkbox.js" type="text/javascript"></script>
<div id="right_content">
	
    	<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      		<tr>
      		<td>
      		 <div>
  <ul class="horizmenu" >
						
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="add_maintenance" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Enter/Modify Equipment</span>
									
								</a>
							</li>
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="equipment_list" class="<c:choose>
								<c:when test="${menu=='maintenance'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									<span>View Equipments</span>
								</a>
							</li>
						<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="maintenance_list" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>View Maintenance & Calibration</span>
								</a>
							</li>
							
				           <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="maintenance_report" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Reports</span>
								</a>
							</li>
							</ul>
  </div>
      		</td>
      		</tr>
			
      		<tr>
        		<td valign="top" align="left">
			        <div class="headings altheading">
			          <h2>View Equipment Details</h2>
			        </div>
			        <div class="contentbox">

			    
			      <form action="maintenance_list" method="POST"> 
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
				     <tr class="title">
							<td valign="top" align="left" width="25%">Equipment Id</td>
							<td valign="top" align="left" width="25%">Equipment Name</td>
							<td valign="top" align="left" width="25%">Equipment Model</td>
							<td valign="top" align="left" width="25%">Acquired Date </td>
							
							</tr>
							<c:if test="${fn:length(maintenanceForm.maintenance) gt 0}">
        				  <c:forEach items="${maintenanceForm.maintenance}" var="maintenance" varStatus="status">
        				       				<tr class="row1">
        				       				
        				       				
        				       				 <td valign="top" align="left"  width="10%"> <a href="view_maintenance?equipment_id=${maintenance.equipment_id}">${maintenance.equipment_id}</a></td>
        				       				 <td valign="top" align="left" width="15%">${maintenance.equipment_name}</td>
        				       				 <td valign="top" align="left" width="15%">${maintenance.equipment_model}</td>
        				       				 <td valign="top" align="left" width="15%">${maintenance.date_acquired}</td>
        				       					<td valign="top" align="left">
											 </td>
        				       				 </tr>
        				       				 </c:forEach>
        				       				 </c:if>
        				       				  <c:if test="${fn:length(maintenanceForm.maintenance) == 0}">	
							    	<c:if test="${justcame ne false }">
							    	<tr class="row1">
							    	<td colspan="7" style="color:red" width="100%"><center><b>No Records Found!!!</b></center></td>
							    		
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
             <li class="page_unselect"><a href="viewequipmentreport_page?page=${currentpage - 1}">Prev</a></li> 
               </c:if>
             
               <c:forEach begin="1" end="${noofpages}" var="i">
                <c:choose>
                    <c:when test="${currentpage eq i}">
                      <li class="page"><a class="paging_select"><c:out value="${i}"></c:out></a></li>
                     </c:when>
                    <c:otherwise>
                        <li class="page_unselect"><a href="viewequipmentreport_page?page=${i}"><c:out value="${i}"></c:out></a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>          
            <c:if test="${currentpage!=noofpages}">
              <li class="page_unselect"><a href="viewequipmentreport_page?page=${currentpage+1}">Next</a></li> 
                 </c:if>
              <c:choose>
              <c:when test="${button=='viewall'}">
                  <li class="page"><a href="viewallequipmentreport" class="paging_select">ViewAll</a></li>
             </c:when>
                <c:otherwise>
                  <li class="page"><a href="equipment_list" class="paging_select">Back</a></li>
              </c:otherwise>
              </c:choose>					
		 
		  </ul>
		  </div>
		  </td>
		  </tr>

        				       				
        				       				</table>
        				       				</div>
        				       				
        				  
<script language="javascript">

function confirmation() {
	var answer = confirm("Are you Sure You Want to Delete  Maintenance & Calibration Form ?")
	if (answer){
		return true;
	}
	else{
		return false;
	}
}


</script>  
<script>
$(function() {
	$("#equipment_id").on("keypress", function(e) {
	
	if (e.which === 32 && !this.value.length)
        e.preventDefault();
});
});
$(function() {
	$("#equipment_name").on("keypress", function(e) {
	
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

function validatename2(id){
	
    var textInput = document.getElementById(id).value;
    textInput = textInput.replace(/[^A-Za-z0-9 ]/g, "");
    document.getElementById(id).value = textInput;
}  


function Alphabets(e, t) {
    try {
        if (window.event) {
            var charCode = window.event.keyCode;
        }
        else if (e) {
            var charCode = e.which;
        }
        else { return true; }
        if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123)|| (charCode == 32))
            return true;
        else
            return false;
    }
    catch (err) {
        alert(err.Description);
    }
}

function AlphabetsNumber(e, t) {
    try {
        if (window.event) {
            var charCode = window.event.keyCode;
        }
        else if (e) {
            var charCode = e.which;
        }
        else { return true; }
        if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123)|| (charCode >47 && charCode < 58))
            return true;
        else
            return false;
    }
    catch (err) {
        alert(err.Description);
    }
}
function AlphabetsNumberSpace(e, t) {
    try {
        if (window.event) {
            var charCode = window.event.keyCode;
        }
        else if (e) {
            var charCode = e.which;
        }
        else { return true; }
        if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123)|| (charCode >47 && charCode < 58) ||(charCode == 32))
            return true;
        else
            return false;
    }
    catch (err) {
        alert(err.Description);
    }
}
</script>
  <script type="text/javascript">
  function validatefind()
  {
	  var error = "";
	  var equipment_id = document.getElementById('equipment_id').value;
	  var equipment_name  = document.getElementById('equipment_name').value;
	
	  if(equipment_id =="" && equipment_name == "" )
		  {
		  document.getElementById("searcherror").innerHTML="Input Empty";
			error="true";
		  }
	 
	  else if(equipment_id.length > 0)
		  {
		
		  if((equipment_id.length < 4) || (equipment_id.length > 32))
			  {
			  document.getElementById("searcherror1").innerHTML="Required field should be length of 4 to 32";
				error="true";
			  }
		  else{
			  document.getElementById("searcherror1").innerHTML="";
		 	 }
		  }
	  else if(equipment_name.length > 0)
	  {
	  if((equipment_name.length < 4) || (equipment_name.length > 32))
		  {
		  document.getElementById("searcherror2").innerHTML="Required field should be length of 4 to 32";
			error="true";
		  }
	  else{
		  document.getElementById("searcherror2").innerHTML="";
	 	 }
	  }
	  else
		  {
		  document.getElementById("searcherror").innerHTML="";
		  }
	  
	  if(error == "true")
		  {
		  return false;
		  }
  }
  
  function ChangeCase(elem)
  {
      elem.value = elem.value.toUpperCase();
  }
  </script>
<script>
   $(function() {
		 var format="yy-mm-dd";
	           $( "#datepicker" ).datepicker();
	           
	         });
   </script>  				
   <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<jsp:include page="footer.jsp"></jsp:include>			