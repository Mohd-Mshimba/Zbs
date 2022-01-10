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
<script src="bootstrap/js/JsBarcode.all.js"></script>
<script src="bootstrap/js/style.js"></script>
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
	height: 29.7cm;
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
<%
String ids = request.getParameter("SCode");
String CCode = request.getParameter("CCode");
String id = (String) session.getAttribute("id");
%>
<%
	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
	try {
		connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/FINAL", "root", "");
		statement = connection.createStatement();
		String sql = "SELECT * FROM sample, customer WHERE (sample.SCode='"+ids+"' AND customer.CCode='"+CCode+"' )";
		resultSet = statement.executeQuery(sql);
%>
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
				<h3 style="margin-left: -12px;">Print Certificate</h3>
				<div class="row"
					style="background: #fff; height: 600px; padding: 80px 50px 50px 50px; overflow: auto;"
					class="table-responsive;">
					<!-- ####### CONTENT ###### -->
					<div class="row">
						<div class="row">
							<div class="col-sm-1">
								<a href="recAllReceivedSample.jsp" style="color: white"
									class="btn" id="printBtn"> <i class="fa fa-arrow-left">&nbsp;BACK</i>
								</a>
							</div>
							<div class="col-sm-9"></div>
							<div class="col-sm-2">
								<button class="btn" value="click" onclick="printDiv()"
									id="printBtn" style="floar: right">
									<i class="fa fa-print"></i>&nbsp;Print Out
								</button>
							</div>
						</div>
					</div>
					<%while(resultSet.next()){ %>
					<div class="row">
						<div class="col-sm-8" style="padding-left: 50px">
							<%
							if(resultSet.getString("Approval").equals("YES")){%>
								<page size="A4" style="margin-left:15%; font-size:18px;" id="GFG">
							<center style="font-size: 15px;">
								<h4 style="font-weight: bold; padding-top: 80px;">
									<img alt="zbs" src="bootstrap\img\zbs.png"
										style="width: 60px; height: auto; margin: 5px;">
									ZANZIBAR BUREAU OF STANDARDS
								</h4>
								P.O.BOX 1136, Zanzibar, Mobile +255 777 872021/Tel.
								+255-24-2232225 Fax: +255-24-22322225.<br> Email:
								info@zbs.go.tz, Website: www.zbs.go.tz <br>
							</center>
							<span style="margin-left: 40px;"> <span
								style="margin-left: 10px;">.Standard</span> <span
								style="margin-left: 10px;">.Quality</span> <span
								style="margin-left: 10px;">.Life</span>
							</span>
							<center>
								<div
									STYLE="background-color: #000000; height: 1px; width: 90%; margin: 0px 0px 0.4px 10px;"></div>
								<div
									STYLE="background-color: #000000; height: 1px; width: 90%; margin: 0px 0px 0px 10px;"></div>
							</center>
							<span style="margin-left: 50px; font-weight: bold;"><%=resultSet.getString("SCode")%></span>
							<span style="margin-left: 100px; font-weight: bold;">SAMPLE
								REGISTRATION FORM</span> <span
								style="margin-left: 70px; font-weight: bold;">ISSUE N0.1</span>
							<center>
								<div
									style="background-color: #000000; height: 1px; width: 90%; margin: 0px 0px 0px 10px;"></div>
							</center>
							<span style="margin-left: 50px;">Department of: </span>DEPARTMENT
							OF INSPECTION <span style="margin-left: 100px;">Location:</span>
							Amani
							<center>
								<div
									style="background-color: #000000; height: 1px; width: 90%; margin: 0px 0px 0px 10px;"></div>
							</center>
							<br>
							<span style="margin-left: 50px;">Customer's Name: </span> <span
								style="text-decoration: underline;"> <%=resultSet.getString("LName")%>
								<%=resultSet.getString("MName")%> <%=resultSet.getString("LName")%>
							</span> <br>
							<span style="margin-left: 50px;">Customer's Addres: </span> <span
								style="text-decoration: underline;"><%=resultSet.getString("Address")%></span>
							<span style="margin-left: 100px;">Mobile:</span> <span
								style="text-decoration: underline;"><%=resultSet.getString("Phone")%></span>
							<br>
							<span style="margin-left: 50px;">Customer's Code: </span> <span
								style="text-decoration: underline;"><%=resultSet.getString("CCode")%></span>
							<br>
							<br>
							<center>
								<div
									style="background-color: #000000; height: 1px; width: 90%; margin: 0px 0px 0px 10px;"></div>
							</center>
							<br>
							<span style="margin-left: 50px; font-weight: bold;">SAMPLE
								INFORMATION</span> <br>
							<span style="margin-left: 50px;">Product Name:</span> <span
								style="text-decoration: underline;"><%=resultSet.getString("SName")%></span>
							<span style="margin-left: 80px;">Brand Name:</span> <span
								style="text-decoration: underline;"><%=resultSet.getString("Brand")%></span>
							<br>
							<span style="margin-left: 50px;">Batch N0:</span> <span
								style="text-decoration: underline;"><%=resultSet.getString("Batch")%></span>
							<br>
							<span style="margin-left: 50px;">Manufacturer:</span> <span
								style="text-decoration: underline;"><%=resultSet.getString("Manufacture")%></span>
							<br>
							<span style="margin-left: 50px;">Product Date: </span> <span
								style="text-decoration: underline;"><%=resultSet.getString("ProdDate")%></span>
							<span style="margin-left: 120px;">Expire Date: </span> <span
								style="text-decoration: underline;"><%=resultSet.getString("ExpDate")%></span>
							<br>
							<span style="margin-left: 50px;">Sample size(Quantity of
								sample submited):</span> <span style="text-decoration: underline;"><%=resultSet.getString("RQuantity")%></span>
							<br>
							<span style="margin-left: 50px;">I (Customer):</span> <span
								style="text-decoration: underline;"> <%=resultSet.getString("LName")%>
								<%=resultSet.getString("MName")%> <%=resultSet.getString("LName")%>
							</span> <span>confirmed to submit the sample of type and </span> <br>
							<span style="margin-left: 50px;">Quantity mentioned above
								to HEAD OF INSPECTION</span> <br>
							<span style="margin-left: 50px;">Date:</span> <span
								style="text-decoration: underline;"><%=(new java.util.Date()).toLocaleString()%></span>
							<br>
							<br>
							<center>
							<b>Sample Result : </b> <span style="color:green; font-weight:bold;"><%=resultSet.getString("Remark")%></span>
								<div
									style="background-color: #000000; height: 1px; width: 90%; margin: 0px 0px 0px 10px;"></div>
							</center>
							<br>
							<span style="margin-left: 50px;">ZBS Inpsection Officer
								(name): </span> MOH'D MSHIMBA SEIF<br>
							<br>
							<span style="margin-left: 50px;">Signature:
								__________________________</span> <br>
							<!-- IMAGE SEAL --> 
							<img src="bootstrap/img/Seal.PNG"
								style="width: 200px; height: auto; margin: -100px 0px 0px 100px; opacity: 0.2;"/>
							
							<!-- BARCODE --> 
							<input type="text" id="code" value="<%=resultSet.getString("SCode")%>" hidden> 
							<span style="margin: 0px 70px;"> 
								<img id="barcode1" style="width: 250px;" /> 
								<script>
									var code = document.getElementById("code").value;
									JsBarcode("#barcode1", code);
								</script>
							</span> 
							<!-- END BARCODE -->
							
							<center style="margin-top: 30px;">
								<div
									STYLE="background-color: #000000; height: 5px; width: 90%; margin: 0px 0px 0px 10px;"></div>
								<div
									STYLE="background-color: #000000; height: 1px; width: 90%; margin: 2px 0px 0px 10px;"></div>
								<br> <span style="font-size: 14px;">All
									correspondence should be addressed to the Director General
									Zanzibar Bureau of Standards (ZBS)<br>
									E-mail:info@zbs.go.tz Mobile +255 777 872021
								</span>
							</center>
							</page>
							<%}else{%>
								<page size="A4" style="margin-left:15%; font-size:18px; background-image:url(bootstrap/img/WATERMARK.png)" id="GFG">
							<center style="font-size: 15px;">
								<h4 style="font-weight: bold; padding-top: 80px;">
									<img alt="zbs" src="bootstrap\img\zbs.png"
										style="width: 60px; height: auto; margin: 5px;">
									ZANZIBAR BUREAU OF STANDARDS
								</h4>
								P.O.BOX 1136, Zanzibar, Mobile +255 777 872021/Tel.
								+255-24-2232225 Fax: +255-24-22322225.<br> Email:
								info@zbs.go.tz, Website: www.zbs.go.tz <br>
							</center>
							<span style="margin-left: 40px;"> <span
								style="margin-left: 10px;">.Standard</span> <span
								style="margin-left: 10px;">.Quality</span> <span
								style="margin-left: 10px;">.Life</span>
							</span>
							<center>
								<div
									STYLE="background-color: #000000; height: 1px; width: 90%; margin: 0px 0px 0.4px 10px;"></div>
								<div
									STYLE="background-color: #000000; height: 1px; width: 90%; margin: 0px 0px 0px 10px;"></div>
							</center>
							<span style="margin-left: 50px; font-weight: bold;"><%=resultSet.getString("SCode")%></span>
							<span style="margin-left: 100px; font-weight: bold;">SAMPLE
								REGISTRATION FORM</span> <span
								style="margin-left: 70px; font-weight: bold;">ISSUE N0.1</span>
							<center>
								<div
									style="background-color: #000000; height: 1px; width: 90%; margin: 0px 0px 0px 10px;"></div>
							</center>
							<span style="margin-left: 50px;">Department of: </span>DEPARTMENT
							OF INSPECTION <span style="margin-left: 100px;">Location:</span>
							Amani
							<center>
								<div
									style="background-color: #000000; height: 1px; width: 90%; margin: 0px 0px 0px 10px;"></div>
							</center>
							<br>
							<span style="margin-left: 50px;">Customer's Name: </span> <span
								style="text-decoration: underline;"> <%=resultSet.getString("LName")%>
								<%=resultSet.getString("MName")%> <%=resultSet.getString("LName")%>
							</span> <br>
							<span style="margin-left: 50px;">Customer's Addres: </span> <span
								style="text-decoration: underline;"><%=resultSet.getString("Address")%></span>
							<span style="margin-left: 100px;">Mobile:</span> <span
								style="text-decoration: underline;"><%=resultSet.getString("Phone")%></span>
							<br>
							<span style="margin-left: 50px;">Customer's Code: </span> <span
								style="text-decoration: underline;"><%=resultSet.getString("CCode")%></span>
							<br>
							<br>
							<center>
								<div
									style="background-color: #000000; height: 1px; width: 90%; margin: 0px 0px 0px 10px;"></div>
							</center>
							<br>
							<span style="margin-left: 50px; font-weight: bold;">SAMPLE
								INFORMATION</span> <br>
							<span style="margin-left: 50px;">Product Name:</span> <span
								style="text-decoration: underline;"><%=resultSet.getString("SName")%></span>
							<span style="margin-left: 80px;">Brand Name:</span> <span
								style="text-decoration: underline;"><%=resultSet.getString("Brand")%></span>
							<br>
							<span style="margin-left: 50px;">Batch N0:</span> <span
								style="text-decoration: underline;"><%=resultSet.getString("Batch")%></span>
							<br>
							<span style="margin-left: 50px;">Manufacturer:</span> <span
								style="text-decoration: underline;"><%=resultSet.getString("Manufacture")%></span>
							<br>
							<span style="margin-left: 50px;">Product Date: </span> <span
								style="text-decoration: underline;"><%=resultSet.getString("ProdDate")%></span>
							<span style="margin-left: 120px;">Expire Date: </span> <span
								style="text-decoration: underline;"><%=resultSet.getString("ExpDate")%></span>
							<br>
							<span style="margin-left: 50px;">Sample size(Quantity of
								sample submited):</span> <span style="text-decoration: underline;"><%=resultSet.getString("RQuantity")%></span>
							<br>
							<span style="margin-left: 50px;">I (Customer):</span> <span
								style="text-decoration: underline;"> <%=resultSet.getString("LName")%>
								<%=resultSet.getString("MName")%> <%=resultSet.getString("LName")%>
							</span> <span>confirmed to submit the sample of type and </span> <br>
							<span style="margin-left: 50px;">Quantity mentioned above
								to HEAD OF INSPECTION</span> <br>
							<span style="margin-left: 50px;">Date:</span> <span
								style="text-decoration: underline;"><%=(new java.util.Date()).toLocaleString()%></span>
							<br>
							<br>
							<center>
							<b>Sample Result : </b> <span style="color:green; font-weight:bold;"><%=resultSet.getString("Remark")%></span>
								<div
									style="background-color: #000000; height: 1px; width: 90%; margin: 0px 0px 0px 10px;"></div>
							</center>
							<br>
							<span style="margin-left: 50px;">ZBS Inpsection Officer
								(name): </span> MOH'D MSHIMBA SEIF<br>
							<br>
							<span style="margin-left: 50px;">Signature:
								__________________________</span> <br>
							<!-- IMAGE SEAL --> 
							<img src="bootstrap/img/Seal.PNG"
								style="width: 200px; height: auto; margin: -100px 0px 0px 100px; opacity: 0.2;"/>
							
							<!-- BARCODE --> 
							<input type="text" id="code" value="<%=resultSet.getString("SCode")%>" hidden> 
							<span style="margin: 0px 70px;"> 
								<img id="barcode1" style="width: 250px;" /> 
								<script>
									var code = document.getElementById("code").value;
									JsBarcode("#barcode1", code);
								</script>
							</span> 
							<!-- END BARCODE -->
							
							<center style="margin-top: 30px;">
								<div
									STYLE="background-color: #000000; height: 5px; width: 90%; margin: 0px 0px 0px 10px;"></div>
								<div
									STYLE="background-color: #000000; height: 1px; width: 90%; margin: 2px 0px 0px 10px;"></div>
								<br> <span style="font-size: 14px;">All
									correspondence should be addressed to the Director General
									Zanzibar Bureau of Standards (ZBS)<br>
									E-mail:info@zbs.go.tz Mobile +255 777 872021
								</span>
							</center>
							</page>
							<%}
							%>
						</div>
					</div>
					<%}
						} catch (Exception e) {
							e.printStackTrace();
						}
					%>
					<!-- ==== PROFILE PICT ===== -->
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
</html>