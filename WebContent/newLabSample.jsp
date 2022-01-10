<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="quuery.UserQuery,loginVar.sampleVariable.*,java.util.*"%>
<%@page import="quuery.UserQuery"%>
<%@page import="loginVar.sampleVariable"%>
<jsp:useBean id="u" class="loginVar.sampleVariable"></jsp:useBean>
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
<script src="bootstrap/js/style.js"></script>
<script type="text/javascript">
	function Delete() {
		return confirm("Are you sure do you want to delete..?");
	}
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
	try {
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Cache-Control", "no-store");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
		if (session.getAttribute("username") == null || session.getAttribute("username").equals("")
				|| session.getAttribute("password") == null || session.getAttribute("username").equals("")) {
			response.sendRedirect("logout.jsp");
		} else {
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
				<%
					List<sampleVariable> list = UserQuery.getnewSample();
							request.setAttribute("list", list);
				%>
				<div class="content"
					style="height: 690px; width: 100%; background: #E3F2F1; padding: 9px 35px">
					<h3 style="margin-left: -12px;">Received Sample</h3>
					<div class="row"
						style="background: #fff; height: 600px; padding: 80px 50px 50px 50px; overflow: auto;"
						class="table-responsive;">
						<!-- Content -->
						<table class="table table-striped table-bordered"
							style="text-align: center;" id="data">
							<thead style="text-align: center; background: #E3F2F1;">
								<tr>
									<th id="th">Sample Code</th>
									<th id="th">Sample Name</th>
									<th id="th">Sample Type</th>
									<th id="th">Brand</th>
									<th id="th">Received On</th>
									<th id="th">View Sample</th>
									<th id="th">Assign To</th>
								</tr>
							</thead>
							<tbody>
								<%
									int count = 0;
								%>
								<c:forEach items="${list}" var="u">
									<%
										count = count + 1;
									%>
									<tr>
										<td>${u.getSCode()}</td>
										<td>${u.getSName()}</td>
										<td>${u.getSType()}</td>
										<td>${u.getBrand()}</td>
										<td>${u.getSubmDate()}</td>
										<td><a href="distViewSample.jsp?SCode=${u.getSCode()}"><i
												class="fa fa-eye"></i></a></td>
										<td><a href=""
											class="btn  border border-light border-2 rounded-pill"
											data-toggle="modal"
											data-target="#AssignLabSample<%out.print(count);%>"><i
												class="fa fa-edit"></i></a></td>
									</tr>
									<div class="modal fade"
										id="AssignLabSample<%out.print(count);%>" role="dialog">
										<div class="modal-dialog modal-md">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal">&times;</button>
													<h4 class="modal-title">ASSIGN SAMPLE</h4>
												</div>
												<div class="modal-body">
													<form action="AssignSampHandler.jsp" method="POST">
														<div class="row">
															<div class="col-xs-12 col-sm-6">
																<div class="form-group">
																	<label for="lName"> <i id="star">*&nbsp</i>Sample
																		Code
																	</label>
																	<div class="form-group has-success has-feedback">
																		<div class="input-group">
																			<span class="input-group-addon"> <i
																				class="fa fa-user"></i>
																			</span> <input type="text" name="SCode" class="form-control"
																				value="${u.getSCode()}" required="" readonly="">
																		</div>
																	</div>
																</div>
															</div>
															<div class="col-xs-12 col-sm-6">
																<div class="form-group">
																	<label for="lName"> <i id="star">*&nbsp</i>Sample
																		Name
																	</label>
																	<div class="form-group has-success has-feedback">
																		<div class="input-group">
																			<span class="input-group-addon"> <i
																				class="fa fa-user"></i>
																			</span> <input type="text" name="SName" class="form-control"
																				value="${u.getSName()}" readonly>
																		</div>
																	</div>
																</div>
															</div>
														</div>
														<div class="row">
															<div class="col-xs-12 col-sm-12">
																<div class="form-group">
																	<label for="lName"> <i id="star">*&nbsp</i>Customer
																		Code
																	</label>
																	<div class="form-group has-success has-feedback">
																		<div class="input-group">
																			<span class="input-group-addon"> <i
																				class="fa fa-user"></i>
																			</span> <input type="text" id="CCode" name=CCode
																				class="form-control" value="${u.getCCode()}"
																				readonly>
																		</div>
																	</div>
																</div>
															</div>
														</div>
														<%
															Connection connection = null;
																		Statement statement = null;
																		ResultSet resultSet = null;
																		try {
																			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/FINAL", "root", "");
																			statement = connection.createStatement();
																			String sql = "select * from staff WHERE Status='Lab Expart'";
																			resultSet = statement.executeQuery(sql);
														%>
														<div class="row">
															<div class="col-sm-12">
																<div class="form-group">
																	<label for="CCode"> <i id="star">*&nbsp</i> Lab
																		Analyser
																	</label>
																	<div class="form-group has-success has-feedback">
																		<div class="input-group">
																			<span class="input-group-addon"> <i
																				class="fa fa-table"></i>
																			</span> 
																			<select name="analyzerID"
																				class="form-control mb-2 mr-sm-2 custom-select lab" required>
																				<option value="">--Select Lab Expert--</option>
																				<%
																					while (resultSet.next()) {
																				%>
																				<option value="<%=resultSet.getString("SID")%>">
																					<%=resultSet.getString("fName")%>
																					<%=resultSet.getString("mName")%>
																					<%=resultSet.getString("lName")%>
																				</option>
																				<%
																					}connection.close();
																				%>
																			</select>
																		</div>
																	</div>
																</div>
															</div>
														</div>
														<%
															} catch (Exception e) {
																			e.printStackTrace();
																		}
														%>
														<div class="row">
															<div class="col-sm-12">
																<button type="submit" name="submit"
																	class="btn btn-success" style="font-weight: bold">ASSIGN TO
																	LAB</button>
																<span id="star" style="float: right;">*&nbsp<span
																	style="color: black; font-size: 15px;">Means
																		Mandatory to Fill</span></span>
															</div>
														</div>
													</form>
												</div>
												<div class="modal-footer" style="text-align: center;">
													<img src="bootstrap/img/zbs.png"
														style="width: 60px; height: auto;"> <span>
														Copyright © 2021 Zanzibar Bereau of Standards. </span>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</tbody>
						</table>
						<!-- *********** -->
					</div>
				</div>
				<script type="text/javascript">
					$(document).ready(function() {
						$("#foodLab").modal("show");
					});
				</script>
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