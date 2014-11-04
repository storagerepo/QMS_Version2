<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" />
<script src="resources/js/jquery.min.js"></script>
 <script src="resources/js/jquery-ui.js"></script>

 
 
  <div id="right_content">
  
        
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table" style="table-layout: fixed;width: 100%;">
     
        
        
       	 <tr class="row1"  >
        <td width="20%"></td>
             <td  style="width: 40%"><br/><br/><br/><br/><form method="get" enctype="multipart/form-data" action="adddocument">
             <input type="submit" id="document"  name="DOCUMENT" value="Documents" class="menubuttonsub blue" style="width: 100%;height: 50px;font-size: 24px;cursor:pointer">
            </form><br/></td>
            
             <td style="width: 40%" ><br/><br/><br/><br/>
             <form method="get" enctype="multipart/form-data" action="addform">
            <input type="submit" id="form" name="FORM" value="Forms/Records" class="menubuttonsub blue"style="width: 100%;height: 50px;font-size: 24px;cursor:pointer">
            </form><br/></td>
</tr>
<tr class="row1" height="200px;" >
        <td width="20%"></td>
             <td  style="width: 40%">
             <h3 style="font-size:26px;">Documents</h3><br/><br/>
             <p align="justify"><a href="adddocument">Click here</a>....Leads to 'Add Document details' and 'Add revision details' page,gets the input and same input will be displayed in View document.
             </p>
             <p align="justify" id="para">
             This page also has an search functionality 
             will search for a particular keyword(document type,process area) and will list the document of search.
             The report tab gives the list of reports of document added/inserted in add document.
             Click a corresponding or document link will give or display the complete information of the document and added with download option.
             </p>
             <a href="#" id="read-more">read more</a>
             <a href="#" id="show-read-more">hide</a>
             </td>
            
             <td style="width: 40%">
             <h3 style="font-size:26px;">Forms/Records</h3><br/><br/>
              <p align="justify"> <a href="addform">Click here</a>....Leads to 'Add Form details' and 'Add revision details' page, gets the input and same input will be displayed in View Form.
              </p>
              <p align="justify" id="para1">
              This page also has an search functionality will search for a particular keyword(process area) and will list the Form of search.The report tab gives the list of reports of Form added/inserted in add Form.
              Click a corresponding or Form link will give or display the complete information of the form and added with download option.</p>
               <a href="#" id="read-more1">read more</a>
               <a href="#" id="show-read-more1">hide</a>
               </td>
</tr>
</table></div>
<script type="text/javascript">
$("#para").hide();
$("#show-read-more").hide();
$( document ).ready(function() {
            $("#read-more").click(function(){
$("#para").toggle('slow');
$("#read-more").hide('slow');
$("#show-read-more").toggle('slow');
});
            $("#show-read-more").click(function(){
            	$("#para").hide('slow');
            	$("#read-more").toggle('slow');
            	$("#show-read-more").hide('slow');
            	});
});        
</script>

<script type="text/javascript">
$("#para1").hide();
$("#show-read-more1").hide();
$( document ).ready(function() {
            $("#read-more1").click(function(){
$("#para1").toggle('slow');
$("#read-more1").hide('slow');
$("#show-read-more1").toggle('slow');
});
            $("#show-read-more1").click(function(){
            	$("#para1").hide('slow');
            	$("#read-more1").toggle('slow');
            	$("#show-read-more1").hide('slow');
            	});
});        
</script>


<table  width=300 height=300>
			<tr height=30><td></td></tr></table>
			<br><br><br><br>
<jsp:include page="footer.jsp"></jsp:include>		