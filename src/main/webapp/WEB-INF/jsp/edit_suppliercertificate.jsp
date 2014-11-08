<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="header.jsp"></jsp:include>
<script src="resources/js/jquery.min.js"></script>
 <script src="resources/js/jquery-ui.js"></script>
 <link rel="stylesheet" href="resources/css/jquery-ui.css"	type="text/css" />
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Supplier Certified To</title>
</head>
<body>
<form method="post" action="update_suppliercertificate">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
        <td>
        <div>
  <ul class="horizmenu">
						
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="#" class="<c:choose>
								<c:when test="${menu=='supplier'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>" rel="supplier11">
									<span>Add Set-up</span>
								</a>
							</li>
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="#" class="<c:choose>
									<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>"rel="supplier1">
									<span>List/Delete Set-up</span>
							</a>
							</li>
							
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="supplierperformancedelete" class="<c:choose>
								<c:when test="${menu=='supplier'}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									Delete Supplier Performance
								</a>
							</li>
							
							
				          
							</ul>
  </div>
        </td>
      </tr>
      <tr>
        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2 style="padding-left: 65px">Update Supplier Certified To</h2>
            </div>  <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
               <c:set value="${Certified_toform.certified_to[0]}" var="certified_to"> </c:set>
             
              <tr>
			<td align="left" valign="top" width="50%" style="padding-right: 25px;">
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
			<tr>
			<td align="left" valign="top" width="50%" style="padding-right: 25px;">
			<table cellpadding="0" cellspacing="0" border="0">
               <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" style="padding-left: 55px">Certified To :</td>
                  <td> <input type="text" class="input_txtbx" name="certified_to" value="${certified_to.certified_to}" id="certified_to" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"/>
                   <br> <span id="certified_toerror" style="color:red">       </span>                    
               </td>
                </tr>
              <%--   <tr class="row2">
                
                     <td valign="middle" align="left" class="input_txt" style="padding-left: 55px">Certified To :</td>
                  <td valign="top" align="left" class="input_txt" >
                    <input type="text" class="input_txtbx" name="certified_to" value="${certified_to.certified_to}" id="certified_to" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"/>
                    <font color="Red"><span id="certified_toerror"></span></font>
                  
                  
                  <input type="hidden" name="id" id="id" value="${certified_to.id}"/>
                  </td>
                </tr> --%>
                <tr height="10"></tr>
                 <tr class="row1">
                  <td valign="top" align="right">&nbsp;</td>
                  <td valign="top" align="left"><input type="submit" value="Update" onclick="return validation();"class="submit_btn1"></td>
                </tr>
             </table>
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
            <script>
  $(function() {
	$("#certified_to").on("keypress", function(e) {
		if (e.which === 32 && !this.value.length)
	        e.preventDefault();
	});
	});	

</script>
 
<script>
    function validation()
    {
      // alert("calling");
        var error="";
     
      document.getElementById("certified_toerror").innerHTML="";
     

       if(document.getElementById("certified_to").value=="")
      {
        //alert("hai");
         document.getElementById("certified_toerror").innerHTML="Required field should not be empty";
         error=true; 
      } 
       if(document.getElementById("certified_to").value!="")
       {
         if(document.getElementById("certified_to").value.length < 4 || document.getElementById("certified_to").value.length > 200){
                    document.getElementById("certified_toerror").innerHTML="Required field should be length of 4 to 200";
                    error=true; 
                }
       }   
      
       if(error==true)
       {

         return false;
       }

      

    }

    </script>
    
</body>
</html>