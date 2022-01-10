<%@ page session="true"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="quuery.UserQuery,loginVar.sampleVariable"%>
<%@page import="quuery.UserQuery"%>
<%@page import="loginVar.sampleVariable"%>
<jsp:useBean id="u" class="loginVar.sampleVariable"></jsp:useBean>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
body {
	background: rgb(204, 204, 204);
}

page {
	background: white;
	display: block;
	margin: 0 auto;
	margin-bottom: 0.5cm;
	box-shadow: 0 0 0.5cm rgba(0, 0, 0, 0.5);
}

page[size="A4"] {
	width: 21cm;
	height: 12.7cm;
}

@media print {
	body, page {
		margin: 0;
		box-shadow: 0;
	}
}

#printBtn {
	background-color: #019950;
	color: #fff;
	border: 2px solid #f6eb51;
	box-shadow: none;
	margin: 6px;
}

ul#menu li {
	display: inline;
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
				<h3 style="margin-left: -12px;">VIEW REQUEST</h3>
				<div class="row"
					style="background: #fff; height: 600px; padding: 80px 50px 50px 50px; overflow: auto;"
					class="table-responsive;">
					<!-- Content -->
					 	<%
              	if(session.getAttribute("success")!=null)
              	{%>
              		<div style="margin-top:-40px; text-align:center; font-size:18px; color:green;">
              		<%out.println(session.getAttribute("success")); %>
              		</div>
              	<%}
              	%>
					<div class="col-sm-8" style="padding-left: 50px">
						<page size="A4" style="margin-left:15%; font-size:18px;" id="GFG">
						<!-- INSIDE -->
						<div class="row">
							<div class="col-md-12"
								style="font-size: 15px; text-align: center">
								<div class="row">
							<div class="col-md-12">
							<p>~ ** ~</p>
							</div>
							</div>
							<div class="row">
							<div class="col-md-12">
								<center>
									<div style="background: #193153; width: 18cm; height: 40px;">
										<div style="color: #fff; padding-top: 10px; font-weight: bold">
											VIEW YOUR REQUEST RESPONSE 
										</div>
										~~~
									</div>
								</center>
								</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12" style="margin:30px 10px;text-align:center">
									<%
											Connection connection = null;
											Statement statement = null;
											ResultSet resultSet = null;
											String id = (String) session.getAttribute("id");
											try {
												connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/FINAL", "root", "");
												statement = connection.createStatement();
												String sql = "SELECT * FROM customer, appointdate WHERE (customer.CCode=appointdate.CCode AND appointdate.CCode='"
														+ id + "')";
												resultSet = statement.executeQuery(sql);
												resultSet.next();
										%>
										<% String rs = resultSet.getString("Request"); %>
										<div class="row">
											<div class="col-md-12">
											<%
													if ("Accepted".equals(rs)) {
												%>
												<div
													style="color: green; padding: 100px 0px; font-size: 18px;">
													YOUR REQUEST HAVE BEEN <b>ACCEPTED</b> PLEASE COME WITH YOUR
													PRODUCT ON<br> <span
														style="text-decoration: underline; font-weight: bold;">
														<a><%out.println(resultSet.getString("CommingDate"));%></a></span><br> 
														OPTIONAL DAY<br>
													<span
														style="text-decoration: underline; font-weight: bold;">
														<a><%out.println(resultSet.getString("OptionalDate"));%></a><br>
													</span>
												</div>
												<%
													}
												%>
												<%
													if ("Rejected".equals(rs)) {
														
												%>
												<div
													style="color: red; padding: 100px 0px; font-size: 18px;">
													YOUR REQUEST HAVE BEEN <b>REJECTED</b> PLEASE CONTACTS WITH OUR US<br> <span
														style="font-weight: bold;">
														TO KNOW WHAT IS PROBLEMS</span><br>
												</div>
												<%
													}
												%>
												<%
													if ("Registered".equals(rs)){
												%>
												<div
													style="color: orange; padding: 100px 0px; font-size: 18px;">
													CONGRATULATION!! YOUR HAVE BEEN <b>SUCCESS TO MAKE</b> <br>
													 YOUR REQUEST, PLEASE WAIT IN 24.HRS<br> 
													 TO RECEIVE RESPONSE													
												</div>
												<%
													}
												%>
											</div>
											</div>
										<%
												connection.close();
											} catch (Exception e) {
												e.printStackTrace();
											}
										%>
							</div>
						</div>
						<!-- END --> </page>
					</div>
					<!-- *******************END CONETENT********************* -->
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
<%session.setAttribute("success", null); %>
</html>