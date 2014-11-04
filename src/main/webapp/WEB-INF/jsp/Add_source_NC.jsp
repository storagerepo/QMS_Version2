<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script src="resources/js/jquery-1.7.2.min.js"></script>
<script src="resources/js/jquery-ui.js"></script>
<script src="resources/js/modal.js"></script>
<jsp:include page="header.jsp"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Inserting Source NC</title>
</head>
<body>


<div id="right_content">
<form method="post" action="addsourcenc">
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
								<c:when test="${menu=='nonconformance'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>" rel="noncon">
									<span>Add Set-up</span>
								</a>
							</li>
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>"rel="noncon1">
									<span>List/Delete Set-up</span>
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
			       <c:if test="${success=='insert'}">
			<tr>
				<td valign="top" align="left" style="padding: 5px 50px 10px 228px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<div id="success_statusbar" class="status success">
						<p class="closestatus">
						<img alt="Success" src="resources/images/icons/inserted.png">
						<a title="Close" href="addsourcenc">
						<img alt="Success" src="resources/images/icons/icon_square_close.png"></a>		
						</p>
					</div></td>
			</tr>
		</c:if>
      <tr>
        <td valign="top" align="left">
            <div class="headings altheading">
              <h2 style="padding-left: 55px">Add Source NC</h2>
            </div>
    <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
             
              <tr>
			<td align="left" valign="top" width="50%" style="padding-right: 25px;">
			<table cellpadding="0" cellspacing="0" border="0">
                <tr class="row2">
                  <td valign="top" align="left" class="input_txt" width="50%" style="padding-left: 60px">Source of NC :</td>
                  <td valign="top" align="left" class="input_txt" ><input type="text" maxlength="32" name="source_of_nc" class="input_txtbx" id="sourceofnc" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"onblur="toggle(this.value)"onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  onkeypress="return onlyAlphabets(event,this);" value="${sourcenc}" />
                  <br><span id="sourceofnc1" style="color:red">
                  <c:if test="${success=='exist'}">Source of NC already exist</c:if></span>
                  <span class="err" style="color:red"><form:errors path="Non_Conformance_Source.source_of_nc"></form:errors></span></td>
                </tr><tr height="10"></tr>
                 <tr class="row1">
                  <td valign="top" align="left">&nbsp;</td>
                  <td valign="top" align="left"><input type="submit" value="Submit" onclick="return validation();"class="submit_btn1"></td>
                </tr>
               </table>
               </td>
               </tr>
               </table>
               </div>
               </td>
               </tr>
               </table>
               </form>
               <script type="text/javascript">
               $(function() {
             		$("#sourceofnc").on("keypress", function(e) {
             			if (e.which === 32 && !this.value.length)
             		        e.preventDefault();
             		});
             		});
              
                 function validateAlpha4(){
               	    var textInput = document.getElementById("sourceofnc").value;
               	    textInput = textInput.replace(/[^A-Za-z ]/g, "");
               	    document.getElementById("sourceofnc").value = textInput;
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
            	   var chars = /[A-Za-z ]+$/;
            	   var sourceofnc = document.getElementById('sourceofnc').value;
            	   if(sourceofnc == "")
            		   {
            		   document.getElementById("sourceofnc1").innerHTML="Required field should not be empty";
            			 return false;
            		   }
            	   else if(sourceofnc.charAt(0)==" ")
            		   {
            		   document.getElementById("sourceofnc1").innerHTML="Should not accept initial space";
          			 return false;
            		   }
            	   else if(sourceofnc.length<4)
        		   {
        		   document.getElementById("sourceofnc1").innerHTML="Required field should be of length 4 to 32";
      			 return false;
        		   }
            	   else if(sourceofnc.match(chars))
            		   {
            		   document.getElementById("sourceofnc1").innerHTML="";
            		   }
            	   else
            		   {
            		   document.getElementById("sourceofnc1").innerHTML="Required field should be alphabates";
            			 return false;
            		   
            		   }
            	   
            	   
               }
               </script>
          	<tr height="350"></tr>

        				       				
        				       				</table>
        				       				</div>
        				       				<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

</body>
</html>