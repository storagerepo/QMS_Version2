<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="header.jsp"></jsp:include>
<html>
<div id="right_content">
<form method="post" action="selectedformat">
  <!-- <div id="right_content" style="background-color:lightgrey;"> -->
  
    
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
       <tr>
      
        <td valign="top" align="left">
            <div class="headings altheading">
              <h2>Set Format</h2>
              
             
              
              
            </div>
    <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
              <tr>
			<td align="left" valign="top" width="50%" style="padding-right: 25px;">
			<table cellpadding="0" cellspacing="0" border="0">
                <tr class="row2">
                 <td valign="middle" align="left" class="input_txt" >Revision Format:</td>
																		<td valign="top" align="left" class="input_txt">
																		 <select id="decimalno" name="first" class="input_txtbx" style="width:200px;">
             
              <option value="">--Select--</option>
               <option value="integer">Integer</option>
               <option value="alpha">Alphabet</option>
               <!-- <option value="romain">Romain</option> -->
               </select>
																		
																		</td>
																		<td valign="top" align="left" class="input_txt">
																		 <select id="floorno" name="second" class="input_txtbx" style="width:200px;">
             <option value="">--Select--</option>
               <option value="integer">Integer</option>
               <option value="alpha">Alphabet</option>
             <!--   <option value="romain">Romain</option> -->
               </select>
												<span id="nullvalue" style="color:red"></span>						
																		</td>
</tr>
</table>
 <tr class="row1">
              <td colspan="1" align="right">
             <input type="submit" id="export"  name="export" value="Submit" onclick="return validation();"class="submit_btn1"></td>
             <td colspan="1">
            <input type="reset" id="reset_export" name="reset_export" value="Reset" class="submit_btn1"></td>
</tr>
</table>
</div>
</td>
</tr>
</table>
</form>
<script type="text/javascript">
function validation()
{

  if((document.getElementById('decimalno').value =="")&&(document.getElementById('floorno').value =="") )
	  {
	  
	  document.getElementById("nullvalue").innerHTML="Please Select Atleast one";
		 return false;
	  }
}

</script><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
 </div>
 <jsp:include page="footer.jsp"></jsp:include>
 </html>

																		
																		
																		