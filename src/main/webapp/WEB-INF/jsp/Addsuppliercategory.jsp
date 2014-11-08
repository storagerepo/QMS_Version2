<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="header.jsp"></jsp:include>
<script src="resources/js/jquery-1.7.2.min.js"></script>
<script src="resources/js/jquery-ui.js"></script>
<script src="resources/js/modal.js"></script>
 <script src="resources/js/jquery.js"></script>
 
<head>
<script>
	 $('input[type=text]').on("focusout", function() {
		    var dest = $(this);
		    dest.val(jQuery.trim(dest.val()));        
		    dest.val(dest.val().replace(/[ ]{2,}/, ' ')); 
		     });

	</script>
	</head>
<html>
<div id="right_content">
<form method="post" action="add_supplierprefix">
 <c:set value="${addsuppliercategoryform.suppliercategory[0]}" var="suppliercategory"></c:set>
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
						<a title="Close" href="add_prefixdocument">
						<img alt="Success" src="resources/images/icons/icon_square_close.png"></a>		
						</p>
					</div></td>
			</tr>
		</c:if>	
      <tr>
        <td valign="top" align="left">
            <div class="headings altheading">
              <h2 style="padding-left: 50px">Add Supplier</h2>
           
            </div>
    <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
         
              <tr>
			<td align="left" valign="top" width="50%" style="padding-right: 25px;">
			<table cellpadding="0" cellspacing="0" border="0">
                <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" style="padding-left: 55px" >Supplier Category :</td>
                  <td valign="top" align="left" class="input_txt">
                  <input type="text" name="category" class="input_txtbx" maxlength="32" id="category" value="${suppliercategory.category}" onkeypress="return onlyAlphabets(event,this);" />
                   <br> <span id="categoryerror" style="color:red">     
              
</td>
                
                </tr>
               
                  <tr height="10"></tr>
                 <tr class="row1">
                  <td valign="top" align="left">&nbsp;</td>
                  <td valign="top" align="left"><input type="submit" value="Submit"  onclick="return validation();" class="submit_btn1"></td>
                </tr>
          
                
 </table>
 </td>
 </tr>
 </table>
 </div>
 </td>
   <tr style="height: 250%"><td ></td></tr>
 </table>
 </form>
 </div>
<script>
  $(function() {
	$("#category").on("keypress", function(e) {
		if (e.which === 32 && !this.value.length)
	        e.preventDefault();
	});
	});	

</script>
 <script>
    function validation()
    {
       //alert("calling");
        var error="";
     
      document.getElementById("categoryerror").innerHTML="";
     

       if(document.getElementById("category").value=="")
      {
        //alert("hai");
         document.getElementById("categoryerror").innerHTML="Required field should not be empty";
         error=true; 
      } 
       if(document.getElementById("category").value!="")
       {
         if(document.getElementById("category").value.length < 4 || document.getElementById("category").value.length > 32){
                    document.getElementById("categoryerror").innerHTML="Required field should be length of 4 to 32";
                    error=true; 
                }
       }   
      
       if(error==true)
       {

         return false;
       }

      

    }

    </script>
    
    <script>
   
	
	function onlyAlphabets(e, t) {
		
	    try {
	        if (window.event) {
	            var charCode = window.event.keyCode;
	        }
	        else if (e) {
	            var charCode = e.which;
	        }
	        else { return true; }
	        if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123)|| (charCode==32)||(charCode==45) || (charCode==8) || (charCode==9) )
	            return true;
	        else
	            return false;
	    }
	    catch (err) {
	        alert(err.Description);
	    }
	}
	
    </script>
    
  <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<jsp:include page="footer.jsp"></jsp:include>
</html>