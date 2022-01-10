<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="quuery.UserQuery"%>
<%@page import="loginVar.customer_sampleVariable"%>
<jsp:useBean id="u" class="loginVar.customer_sampleVariable"></jsp:useBean>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
#printBtn {
	background-color: #019950;
	color: #fff;
	border: 2px solid #f6eb51;
	box-shadow: none;
	margin: 6px;
}
</style>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>FOOD AND DRUG | INSPECTION</title>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet"
	type="text/css" media="all">
<link href="bootstrap/css/font-awesome.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="bootstrap/css/style.css" />
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/datatables.min.css" />
<script src="bootstrap/js/jquery-2.1.1.min.js"></script>
<script src="bootstrap/js/datatables.min.js"></script>
<script src="bootstrap/js/JsBarcode.all.js"></script>
<script src="bootstrap/js/bootstrap.js"></script>
<script src="bootstrap/js/style.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#data").dataTable({
			dom : 'Bfrtip',
			buttons : [ {
				extend : 'pdf',
				text : 'Print PDF'
			} ]
		});

	});
	function printDiv() {
		var divContents = document.getElementById("GFG").innerHTML;
		var a = window.open('', '', 'height=500, width=500');
		a.document.write('<html>');
		a.document.write('<body>');
		a.document.write(divContents);
		a.document.write('</body></html>');
		a.document.close();
		a.print();
	}
</script>
</head>
<%
try{
	 response.setHeader("Cache-Control","no-cache");
	 response.setHeader("Cache-Control","no-store");
	 response.setHeader("Pragma","no-cache");
	 response.setDateHeader ("Expires", 0);
	if(session.getAttribute("username") == null || session.getAttribute("username").equals("") || session.getAttribute("password") == null || session.getAttribute("username").equals("")){
		response.sendRedirect("logout.jsp");
	}else{
%>
<body>
<div class="wrapper">
	<div class="wrapper_inner">
		<!--************************** LEFT SIDE BAR********************* -->
		<div class="vertical_wrap">
			<div class="vertical_bar">
				
				<!--********************************************************************************* -->
				<jsp:include page="Menu.jsp" />
				<!--********************************************************************************* -->
			</div>
		</div>
		<!--*********************** END LEFT SIDE BAR**************************** -->
		<div class="main_container">
			<!--***********************  TOP BAR**************************** -->
			<div class="top_bar">
				<div class="hamburger">
					<i class="fa fa-bars"></i>
				</div>
				<div class="logo">
					FOOD & DRUG INSPECTION <span>USING BARCODE</span>
				</div>
			</div>
			<!--***********************  DIV CONTENT **************************** -->
			<div class="content"
				style="height: 690px; width: 100%; background: #E3F2F1; padding: 9px 35px">
				<h3 style="margin-left: -12px;">View Sample Info</h3>
				<div class="row"
					style="background: #fff; height: 600px; padding: 80px 50px 50px 50px; overflow: auto;"
					class="table-responsive;">
					<!-- ####### CONTENT ###### -->
					<div class="row">
						<div class="col-sm-1">
							<a href="receiverSample.jsp"
								style="color: #fff; margin: -15px 0px;" class="btn btn-success"
								id="printBtn"> <i class="fa fa-arrow-left">&nbsp;BACK</i>
							</a>
						</div>
						<div class="col-sm-9"></div>
						<div class="col-sm-2"></div>
					</div>
					<%
						String ids = request.getParameter("SCode");
						String CCode = request.getParameter("CCode");
					%>
					<%
						Connection connection = null;
						Statement statement = null;
						ResultSet resultSet = null;
						try {
							connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/FINAL", "root", "");
							statement = connection.createStatement();
							String sql = "SELECT * FROM sample, customer WHERE (sample.SCode='" + ids + "' AND customer.CCode='"
									+ CCode + "' )";
							resultSet = statement.executeQuery(sql);
					%>
					<!-- ####### CONTENT ###### -->
					<div class="row">
						<div class="col-sm-8" style="padding-left: 50px">
							<table class="table table-hover">
								<%
									while (resultSet.next()) {
								%>
								<center>
									<h4 id="heading">CUSTOMER INFORMATIONS</h4>
								</center>
								<!-- 1 ROW -->
								<tr>
									<td><b>Full Name</b></td>
									<td><%=resultSet.getString("FName")%></td>
									<td><%=resultSet.getString("MName")%></td>
									<td><%=resultSet.getString("LName")%></td>
								</tr>
								<!-- 2 ROW -->
								<tr>
									<td><b>Customer's Code</b></td>
									<td><%=resultSet.getString("CCode")%></td>
									<td><b>Date of Birth</b></td>
									<td><%=resultSet.getString("Dob")%></td>
								</tr>
								<!-- 3 ROW -->
								<tr>
									<td><b>Phone Number</b></td>
									<td><%=resultSet.getString("Phone")%></td>
									<td><b>Gender</b></td>
									<td><%=resultSet.getString("Gender")%></td>
								</tr>
								<tr>
									<td><b>Email</b></td>
									<td><%=resultSet.getString("Email")%></td>
									<td><b>Status</b></td>
									<td><%=resultSet.getString("Status")%></td>
								</tr>
								<tr>
									<td><b>Address</b></td>
									<td><%=resultSet.getString("Address")%></td>
									<td><b>Company Name</b></td>
									<td><%=resultSet.getString("CName")%></td>
								</tr>
							</table>
							<table class="table table-hover">
								<center>
									<h4 id="heading">SAMPLE INFORMATIONS</h4>
								</center>
								<!-- 1 ROW -->
								<tr>
									<td><b>Product Name</b></td>
									<td><%=resultSet.getString("SName")%></td>
									<td><b>Brand Name</b></td>
									<td><%=resultSet.getString("Brand")%></td>
								</tr>
								<!-- 2 ROW -->
								<tr>
									<td><b>Batch N0</b></td>
									<td><%=resultSet.getString("Batch")%></td>
									<td><b>Manufacturer</b></td>
									<td><%=resultSet.getString("Manufacture")%></td>
								</tr>
								<!-- 3 ROW -->
								<tr>
									<td><b>Product Date</b></td>
									<td><%=resultSet.getString("ProdDate")%></td>
									<td><b>Expire Date</b></td>
									<td><%=resultSet.getString("ExpDate")%></td>
								</tr>
								<tr>
									<td><b>Sample size</b></td>
									<td><%=resultSet.getString("RQuantity")%></td>
									<td><b>Customer Type</b></td>
									<td><%=resultSet.getString("CustType")%></td>
								</tr>
							</table>
							<%
								}
							%>
						</div>
					</div>
					<%
						} catch (Exception e) {
							e.printStackTrace();
						}
					%>
					<!-- ==== PROFILE PICT ===== -->
				</div>
			</div>
			<div
				style="height: 35px; background: #fff; padding: 12px 25px; color: #000000; font-weight: bold;">
				<span>Copyright © 2021 | Mohd. M. Seif</span>
			</div>
		</div>
	</div>
</div>
<script>
	var hamburger = document.querySelector(".hamburger");
	var wrapper = document.querySelector(".wrapper");
	var backdrop = document.querySelector(".backdrop");

	hamburger.addEventListener("click", function() {
		wrapper.classList.add("active");
	})

	backdrop.addEventListener("click", function() {
		wrapper.classList.remove("active");
	})
</script>
</body>
<%
	}
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
</html>