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
				<h3 style="margin-left: -12px;">MAKE REQUEST</h3>
				<div class="row"
					style="background: #fff; height: 600px; padding: 80px 50px 50px 50px; overflow: auto;"
					class="table-responsive;">
					<!-- Content -->
					 	<%
              	if(session.getAttribute("success")!=null)
              	{%>
              		<div style="margin-top:-40px; text-align:center; font-size:18px; color:green;">
              		<script>
								swal(" You have been success to make Request ..!!",
										"Say OK!", "success")
							</script>
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
										<div style="color: #fff; padding-top: 10px; font-weight: bold">MAKE
											REQUEST</div>
										~~~
										<div style="text-align: left; font-size: 16px;">
											Please fill out the form and press "Submit" at the bottom of
											the form. We will receive you request, process it and answer
											you within 24 hours regarding to following activities. If
											it`s more urgent situation please contact<a
												href="https://api.whatsapp.com/send?Contact us">
												(+255-776 666 813)</a>
											<p>
											<div
												style="background-color: #000000; height: 1px; width: 96%; margin: 0px 0px 0.4px 10px;"></div>
											</p>
										</div>
									</div>
								</center>
								</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12" style="margin:130px 28px;">
								<form method="POST" action="directAddReq.jsp">
								<div class="col-md-8">
								<% String id = (String)session.getAttribute("id");%>
									<div class="form-group has-feedback col-md-12">
										<label class="control-label" for="inputGroupSuccess1">
											Customer Code</label>
										<div class="input-group  has-success ">
											<span class="input-group-addon">@</span> <input type="text"
												class="form-control" name="CCode" readonly id="inputGroupSuccess1" 
												value="<%out.println(id);%>">
										</div>
									</div>
									<div class="form-group has-feedback col-md-12">
										<label class="control-label" for="inputGroupSuccess1">Sample Type</label>
										<div class="input-group  has-success ">
											<span class="input-group-addon">@</span>
											<select name="sampType" class="form-control custom-select" required="">
												<option value="">--Sample Type--</option>
												<option value="FOOD">FOOD SAMPLE</option>
												<option value="DRUG">DRUG SAMPLE</option>
												</select> 
											</div>
									</div>
									<div class="form-group has-feedback col-md-12">
										<input type="submit" name="submit" class="btn btn-primary"
											value="SUBMIT">
									</div>
									<div class="form-group has-feedback col-md-12">
										<p>
											<div
												style="background-color: #000000; height: 1px; width: 140%; margin: 0px 0px 0.4px 10px;"></div>
											<div
												style="background-color: #000000; height: 1px; width: 140%; margin: 0px 0px 0px 10px;"></div>
											</p>
									</div>
									</div>
								</form>
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