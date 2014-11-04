<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Login Page</title> 
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet"  type="text/css" />
<link href="<c:url value="/resources/css/home.css" />" rel="stylesheet"  type="text/css" />
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/jquery-1.7.2.min.js"></script>
<style>
.errorblock {
	color: #eaeaea; 
	background-color: #eaeaea;
	border: 3px solid #eaeaea;
	padding: 8px;
	margin: 16px;
}
</style>
</head>
<body onload='document.f.j_username.focus();'>
	<h3><!-- Login with Username and Password (Custom Page) --></h3>
<script>
function clear123()
{
	document.getElementById("usernameerr").innerHTML="";
	document.getElementById("passworderr").innerHTML="";
	document.getElementById("exerr").innerHTML="";
	document.getElementById("suerr").innerHTML="";
	
	}
function validation()
{
	var error="";
	if(document.getElementById("username").value==""&&document.getElementById("password").value=="")
		{
		document.getElementById("usernameerr").innerHTML="Required field should not be empty";
		error="true";
		}
	if(document.getElementById("username").value=="")
	{
	document.getElementById("usernameerr").innerHTML="Required field should not be empty";
	error="true";
	}
	if(document.getElementById("password").value=="")
	{
	document.getElementById("passworderr").innerHTML="Required field should not be empty";
	error="true";
	}
	if(error=="true")
		{
		return false;
		}
	
	}

</script>
	

	<form name='f' action="<c:url value='j_spring_security_check' />" method='POST'>
		<div id="login_div">
		  <div class="login-top">
		 
		  
		  </div>
		  <div class="login-center">
		  <ul class="login-list">
		  <li  style="background-color:#FFFFD6;"><h3 style="font-family:verdana;background-color:gainsboro;padding:10px;font-weight:bolder;text-align:center;border:solid 1px brown;"><font color="#993300">QUALITY MANAGEMENT SYSTEM LOGIN</font></h3>
		  </li>
		  </ul>
		   <c:if test="${not empty error}">
		<div id="exerr"  style="color:red;text-align:center;">
		 Your login attempt was not successful, try again.<br /> Caused :
			${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
			${blank.message}
			
		</div><br/>
		
	</c:if>
	<c:if test="${success=='true'}"> <div id="suerr" style="color:green;text-align:center;"><b><font size="+1">Successfully Completed User Registration</b></div></c:if> 
		  
		    <ul class="login-list">
		   <li>
<BR/>
	 <table cellpadding="0" cellspacing="0" border="0" width="500" >
	 <td style="width:40%" valign="top" align="right">
	
		       <b> <font color="#993300">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;UserName&nbsp;:&nbsp;&nbsp;</font></b>
		     </td>
		     
		       <td valign="top" align="left"><input type="text" maxlength="32" class="inputbx1" id="username" style="border:solid 1px brown;" name="j_username" value='' onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}" >
		       <br><font size="+1" color="red"><span id="usernameerr"></span></font>
				<p><font color="#993300"></font></p></td>
		      </table>
		      </li>
		      <li>
		      <table cellpadding="0" cellspacing="0" border="0" width="500">
		      <td style="width:40%;padding-right:5px;" valign="top" align="right">
		        <b><font color="#993300">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Password&nbsp;&nbsp;&nbsp;:</font></b>
		        </td>
		      
		      
		      <td valign="top" align="left"><input type="password" id="password" maxlength="32" class="inputbx1" style="border:solid 1px brown;" name="j_password" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}" >
				<br><font size="+1" color="red"><span id="passworderr"></span></font>	
		      </td>
		      </table>
		      </li>
		      <li>
		      </li>
		      <li><br>
		      <table cellpadding="0" cellspacing="0" border="0" width="500">
		      <td valign="top" align="right">
		      <a href="#">
		        <input type="submit" value="Submit" style="width:70px;height:30px;" name="submit" class="submit_btn1" onclick="return validation()">
		        </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		          <input type="reset" value="Reset" onclick="window.location.href='login'"  class="submit_btn1" style="width:70px;height:30px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		  </td><Td width="20%"> </td></table></li>
		      
		      
		      <li>
		      <table cellpadding="0" cellspacing="0" border="0" width="300">
		      
		      <td valign="top" align="left">
		     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<!--  <a href="forgot-password"><font color="#993300">Forgot Password</font></a> --></li>
		      </td>
		     
		      </table>
		    
		    <li>
		    	
		      <li>
		      <table cellpadding="0" border="0" cellspacing="1" width="100%" border="0">
		     <tr>
		     <td align="right"><a style="color:brown;text-align:right;">New User Click Here For Register&nbsp;&nbsp;</a></td>
		      <td valign="top" align="left">
		    <input type="button" value="Register" style="width:70px;height:30px;" name="submit" class="submit_btn1" onclick="window.location.href='createuser'">&nbsp;&nbsp;</td><td width="20%"></td>
		    </tr>
		    </table></li>
		      
		    </ul>
		  </div>
		  <div class="login-bottom"></div>
		</div>
	</form>
</body>
</html>