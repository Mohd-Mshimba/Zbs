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

tr:hover {background-color: #f5f5f5}
#b{font-weight:bold;}
table, td, th {
    border: 1px solid black;
}

table {
    border-collapse: collapse;
    width: 100%;
}

th {
    height: 50px;
}
page[size="A4"] {
    width: 21cm;
    min-height: 29.7cm;
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
    String SCode = request.getParameter("SCode");
%>
<%
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
    try {
        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/FINAL", "root", "");
        statement = connection.createStatement();
        String sql = "SELECT * FROM sample, analysis, customer WHERE(sample.SCode=analysis.SCode AND sample.CCode=customer.CCode AND sample.SCode='"
                + SCode + "')";
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
					style="height: 690px; width: 100%; background: #E3F2F1; padding: 10px 35px">
					<h3 style="margin-left: -12px;">VIEW RESULTS</h3>
					<div class="row"
						style="background: #fff; height: 600px; padding: 60px 50px 50px 50px; overflow: auto;"
						class="table-responsive;">
						<div class="row">
							<div class="row">
								<div class="col-sm-1">
									<a href="manageLabSample.jsp" style="color: white"
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
						<div class="col-sm-8" style="padding-left: 50px">
							<%
								while (resultSet.next()) {
							%>
							<%
                    if (resultSet.getString("Approval").equals("YES")) {
                    %>
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
							style="margin-left: 10px;">.Life</span> <span
							style="margin-left: 280px;">Inspection Result: &nbsp;</span> <%
								if (resultSet.getString("Remark").equals("Fail")) {
								%> <span style="color: red; font-weight: bold;"><%=resultSet.getString("Remark")%></span>
								<%
								} else {
								%> <span style="color: green; font-weight: bold;"><%=resultSet.getString("Remark")%></span>
								<%
								}
							%>
						</span>
						<center>
							<div
							STYLE="background-color: #000000; height: 1px; width: 90%; margin: 0px 0px 0.4px 10px;"></div>
							<div
							STYLE="background-color: #000000; height: 1px; width: 90%; margin: 0px 0px 0px 10px;"></div>
						</center>
						<div style="margin-left: 40px; padding: 10px;">
							<center><h3 id="b">General Information</h3></center>
							<div class="table table-responsive">
								<table class="table" style="width: 95%;">
									<tr>
										<th>Customer Name</th>
										<td><%=resultSet.getString("fName")%>.&nbsp;&nbsp; <%=resultSet.getString("mName")%>&nbsp;&nbsp;
											<%=resultSet.getString("lName")%></td>
										</tr>
										<tr>
											<th>Address</th>
											<td><%=resultSet.getString("Address")%>,&nbsp; <%=resultSet.getString("Email")%></td>
										</tr>
										<tr>
											<th>Comapny Name</th>
											<td><%=resultSet.getString("CName")%></td>
										</tr>
										<tr>
											<th>Phone Number</th>
											<td><%=resultSet.getString("Phone")%></td>
										</tr>
										<tr>
											<th>Status</th>
											<td><%=resultSet.getString("Status")%>,&nbsp; <b><%=resultSet.getString("CCode")%></b></td>
										</tr>
									</table>
									<center>
										<h3  id="b">Sample Information</h3>
									</center>
									<div class="table-responsive">
										<table class="table" style="width: 95%;">
											<tr>
												<th>Smaple Code</th>
												<td><%=resultSet.getString("SCode")%></td>
												<th>Smaple Name</th>
												<td><%=resultSet.getString("SName")%></td>
											</tr>
											<tr>
												<th>Receiving Date</th>
												<td><%=resultSet.getString("RecDate")%></td>
												<th>Result Date</th>
												<td><%=resultSet.getString("SampDate")%></td>
											</tr>
											<tr>
												<th>Brand Sample</th>
												<td><%=resultSet.getString("Brand")%></td>
												<th>Batch</th>
												<td><%=resultSet.getString("Batch")%></td>
											</tr>
											<tr>
												<th>Production Date</th>
												<td><%=resultSet.getString("ProdDate")%></td>
												<th>Expire Date</th>
												<td><%=resultSet.getString("ExpDate")%></td>
											</tr>
											<tr>
												<th>Production Date</th>
												<td><%=resultSet.getString("ProdDate")%></td>
												<th>Expire Date</th>
												<td><%=resultSet.getString("ExpDate")%></td>
											</tr>
											<tr>
												<th colspan="2">Sample Manufacture</th>
												<td colspan="2"><%=resultSet.getString("Manufacture")%></td>
											</tr>
											<tr>
												<th>Sample Type</th>
												<td><%=resultSet.getString("SType")%></td>
												<th>Received Quantity</th>
												<td><%=resultSet.getString("RQuantity")%></td>
											</tr>
										</table>
										<center>
											<h3  id="b">Inspection Result Summary</h3>
										</center>
										<div class="table-responsive">
											<table class="table" style="width: 95%;">
												<tr class="active">
													<th>Water</th>
													<th>Protein</th>
													<th>Sugar</th>
													<th>Calcium</th>
													<th>Sodium</th>
												</tr>
												<tr>
													<td><%=resultSet.getString("Water")%></td>
													<td><%=resultSet.getString("Protein")%></td>
													<td><%=resultSet.getString("Sugar")%></td>
													<td><%=resultSet.getString("Calcium")%></td>
													<td><%=resultSet.getString("Sodium")%></td>
												</tr>
											</table>
											
											<table class="table" style="width: 95%;">
												<tr class="active">
													<th>Zink</th>
													<th>Energy</th>
													<th>Caffein</th>
													<th>Starch</th>
													<th>Alkohol</th>
													<th>FatyAcid</th>
												</tr>
												<tr>
													<td><%=resultSet.getString("Zink")%></td>
													<td><%=resultSet.getString("Energy")%></td>
													<td><%=resultSet.getString("Caffein")%></td>
													<td><%=resultSet.getString("Starch")%></td>
													<td><%=resultSet.getString("Alkohol")%></td><td>
														<%=resultSet.getString("FatyAcid")%></td>
													</tr>
												</table>
											</div>
										</div>
										<!-- IMAGE SEAL -->
										<img src="bootstrap/img/Seal.PNG"
										style="width: 200px; height: auto; margin: -150px 0px 0px 100px; opacity: 0.2;" />
										<!-- END IMAGE SEAL -->
										<center style="margin-top: 10px;">
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
										</div>
										</div>
									</page>
							<%
								}else{%>
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
							style="margin-left: 10px;">.Life</span> <span
							style="margin-left: 280px;">Inspection Result: &nbsp;</span> <%
								if (resultSet.getString("Remark").equals("Fail")) {
								%> <span style="color: red; font-weight: bold;"><%=resultSet.getString("Remark")%></span>
								<%
								} else {
								%> <span style="color: green; font-weight: bold;"><%=resultSet.getString("Remark")%></span>
								<%
								}
							%>
						</span>
						<center>
							<div
							STYLE="background-color: #000000; height: 1px; width: 90%; margin: 0px 0px 0.4px 10px;"></div>
							<div
							STYLE="background-color: #000000; height: 1px; width: 90%; margin: 0px 0px 0px 10px;"></div>
						</center>
						<div style="margin-left: 40px; padding: 10px;">
							<center><h3 id="b">General Information</h3></center>
							<div class="table table-responsive">
								<table class="table" style="width: 95%;">
									<tr>
										<th>Customer Name</th>
										<td><%=resultSet.getString("fName")%>.&nbsp;&nbsp; <%=resultSet.getString("mName")%>&nbsp;&nbsp;
											<%=resultSet.getString("lName")%></td>
										</tr>
										<tr>
											<th>Address</th>
											<td><%=resultSet.getString("Address")%>,&nbsp; <%=resultSet.getString("Email")%></td>
										</tr>
										<tr>
											<th>Comapny Name</th>
											<td><%=resultSet.getString("CName")%></td>
										</tr>
										<tr>
											<th>Phone Number</th>
											<td><%=resultSet.getString("Phone")%></td>
										</tr>
										<tr>
											<th>Status</th>
											<td><%=resultSet.getString("Status")%>,&nbsp; <b><%=resultSet.getString("CCode")%></b></td>
										</tr>
									</table>
									<center>
										<h3  id="b">Sample Information</h3>
									</center>
									<div class="table-responsive">
										<table class="table" style="width: 95%;">
											<tr>
												<th>Smaple Code</th>
												<td><%=resultSet.getString("SCode")%></td>
												<th>Smaple Name</th>
												<td><%=resultSet.getString("SName")%></td>
											</tr>
											<tr>
												<th>Receiving Date</th>
												<td><%=resultSet.getString("RecDate")%></td>
												<th>Result Date</th>
												<td><%=resultSet.getString("SampDate")%></td>
											</tr>
											<tr>
												<th>Brand Sample</th>
												<td><%=resultSet.getString("Brand")%></td>
												<th>Batch</th>
												<td><%=resultSet.getString("Batch")%></td>
											</tr>
											<tr>
												<th>Production Date</th>
												<td><%=resultSet.getString("ProdDate")%></td>
												<th>Expire Date</th>
												<td><%=resultSet.getString("ExpDate")%></td>
											</tr>
											<tr>
												<th>Production Date</th>
												<td><%=resultSet.getString("ProdDate")%></td>
												<th>Expire Date</th>
												<td><%=resultSet.getString("ExpDate")%></td>
											</tr>
											<tr>
												<th colspan="2">Sample Manufacture</th>
												<td colspan="2"><%=resultSet.getString("Manufacture")%></td>
											</tr>
											<tr>
												<th>Sample Type</th>
												<td><%=resultSet.getString("SType")%></td>
												<th>Received Quantity</th>
												<td><%=resultSet.getString("RQuantity")%></td>
											</tr>
										</table>
										<center>
											<h3  id="b">Inspection Result Summary</h3>
										</center>
										<div class="table-responsive">
											<table class="table" style="width: 95%;">
												<tr class="active">
													<th>Water</th>
													<th>Protein</th>
													<th>Sugar</th>
													<th>Calcium</th>
													<th>Sodium</th>
												</tr>
												<tr>
													<td><%=resultSet.getString("Water")%></td>
													<td><%=resultSet.getString("Protein")%></td>
													<td><%=resultSet.getString("Sugar")%></td>
													<td><%=resultSet.getString("Calcium")%></td>
													<td><%=resultSet.getString("Sodium")%></td>
												</tr>
											</table>
											
											<table class="table" style="width: 95%;">
												<tr class="active">
													<th>Zink</th>
													<th>Energy</th>
													<th>Caffein</th>
													<th>Starch</th>
													<th>Alkohol</th>
													<th>FatyAcid</th>
												</tr>
												<tr>
													<td><%=resultSet.getString("Zink")%></td>
													<td><%=resultSet.getString("Energy")%></td>
													<td><%=resultSet.getString("Caffein")%></td>
													<td><%=resultSet.getString("Starch")%></td>
													<td><%=resultSet.getString("Alkohol")%></td><td>
														<%=resultSet.getString("FatyAcid")%></td>
													</tr>
												</table>
											</div>
										</div>
										<!-- IMAGE SEAL -->
										<img src="bootstrap/img/Seal.PNG"
										style="width: 200px; height: auto; margin: -150px 0px 0px 100px; opacity: 0.2;" />
										<!-- END IMAGE SEAL -->
										<center style="margin-top: 10px;">
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
										</div>
										</div>
									</page>
								<%}
							%>
							<%
								}
							%>
						</div>
					</div>
				</div>
				<!--***********************END  DIV CONTENT **************************** -->
				<div
					style="height: 35px; background: #fff; padding: 12px 25px; color: #000000; font-weight: bold;">
					<span>Copyright © 2021 | Mohd. M. Seif</span>
				</div>
			</div>
		</div>
	</div>
	<%
		} catch (Exception e) {
					e.printStackTrace();
				}
	%>
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
<%
	session.setAttribute("success", null);
%>
</html>