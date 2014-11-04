<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Signup Page</title> 
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet"  type="text/css" />
<link href="<c:url value="/resources/css/home.css" />" rel="stylesheet"  type="text/css" />
 <script src="/QMS_App/resources/js/jquery.js"></script>
<script src="resources/js/jquery-1.7.2.min.js"></script>
<script src="resources/js/jquery-ui.js"></script> 
<script src="resources/js/modal.js"></script>
<style>
.errorblock {
	color: #eaeaea; 
	background-color: #eaeaea;
	border: 3px solid #eaeaea;
	padding: 8px;
	margin: 16px;
}
</style>
<script>

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




</script>
<script>
function validation()
{
	var error="";
	var fullname = document.getElementById('fullname').value;
	var username = document.getElementById('username').value;
	var password = document.getElementById('password').value;
	var cpassword=document.getElementById('cpassword').value;
	var email = document.getElementById('email').value;
	var mail = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,3}$/;
	document.getElementById("cperr").innerHTML="";
	
	
	if(fullname == "")
	{
		
	 document.getElementById("ferr").innerHTML="Required field should not be empty";
	 error="true";
	
	}
	
	else if(fullname.charAt(0) == " ")
	{
		document.getElementById("ferr").innerHTML="Should not accept initial space";
		 error="true";
	}
	else if((fullname.length < 4) ||(fullname.length > 32))
	{
	document.getElementById("ferr").innerHTML="Required field should be length of 4 to 32";
	error="true";
	
	}
	else
	{
	document.getElementById("ferr").innerHTML="";
	}
	
	if(username == "")
	{
		
	 document.getElementById("uerr").innerHTML="Required field should not be empty";
	 error="true";
	
	}
	
	else if(username.charAt(0) == " ")
	{
		document.getElementById("uerr").innerHTML="Should not accept initial space";
		 error="true";
	}
	else if(username.length < 4)
	{
	document.getElementById("uerr").innerHTML="Required field should be length of 4 to 15";
	error="true";
	
	}
	else
	{
	document.getElementById("uerr").innerHTML="";
	}
	  
	if(password == "")
	{
		
	 document.getElementById("perr").innerHTML="Required field should not be empty";
	 error="true";
	
	}
	
	else if(password.charAt(0) == " ")
	{
		document.getElementById("perr").innerHTML="Should not accept initial space";
		 error="true";
	}
	else if((password.length < 3) ||(password.length > 32))
	{
	document.getElementById("perr").innerHTML="Required field should be length of 3 to 32";
	error="true";
	
	}
	else
	{
	document.getElementById("perr").innerHTML="";
	}
	
	if(cpassword == "")
	{
		
	 document.getElementById("cperr").innerHTML="Required field should not be empty";
	 error="true";
	
	}
	
	else if(cpassword.charAt(0) == " ")
	{
		document.getElementById("cperr").innerHTML="Should not accept initial space";
		 error="true";
	}
	else if((cpassword.length < 3) ||(cpassword.length > 32))
	{
	document.getElementById("cperr").innerHTML="Required field should be length of 3 to 32";
	error="true";
	
	}
	else if(cpassword!="")
	{
		if(password!=cpassword)
			{
			document.getElementById("cperr").innerHTML="Password and confirm password should be same";
			 error="true";
			}}
	else
	{
	document.getElementById("cperr").innerHTML="";
	}
	 
	 
	  if(email =="")
	  {
	  document.getElementById("emailerr").innerHTML="Required field should not be empty";
  	error="true";
	  }
	  else if(email.charAt(0) ==" ") 
	   {
	   document.getElementById("emailerr").innerHTML="Should not accept initial space";
	error="true";
		}
else if(email.match(mail)){  
	  
	   document.getElementById("emailerr").innerHTML="";
	  
	   }

else{
	  document.getElementById("emailerr").innerHTML="Invalid email format";
  	error="true";
}
	
	   
	    if(error == "true")
		{
	    	//alert("er");
		return false;
		}
	    $.ajax({
			type : "POST",
			url : "/QMS_App/ajax_createuserexisterror",
			data : "username="+ document.getElementById("username").value+"&email="+ document.getElementById("email").value,
			success : function(response) {
			//	alert("response"+response);	
			
	    	
	    		//	alert("if loop 0");
	    		
	    	if(response=='username')
	    		{
	    		document.getElementById("uerr").innerHTML="UserName already exists";
	    		}
	    	if(response=='email')
    		{
	    		document.getElementById("emailerr").innerHTML="Email Address already exists";
    		}	
	    	if(response=='')
	    			{
	    			document.forms[0].method = "POST";
	    			document.forms[0].action = "submituser";
	    			document.forms[0].submit();
	    			}
	    		
	    		
	    		
	    		  
			},
			error : function(e) {
				alert('Error: ' + e);
			}
		});
	 return false;
	 
	    
	    
	    
}

</script>
<script>


function usernamevalidation(e, t) {
	
    try {
        if (window.event) {
            var charCode = window.event.keyCode;
        }
        else if (e) {
            var charCode = e.which;
        }
        else { return true; }
        if ((charCode==64) || (charCode==46) || (charCode==95) || (charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123)|| (charCode >47 && charCode < 58))
            return true;
        else
            return false;
    }
    catch (err) {
        alert(err.Description);
    }
}


</script>
<script>
function usernamevalidation1(e, t) {
	
    try {
        if (window.event) {
            var charCode = window.event.keyCode;
        }
        else if (e) {
            var charCode = e.which;
        }
        else { return true; }
        if ((charCode==64) || (charCode > 32 && charCode < 48) || (charCode > 57 && charCode < 64) || (charCode > 90 && charCode < 97) || (charCode > 122 && charCode < 127) || (charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123)|| (charCode >47 && charCode < 58))
            return true;
        else
            return false;
    }
    catch (err) {
        alert(err.Description);
    }
}



</script>
<script>
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


</script>
 <script>
      $(function() {
    	    $("#password").keydown(function(e) {
    	        if (e.keyCode == 32) // 32 is the ASCII value for a space
    	            e.preventDefault();
    	    });
    	});
      $(function() {
  		$("#fullname").on("keypress", function(e) {
  			if (e.which === 32 && !this.value.length)
  		        e.preventDefault();
  		});
  		});
      $(function() {
  		$("#username").on("keypress", function(e) {
  			if (e.which === 32 && !this.value.length)
  		        e.preventDefault();
  		});
  		});
      $(function() {
    	  $("#email").on("keypress", function(e) {
  			if (e.which === 32 && !this.value.length)
  		        e.preventDefault();
  		});
  		});
      function validateAlpha(){
    	    var textInput = document.getElementById("fullname").value;
    	    textInput = textInput.replace(/[^A-Za-z ]/g, "");
    	    document.getElementById("fullname").value = textInput;
    	}
      function validateAlpha1(){
  	    var textInput = document.getElementById("username").value;
  	    textInput = textInput.replace(/[^A-Za-z0-9@_.]/g, "");
  	    document.getElementById("username").value = textInput;
  	}
     

      
      </script>
</head>
<body>

<div id="login_div" style="margin-left:500px;">
		  <div class="login-top">
		 
		  
		  </div>
		  <div class="login-center" style="width:500px;">
		  <ul class="login-list">
		  <li  style="background-color:#FFFFD6;"><h3 style="font-family:verdana;background-color:gainsboro;padding:10px;font-weight:bolder;text-align:center;border:solid 1px brown;"><font color="#993300">Create a Free Account</font></h3>
		  </li>
		  </ul>
<h2></h2>
 
<sf:form action="submituser" method="POST" modelAttribute="userProfile">         
   <fieldset> 
   <ul class="login-list" style="margin-left:50px;">
		   <li>
<BR/>
	 <table cellpadding="0" cellspacing="0" border="0" width="300">
	 <td  style="width:70%" valign="top">
	
		       <b> <font color="#993300">&nbsp;&nbsp;Full Name:</font></b>
		     </td>
		     
		      <td style="width: 512px; "><sf:input path="fullName" id="fullname" class="input_txtbx" size="30" maxlength="32" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"  onkeypress="return Alphabets(event,this);"/><br/>
     <span id="ferr" style="color: red;font-style:italic;"></span>
        </td>
		      </table>
		      </li>
		       <li>
		      <table cellpadding="0" cellspacing="0" border="0" width="300">
		      <td  style="width:70%" valign="top">
		        <b><font color="#993300">&nbsp;&nbsp;UserName:</font></b></td>
		       <td style="width: 512px; "> <sf:input path="username" id="username" class="input_txtbx" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"  onkeypress="return usernamevalidation(event,this);" size="30" maxlength="15" />
             <!--  <b><font color="#993300">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</font></b> <small id="username_msg"></small><br/> -->
             <span id="uerr" style="color: red;font-style:italic;"><c:if test="${username=='exist'}">UserName already exists</c:if></span>
		        </table>
  
   
     
      <li>
		      <table cellpadding="0" cellspacing="0" border="0" width="300">
		      <td style="width:70%" valign="top">
		        <b><font color="#993300">&nbsp;&nbsp;Password:</font></b></td>
		      
		      <td style="width: 512px; "><sf:password class="input_txtbx" path="password" id="password" size="30" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"   maxlength="32" showPassword="true" onkeypress="return usernamevalidation1(event,this);"/> 
             <!-- <small>6 characters or more (be tricky!)</small><br/> -->
              <span id="perr" style="color: red;font-style:italic;"></span>
		      </td>
		      </table>
		        <li>
		      <table cellpadding="0" cellspacing="0" border="0" width="300">
		      <td style="width:70%" valign="top">
		        <b><font color="#993300">&nbsp;&nbsp;Confirm Password:</font></b></td>
		      
		      <td style="width: 512px; "><input class="input_txtbx" name="cpassword" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}" id="cpassword" type="password" onkeypress="return usernamevalidation1(event,this);"> 
             <!-- <small>6 characters or more (be tricky!)</small><br/> -->
              <span id="cperr" style="color: red;font-style:italic;"></span>
		      </td>
		      </table>
	
<li>
		      <table cellpadding="0" cellspacing="0" border="0" width="300">
		      <td style="width:70%" valign="top">
		        <b><font color="#993300">&nbsp;&nbsp;Email Address:</font></b>
		        </td>
		      
		      
		      <td style="width: 512px; "><sf:input class="input_txtbx" path="email" id="email" size="30" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}" /> 
         
             <span id="emailerr" style="color: red;font-style:italic;"><c:if test="${email=='exist'}">Email Address already exists</c:if></span>
		      </td>
		      </table>
		      </li>
     <li>
		     
		      </li>
      <!--<start id="image_field"/>--> 
     <!--  <tr>
        <th><label for="image">Profile image:</label></th>
        <td><input name="image" type="file"/>
      </tr> -->
      <!--<end id="image_field"/>--> 
     
     
     <li><br>
		      <table cellpadding="0" cellspacing="0" border="0" width="300">
		      
		      <a href="#">
		        <input name="commit" type="submit" class="submit_btn1" value="I accept. Create my account." style="width:200px;height:30px;" onclick="return validation()">
		        </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" class="submit_btn1" value="Back to Login" onclick="window.location.href='login'">
		    
		         <!-- <td><button type="reset" class="submit_btn" value="Reset">Reset</button></td> -->
		
		
		  </table></li>
		  
     <!--  <tr>
         <th></th>
         <td><input name="commit" type="submit"  onclick="return validation()"
                    value="I accept. Create my account." /></td>
      </tr>
   </table> -->
   
   
</fieldset>
</sf:form>

</ul>
		  </div>
		  <div class="login-bottom"></div>
		</div>

</body>

</html>