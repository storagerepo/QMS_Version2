<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script src="resources/js/jquery-1.7.2.min.js"></script>
<script src="resources/js/jquery-ui.js"></script>
<script src="resources/js/modal.js"></script>
<jsp:include page="header.jsp"></jsp:include>
<html>
<div id="right_content">
<form method="post" action="add_process">
      
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
								<c:when test="${menu=='document'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>" rel="document">
									<span>Add Set-up</span>
								</a>
							</li>
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="#" class="<c:choose>
									<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>"rel="document1">
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
     <c:if test="${success=='insert'}">
			<tr>
				<td valign="top" align="left" style="padding: 5px 50px 10px 220px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<div id="success_statusbar" class="status success">
						<p class="closestatus">
						<img alt="Success" src="resources/images/icons/inserted.png">
						<a title="Close" href="add_process">
						<img alt="Success" src="resources/images/icons/icon_square_close.png"></a>		
						</p>
					</div></td>
			</tr>
		</c:if>
      <tr>
        <td valign="top" align="left">
            <div class="headings altheading">
           
              <h2 style="padding-left: 50px">Add Process</h2>
            </div>
    <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
              
              <tr>
			<td align="left" valign="top" width="50%" style="padding-right: 25px;">
			<table cellpadding="0" cellspacing="0" border="0">
                <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="50%" style="padding-left: 55px">Process ID :</td>                
                  <span class="err"><form:errors path="Process.process_id"></form:errors></span></td>
                  <td valign="top" align="left" class="input_txt" ><input type="text" maxlength="15"  name="process_id" class="input_txtbx"  onblur="ChangeCase(this);" id="processid" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"  onblur="toggle(this.value)"onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  value="${process.process_id}" onkeypress="return onlyAlphabets1(event,this);"	/>
                <br> 
                 <span id="processid1" style="color:red">
                   <c:if test="${success=='exist'}">Process ID already Exist</c:if>
                  <%--    <c:if test="${success=='exist'}"><span style="color:red">Process name already Exist</span></c:if>
                   --%><form:errors path="Process.process_id"></form:errors></span></td>
                </tr>
                  <tr height="10"></tr>
                <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" style="padding-left: 55px">Process Name :</td>
                  <td valign="top" align="left" class="input_txt" ><input type="text" maxlength="32" name="process_name" class="input_txtbx" id="processname"onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}" onblur="toggle(this.value)"onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${process.process_name}" onkeypress="return onlyAlphabets(event,this);" />
                <br>   <span id="processname1"></span>
                <c:if test="${success=='exists'}"><span style="color:red">Process name already exists</span></c:if>
                  <span class="err"><form:errors path="Process.process_name"></form:errors></span></td>
                </tr>  <tr height="10"></tr>
                 <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" style="padding-left: 55px" >Process Owner :</td>
                  <td valign="top" align="left" class="input_txt" ><input type="text" name="process_owner" maxlength="32" class="input_txtbx" id="processowner" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"onblur="toggle(this.value)"onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${process.process_owner}" onkeypress="return onlyAlphabets(event,this);" />
                 <br>  <span id="processowner1"></span>
                  <span class="err"><form:errors path="Process.process_owner"></form:errors></span></td>
                </tr>  <tr height="10"></tr>
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
		$("#processid").on("keypress", function(e) {
			if (e.which === 32 && !this.value.length)
		        e.preventDefault();
		});
		});
 $(function() {
		$("#processname").on("keypress", function(e) {
			if (e.which === 32 && !this.value.length)
		        e.preventDefault();
		});
		});
 $(function() {
		$("#processowner").on("keypress", function(e) {
			if (e.which === 32 && !this.value.length)
		        e.preventDefault();
		});
		});

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
 function onlyAlphabets1(e, t) {
	    try {
	        if (window.event) {
	            var charCode = window.event.keyCode;
	        }
	        else if (e) {
	            var charCode = e.which;
	        }
	        else { return true; }
	        if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123)|| (charCode > 47 && charCode < 58))
	            return true;
	        else
	            return false;
	    }
	    catch (err) {
	        alert(err.Description);
	    }
	}
 function validateAlpha(){
	    var textInput = document.getElementById("processid").value;
	    textInput = textInput.replace(/[^A-Za-z0-9]/g, "");
	    document.getElementById("processid").value = textInput;
	}
 function validateAlpha1(){
	    var textInput = document.getElementById("processname").value;
	    textInput = textInput.replace(/[^A-Za-z ]/g, "");
	    document.getElementById("processname").value = textInput;
	}
 function validateAlpha2(){
	    var textInput = document.getElementById("processowner").value;
	    textInput = textInput.replace(/[^A-Za-z ]/g, "");
	    document.getElementById("processowner").value = textInput;
	}
 
 function ChangeCase(elem)
 {
     elem.value = elem.value.toUpperCase();
 }

 function validation()
 {
	var error="";
	 var number = /^[A-Za-z0-9]*$/;
	 var chars = /[A-Za-z ]+$/;
	 var processid = document.getElementById('processid').value;
	 var processname = document.getElementById('processname').value;
	 var processowner = document.getElementById('processowner').value;
	 var errord = "Required field should not be empty";
	 var space = "Should not accept initial space";
	 var num = "Required field should be alphanumeric";
	 var wds = "Required field should be alphabate";
	 var ermsg="Required field should be of length 4 to 32";
	var msg = errord.fontcolor("red");
	var spmsg = space.fontcolor("red");
	var nummsg = num.fontcolor("red");
	var wdmsg  = wds.fontcolor("red");
	ermsg=ermsg.fontcolor("red");
	 document.getElementById("processid1").innerHTML="";
	 document.getElementById("processname1").innerHTML="";
	 document.getElementById("processowner1").innerHTML="";
	 
	 if(processid=="")
		 {
		 document.getElementById("processid1").innerHTML=msg;
		 error="true";
		 }
	 else if(processid.charAt(0)==" ")
	 {
	 document.getElementById("processid1").innerHTML=spmsg;
	 error="true";
	 }
	 else if(processid.length<4)
	 {
		 document.getElementById("processid1").innerHTML="Required field should be of length 4 to 15";
		 error="true";
	 }
	 if(processname=="")
		 {
		 document.getElementById("processname1").innerHTML=msg;
		 error="true";
		 }
	 else if(processname.charAt(0)==" ")
	 {
	 document.getElementById("processname1").innerHTML=spmsg;
	 error="true";
	 }
	 else if(processname.length<4)
	 {
		 document.getElementById("processname1").innerHTML=ermsg;
		 error="true";
	 }
	 
	 if(processowner=="")
		 {
		 document.getElementById("processowner1").innerHTML=msg;
		 error="true";
		 }
	 else if(processowner.charAt(0)==" ")
	 {
	 document.getElementById("processowner1").innerHTML=spmsg;
	 error="true";
	 }
	 else if(processowner.length<4)
	 {
		 document.getElementById("processowner1").innerHTML=ermsg;
		 error="true";
	 }	
	
	 if(error=="true")
		 {
		 return false;
		 }
	 
 }
 
 
 </script>
  <br><br><br><br><br><br><br><br><br><br><br><br> <br><br><br><br><br><br>    

</div>
 <jsp:include page="footer.jsp"></jsp:include> 
 </html>