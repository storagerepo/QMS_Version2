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
<title>Edit Document Prefix</title>
</head>
<body>
<form method="post" action="update_documentprefix">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
        <td>
        <div>
  <ul class="horizmenu">
						
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="add_prefixdocument" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									Add Prefix</span>
									
								</a>
							</li>
						<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="documentprefix_list" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
								View Prefixes</span>
								</a>
							</li>
				          
							</ul>
  </div>
        </td>
      </tr>
      <tr>
        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2 style="padding-left: 50px">Update Document Prefix</h2>
            </div>  <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
               <c:set value="${documentPrefixForm.documentPrefixs[0]}" var="documentprefix"> </c:set>
             
              <tr>
			<td align="left" valign="top" width="50%" style="padding-right: 25px;">
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr class="row2">
                
                  <td valign="middle" align="left"  style="padding-left: 55px">Prefix :</td>
                  <td valign="top" align="left" width="70%"><input type="text" name="doc_prefix" class="input_txtbx" maxlength="32" id="docprefix" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"onblur="ChangeCase(this);toggle(this.value)"onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${documentprefix.doc_prefix}" onkeypress="return onlyAlphabets(event,this);"  />
                  <input type="hidden" name="id" id="id" value="${documentprefix.id}"/>
                 <br>   <span id="docprefix1" style="color:red">
                 <c:if test="${success=='exist'}">Document Prefix already exists</c:if>
                 <form:errors path="DocumentPrefix.doc_prefix"></form:errors></span>
                  
                  </td>
                </tr>
                <tr height="10"></tr>
                 <tr class="row1">
                  <td valign="top" align="left" style="padding-left: 55px">Description :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">
                  <textarea   cols="27" rows="5" class="input_txtarea"  maxlength="400" name="document_id" id="document_id" >${documentprefix.document_id}</textarea>
                <input type="hidden"  id="duplicate">
                  <br>  <span id="document_id1" style="color:red"></span>
                  <span class="err"><form:errors path="DocumentPrefix.document_id"></form:errors></span></td>
                </tr>
                <tr height="10"></tr>
                 <tr class="row1">
                  <td valign="top" >&nbsp;</td>
                  <td valign="top" align="left"><input type="submit" value="Update" onclick="return validation();" class="submit_btn1"></td>
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
		$("#docprefix").on("keypress", function(e) {
			if (e.which === 32 && !this.value.length)
		        e.preventDefault();
		});
		});
$(function() {
		$("#document_id").on("keypress", function(e) {
			if (e.which === 32 && !this.value.length)
		        e.preventDefault();
		});
		});
		function validateAlpha(){
	    var textInput = document.getElementById("docprefix").value;
	    textInput = textInput.replace(/[^A-Za-z]/g, "");
	    document.getElementById("docprefix").value = textInput;
	}
/*  function validateAlpha1(){
	    var textInput = document.getElementById("document_id").value;
	    textInput = textInput.replace(/[^A-Za-z ]/g, "");
	    document.getElementById("document_id").value = textInput;
	} */
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
	
	var error="";
	  var cap = /[A-Z]+$/;
	 var desc = /[A-Za-z ]+$/;
	 var docprefix = document.getElementById('docprefix').value;
	 var document_id= document.getElementById('document_id').value;
	document.getElementById("duplicate").value=document.getElementById('document_id').value;
	
	  document.getElementById("docprefix1").innerHTML="";
	   document.getElementById("document_id1").innerHTML="";
	 if(docprefix =="")
		 {
		 document.getElementById("docprefix1").innerHTML="Required field should not be empty";
		 error="true";
		 }
	 else if(docprefix.charAt(0)==" ")
		 {
		 document.getElementById("docprefix1").innerHTML="Should not accept initial space";
		 error="true";
		 }
	 else if(docprefix.length<4)
	 {
	 document.getElementById("docprefix1").innerHTML="Required field should be of length 4 to 32.";
	 error="true";
	 }
	 else if(docprefix.match(cap))
		 {
		 	 document.getElementById("docprefix1").innerHTML="";
		 }
	/*  else {
		 
		 document.getElementById("docprefix1").innerHTML="Required field should be capital letters";
		 error="true";
	 } */
	 
	 
	 if(document_id =="")
	 {
	 document.getElementById("document_id1").innerHTML="Required field should not be empty";
	 error="true";
	 }
 else if(document_id.charAt(0)==" ")
	 {
	 document.getElementById("document_id1").innerHTML="Should not accept initial space";
	 error="true";
	 }
 else if(document_id.length<4)
 {
 document.getElementById("document_id1").innerHTML="Required field should be of length 4 to 400";
 error="true";
 }
 else if(document_id.match(desc))
	 {
	 	 document.getElementById("document_id1").innerHTML="";
	 }
 
	 if(error=="true")
		 {
		 return false;
		 }
 }
 
 </script>
</body>
</html>