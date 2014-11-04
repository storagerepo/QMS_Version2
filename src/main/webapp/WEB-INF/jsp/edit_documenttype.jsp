<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="header.jsp"></jsp:include>
<script src="resources/js/jquery.min.js"></script>
 <script src="resources/js/jquery-ui.js"></script>
 <link rel="stylesheet" href="resources/css/jquery-ui.css"
	type="text/css" />
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Document Type</title>
</head>
<body>
<form method="post" action="update_documenttype">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
        <td>
        <div>
  <ul class="horizmenu">
						
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="add_documenttype" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span >Add DocumentType</span>
									
								</a>
							</li>
						<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="documenttype_list" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									<span >View DocumentType</span>
								</a>
							</li>
				          
							</ul>
  </div>
        </td>
      </tr>
      <tr>
        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2 style="padding-left: 65px">Update Document Type</h2>
            </div>  <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
               <c:set value="${documentTypeForm.documentTypes[0]}" var="documenttype"> </c:set>
             
              <tr>
			<td align="left" valign="top" width="50%" style="padding-right: 25px;">
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr class="row2">
                
                  <td valign="top" align="left" class="input_txt" width="30%" style="padding-left: 70px">Document Type&nbsp;:</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" maxlength="32" name="document_type" class="input_txtbx" id="documenttype" onblur="toggle(this.value)"onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${documenttype.document_type}"onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}" onkeypress="return onlyAlphabets(event,this);"	/>
                  <br>  <span id="documenttype1" style="color:red">
                   <c:if test="${success=='exist'}">Document type already exist</c:if></span>
                  
                  <span class="err"><form:errors path="DocumentType.document_type"></form:errors></span>
                  <input type="hidden" name="id" id="id" value="${documenttype.id}"/>
                  </td>
                </tr>
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
             <script type="text/javascript">
             $(function() {
         		$("#documenttype").on("keypress", function(e) {
         			if (e.which === 32 && !this.value.length)
         		        e.preventDefault();
         		});
         		});
             function validateAlpha4(){
         	    var textInput = document.getElementById("documenttype").value;
         	    textInput = textInput.replace(/[^A-Za-z ]/g, "");
         	    document.getElementById("documenttype").value = textInput;
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
            	        if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123)|| (charCode==32)|| (charCode > 47 && charCode < 58))
            	            return true;
            	        else
            	            return false;
            	    }
            	    catch (err) {
            	        alert(err.Description);
            	    }
            	}
             
 function validation()
 {
	 var  chars = /[A-Za-z ]+$/;
	 var documenttype = document.getElementById('documenttype').value;
	 if(documenttype == "")
		 {
		 document.getElementById("documenttype1").innerHTML="Required field should not be empty";
		 return false;
		 }
	 else if(documenttype.charAt(0) == " ")
		 {
		 document.getElementById("documenttype1").innerHTML="Should not accept initial space";
		 return false;
		 }
	 else if(documenttype.length<4)
	 {
	 document.getElementById("documenttype1").innerHTML="Required field should be of length 4 to 32.";
	 return false;
	 }
	 else if(documenttype.match(chars))
		 {
		 document.getElementById("documenttype1").innerHTML="";
		 }
	
 }
 
 </script>   
</body>
</html>