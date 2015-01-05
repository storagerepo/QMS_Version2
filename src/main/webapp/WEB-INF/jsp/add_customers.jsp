<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="header.jsp"></jsp:include>
<script src="resources/js/jquery-1.7.2.min.js"></script>
<script src="resources/js/jquery-ui.js"></script>
<script src="resources/js/modal.js"></script>
<link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" />
<form method="post" enctype="multipart/form-data" action="addcustomer">
	<div id="right_content">
		<table cellpadding="0" cellspacing="0" border="0" width="98%"
			class="margin_table">
			<tr>
				<td>
					<div>
						<ul class="horizmenu">
							<li
								style="float: left; margin-right: 8px; text-transform: uppercase;">
								<a href="addcustomer"
								class="<c:choose>
								<c:when test="${menu=='customer'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									<span>Add Customers</span>

							</a>
							</li>
							<li
								style="float: left; margin-right: 8px; text-transform: uppercase;">
								<a href="viewcustomers"
								class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>View Customers</span>

							</a>
							</li>
<%-- 
							<li
								style="float: left; margin-right: 8px; text-transform: uppercase;">
								<a href="addfeedback"
								class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Add Feedback</span>

							</a>
							</li>
							<li
								style="float: left; margin-right: 8px; text-transform: uppercase;">
								<a href="viewfeedback"
								class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>View feedback</span>

							</a>
							</li> --%>
							<li
								style="float: left; margin-right: 8px; text-transform: uppercase;">
								<a href="feedback_report"
								class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Feedback Report</span>

							</a>
							</li>

						</ul>
					</div>
				</td>
			</tr>
			<tr>
				<td valign="top" align="left"><div>
						<div class="headings altheading">
							<h2>Add Customer Details</h2>
						</div>
						<div class="contentbox">
							<div
								style="border: #993300 2px solid; padding: 15px; margin-bottom: 15px;">


								<table cellpadding="0" cellspacing="0" border="0" width="100%">
									<tr class="row2">
										<td valign="middle" align="left" class="input_txt" width="20%">ID
											:</td>
										<td valign="middle" align="left" class="input_txt" width="20%"><input
											type="text" name="customer_id" class="input_txtbx"
											value="${id }" readonly="readonly"><br />
										<span class="err"></span></td>
										<td valign="middle" align="left" class="input_txt" width="20%">
											Website :</td>
										<td valign="middle" align="left" class="input_txt" width="20%"><input
											type="text" name="website" class="input_txtbx"
											id="inp_website" placeholder="www.example.com"
											onmouseover="showTooltip('tooltip_id','inp_id3');"
											onmouseout="hideTooltip('tooltip_id');" value="" /><br>
											<span id="websiteerror" style="color: red"></span> <span
											class="err"><form:errors path="Customers.website"></form:errors></span></td>

									</tr>
									<tr class="row1">
										<td valign="middle" align="left" class="input_txt" width="20%">
											Name :</td>
										<td valign="middle" align="left" class="input_txt" width="20%"><input
											type="text" name="customer_name"
											onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"
											class="input_txtbx" id="customername" maxlength="32" value=""
											onkeypress="return Alphabets(event,this);" /><br> <span
											id="customernameerror" style="color: red"></span> <span
											class="err"><form:errors
													path="Customers.customer_name"></form:errors></span></td>
										<td valign="middle" align="left" class="input_text"
											width="20%">Contact Name :</td>
										<td valign="middle" align="left" class="input_txt" width="20%"><input
											type="text" name="contact_name" class="input_txtbx"
											onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"
											id="inp_contact_name" maxlength="32"
											onmouseover="showTooltip('tooltip_id','inp_id3');"
											onmouseout="hideTooltip('tooltip_id');" value=""
											onkeypress="return Alphabets(event,this);" /><br> <span
											id="contactnameerror" style="color: red"></span> <span
											class="err"><form:errors path="Customers.contact_name"></form:errors></span></td>

									</tr>
									<tr class="row2">
										<td valign="middle" align="left" class="input_txt" width="20%">
											Address :</td>
										<td valign="middle" align="left" class="input_txt" width="20%"><textarea
												class="input_txtbx" id="inp_address" name="address"
												maxlength=""
												onmouseover="showTooltip('tooltip_id','inp_id3');"
												onmouseout="hideTooltip('tooltip_id');"
												style="height: 75px;" name="note"></textarea><br /> <span
											id="addresserror" style="color: red"></span> <span
											class="err"><form:errors path="Customers.address"></form:errors></span></td>
										<td valign="middle" align="left" class="input_txt" width="20%">Contact
											Title :</td>
										<td valign="middle" align="left" class="input_txt" width="20%"><input
											type="text" name="title_of_contact" class="input_txtbx"
											onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"
											id="inp_title_of_contact" maxlength="32"
											onkeypress="return Alphabets(event,this);"
											onmouseover="showTooltip('tooltip_id','inp_id3');"
											onmouseout="hideTooltip('tooltip_id');" value="" /><br>
											<span id="contacterror" style="color: red"></span> <span
											class="err"><form:errors
													path="Customers.title_of_contact"></form:errors></span></td>

									</tr>
									<tr class="row1">
										<td valign="middle" align="left" class="input_txt" width="20%">
											City :</td>
										<td valign="top" align="left" class="input_txt" width="20%"><input
											type="text" name="city" class="input_txtbx" id="inp_city"
											onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"
											maxlength="32" onkeypress="return Alphabets(event,this);"
											onmouseover="showTooltip('tooltip_id','inp_id3');"
											onmouseout="hideTooltip('tooltip_id');" value="" /><br>
											<span id="cityerror" style="color: red"></span> <span
											class="err"><form:errors path="Customers.city"></form:errors></span></td>
										<td valign="middle" align="left" class="input_txt" width="20%">Telephone
											:</td>
										<td valign="top" align="left" class="input_txt" width="20%"><input
											type="text" name="telephone" class="input_txtbx"
											onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"
											id="inp_telephone" placeholder="9876543210" maxlength="10"
											onkeypress="return Number(event,this);"
											onmouseover="showTooltip('tooltip_id','inp_id3');"
											onmouseout="hideTooltip('tooltip_id');" value="" /><br>
											<span id="telephoneerror" style="color: red"></span><span
											class="err"><form:errors path="Customers.telephone"></form:errors></span></td>

									</tr>
									<tr class="row2">
										<td valign="middle" align="left" class="input_txt" width="20%">
											State :</td>
										<td valign="top" align="left" class="input_txt" width="20%"><input
											type="text" name="state" class="input_txtbx" id="inp_state"
											maxlength="32" onkeypress="return Alphabets(event,this);"
											onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"
											onmouseover="showTooltip('tooltip_id','inp_id3');"
											onmouseout="hideTooltip('tooltip_id');" value="" /><br>
											<span id="stateerror" style="color: red"></span><span
											class="err"><form:errors path="Customers.state"></form:errors></span></td>
										<td valign="middle" align="left" class="input_txt" width="20%">Fax
											:</td>
										<td valign="top" align="left" class="input_txt" width="20%"><input
											type="text" name="fax" class="input_txtbx" id="inp_fax"
											maxlength="10" placeholder="6143229928"
											onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"
											onkeypress="return Number(event,this);"
											onmouseover="showTooltip('tooltip_id','inp_id3');"
											onmouseout="hideTooltip('tooltip_id');" value="" /><br>
											<span id="faxerror" style="color: red"></span> <span
											class="err"><form:errors path="Customers.fax"></form:errors></span></td>

									</tr>
									<tr class="row1">
										<td valign="middle" align="left" class="input_txt" width="20%">Country
											:</td>
										<td valign="top" align="left" class="input_txt" width="20%"><input
											type="text" name="country" class="input_txtbx"
											onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"
											id="inp_country" maxlength="32"
											onkeypress="return Alphabets(event,this);"
											onmouseover="showTooltip('tooltip_id','inp_id3');"
											onmouseout="hideTooltip('tooltip_id');" value="" /><br>
											<span id="countryerror" style="color: red"></span><span
											class="err"><form:errors path="Customers.country"></form:errors></span></td>
										<td valign="middle" align="left" class="input_txt" width="20%">Email
											:</td>
										<td valign="top" align="left" class="input_txt" width="20%"><input
											type="text" name="email_address" class="input_txtbx"
											id="inp_email_address" maxlength="32"
											onmouseover="showTooltip('tooltip_id','inp_id3');"
											onmouseout="hideTooltip('tooltip_id');" value="" /><br>
											<span id="emailerror" style="color: red"></span><span
											class="err"><form:errors
													path="Customers.email_address"></form:errors></span></td>

									</tr>
									<tr class="row2">
										<td valign="middle" align="left" class="input_txt" width="20%">ZipCode
											:</td>
										<td valign="top" align="left" class="input_txt" width="20%"><input
											type="text" name="zipcode"
											onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"
											class="input_txtbx" id="inp_zipcode" placeholder="OH 43230"
											maxlength="8" onblur="ChangeCase(this);"
											onkeypress="return AlphabetsNumber1(event,this);"
											onmouseover="showTooltip('tooltip_id','inp_id3');"
											onmouseout="hideTooltip('tooltip_id');" value="" /><br>
											<span id="zipcodeerror" style="color: red"></span><span
											class="err"><form:errors path="Customers.zipcode"></form:errors></span></td>
									</tr>
									
									<!-- <tr class="row1">
										<td valign="bottom" colspan="4" align="right"
											style="padding-right: 107.8px;">&nbsp;<input
											type="submit" value="Submit" onclick="return validate();"
											class="submit_btn1"></td>

									</tr> -->
								</table>

							</div>
							<div style="display: none;" id="childsection">
								<div style="border: #993300 2px solid; padding: 15px; margin-bottom: 15px; margin-left: 10px;">
									<table cellpadding="0" cellspacing="0" border="0" width="100%">
											 <tr class="row1">
                 <td valign="middle" align="left" class="input_txt" width="30%"> Date of Feedback :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="date_of_feedback" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}" class="input_txtbx" id="datepicker" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /></br>
                  <span id="datepicker1" style="color:red"></span>
                  <span class="err"><form:errors path="Customers.date_of_feedback"></form:errors></span></td>
                  </tr>
                   <tr class="row2">
                 <td valign="middle" align="left" class="input_txt" width="30%"> Type of Feedback :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">
                  <select name="type_of_feedback" class="input_txtbx" id="typeoffeedback">
                   <option value="">- select -</option>
                  <option value="Complaint">Complaint</option>
                  <option value="Suggestion">Suggestion</option>
                  <option value="Product Return">Product return</option>                  
                  </select>
                  
                  <br/><span class="err" id="typeoffeedbackError" style="color:red"></span></td>
                  </tr>
                  <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="30%"> Feedback Recorded by :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">
                  <select name="feedback_recorded_by" class="input_txtbx">
                  <option value="name1">Associate name1</option>
                  <option value="name2">Associate name2</option>
                  <option value="name3">Associate name3</option>                  
                  </select>                  
                  <br/><span class="err"></span></td>
                  </tr>
                   <tr class="row2">
                 <td valign="top" align="left" class="input_txt" width="30%"> Feedback Details :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">
                  <textarea class="input_txtbx" name="feedback_details" id="id_feedback_details" style="height: 89px;"></textarea><br/>
                  <span id="feedbackdetailserror" style="color:red"></span>
                  <span class="err"><form:errors path="Customers.feedback_details"></form:errors></span></td>
                  </tr>
                  <tr class="row1">
                 <td valign="middle" align="left" class="input_txt" width="30%"> Attachments :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input name="attachments" id="image" type="file" /></br>
                  
                  <span id="imageerror" style="color:red"class="err"></span></td>
                  </tr>
                   
									</table>
								</div>
							</div>
						</div>
						<table id="hidebutton" style="float: right; margin-top: 20px;">
							<tr class="row1">
								<td valign="bottom" colspan="4" style="padding-right: 125px;"
									align="right">&nbsp;<input type="submit" value="Submit"
									onclick="return mainValidate();" class="submit_btn1"></td>
								<td valign="top" align="left"><input type="button"
									value="Enter Feedback Details" onclick="showchildsection();"
									class="submit_btn1" style="width: 350px;"></td>

							</tr>
						</table>
						<table id="showbutton"
							style="display: none; float: right; margin-top: 20px">
							<tr class="row1">
							<tr class="row1">
								<td valign="bottom" colspan="4" align="right">&nbsp;<input
									type="submit" value="Submit" onclick="return ValidateAll();"
									class="submit_btn1"></td>
								<td valign="top" align="left"><input type="button"
									value="Hide Enter Feedback Details"
									onclick="hidechildsection();" class="submit_btn1"
									style="width: 350px;"></td>

							</tr>
						</table>
					</div></td>
			</tr>
		</table>
	</div>
</form>
<script type="text/javascript">
 function showchildsection()
 {
	 document.getElementById('childsection').style.display="block";
	 document.getElementById('hidebutton').style.display="none";
	 document.getElementById('showbutton').style.display="block";
 }
 function hidechildsection()
 {
	 document.getElementById('childsection').style.display="none";
	 document.getElementById('hidebutton').style.display="block";
	 document.getElementById('showbutton').style.display="none";
 }
  </script>
<script>
	$(function() {

		$("#customername").on("keypress", function(e) {

			if (e.which === 32 && !this.value.length)
				e.preventDefault();
		});
	});

	$(function() {
		$("#inp_website").on("keypress", function(e) {

			if (e.which === 32 && !this.value.length)
				e.preventDefault();
		});
	});
	$(function() {
		$("#inp_contact_name").on("keypress", function(e) {

			if (e.which === 32 && !this.value.length)
				e.preventDefault();
		});
	});

	$(function() {
		$("#inp_address").on("keypress", function(e) {

			if (e.which === 32 && !this.value.length)
				e.preventDefault();
		});
	});
	$(function() {
		$("#inp_city").on("keypress", function(e) {

			if (e.which === 32 && !this.value.length)
				e.preventDefault();
		});
	});
	$(function() {
		$("#inp_title_of_contact").on("keypress", function(e) {

			if (e.which === 32 && !this.value.length)
				e.preventDefault();
		});
	});
	$(function() {
		$("#inp_state").on("keypress", function(e) {

			if (e.which === 32 && !this.value.length)
				e.preventDefault();
		});
	});
	$(function() {
		$("#inp_telephone").on("keypress", function(e) {

			if (e.which === 32 && !this.value.length)
				e.preventDefault();
		});
	});
	$(function() {
		$("#inp_country").on("keypress", function(e) {

			if (e.which === 32 && !this.value.length)
				e.preventDefault();
		});
	});
	$(function() {
		$("#inp_fax").on("keypress", function(e) {

			if (e.which === 32 && !this.value.length)
				e.preventDefault();
		});
	});
	$(function() {
		$("#inp_zipcode").on("keypress", function(e) {

			if (e.which === 32 && !this.value.length)
				e.preventDefault();
		});
	});
	$(function() {
		$("#inp_email_address").on("keypress", function(e) {

			if (e.which === 32 && !this.value.length)
				e.preventDefault();
		});
	});
</script>

<script type="text/javascript">
	function validate(event) {

		var regex = new RegExp("^[0-9]+$");
		var key = String.fromCharCode(event.charCode ? event.which
				: event.charCode);
		if (!regex.test(key)) {
			// document.getElementById("cmaerr").innerHTML="enter numerics or decimals only";
			event.preventDefault();
			return false;
		}
	}
</script>

<script>
	function Alphabets(e, t) {
		try {
			if (window.event) {
				var charCode = window.event.keyCode;
			} else if (e) {
				var charCode = e.which;
			} else {
				return true;
			}
			if ((charCode > 64 && charCode < 91)
					|| (charCode > 96 && charCode < 123) || (charCode == 32))
				return true;
			else
				return false;
		} catch (err) {
			alert(err.Description);
		}
	}

	function Number(e, t) {
		try {
			if (window.event) {
				var charCode = window.event.keyCode;
			} else if (e) {
				var charCode = e.which;
			} else {
				return true;
			}
			if ((charCode > 47 && charCode < 58))
				return true;
			else
				return false;
		} catch (err) {
			alert(err.Description);
		}
	}

	function AlphabetsNumber1(e, t) {
		try {

			if (window.event) {
				var charCode = window.event.keyCode;
			} else if (e) {
				var charCode = e.which;
			}

			else {
				return true;
			}
			/*  if(t.value.substring(0,1))
			 	{
			 	alert()
			 	alert(e.which);
			 	} */
			if (t.value.length < 2) {
				if ((charCode > 64 && charCode < 91)
						|| (charCode > 96 && charCode < 123))
					return true;
				else
					return false;
			}
			if (t.value.length == 2) {

				t.value += " ";
			}

			if (t.value.length >= 2) {

				if ((charCode > 47 && charCode < 58))
					return true;
				else
					return false;

			}
		} catch (err) {
			alert(err.Description);
		}
	}

	function AlphabetsNumber(e, t) {
		try {
			if (window.event) {
				var charCode = window.event.keyCode;
			} else if (e) {
				var charCode = e.which;
			} else {
				return true;
			}
			if ((charCode > 64 && charCode < 91)
					|| (charCode > 96 && charCode < 123)
					|| (charCode > 47 && charCode < 58))
				return true;
			else
				return false;
		} catch (err) {
			alert(err.Description);
		}
	}
</script>
<script type="text/javascript">
	function validatename(id) {

		var textInput = document.getElementById(id).value;
		textInput = textInput.replace(/[^A-Za-z ]/g, "");
		document.getElementById(id).value = textInput;
	}
	function validatename1(id) {

		var textInput = document.getElementById(id).value;
		textInput = textInput.replace(/[ ]/g, "");
		document.getElementById(id).value = textInput;
	}
	function validatename2(id) {

		var textInput = document.getElementById(id).value;
		textInput = textInput.replace(/[^A-Za-z0-9 ]/g, "");
		document.getElementById(id).value = textInput;
	}

	function validatename55(id) {

		var textInput = document.getElementById(id).value;
		textInput = textInput.replace(/[^0-9]/g, "");
		document.getElementById(id).value = textInput;
	}
</script>

<script type="text/javascript">
	function validate(event) {

		var regex = new RegExp("^[0-9]+$");
		var key = String.fromCharCode(event.charCode ? event.which
				: event.charCode);
		if (!regex.test(key)) {
			// document.getElementById("cmaerr").innerHTML="enter numerics or decimals only";
			event.preventDefault();
			return false;
		}
	}
</script>
 <script>
 $(function() {
           $( "#datepicker" ).datepicker();
         });
 
</script>
<script>
	function ChangeCase(elem) {
		elem.value = elem.value.toUpperCase();
	}
</script>
<script>
	function validatefax() {
		var textInput = document.getElementById("inp_fax").value;
		textInput = textInput.replace(/[^0-9]/g, "");
		document.getElementById("inp_fax").value = textInput;
	}
</script>
<script type="text/javascript">
	function validateblur() {

		document.getElementById("customernameerror").innerHTML = " ";

		if (document.getElementById("customername").value == "") {
			document.getElementById("customernameerror").innerHTML = "Required field should not be empty";

			return false;
		}

		document.getElementById("customernameerror").innerHTML = "";
		if (document.getElementById("customername").value.length < 4
				|| document.getElementById("customername").value.length >= 32) {

			document.getElementById("customernameerror").innerHTML = "Name should be length of 4 to 32";

			return false;
		}

		document.getElementById("websiteerror").innerHTML = " ";

		if (document.getElementById("inp_website").value == "") {
			document.getElementById("websiteerror").innerHTML = "Required field should not be empty";

			return false;
		}

		document.getElementById("websiteerror").innerHTML = " ";
		var website = /(ftp|http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/;

		if (document.getElementById("inp_website").value.match(website) == null) {
			document.getElementById("websiteerror").innerHTML = "Invalid URL format";

			return false;
		}

		document.getElementById("contactnameerror").innerHTML = " ";

		if (document.getElementById("inp_contact_name").value == "") {
			document.getElementById("contactnameerror").innerHTML = "Required field should not be empty";

			return false;
		}

		document.getElementById("contactnameerror").innerHTML = "";
		if (document.getElementById("inp_contact_name").value.length < 4
				|| document.getElementById("inp_contact_name").value.length >= 32) {

			document.getElementById("contactnameerror").innerHTML = "Name should be length of 4 to 32";

			return false;
		}

		document.getElementById("addresserror").innerHTML = " ";

		if (document.getElementById("inp_address").value == "") {
			document.getElementById("addresserror").innerHTML = "Required field should not be empty";

			return false;
		}

		document.getElementById("addresserror").innerHTML = "";
		if (document.getElementById("inp_address").value.length < 4
				|| document.getElementById("inp_address").value.length > 400) {

			document.getElementById("addresserror").innerHTML = "Required field should be length of 4 to 400";

			return false;
		}
		document.getElementById("cityerror").innerHTML = " ";

		if (document.getElementById("inp_city").value == "") {
			document.getElementById("cityerror").innerHTML = "Required field should not be empty";

			return false;
		}

		document.getElementById("cityerror").innerHTML = "";
		if (document.getElementById("inp_city").value.length < 4
				|| document.getElementById("inp_city").value.length >= 32) {

			document.getElementById("cityerror").innerHTML = "Required field should be length of 4 to 32";

			return false;
		}

		document.getElementById("contacterror").innerHTML = " ";

		if (document.getElementById("inp_title_of_contact").value == "") {
			document.getElementById("contacterror").innerHTML = "Required field should not be empty";

			return false;
		}

		document.getElementById("contacterror").innerHTML = "";
		if (document.getElementById("inp_title_of_contact").value.length < 4
				|| document.getElementById("inp_title_of_contact").value.length >= 32) {

			document.getElementById("contacterror").innerHTML = "Required field should be length of 4 to 32";

			return false;
		}

		document.getElementById("stateerror").innerHTML = " ";

		if (document.getElementById("inp_state").value == "") {
			document.getElementById("stateerror").innerHTML = "Required field should not be empty";

			return false;
		}

		document.getElementById("stateerror").innerHTML = "";
		if (document.getElementById("inp_state").value.length < 4
				|| document.getElementById("inp_state").value.length >= 32) {

			document.getElementById("stateerror").innerHTML = "Required field should be length of 4 to 32";

			return false;
		}

		document.getElementById("telephoneerror").innerHTML = " ";

		if (document.getElementById("inp_telephone").value == "") {
			document.getElementById("telephoneerror").innerHTML = "Required field should not be empty";

			return false;
		}
		document.getElementById("telephoneerror").innerHTML = " ";
		var mobile = /(\W|^)[(]{0,1}\d{3}[)]{0,1}[\s-]{0,1}\d{3}[\s-]{0,1}\d{4}(\W|$)/;

		if (document.getElementById("inp_telephone").value.match(mobile) == null) {
			document.getElementById("telephoneerror").innerHTML = "Invalid phone number format";

			return false;
		}

		document.getElementById("telephoneerror").innerHTML = "";
		var txt1 = document.getElementById("inp_telephone").value;

		if (txt1 == 0000000000 && txt1 == 1111111111) {
			document.getElementById("telephoneerror").innerHTML = "Invalid phone number format";

			return false;
		}

		document.getElementById("countryerror").innerHTML = " ";

		if (document.getElementById("inp_country").value == "") {
			document.getElementById("countryerror").innerHTML = "Required field should not be empty";

			return false;
		}

		document.getElementById("countryerror").innerHTML = "";
		if (document.getElementById("inp_country").value.length < 4
				|| document.getElementById("inp_country").value.length >= 32) {

			document.getElementById("countryerror").innerHTML = "Required field should be length of 4 to 32";

			return false;
		}
		document.getElementById("faxerror").innerHTML = " ";

		if (document.getElementById("inp_fax").value == "") {
			document.getElementById("faxerror").innerHTML = "Required field should not be empty";

			return false;
		}
		document.getElementById("faxerror").innerHTML = " ";
		var faxreg = /\+1(|\.|\-)[2-9][0-9]{2}(|\.|\-)[0-9]{3}(|\.|\-)[0-9]{4}/;
		if (document.getElementById("inp_fax").value.match(faxreg) == null) {
			document.getElementById("faxerror").innerHTML = "Invalid fax number format";

			return false;
		}

		document.getElementById("zipcodeerror").innerHTML = " ";

		if (document.getElementById("inp_zipcode").value == "") {
			document.getElementById("zipcodeerror").innerHTML = "Required field should not be empty";

			return false;
		}

		/* document.getElementById("zipcodeerror").innerHTML=" ";
		var zipcode =/^\d{5}$|^\d{5}-\d{4}$/;
		
		    if(document.getElementById("inp_zipcode").value.match(zipcode)==null)
		    {
		    	document.getElementById("zipcodeerror").innerHTML="Invalid Zip Format";
		    	
		    	 return false;
		    } */

		document.getElementById("zipcodeerror").innerHTML = "";
		if (document.getElementById("inp_zipcode").value.length < 5) {
			document.getElementById("zipcodeerror").innerHTML = "Zipcode format should be 5Numbers";

			return false;

		}

		var txt1 = document.getElementById("inp_zipcode").value;
		if (txt1 == 00000) {
			document.getElementById("zipcodeerror").innerHTML = "Invalid Zipcode format ";

			return false;
		}
		var txt2 = txt1.substring(1, 3);

		if (txt2 == 000) {
			document.getElementById("zipcodeerror").innerHTML = "Invalid Zipcode format ";

			return false;
		}

		document.getElementById("emailerror").innerHTML = " ";

		if (document.getElementById("inp_email_address").value == "") {
			document.getElementById("emailerror").innerHTML = "Required Field Should not be Empty";

			return false;
		}

		var mail = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,3}$/;

		if (document.getElementById("inp_email_address").value.match(mail) == null) {
			document.getElementById("emailerror").innerHTML = "Invalid E-Mail Format";

			return false;
		}

	}
</script>
<script type="text/javascript">
	function validate(event) {

		var regex = new RegExp("^[0-9]+$");
		var key = String.fromCharCode(event.charCode ? event.which
				: event.charCode);
		if (!regex.test(key)) {
			// document.getElementById("cmaerr").innerHTML="enter numerics or decimals only";
			event.preventDefault();
			return false;
		}
	}
</script>

<!--    <script type="text/javascript">
$(function() {
$('#Submit').click(function() {
var txt = $('#inp_website').val();
var re = /(http(s)?:\\)?([\w-]+\.)+[\w-]+[.com|.in|.org]+(\[\?%&=]*)?/
if (re.test(txt)) {
alert('Valid URL');
}
else {
alert('Please Enter Valid URL');
return false;
}
});
});
</script> -->
<script>
	i = 0;
	$(document).ready(function() {
		$("#inp_fax").blur(function() {
			var phone = document.getElementById("inp_fax").value;
			phone = phone.replace(/(\d{3})(\d{3})(\d{4})/, '$1-$2-$3');
			document.getElementById("inp_fax").value = phone;
		});
		$("#inp_fax").focus(function() {

			var phone = document.getElementById("inp_fax").value;

			phone = phone.replace("-", "");
			phone = phone.replace("-", "");
			document.getElementById("inp_fax").value = phone;
		});
		$("#inp_telephone").blur(function() {
			var mobile = document.getElementById("inp_telephone").value;
			mobile = mobile.replace(/(\d{3})(\d{3})(\d{4})/, '$1-$2-$3');
			document.getElementById("inp_telephone").value = mobile;
		});
		$("#inp_telephone").focus(function() {

			var mobile = document.getElementById("inp_telephone").value;
			mobile = mobile.replace("-", "");
			mobile = mobile.replace("-", "");
			document.getElementById("inp_telephone").value = mobile;
		});
	});
</script>
<script>
$(function() {

	$("#id_feedback_details").on("keypress", function(e) {
		
		if (e.which === 32 && !this.value.length)
	        e.preventDefault();
	});
	});
	</script>
<script>
$(function() {
	$("#id_feedback_details").on("keypress", function(e) {
	
	if (e.which === 32 && !this.value.length)
        e.preventDefault();
});
});
function validatename1(id){
	
    var textInput = document.getElementById(id).value;
    textInput = textInput.replace(/[ ]/g, "");
    document.getElementById(id).value = textInput;
}  

</script>
<!--  <script>
i=0;
$(document).ready(function(){
$("#inp_zipcode").keypress(function(){
var zipcode=document.getElementById("inp_zipcode").value;
zipcode = zipcode.replace(/(\d{2})(\d{1})(\d{5})/,'$1-$2-$3');
document.getElementById("inp_fax").value=zipcode;
 });  

</script> -->

<script type="text/javascript">
	function validate(event) {

		var regex = new RegExp("^[0-9]+$");
		var key = String.fromCharCode(event.charCode ? event.which
				: event.charCode);
		if (!regex.test(key)) {
			// document.getElementById("cmaerr").innerHTML="enter numerics or decimals only";
			event.preventDefault();
			return false;
		}
	}
</script>

<script type="text/javascript">
	function mainValidate() {

		var error = "";
		/* var website = /(ftp|http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/; */
		//var mail = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,3}$/;
		var website = /^[a-zA-Z0-9]+[a-zA-Z0-9.-]+\.[a-zA-Z]{2,3}$/;
		//  var website = /(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/;
		var mobile = /(\W|^)[(]{0,1}\d{3}[)]{0,1}[\s-]{0,1}\d{3}[\s-]{0,1}\d{4}(\W|$)/;
		var mail = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,3}$/;

		var faxreg = /^\(?([0-9]{3})\)?[-]?([0-9]{3})[-]?([0-9]{4})$/;
		// var faxreg = /\+1(|\.|\-)[2-9][0-9]{2}(|\.|\-)[0-9]{3}(|\.|\-)[0-9]{4}/;
		// var zipcode =/^\d{5}$|^\d{5}-\d{4}$/;
		var customername = document.getElementById('customername').value;
		var inp_website = document.getElementById('inp_website').value;
		var inp_contact_name = document.getElementById('inp_contact_name').value;
		var address = document.getElementById('inp_address').value;
		var city = document.getElementById('inp_city').value;
		var contact = document.getElementById('inp_title_of_contact').value;
		var state = document.getElementById('inp_state').value;
		var telephone = document.getElementById('inp_telephone').value;
		var country = document.getElementById('inp_country').value;
		var fax = document.getElementById('inp_fax').value;
		var inpzipcode = document.getElementById('inp_zipcode').value;
		var emailaddress = document.getElementById('inp_email_address').value;
		if (customername == "") {
			document.getElementById("customernameerror").innerHTML = "Required field should not be empty";
			error = "true";
		} else if (customername.charAt(0) == " ") {
			document.getElementById("customernameerror").innerHTML = "Should not accept initial space";
			error = "true";
		} else if ((customername.length < 4) || (customername.length > 32)) {
			document.getElementById("customernameerror").innerHTML = "Required field should be length of 4 to 32";
			error = "true";
		} else {
			document.getElementById("customernameerror").innerHTML = "";
		}

		if (inp_website == "") {
			document.getElementById("websiteerror").innerHTML = "Required field should not be empty";
			error = "true";
		} else if (inp_website.charAt(0) == " ") {
			document.getElementById("websiteerror").innerHTML = "Should not accept initial space";
			error = "true";
		} else if (inp_website.match(website)) {

			document.getElementById("websiteerror").innerHTML = "";
		}

		else {
			document.getElementById("websiteerror").innerHTML = "Invalid URL Format";
			error = "true";
		}

		if (address == "") {
			document.getElementById("addresserror").innerHTML = "Required field should not be empty";
			error = "true";
		} else if (address.charAt(0) == " ") {
			document.getElementById("addresserror").innerHTML = "Should not accept initial space";
			error = "true";
		} else if ((address.length < 4) || (address.length > 400)) {
			document.getElementById("addresserror").innerHTML = "Required field should be length of 4 to 400";
			error = "true";
		} else {
			document.getElementById("addresserror").innerHTML = "";
		}

		if (inp_contact_name == "") {
			document.getElementById("contactnameerror").innerHTML = "Required field should not be empty";
			error = "true";
		} else if (inp_contact_name.charAt(0) == " ") {
			document.getElementById("contactnameerror").innerHTML = "Should not accept initial space";
			error = "true";
		} else if ((inp_contact_name.length < 4)
				|| (inp_contact_name.length > 32)) {
			document.getElementById("contactnameerror").innerHTML = "Required field should be length of 4 to 32";
			error = "true";
		} else {
			document.getElementById("contactnameerror").innerHTML = "";
		}

		if (city == "") {
			document.getElementById("cityerror").innerHTML = "Required field should not be empty";
			error = "true";
		} else if (city.charAt(0) == " ") {
			document.getElementById("cityerror").innerHTML = "Should not accept initial space";
			error = "true";
		} else if ((city.length < 4) || (city.length > 32)) {
			document.getElementById("cityerror").innerHTML = "Required field should be length of 4 to 32";
			error = "true";
		} else {
			document.getElementById("cityerror").innerHTML = "";
		}

		if (contact == "") {
			document.getElementById("contacterror").innerHTML = "Required field should not be empty";
			error = "true";
		} else if (contact.charAt(0) == " ") {
			document.getElementById("contacterror").innerHTML = "Should not accept initial space";
			error = "true";
		} else if ((contact.length < 4) || (contact.length > 32)) {
			document.getElementById("contacterror").innerHTML = "Required field should be Length of 4 to 32";
			error = "true";
		} else {
			document.getElementById("contacterror").innerHTML = "";
		}

		if (state == "") {
			document.getElementById("stateerror").innerHTML = "Required field should not be empty";
			error = "true";
		} else if (state.charAt(0) == " ") {
			document.getElementById("stateerror").innerHTML = "Should not accept initial space";
			error = "true";
		} else if ((state.length < 4) || (state.length > 32)) {
			document.getElementById("stateerror").innerHTML = "Required field should be length of 4 to 32";
			error = "true";
		} else {
			document.getElementById("stateerror").innerHTML = "";
		}

		if (telephone == "") {
			document.getElementById("telephoneerror").innerHTML = "Required field should not be empty";
			error = "true";
		} else if (telephone.charAt(0) == " ") {
			document.getElementById("telephoneerror").innerHTML = "Should not accept initial space";
			error = "true";
		}

		else if (telephone.length < 10) {
			document.getElementById("stateerror").innerHTML = "Required field should be length of 4 to 32";
			error = "true";
		}
		/*   else if (!(telephone.charAt(0)=="9" || telephone.charAt(0)=="8" || telephone.charAt(0)=="7"))
		  {
		       //alert("Mobile No. should start with 9 or 8 or 7");
		       document.getElementById("telephoneerror").innerHTML="Telephone number should start with 9 or 8 or 7";
		   	error="true";
		  } */

		else if (telephone.match(mobile)) {
			if ((telephone == "0000000000")) {
				document.getElementById("telephoneerror").innerHTML = "Invalid number format";
				error = "true";
			} else {
				document.getElementById("telephoneerror").innerHTML = "";
			}
		} else {
			document.getElementById("telephoneerror").innerHTML = "Required field should contain 10 digits";
			error = "true";
		}

		if (country == "") {
			document.getElementById("countryerror").innerHTML = "Required field should not be empty";
			error = "true";
		} else if (country.charAt(0) == " ") {
			document.getElementById("countryerror").innerHTML = "Should not accept initial space";
			error = "true";
		} else if ((country.length < 4) || (country.length > 32)) {
			document.getElementById("countryerror").innerHTML = "Required field should be length of 4 to 32";
			error = "true";
		} else {
			document.getElementById("countryerror").innerHTML = "";
		}

		if (fax == "") {
			document.getElementById("faxerror").innerHTML = "Required field should not be empty";
			error = "true";
		} else if (fax.charAt(0) == " ") {
			document.getElementById("faxerror").innerHTML = "Should not accept initial space";
			error = "true";
		} else if (fax.match(faxreg)) {
			document.getElementById("faxerror").innerHTML = "";

		}

		else {

			document.getElementById("faxerror").innerHTML = "Invalid fax number";
			error = "true";
		}

		if (inpzipcode == "") {
			document.getElementById("zipcodeerror").innerHTML = "Required field should not be empty";
			error = "true";
		} else if (inpzipcode.charAt(0) == " ") {
			document.getElementById("zipcodeerror").innerHTML = "Should not accept initial space";
			error = "true";
		}

		else if ((inpzipcode.length < 4) || (inpzipcode.length > 8))

		{
			document.getElementById("zipcodeerror").innerHTML = "Required field should be length of 4 to 8";
			error = "true";
		}

		else {
			document.getElementById("zipcodeerror").innerHTML = "";

		}

		if (emailaddress == "") {
			document.getElementById("emailerror").innerHTML = "Required field should not be empty";
			error = "true";
		} else if (emailaddress.charAt(0) == " ") {
			document.getElementById("emailerror").innerHTML = "Should not accept initial space";
			error = "true";
		} else if (emailaddress.match(mail)) {

			document.getElementById("emailerror").innerHTML = "";

		}

		else {
			document.getElementById("emailerror").innerHTML = "Invalid email format";
			error = "true";
		}

		if (error == "true") {

			return false;
		}

	}



	function ValidateAll() {

		var error = "";
		/* var website = /(ftp|http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/; */
		//var mail = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,3}$/;
		var website = /^[a-zA-Z0-9]+[a-zA-Z0-9.-]+\.[a-zA-Z]{2,3}$/;
		//  var website = /(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/;
		var mobile = /(\W|^)[(]{0,1}\d{3}[)]{0,1}[\s-]{0,1}\d{3}[\s-]{0,1}\d{4}(\W|$)/;
		var mail = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,3}$/;

		var faxreg = /^\(?([0-9]{3})\)?[-]?([0-9]{3})[-]?([0-9]{4})$/;
		// var faxreg = /\+1(|\.|\-)[2-9][0-9]{2}(|\.|\-)[0-9]{3}(|\.|\-)[0-9]{4}/;
		// var zipcode =/^\d{5}$|^\d{5}-\d{4}$/;
		var customername = document.getElementById('customername').value;
		var inp_website = document.getElementById('inp_website').value;
		var inp_contact_name = document.getElementById('inp_contact_name').value;
		var address = document.getElementById('inp_address').value;
		var city = document.getElementById('inp_city').value;
		var contact = document.getElementById('inp_title_of_contact').value;
		var state = document.getElementById('inp_state').value;
		var telephone = document.getElementById('inp_telephone').value;
		var country = document.getElementById('inp_country').value;
		var fax = document.getElementById('inp_fax').value;
		var inpzipcode = document.getElementById('inp_zipcode').value;
		var emailaddress = document.getElementById('inp_email_address').value;
		var date = /^(0?[1-9]|1[012])[\/](0?[1-9]|[12][0-9]|3[01])[\/]\d{4}$/;	
		var datepicker123 = document.getElementById('datepicker').value;
		var feedbackdetails = document.getElementById('id_feedback_details').value;
		var typeoffeedback = document.getElementById('typeoffeedback').value;
		var image = document.getElementById('image').value;
		if(typeoffeedback == "")
			{
			document.getElementById("typeoffeedbackError").innerHTML = "Required field should not be empty";
			error = "true";
			}
		else{
			document.getElementById("typeoffeedbackError").innerHTML = "";
			}
		if (customername == "") {
			document.getElementById("customernameerror").innerHTML = "Required field should not be empty";
			error = "true";
		} else if (customername.charAt(0) == " ") {
			document.getElementById("customernameerror").innerHTML = "Should not accept initial space";
			error = "true";
		} else if ((customername.length < 4) || (customername.length > 32)) {
			document.getElementById("customernameerror").innerHTML = "Required field should be length of 4 to 32";
			error = "true";
		} else {
			document.getElementById("customernameerror").innerHTML = "";
		}

		if (inp_website == "") {
			document.getElementById("websiteerror").innerHTML = "Required field should not be empty";
			error = "true";
		} else if (inp_website.charAt(0) == " ") {
			document.getElementById("websiteerror").innerHTML = "Should not accept initial space";
			error = "true";
		} else if (inp_website.match(website)) {

			document.getElementById("websiteerror").innerHTML = "";
		}

		else {
			document.getElementById("websiteerror").innerHTML = "Invalid URL Format";
			error = "true";
		}

		if (address == "") {
			document.getElementById("addresserror").innerHTML = "Required field should not be empty";
			error = "true";
		} else if (address.charAt(0) == " ") {
			document.getElementById("addresserror").innerHTML = "Should not accept initial space";
			error = "true";
		} else if ((address.length < 4) || (address.length > 400)) {
			document.getElementById("addresserror").innerHTML = "Required field should be length of 4 to 400";
			error = "true";
		} else {
			document.getElementById("addresserror").innerHTML = "";
		}

		if (inp_contact_name == "") {
			document.getElementById("contactnameerror").innerHTML = "Required field should not be empty";
			error = "true";
		} else if (inp_contact_name.charAt(0) == " ") {
			document.getElementById("contactnameerror").innerHTML = "Should not accept initial space";
			error = "true";
		} else if ((inp_contact_name.length < 4)
				|| (inp_contact_name.length > 32)) {
			document.getElementById("contactnameerror").innerHTML = "Required field should be length of 4 to 32";
			error = "true";
		} else {
			document.getElementById("contactnameerror").innerHTML = "";
		}

		if (city == "") {
			document.getElementById("cityerror").innerHTML = "Required field should not be empty";
			error = "true";
		} else if (city.charAt(0) == " ") {
			document.getElementById("cityerror").innerHTML = "Should not accept initial space";
			error = "true";
		} else if ((city.length < 4) || (city.length > 32)) {
			document.getElementById("cityerror").innerHTML = "Required field should be length of 4 to 32";
			error = "true";
		} else {
			document.getElementById("cityerror").innerHTML = "";
		}

		if (contact == "") {
			document.getElementById("contacterror").innerHTML = "Required field should not be empty";
			error = "true";
		} else if (contact.charAt(0) == " ") {
			document.getElementById("contacterror").innerHTML = "Should not accept initial space";
			error = "true";
		} else if ((contact.length < 4) || (contact.length > 32)) {
			document.getElementById("contacterror").innerHTML = "Required field should be Length of 4 to 32";
			error = "true";
		} else {
			document.getElementById("contacterror").innerHTML = "";
		}

		if (state == "") {
			document.getElementById("stateerror").innerHTML = "Required field should not be empty";
			error = "true";
		} else if (state.charAt(0) == " ") {
			document.getElementById("stateerror").innerHTML = "Should not accept initial space";
			error = "true";
		} else if ((state.length < 4) || (state.length > 32)) {
			document.getElementById("stateerror").innerHTML = "Required field should be length of 4 to 32";
			error = "true";
		} else {
			document.getElementById("stateerror").innerHTML = "";
		}

		if (telephone == "") {
			document.getElementById("telephoneerror").innerHTML = "Required field should not be empty";
			error = "true";
		} else if (telephone.charAt(0) == " ") {
			document.getElementById("telephoneerror").innerHTML = "Should not accept initial space";
			error = "true";
		}

		else if (telephone.length < 10) {
			document.getElementById("stateerror").innerHTML = "Required field should be length of 4 to 32";
			error = "true";
		}
		/*   else if (!(telephone.charAt(0)=="9" || telephone.charAt(0)=="8" || telephone.charAt(0)=="7"))
		  {
		       //alert("Mobile No. should start with 9 or 8 or 7");
		       document.getElementById("telephoneerror").innerHTML="Telephone number should start with 9 or 8 or 7";
		   	error="true";
		  } */

		else if (telephone.match(mobile)) {
			if ((telephone == "0000000000")) {
				document.getElementById("telephoneerror").innerHTML = "Invalid number format";
				error = "true";
			} else {
				document.getElementById("telephoneerror").innerHTML = "";
			}
		} else {
			document.getElementById("telephoneerror").innerHTML = "Required field should contain 10 digits";
			error = "true";
		}

		if (country == "") {
			document.getElementById("countryerror").innerHTML = "Required field should not be empty";
			error = "true";
		} else if (country.charAt(0) == " ") {
			document.getElementById("countryerror").innerHTML = "Should not accept initial space";
			error = "true";
		} else if ((country.length < 4) || (country.length > 32)) {
			document.getElementById("countryerror").innerHTML = "Required field should be length of 4 to 32";
			error = "true";
		} else {
			document.getElementById("countryerror").innerHTML = "";
		}

		if (fax == "") {
			document.getElementById("faxerror").innerHTML = "Required field should not be empty";
			error = "true";
		} else if (fax.charAt(0) == " ") {
			document.getElementById("faxerror").innerHTML = "Should not accept initial space";
			error = "true";
		} else if (fax.match(faxreg)) {
			document.getElementById("faxerror").innerHTML = "";

		}

		else {

			document.getElementById("faxerror").innerHTML = "Invalid fax number";
			error = "true";
		}

		if (inpzipcode == "") {
			document.getElementById("zipcodeerror").innerHTML = "Required field should not be empty";
			error = "true";
		} else if (inpzipcode.charAt(0) == " ") {
			document.getElementById("zipcodeerror").innerHTML = "Should not accept initial space";
			error = "true";
		}

		else if ((inpzipcode.length < 4) || (inpzipcode.length > 8))

		{
			document.getElementById("zipcodeerror").innerHTML = "Required field should be length of 4 to 8";
			error = "true";
		}

		else {
			document.getElementById("zipcodeerror").innerHTML = "";

		}

		if (emailaddress == "") {
			document.getElementById("emailerror").innerHTML = "Required field should not be empty";
			error = "true";
		} else if (emailaddress.charAt(0) == " ") {
			document.getElementById("emailerror").innerHTML = "Should not accept initial space";
			error = "true";
		} else if (emailaddress.match(mail)) {

			document.getElementById("emailerror").innerHTML = "";

		}

		else {
			document.getElementById("emailerror").innerHTML = "Invalid email format";
			error = "true";
		}
		 if(datepicker123 == "")
		 {
		 document.getElementById("datepicker1").innerHTML="Required field should not be empty";
		error="true";
		 
		 }
		 else if(datepicker123.match(date))
		 {
		 document.getElementById("datepicker1").innerHTML="";
		 }
		 else
		 {
		 document.getElementById("datepicker1").innerHTML="Invalid date format";
		 error="true";
		 }
		 
		 
		 if(feedbackdetails == "")
			 {
			 document.getElementById("feedbackdetailserror").innerHTML="Required field should not be empty";
				error="true";
			 }
		 else if(feedbackdetails.charAt(0) == " ")
			 {
			 document.getElementById("feedbackdetailserror").innerHTML="Should not accept initial space";
				error="true";
			 }
		 
		 else  if((feedbackdetails.length < 4) ||(feedbackdetails.length > 400))
		   {
			   document.getElementById("feedbackdetailserror").innerHTML="Required field should be length of 4 to 400";
		    	error="true";
				}
		 else
		 {
			 document.getElementById("feedbackdetailserror").innerHTML="";
		 }
		 
		 if(image == "")
			 {
			 //alert("no file");
			 document.getElementById("imageerror").innerHTML="Please upload a file";
				error="true";
			 }
		 else
			 {
			 //alert("file is there");
			 document.getElementById("imageerror").innerHTML="";
			 }

		if (error == "true") {

			return false;
		}

	}
	
</script>


<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<jsp:include page="footer.jsp"></jsp:include>
