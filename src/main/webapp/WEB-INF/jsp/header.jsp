<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>:: QMS ::</title>
  
		<script type="text/javascript" src="<c:url value="/resources/js/ddlevelsmenu.js" />"></script> 
		<script type="text/javascript" src="<c:url value="/resources/js/clock.js" />"></script>


<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet"
	type="text/css" />
	<link href="<c:url value="/resources/css/inner-clr.css" />"
	rel="stylesheet" type="text/css" />


<style type="text/css">
/* #######################################Sub menu@################## */
.menubuttonsub {
  text-decoration: none;
  color: #fff;
  padding: 5px;
  text-transform: uppercase;
  display: inline-block;
  text-shadow: -2px 2px 0 rgba(0, 0, 0, 0.2);
  font-weight: bold;
  padding-right: 50px;
  margin: 0px;
  -moz-transition: all 0.1s linear;
  -o-transition: all 0.1s linear;
  -webkit-transition: all 0.1s linear;
  transition: all 0.1s linear;
  -moz-transform: translateZ(0);
  -ms-transform: translateZ(0);
  -webkit-transform: translateZ(0);
  transform: translateZ(0);
  
  Kinda replicates keyline but looks dumb.
  @include filter(
    drop-shadow(0 1px 0 rgba(blue, 0.2))
    drop-shadow(0 -1px 0 rgba(blue, 0.2))
  );
 
}
.menubuttonsub.blue {
  color:#fff;
  background: -moz-linear-gradient(top, #939393, #d7d7d7);
  background: -webkit-linear-gradient(top, #939393, #d7d7d7);
  background: linear-gradient(to bottom, #939393, #d7d7d7);
  box-shadow: -1px 0px 1px #2F4F4F, 0px 1px 1px #54809d, -2px 1px 1px #2F4F4F, -1px 2px 1px #54809d, -3px 2px 1px #2F4F4F, -2px 3px 1px #2F4F4F, -4px 3px 1px #2F4F4F, -3px 4px 1px #54809d, -5px 4px 1px #2F4F4F, -4px 5px 1px #54809d, -6px 5px 1px #2F4F4F, -6px 7px 0 rgba(0, 0, 0, 0.05), -5px 8px 0 rgba(0, 0, 0, 0.05), -3px 9px 0 rgba(0, 0, 0, 0.04), -2px 10px 0 rgba(0, 0, 0, 0.04), -1px 11px 0 rgba(0, 0, 0, 0.03), 0px 12px 0 rgba(0, 0, 0, 0.03), 1px 13px 0 rgba(0, 0, 0, 0.02), 2px 14px 0 rgba(0, 0, 0, 0.02), 3px 15px 0 rgba(0, 0, 0, 0.01), 4px 16px 0 rgba(0, 0, 0, 0.01), 5px 17px 0 rgba(0, 0, 0, 0.01), 6px 18px 0 rgba(0, 0, 0, 0.01), inset 0 4px 5px -2px rgba(255, 255, 255, 0.5), inset 0 1px 0 0 rgba(0, 0, 0, 0.3);
}
.menubuttonsub.blueactive {
  color:#fff;
  background: -moz-linear-gradient(top, #000, #2F4F4F);
  background: -webkit-linear-gradient(top, #000, #2F4F4F);
  background: linear-gradient(to bottom, #000, #2F4F4F);
  box-shadow: -1px 0px 1px #2F4F4F, 0px 1px 1px #000, -2px 1px 1px #cccccc, -1px 2px 1px #000, -3px 2px 1px #cccccc, -2px 3px 1px #000, -4px 3px 1px #cccccc, -3px 4px 1px #000, -5px 4px 1px #cccccc, -4px 5px 1px #000, -6px 5px 1px #cccccc, -6px 7px 0 rgba(0, 0, 0, 0.05), -5px 8px 0 rgba(0, 0, 0, 0.05), -3px 9px 0 rgba(0, 0, 0, 0.04), -2px 10px 0 rgba(0, 0, 0, 0.04), -1px 11px 0 rgba(0, 0, 0, 0.03), 0px 12px 0 rgba(0, 0, 0, 0.03), 1px 13px 0 rgba(0, 0, 0, 0.02), 2px 14px 0 rgba(0, 0, 0, 0.02), 3px 15px 0 rgba(0, 0, 0, 0.01), 4px 16px 0 rgba(0, 0, 0, 0.01), 5px 17px 0 rgba(0, 0, 0, 0.01), 6px 18px 0 rgba(0, 0, 0, 0.01), inset 0 4px 5px -2px rgba(255, 255, 255, 0.5), inset 0 1px 0 0 rgba(0, 0, 0, 0.3);
}
.menubuttonsub.yellow {
  background: -moz-linear-gradient(top, #f2d851, #ecc92b);
  background: -webkit-linear-gradient(top, #f2d851, #ecc92b);
  background: linear-gradient(to bottom, #f2d851, #ecc92b);
  color: #fff;
  text-shadow: -2px 2px 0 rgba(255, 255, 255, 0.3);
  box-shadow: -1px 0px 1px #d9b826, 0px 1px 1px #b1961d, -2px 1px 1px #d9b826, -1px 2px 1px #b1961d, -3px 2px 1px #d9b826, -2px 3px 1px #b1961d, -4px 3px 1px #d9b826, -3px 4px 1px #b1961d, -5px 4px 1px #d9b826, -4px 5px 1px #b1961d, -6px 5px 1px #d9b826, -6px 7px 0 rgba(0, 0, 0, 0.05), -5px 8px 0 rgba(0, 0, 0, 0.05), -3px 9px 0 rgba(0, 0, 0, 0.04), -2px 10px 0 rgba(0, 0, 0, 0.04), -1px 11px 0 rgba(0, 0, 0, 0.03), 0px 12px 0 rgba(0, 0, 0, 0.03), 1px 13px 0 rgba(0, 0, 0, 0.02), 2px 14px 0 rgba(0, 0, 0, 0.02), 3px 15px 0 rgba(0, 0, 0, 0.01), 4px 16px 0 rgba(0, 0, 0, 0.01), 5px 17px 0 rgba(0, 0, 0, 0.01), 6px 18px 0 rgba(0, 0, 0, 0.01), inset 0 4px 5px -2px rgba(255, 255, 255, 0.5), inset 0 1px 0 0 rgba(0, 0, 0, 0.3);
}
.menubuttonsub.yellow:after, .menubuttonsub.yellow:before {
  background: black;
}
.menubuttonsub.yellow:after {
  -webkit-filter: drop-shadow(-2px 0 0 rgba(255, 255, 255, 0.4));
  filter: drop-shadow(-2px 0 0 rgba(255, 255, 255, 0.4));
}
.menubuttonsub.yellow:before {
  -webkit-filter: drop-shadow(0 -2px 0 rgba(255, 255, 255, 0.35));
  filter: drop-shadow(0 -2px 0 rgba(255, 255, 255, 0.35));
}
.menubuttonsub:active {
  box-shadow: none;
  -moz-transform: translate3d(-6px, 6px, 0);
  -ms-transform: translate3d(-6px, 6px, 0);
  -webkit-transform: translate3d(-6px, 6px, 0);
  transform: translate3d(-6px, 6px, 0);
}	
.menubuttonsub:hover {
  background: black;
}	

/* 

//End styles

##################################Style for button (3D)#########################
 */.buttonsub {
 width:200px;
  text-decoration: none;
  color: #fff;
  padding: 5px;
  text-transform: uppercase;
  display: inline-block;
  text-shadow: -2px 2px 0 rgba(0, 0, 0, 0.2);
  font-weight: bold;
  padding-right: 5px;
  margin: 0px;
  -moz-transition: all 0.1s linear;
  -o-transition: all 0.1s linear;
  -webkit-transition: all 0.1s linear;
  transition: all 0.1s linear;
  -moz-transform: translateZ(0);
  -ms-transform: translateZ(0);
  -webkit-transform: translateZ(0);
  transform: translateZ(0);
  
  Kinda replicates keyline but looks dumb.
  @include filter(
    drop-shadow(0 1px 0 rgba(blue, 0.2))
    drop-shadow(0 -1px 0 rgba(blue, 0.2))
  );
 
}
.buttonsub.blue {
  color:#fff;
  background: -moz-linear-gradient(top, #939393, #d7d7d7);
  background: -webkit-linear-gradient(top, #939393, #d7d7d7);
  background: linear-gradient(to bottom, #939393, #d7d7d7);
  box-shadow: -1px 0px 1px #2F4F4F, 0px 1px 1px #54809d, -2px 1px 1px #2F4F4F, -1px 2px 1px #54809d, -3px 2px 1px #2F4F4F, -2px 3px 1px #2F4F4F, -4px 3px 1px #2F4F4F, -3px 4px 1px #54809d, -5px 4px 1px #2F4F4F, -4px 5px 1px #54809d, -6px 5px 1px #2F4F4F, -6px 7px 0 rgba(0, 0, 0, 0.05), -5px 8px 0 rgba(0, 0, 0, 0.05), -3px 9px 0 rgba(0, 0, 0, 0.04), -2px 10px 0 rgba(0, 0, 0, 0.04), -1px 11px 0 rgba(0, 0, 0, 0.03), 0px 12px 0 rgba(0, 0, 0, 0.03), 1px 13px 0 rgba(0, 0, 0, 0.02), 2px 14px 0 rgba(0, 0, 0, 0.02), 3px 15px 0 rgba(0, 0, 0, 0.01), 4px 16px 0 rgba(0, 0, 0, 0.01), 5px 17px 0 rgba(0, 0, 0, 0.01), 6px 18px 0 rgba(0, 0, 0, 0.01), inset 0 4px 5px -2px rgba(255, 255, 255, 0.5), inset 0 1px 0 0 rgba(0, 0, 0, 0.3);
}
.buttonsub.blueactive {
  color:#fff;
  background: -moz-linear-gradient(top, #000, #2F4F4F);
  background: -webkit-linear-gradient(top, #000, #2F4F4F);
  background: linear-gradient(to bottom, #000, #2F4F4F);
  box-shadow: -1px 0px 1px #2F4F4F, 0px 1px 1px #000, -2px 1px 1px #cccccc, -1px 2px 1px #000, -3px 2px 1px #cccccc, -2px 3px 1px #000, -4px 3px 1px #cccccc, -3px 4px 1px #000, -5px 4px 1px #cccccc, -4px 5px 1px #000, -6px 5px 1px #cccccc, -6px 7px 0 rgba(0, 0, 0, 0.05), -5px 8px 0 rgba(0, 0, 0, 0.05), -3px 9px 0 rgba(0, 0, 0, 0.04), -2px 10px 0 rgba(0, 0, 0, 0.04), -1px 11px 0 rgba(0, 0, 0, 0.03), 0px 12px 0 rgba(0, 0, 0, 0.03), 1px 13px 0 rgba(0, 0, 0, 0.02), 2px 14px 0 rgba(0, 0, 0, 0.02), 3px 15px 0 rgba(0, 0, 0, 0.01), 4px 16px 0 rgba(0, 0, 0, 0.01), 5px 17px 0 rgba(0, 0, 0, 0.01), 6px 18px 0 rgba(0, 0, 0, 0.01), inset 0 4px 5px -2px rgba(255, 255, 255, 0.5), inset 0 1px 0 0 rgba(0, 0, 0, 0.3);
}
.buttonsub.yellow {
  background: -moz-linear-gradient(top, #f2d851, #ecc92b);
  background: -webkit-linear-gradient(top, #f2d851, #ecc92b);
  background: linear-gradient(to bottom, #f2d851, #ecc92b);
  color: #fff;
  text-shadow: -2px 2px 0 rgba(255, 255, 255, 0.3);
  box-shadow: -1px 0px 1px #d9b826, 0px 1px 1px #b1961d, -2px 1px 1px #d9b826, -1px 2px 1px #b1961d, -3px 2px 1px #d9b826, -2px 3px 1px #b1961d, -4px 3px 1px #d9b826, -3px 4px 1px #b1961d, -5px 4px 1px #d9b826, -4px 5px 1px #b1961d, -6px 5px 1px #d9b826, -6px 7px 0 rgba(0, 0, 0, 0.05), -5px 8px 0 rgba(0, 0, 0, 0.05), -3px 9px 0 rgba(0, 0, 0, 0.04), -2px 10px 0 rgba(0, 0, 0, 0.04), -1px 11px 0 rgba(0, 0, 0, 0.03), 0px 12px 0 rgba(0, 0, 0, 0.03), 1px 13px 0 rgba(0, 0, 0, 0.02), 2px 14px 0 rgba(0, 0, 0, 0.02), 3px 15px 0 rgba(0, 0, 0, 0.01), 4px 16px 0 rgba(0, 0, 0, 0.01), 5px 17px 0 rgba(0, 0, 0, 0.01), 6px 18px 0 rgba(0, 0, 0, 0.01), inset 0 4px 5px -2px rgba(255, 255, 255, 0.5), inset 0 1px 0 0 rgba(0, 0, 0, 0.3);
}
.buttonsub.yellow:after, .buttonsub.yellow:before {
  background: black;
}
.buttonsub.yellow:after {
  -webkit-filter: drop-shadow(-2px 0 0 rgba(255, 255, 255, 0.4));
  filter: drop-shadow(-2px 0 0 rgba(255, 255, 255, 0.4));
}
.buttonsub.yellow:before {
  -webkit-filter: drop-shadow(0 -2px 0 rgba(255, 255, 255, 0.35));
  filter: drop-shadow(0 -2px 0 rgba(255, 255, 255, 0.35));
}
.buttonsub:active {
  box-shadow: none;
  -moz-transform: translate3d(-6px, 6px, 0);
  -ms-transform: translate3d(-6px, 6px, 0);
  -webkit-transform: translate3d(-6px, 6px, 0);
  transform: translate3d(-6px, 6px, 0);
}	
.buttonsub:hover {
  background: black;
}	/* 
#################################### 3D button styles ends here################
  */
.ddsubmenustyle,.ddsubmenustyle ul {
	margin: 0;
	padding: 0;
	position: absolute;
	left: 0;
	top: 0;
	list-style-type: none;
	border: 1px solid #444;
	border-bottom: none;
	visibility: hidden;
	z-index: 100;
	font-size: 13px;
}

.ddsubmenustyle li {
	line-height: 28px;
	font-size: 13px;
}

.ddsubmenustyle li a {
	display: block;
	width: 160px;
	color: #0000;
	text-decoration: none;
	padding: 0 10px;
	background: #eee;
	border-bottom: 1px solid #68491B;
	font-size: 13px;
}

* html .ddsubmenustyle li { /*IE6 CSS hack*/
	display: inline-block;
	width: 140px; /*width of menu (include side paddings of LI A*/
}

.ddsubmenustyle li a:hover {
	background-color: #333333;
	border-bottom: 1px solid #ccc;
	color: #eee;
}

.downarrowpointer {
	/*CSS for "down" arrow image added to top menu items*/
	padding: 0;
	border: 0;
}

.rightarrowpointer {
	/*CSS for "right" arrow image added to drop down menu items*/
	position: absolute;
	padding-top: 3px;
	left: 100px;
	border: 0;
}

.ddiframeshim {
	position: absolute;
	z-index: 500;
	background: transparent;
	border-width: 0;
	width: 0;
	height: 0;
	display: block;
}
</style>
</head>
<body onload="javascript:startTime();">



	<div id="main" >
		<div id="header">
			<div class="logo">
				<a href="#"><img src="<c:url value="/resources/images/Qmslogo.png" />" alt="Company Logo" /></a>
			</div>
			<div class="top_link">
				<table border="0" cellspacing="0" cellpadding="0"
					style="padding: 0;">
					<tr>
						<td rowspan="2" align="right" valign="middle">&nbsp;</td>
						<td align="right" valign="middle"><div class="date">
								<span id="time" class="time"></span>
							</div></td>
					</tr>
					<tr>
						<td align="right" valign="middle"><span class="cart_txt">Welcome
								<sec:authentication property="principal.username" />&nbsp;&nbsp;|&nbsp;&nbsp;<a href="<c:url value="/j_spring_security_logout" />"><span class="cart_txt">Logout</span></a>
						</span></td>
					</tr>
				</table>
			</div>
			
			<div class="clear"></div>
			 <div id="ddtopmenubar">
				<div class="menu_container">
					<div class="menu_l"></div>
					<div class="menu_c">
						
						<div >
						  <ul class="menu" >
						  		<c:if test="${role==0}">
							
							<li>
							
								<a href="#" class="<c:choose>
								<c:when test="${menu=='admin'}">buttonsub blueactive</c:when><c:otherwise>buttonsub blue</c:otherwise></c:choose>">
									<span><img src="<c:url value="/resources/images/admin.png" />" alt="" style="padding:5px 5px 0 0;color:blue" />ADMIN SET-UP ROLES</span>
								</a>
							
							</li>
							<br>
							<li>
								<a href="view_referenceMaintenance" class="<c:choose>
								<c:when test="${menu=='maintenance'}">buttonsub blueactive</c:when><c:otherwise>buttonsub blue</c:otherwise></c:choose>">
									<span><img src="<c:url value="/resources/images/icon_07.png" />" alt="" style="padding:-5px 0px 0 0;" />Maintenance & Calibration</span>
								</a>
							</li>
				           <br>
				            <li>
								<a href="addsourcenc" class="<c:choose>
								<c:when test="${menu=='nonconformance'}">buttonsub blueactive</c:when><c:otherwise>buttonsub blue</c:otherwise></c:choose>">
									<span ><img src="<c:url value="/resources/images/icon_03.png" />" alt="" style="padding:5px 5px 0 0;" />Non Conformance</span>
								</a>
							</li>
				             <br>
				             <li>
								<a href="customersdelete" class="<c:choose>
								<c:when test="${menu=='customer'}">buttonsub blueactive</c:when><c:otherwise>buttonsub blue</c:otherwise></c:choose>">
									<span><img src="<c:url value="/resources/images/customer.png" />" alt="" style="padding:5px 5px 0 0;" />Customers</span>
								</a>
							</li>
				           <br>
				             
				             <li>
								<a href="employeesdelete" class="<c:choose>
								<c:when test="${menu=='employee'}">buttonsub blueactive</c:when><c:otherwise>buttonsub blue</c:otherwise></c:choose>">
									<span><img src="<c:url value="/resources/images/emploee.png" />" alt="" style="padding:5px 5px 0 0;" />Employees</span>
								</a>
							</li>
							 <br>
				            <li>
								<a href="add_prefixdocument" class="<c:choose>
								<c:when test="${menu=='document'}">buttonsub blueactive</c:when><c:otherwise>buttonsub blue</c:otherwise></c:choose>">
									<span><img src="<c:url value="/resources/images/document.png" />" alt="" style="padding:5px 5px 0 0;" />Documents Forms/Records </span>
								</a>
							</li>
				           
				             <br>
				            <li>
								<a href="internalauditsdelete" class="<c:choose>
								<c:when test="${menu=='audits'}">buttonsub blueactive</c:when><c:otherwise>buttonsub blue</c:otherwise></c:choose>">
									<span><img style="width:20px;height:20px;margin-top:2px;m" src="<c:url value="/resources/images/audit_black.png" />" alt=""  />Internal Audits</span>
								</a>
							</li>
				            <br>
				            
				              <li>
								<a href="correctiveactionsdelete" class="<c:choose>
								<c:when test="${menu=='corrective'}">buttonsub blueactive</c:when><c:otherwise>buttonsub blue</c:otherwise></c:choose>">
									<span><img src="<c:url value="/resources/images/corrective.png" />" alt="" style="padding:5px 5px 0 0;" />Corrective&amp;Preventive Actions</span>
								</a>
							</li>
				            <br>
				            <li>
								<a href="Addsuppliercategory" class="<c:choose>
								<c:when test="${menu=='supplier'}">buttonsub blueactive</c:when><c:otherwise>buttonsub blue</c:otherwise></c:choose>">
									<span><img src="<c:url value="/resources/images/suplier.png" />" alt="" style="padding:5px 5px 0 0;" />Supplier Performance</span>
								</a>
							</li>
							 <br>
							<li>
								<a href="managementdelete" class="<c:choose>
								<c:when test="${menu=='managementreview'}">buttonsub blueactive</c:when><c:otherwise>buttonsub blue</c:otherwise></c:choose>">
									<span><img src="<c:url value="/resources/images/icon_07.png" />" alt="" style="padding:5px 5px 0 0;" />Management Review</span>
								</a>
							</li>
							<br>
							<li>
								<a href="hrdelete" class="<c:choose>
								<c:when test="${menu=='hr'}">buttonsub blueactive</c:when><c:otherwise>buttonsub blue</c:otherwise></c:choose>">
									<span><img src="<c:url value="/resources/images/icon_07.png" />" alt="" style="padding:5px 5px 0 0;" />HR and Training</span>
								</a>
							</li>
							
							</c:if>
							<c:if test="${role==1}">
							
							<li>
								<a href="add_maintenance" class="<c:choose>
								<c:when test="${menu=='maintenance'}">buttonsub blueactive</c:when><c:otherwise>buttonsub blue</c:otherwise></c:choose>">
									<span><img src="<c:url value="/resources/images/icon_07.png" />" alt="" style="padding:-5px 0px 0 0;" />Maintenance & Calibration</span>
								</a>
							</li>
				           <br>
				            <li>
								<a href="add_nonconformance" class="<c:choose>
								<c:when test="${menu=='nonconformance'}">buttonsub blueactive</c:when><c:otherwise>buttonsub blue</c:otherwise></c:choose>">
									<span ><img src="<c:url value="/resources/images/icon_03.png" />" alt="" style="padding:5px 5px 0 0;" />Non Conformance</span>
								</a>
							</li>
				             <br>
				             <li>
								<a href="addcustomer" class="<c:choose>
								<c:when test="${menu=='customer'}">buttonsub blueactive</c:when><c:otherwise>buttonsub blue</c:otherwise></c:choose>">
									<span><img src="<c:url value="/resources/images/customer.png" />" alt="" style="padding:5px 5px 0 0;" />Customers</span>
								</a>
							</li>
				           <br>
				             
				             <li>
								<a href="addemployee" class="<c:choose>
								<c:when test="${menu=='employee'}">buttonsub blueactive</c:when><c:otherwise>buttonsub blue</c:otherwise></c:choose>">
									<span><img src="<c:url value="/resources/images/emploee.png" />" alt="" style="padding:5px 5px 0 0;" />Employees</span>
								</a>
							</li>
							 <br>
				            <li>
								<a href="documententry" class="<c:choose>
								<c:when test="${menu=='document'}">buttonsub blueactive</c:when><c:otherwise>buttonsub blue</c:otherwise></c:choose>">
									<span><img src="<c:url value="/resources/images/document.png" />" alt="" style="padding:5px 5px 0 0;" />Document Control</span>
								</a>
							</li>
				           <br>
				             
				            <li>
								<a href="view_internalaudits" class="<c:choose>
								<c:when test="${menu=='audits'}">buttonsub blueactive</c:when><c:otherwise>buttonsub blue</c:otherwise></c:choose>">
									<span><img style="width:20px;height:20px;margin-top:2px;m" src="<c:url value="/resources/images/audit_black.png" />" alt=""  />Internal Audits</span>
								</a>
							</li>
				           <br>
				               
				              <li>
								<a href="addcorrectiveAndPreventiveActions" class="<c:choose>
								<c:when test="${menu=='corrective'}">buttonsub blueactive</c:when><c:otherwise>buttonsub blue</c:otherwise></c:choose>">
									<span><img src="<c:url value="/resources/images/corrective.png" />" alt="" style="padding:5px 5px 0 0;" />Corrective&amp;Preventive Actions</span>
								</a>
							</li>
				             <br>
				            <li>
								<a href="add_supplierperformance" class="<c:choose>
								<c:when test="${menu=='supplier'}">buttonsub blueactive</c:when><c:otherwise>buttonsub blue</c:otherwise></c:choose>">
									<span><img src="<c:url value="/resources/images/suplier.png" />" alt="" style="padding:5px 5px 0 0;" />Supplier Performance</span>
								</a>
							</li>
							<br>
							<li>
								<a href="addmanagementreview" class="<c:choose>
								<c:when test="${menu=='managementreview'}">buttonsub blueactive</c:when><c:otherwise>buttonsub blue</c:otherwise></c:choose>">
									<span><img src="<c:url value="/resources/images/icon_07.png" />" alt="" style="padding:5px 5px 0 0;" />Management Review</span>
								</a>
							</li>
							<br>
							<li>
								<a href="addhr" class="<c:choose>
								<c:when test="${menu=='hr'}">buttonsub blueactive</c:when><c:otherwise>buttonsub blue</c:otherwise></c:choose>">
									<span><img src="<c:url value="/resources/images/icon_07.png" />" alt="" style="padding:5px 5px 0 0;" />HR and Training</span>
								</a>
							</li>
				            </c:if>
					<c:if test="${role==2}">
							
							<li>
								<a href="add_maintenance" class="<c:choose>
								<c:when test="${menu=='maintenance'}">buttonsub blueactive</c:when><c:otherwise>buttonsub blue</c:otherwise></c:choose>">
									<span><img src="<c:url value="/resources/images/icon_07.png" />" alt="" style="padding:-5px 0px 0 0;" />Maintenance & Calibration</span>
								</a>
							</li>
				           <br>
				            <li>
								<a href="add_nonconformance" class="<c:choose>
								<c:when test="${menu=='nonconformance'}">buttonsub blueactive</c:when><c:otherwise>buttonsub blue</c:otherwise></c:choose>">
									<span ><img src="<c:url value="/resources/images/icon_03.png" />" alt="" style="padding:5px 5px 0 0;" />Non Conformance</span>
								</a>
							</li>
				             <br>
				             <li>
								<a href="addcustomer" class="<c:choose>
								<c:when test="${menu=='customer'}">buttonsub blueactive</c:when><c:otherwise>buttonsub blue</c:otherwise></c:choose>">
									<span><img src="<c:url value="/resources/images/customer.png" />" alt="" style="padding:5px 5px 0 0;" />Customers</span>
								</a>
							</li>
				           <br>
				             
				             <li>
								<a href="addemployee" class="<c:choose>
								<c:when test="${menu=='employee'}">buttonsub blueactive</c:when><c:otherwise>buttonsub blue</c:otherwise></c:choose>">
									<span><img src="<c:url value="/resources/images/emploee.png" />" alt="" style="padding:5px 5px 0 0;" />Employees</span>
								</a>
							</li>
							 <br>
				            <li>
								<a href="documententry" class="<c:choose>
								<c:when test="${menu=='document'}">buttonsub blueactive</c:when><c:otherwise>buttonsub blue</c:otherwise></c:choose>">
									<span><img src="<c:url value="/resources/images/document.png" />" alt="" style="padding:5px 5px 0 0;" />Document Control</span>
								</a>
							</li>
				           <br>
				             
				            <li>
								<a href="addinternalaudits" class="<c:choose>
								<c:when test="${menu=='audits'}">buttonsub blueactive</c:when><c:otherwise>buttonsub blue</c:otherwise></c:choose>">
									<span><img style="width:20px;height:20px;margin-top:2px;m" src="<c:url value="/resources/images/audit_black.png" />" alt=""  />Internal Audits</span>
								</a>
							</li>
				           <br>
				               
				              <li>
								<a href="addcorrectiveAndPreventiveActions" class="<c:choose>
								<c:when test="${menu=='corrective'}">buttonsub blueactive</c:when><c:otherwise>buttonsub blue</c:otherwise></c:choose>">
									<span><img src="<c:url value="/resources/images/corrective.png" />" alt="" style="padding:5px 5px 0 0;" />Corrective&amp;Preventive Actions</span>
								</a>
							</li>
				             <br>
				            <li>
								<a href="add_supplierperformance" class="<c:choose>
								<c:when test="${menu=='supplier'}">buttonsub blueactive</c:when><c:otherwise>buttonsub blue</c:otherwise></c:choose>">
									<span><img src="<c:url value="/resources/images/suplier.png" />" alt="" style="padding:5px 5px 0 0;" />Supplier Performance</span>
								</a>
							</li>
							<br>
							<li>
								<a href="addmanagementreview" class="<c:choose>
								<c:when test="${menu=='managementreview'}">buttonsub blueactive</c:when><c:otherwise>buttonsub blue</c:otherwise></c:choose>">
									<span><img src="<c:url value="/resources/images/icon_07.png" />" alt="" style="padding:5px 5px 0 0;" />Management Review</span>
								</a>
							</li>
							<br>
							<li>
								<a href="addhr" class="<c:choose>
								<c:when test="${menu=='hr'}">buttonsub blueactive</c:when><c:otherwise>buttonsub blue</c:otherwise></c:choose>">
									<span><img src="<c:url value="/resources/images/icon_07.png" />" alt="" style="padding:5px 5px 0 0;" />HR and Training</span>
								</a>
							</li>
				            </c:if>
					
						</ul>  
						</div>
						<div>
					
						
						</div>
						<div class="clear"></div>
						<script type="text/javascript">
							ddlevelsmenu.setup("ddtopmenubar", "topbar");
							ddlevelsmenu.setup("ddtopmenubar1", "topbar");
						</script>
						<ul id="ddsubmenu1" class="ddsubmenustyle">
							<li ><a href="add_maintenance">Add Maintenance</a></li>
							<li ><a href="maintenance_list">View Maintenance</a></li>
					</ul>
						<ul id="ddsubmenu2" class="ddsubmenustyle">
				            <li ><a href="documentdelete">DELETE</a></li>
							 
							 
							 
							</ul>
						
				         <ul id="ddsubmenu5" class="ddsubmenustyle">
							<li><a href="addemployee">Add Employee</a></li>        
				            <li><a href="viewemployees">View Employees</a></li>
				            <li><a href="addfeedback">Add Feedback</a></li>
				             <li><a href="viewfeedback">View Feedbacks</a></li>
				         </ul>
				          <ul id="document" class="ddsubmenustyle">
							<li ><a href="add_prefixdocument">Document Prefix</a></li>
							<li ><a href="add_prefixform">Form Prefix</a></li>
							<li ><a href="add_process">Process</a></li>
							<li ><a href="add_formlocation">Location</a></li>
							<li ><a href="add_documenttype">Document Type</a></li>
							<li ><a href="setrevision">Set Revision Format</a></li>
						</ul>
						 <ul id="auditfinding" class="ddsubmenustyle">
							<li ><a href="add_finding">Add Finding</a></li>
							<li ><a href="finding_list">View Finding</a></li>
							
						</ul>
						
						 <ul id="document1" class="ddsubmenustyle">
							<li ><a href="documentprefix_list">Document Prefix</a></li>
							<li ><a href="formprefix_list">Form Prefix</a></li>
							<li ><a href="process_list">Process</a></li>
							<li ><a href="formlocation_list">Location</a></li>
							<li ><a href="documenttype_list">Document Type</a></li>
							
						</ul>
						
						<ul id="supplier11" class="ddsubmenustyle">
							<li ><a href="Addsuppliercategory">Supplier Category</a></li>
							<li ><a href="Add_certifiedto">Supplier Certified To</a></li>
							
							
							
						</ul>
						
						 <ul id="supplier1" class="ddsubmenustyle">
							<!-- <li ><a href="Addsuppliercategory">Supplier Category</a></li>
							<li ><a href="Add_certifiedto">Supplier Certified To</a></li> -->
							<li><a href="suppliercategorylist">List Supplier Category</a></li>
							<li><a href="suppliercertificatelist">List Supplier Certified To</a></li>
							
						
							
						</ul>
						
						
						 <ul id="deletedoc" class="ddsubmenustyle">
							<li ><a href="documentdelete">Document</a></li>
							<li ><a href="formdelete">Forms / Records</a></li>
							
							
						</ul>
						
						<ul id="ddsubmenu4" class="ddsubmenustyle">
							<li><a href="add_prefixdocument">Add Set-up</a></li>
							<li ><a href="documentprefix_list">View/Remove Set-up</a></li>
				           
							 
				         </ul>
				         <ul id="noncon" class="ddsubmenustyle">
							<li ><a href="addsourcenc">Source of NC</a></li>
							<li ><a href="addtypenc">Type of NC</a></li>
								<li ><a href="addproductidnc">Product ID</a></li>
									<li ><a href="addreportnc">Report NC</a></li>
						</ul>
						 <ul id="noncon1" class="ddsubmenustyle">
							<li ><a href="sourceNC_list">Source of NC</a></li>
							<li ><a href="typeNC_list">Type of NC</a></li>
								<li ><a href="productidNC_list">Product ID</a></li>
									<li ><a href="reportNC_list">Report NC</a></li>
						</ul>
						
					</div>
					<div class="menu_r"></div>
					<div class="clear"></div>
				</div>
			</div>
			<div class="clear"></div>
		</div>
		
