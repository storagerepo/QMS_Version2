<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/jquery-ui.css"
	type="text/css" />
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/jquery-ui.js"></script>

<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table" >
	<tr>
		<td>
			<div>
				<ul class="horizmenu" style="float:left;margin-left:205px; margin-top:8px;">
<li  style="float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addmanagementreview" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Add Management Review</span>
									
								</a>
							</li>
							
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="viewmanagementreview" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>View Management Review</span>
									
								</a>
							</li>
						
				         <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="managementreview_report" class="<c:choose>
								<c:when test="${menu=='review'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									<span>Reports</span>
									
								</a>
							</li>
							</ul>
			</div></td>
	</tr>
	<tr>
		<c:if test="${success==true}">
			<tr>
				<td valign="top" align="left" style="padding: 5px 0 10px 0;">&nbsp;
					<div id="success_statusbar" class="status success">
						<p class="closestatus">
							<a title="Close" href="maintenance_list">x</a>
						</p>
						<p>
							<img alt="Success" src="resources/images/icons/icon_success.png"><span>Success!</span>.
						</p>
					</div>
			</tr>
		</c:if>
	</tr>
<tr><td>
<table cellpadding="0" cellspacing="0" border="0" width="98%"
	class="margin_table">
	<tr>
		<td valign="top" align="left">
				<div class="headings altheading">
					<h2>Management Review Reports</h2>
				</div>
				<div class="contentbox">
					<form method="post" action="management_review_report">
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
							
							<tr class="row1" id="report_type_table">
								<td valign="middle" align="right" class="input_txt" width="30%">
								Type Of Report :
								</td>
								<td valign="middle" align="left" class="input_txt" width="100%">
								<input type="radio" name="management_report_type" value="0" id="id_type_managementreviewminutes" checked/>Management Review Minutes<br/>
								<input type="radio" name="management_report_type" value="1" id="id_type_upcomingmanagementreviewmemo"/>Upcoming Management Review Memo<br/>
								<input type="radio"  name="management_report_type" value="2" id="id_type_actionlistbetweendates"/>Action List Between Dates<br/>
								<input type="radio"  name="management_report_type" value="3" id="id_type_pastdueactionlist"/>Past Due Action List<br/>
								<input type="radio" name="management_report_type" value="4" id="id_type_listofcontinuousimprovementprojects"/>List of Continuous Improvement Projects<br/>
							</td>
							</tr>
							<tr class="row2">
								<td valign="middle" align="right" class="input_txt" width="30%">
									Select Report Type:</td>
								<td valign="top" align="left" class="input_txt" width="100%">
									<input type="radio" onchange="toggle3(this.value)" name="report_type" value="0" id="id_type_standard" checked/>Standard Report&nbsp;&nbsp;&nbsp;
								<input type="radio" onchange="toggle3(this.value)" name="report_type" value="1" id="id_type_userdefined"/>User Defined Report<br/>
							
								</td>
								
							</tr>
						</table>
						
						<table cellpadding="0" cellspacing="0" border="1" width="100%">
							<tr class="row1" id="userdefined_name" style="display:none;">
								<td valign="middle" align="right" class="input_txt" width="30%">
									Name to appear on the Report:</td>
								<td valign="top" align="left" class="input_txt" width="50%">
									<input type="text" name="report_title" maxlength="32" class="input_txtbx1"  style="width:40%;"  value=""/>
								</td>
								
							</tr>
							<tr class="row1" id="userdefined_fields" style="display:none;">
								<td valign="top" align="right" style="margin-top:2px;" class="input_txt" width="30%">
									Select Fields Required on the Report:</td>
								<td valign="top" align="left" class="input_txt" width="100%">
								<table cellpadding="0" cellspacing="0" border="0" width="100%">
								<tr>
								
								
								<td><input type="checkbox" id="select_all"/>Select All</td>
								</tr> 
								<tr>
								<td><input type="checkbox" onclick="selectall(this.id)" name="report_field[]" value="review_id" id="0"/>Review id:</td>
								<td><input type="checkbox" onclick="selectall(this.id)" name="report_field[]" value="management_review_date" id="1"/>Management review date:</td>
								<td><input type="checkbox" onclick="selectall(this.id)"  name="report_field[]" value="attendee_list_with_titles" id="2"/>Attendee List with Titles</td>
					      		</tr>
					      		<tr>
								<td><input type="checkbox" onclick="selectall(this.id)" name="report_field[]" value="next_management_review_by" id="3"/>Next Management Review By</td>
								<td><input type="checkbox" onclick="selectall(this.id)" name="report_field[]" value="category" id="4"/>Category</td>
								<td><input type="checkbox" onclick="selectall(this.id)" name="report_field[]" value="assessment" id="5"/>Assessment</td>
					      		</tr>
					      		<tr>
								<td><input type="checkbox" onclick="selectall(this.id)" name="report_field[]" value="report_link" id="6"/>Report Link</td>
								<td><input type="checkbox" onclick="selectall(this.id)" name="report_field[]" value="action_needed" id="7"/>Action Needed</td>
								<td><input type="checkbox" onclick="selectall(this.id)" name="report_field[]" value="action_detail" id="8"/>Action Detail</td>
					      		</tr>
					      		<tr>
								<td><input type="checkbox" onclick="selectall(this.id)" name="report_field[]" value="action_due_date" id="9"/>Action Due Date</td>
								<td><input type="checkbox" onclick="selectall(this.id)" name="report_field[]" value="responsibility" id="10"/>Responsibility</td>
								<td><input type="checkbox" onclick="selectall(this.id)" name="report_field[]" value="completion_date" id="11"/>Completion Date</td>
								</tr>
								<tr>
								<td><input type="checkbox" onclick="selectall(this.id)" name="report_field[]" value="continuous_improvement_project" id="12"/>Continuous Improvement Project</td>
								</table>
								
								</td>
								
							</tr>
							<tr >
             <td  colspan="2" align="center" width="30%">
            <table><tr style="padding:10px;"><td style="padding:10px;"><input type="submit" id="export"  name="export" value="Generate1" class="submit_btn1">
             </td><td style="padding:10px;">
              <input type="reset" id="reset_export" name="reset_export" value="Reset" class="submit_btn1"></td>
            
             </tr></table>

             
       
           
             </tr>
            
							
						</table>
						</form>
					</div>
				</td></tr>
</table></td></tr></table>

<script type="text/javascript">

function toggle2(value){
    var e3=document.getElementById("report_type_table");
if(value=="report_list_by_type")
    {
	
	e3.style.display="table-row";
	
    }
else
    {
	
	e3.style.display="none";
  
    }
    
}
function toggle3(value){
	
   var e1=document.getElementById("userdefined_name");
    var e2=document.getElementById("userdefined_fields");
if(value==1)
    {
	
	e1.style.display="table-row";
	e2.style.display="table-row";
    }
if(value==0)
    {
	
	e1.style.display="none";
	e2.style.display="none";
  
    }
    
}
$('#select_all').change(function() {
    var checkboxes = $(this).closest('form').find(':checkbox');

    if($(this).is(':checked')) {
        checkboxes.attr('checked','checked');
    } else {
        checkboxes.removeAttr('checked');
    }
   
});

</script>
<script>
		function selectall(id) 
		{
			// var checkboxes1 = $(id).closest('form').find(':checkbox').not($('#select_all'));
		
 if(($('#id').is(':checked')))
	//if(!$(id).closest('form').find(':checkbox').not($('#select_all').is(':checked')))
	
	 {  $("#select_all").attr('checked','checked'); 
		
		//if(!$id.closest('form').find(':checkbox').not($("#select_all")))
			
			
	     
			
	 }
	 else 
	 {$("#select_all").removeAttr('checked');
		 
	 }
	 
		}
		
</script>

<br><br><br><br><br><br><br><br>
  <jsp:include page="footer.jsp"></jsp:include>
  
  
 
  
  
  
  