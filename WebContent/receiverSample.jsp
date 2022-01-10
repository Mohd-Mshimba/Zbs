<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="now" value="<%=new java.util.Date()%>" />
<%@page import="quuery.UserQuery,loginVar.sampleVariable.*,java.util.*"%>
<%@page import="quuery.UserQuery"%>
<%@page import="loginVar.sampleVariable"%>
<%@page import="loginVar.customer_sampleVariable"%>
<jsp:useBean id="u" class="loginVar.sampleVariable"></jsp:useBean>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
			<%
				List<sampleVariable> list = UserQuery.getSample();
						request.setAttribute("list", list);
			%>
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
					<h3 style="margin-left: -12px;">Manage Sample</h3>
					<%
								if (session.getAttribute("addReq") != null) {
							%>
							<span
								style="margin: 0px 300px; text-align: center; font-size: 18px; color: green; font-weight: bold">
								<script type="text/javascript">
									swal(
											"You have been success to Accept Customer",
											"Say OK!", "success")
								</script>
							</span>
							<%
								}
							%>
							<%
								if (session.getAttribute("rejReq") != null) {
							%>
							<span
								style="margin: 0px 300px; text-align: center; font-size: 18px; color: green; font-weight: bold">
								<script type="text/javascript">
									swal(
											"You have been success to Reject Customer",
											"Say OK!", "success")
								</script>
							</span>
							<%
								}
							%>
							<%
								if (session.getAttribute("addSamp") != null) {
							%>
							<span
								style="margin: 0px 300px; text-align: center; font-size: 18px; color: green; font-weight: bold">
								<script type="text/javascript">
									swal(
											"You have been success to Registered Sample",
											"Say OK!", "success")
								</script>
							</span>
							<%
								}
							%>
							<%
								if (session.getAttribute("updateSamp") != null) {
							%>
							<span
								style="margin: 0px 300px; text-align: center; font-size: 18px; color: green; font-weight: bold">
								<script type="text/javascript">
									swal(
											"You have been success to Update Sample",
											"Say OK!", "success")
								</script>
							</span>
							<%
								}
							%>
							<%
								if (session.getAttribute("dirLab") != null) {
							%>
							<span
								style="margin: 0px 300px; text-align: center; font-size: 18px; color: green; font-weight: bold">
								<script type="text/javascript">
									swal(
											"You have been Success to Direct Sample to Lab",
											"Say OK!", "success")
								</script>
							</span>
							<%
								}
							%>
					<div class="row"
						style="background: #fff; height: 595px; padding: 80px 50px 50px 50px; overflow: auto;"
						class="table-responsive;">
						<!-- Content -->
						
						<button class="btn btn-primary fa fa-plus"
							style="margin-bottom: -45px; width: 12%; height: 35px; padding: 5px;"
							data-toggle="modal" data-target="#sampleModal">&nbsp;Receive
							Sample</button>
						<table class="table table-striped table-bordered"
							style="text-align: center;" id="data">
							<thead style="text-align: center; background: #E3F2F1;">
								<tr>
									<th id="th">Samp Code</th>
									<th id="th">Samp Name</th>
									<th id="th">Brand</th>
									<th id="th">Batch</th>
									<th id="th">Received On</th>
									<th id="th">Cust Type</th>
									<th id="th">Cust Code</th>
									<th id="th">View</th>
									<th id="th">Edit</th>
									<th id="th">To Lab</th>
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
										<td>${u.getBrand()}</td>
										<td>${u.getBatch()}</td>
										<td>${u.getRecDate()}</td>
										<td>${u.getCustType()}</td>
										<td>${u.getCCode()}</td>
										<!--(CUSTOMER CODE)-->
										<td id="th"><a
											href="viewSample.jsp?SCode=${u.getSCode()}&CCode=${u.getCCode()}"><i
												class="fa fa-eye"></i></a></td>
										<td><a href=""
											class="btn  border border-light border-2 rounded-pill"
											data-toggle="modal"
											data-target="#viewSample<%out.print(count);%>"><i
												class="fa fa-edit"></i></a></td>
										<%-- <td id="th"><a
											href="receiverSample.jsp?SCode=${u.getSCode()}"> <i
												class="fa fa-send" data-toggle="modal" data-target="#sendTo"></i>
										</a></td> --%>
										<td id="th"><a href=""
											class="btn  border border-light border-2 rounded-pill"
											data-toggle="modal"
											data-target="#sendTo<%out.print(count);%>"><i
												class="fa fa-send"></i></a></td>
									</tr>
									<div class="modal fade" id="viewSample<%out.print(count);%>"
										role="dialog">
										<div class="modal-dialog modal-md">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal">&times;</button>
													<h4 class="modal-title">Update Lab Expart</h4>
												</div>
												<div class="modal-body">
													<div class="row">
														<div class="col-sm-12">
															<form action="updateSampleHandler.jsp" method="POST"
																name="EditSample">
																<div class="row">
																	<div class="col-sm-6">
																		<div class="form-group">
																			<label for="lName"> <i id="star">*&nbsp</i>Sample
																				Code
																			</label>
																			<div class="form-group has-success has-feedback">
																				<div class="input-group">
																					<span class="input-group-addon"> <i
																						class="fa fa-user"></i>
																					</span> <input type="text" name="SCode"
																						class="form-control" value="${u.getSCode()}"
																						required="" readonly="">
																				</div>
																			</div>
																		</div>
																	</div>
																	<div class="col-sm-6">
																		<div class="form-group">
																			<label for="lName"> <i id="star">*&nbsp</i>Sample
																				Name
																			</label>
																			<div class="form-group has-success has-feedback">
																				<div class="input-group">
																					<span class="input-group-addon"> <i
																						class="fa fa-user"></i>
																					</span> <input type="text" name="SName"
																						class="form-control" value="${u.getSName()}"
																						required="">
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
																<div class="row">
																	<div class="col-sm-6">
																		<div class="form-group">
																			<label for="lName"> <i id="star">*&nbsp</i>Brand
																			</label>
																			<div class="form-group has-success has-feedback">
																				<div class="input-group">
																					<span class="input-group-addon"> <i
																						class="fa fa-user"></i>
																					</span> <input type="text" id="lName" name="brand"
																						class="form-control" value="${u.getBrand()}"
																						required="">
																				</div>
																			</div>
																		</div>
																	</div>
																	<div class="col-sm-6">
																		<div class="form-group">
																			<label for="lName"> <i id="star">*&nbsp</i>Sample
																				Type
																			</label>
																			<div class="form-group has-success has-feedback">
																				<div class="input-group">
																					<span class="input-group-addon"> <i
																						class="fa fa-user"></i>
																					</span> <input type="text" name="SType"
																						class="form-control" value="${u.getSType()}"
																						required="">
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
																<div class="row">
																	<div class="col-sm-6">
																		<div class="form-group">
																			<label for="lName"> <i id="star">*&nbsp</i>Batch
																			</label>
																			<div class="form-group has-success has-feedback">
																				<div class="input-group">
																					<span class="input-group-addon"> <i
																						class="fa fa-user"></i>
																					</span> <input type="text" name="batch"
																						class="form-control" value="${u.getBatch()}"
																						required="">
																				</div>
																			</div>
																		</div>
																	</div>
																	<div class="col-sm-6">
																		<div class="form-group">
																			<label for="lName"> <i id="star">*&nbsp</i>Quantity
																			</label>
																			<div class="form-group has-success has-feedback">
																				<div class="input-group">
																					<span class="input-group-addon"> <i
																						class="fa fa-user"></i>
																					</span> <input type="text" id="lName" name="RQuantity"
																						class="form-control" value="${u.getRQuantity()}"
																						required="">
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
																<div class="row">
																	<div class="col-sm-6">
																		<div class="form-group">
																			<label for="lName"> <i id="star">*&nbsp</i>ProdDate
																			</label>
																			<div class="form-group has-success has-feedback">
																				<div class="input-group">
																					<span class="input-group-addon"> <i
																						class="fa fa-user"></i>
																					</span> <input type="date" name="prodDate"
																						class="form-control" value="${u.getProdDate()}"
																						required="" style="padding: 0px 0px 5px 5px">
																				</div>
																			</div>
																		</div>
																	</div>
																	<div class="col-sm-6">
																		<div class="form-group">
																			<label for="lName"> <i id="star">*&nbsp</i>ExpDate
																			</label>
																			<div class="form-group has-success has-feedback">
																				<div class="input-group">
																					<span class="input-group-addon"> <i
																						class="fa fa-user"></i>
																					</span> <input type="date" name="expDate"
																						class="form-control" value="${u.getExpDate()}"
																						required="" style="padding: 0px 0px 5px 5px">
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
																<div class="row">
																	<div class="col-sm-6">
																		<div class="form-group">
																			<label for="CCode"> <i id="star">*&nbsp</i>
																				Customer Type
																			</label>
																			<div class="form-group has-success has-feedback">
																				<div class="input-group">
																					<span class="input-group-addon"> <i
																						class="fa fa-table"></i>
																					</span> <select name="custType" id="custType"
																						class="form-control" required="">
																						<option value="${u.getCustType()}">${u.getCustType()}</option>
																						<option value="External">External</option>
																						<option value="Certification">Certification</option>
																					</select>
																				</div>
																			</div>
																		</div>
																	</div>
																	<div class="col-sm-6">
																		<div class="form-group">
																			<label for="lName"> <i id="star">*&nbsp</i>Manufacture
																			</label>
																			<div class="form-group has-success has-feedback">
																				<div class="input-group">
																					<span class="input-group-addon"> <i
																						class="fa fa-user"></i>
																					</span> <input type="text" name="manufacture"
																						class="form-control" value="${u.getManufacture()}"
																						required="">
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
																<div class="row">
																	<div class="col-sm-6">
																		<div class="form-group">
																			<label for="lName"> <i id="star">*&nbsp</i>Receive
																				Date
																			</label>
																			<div class="form-group has-success has-feedback">
																				<div class="input-group">
																					<span class="input-group-addon"> <i
																						class="fa fa-user"></i>
																					</span> <input type="text" name="recDate"
																						class="form-control" readonly
																						value="${u.getRecDate()}" required=""
																						style="padding: 0px 0px 5px 5px">
																				</div>
																			</div>
																		</div>
																	</div>
																	<div class="col-sm-6">
																		<div class="form-group">
																			<label for="CCode"> <i id="star">*&nbsp</i>Customer
																				Code
																			</label>
																			<div class="form-group has-success has-feedback">
																				<div class="input-group">
																					<span class="input-group-addon"> <i
																						class="fa fa-table"></i>
																					</span> <select name="CCode" id="CCode"
																						class="form-control" required="" readonly>
																						<option value="${u.getCCode()}">${u.getCCode()}</option>
																					</select>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
																<div class="row">
																	<div class="col-sm-12">
																		<button type="submit" name="submit"
																			class="btn btn-success"
																			onclick="return EditValidateSample()"
																			style="font-weight: bold">UPDATE SAMPLE</button>
																		<span id="star" style="float: right;">*&nbsp<span
																			style="color: black; font-size: 15px;">Means
																				Mandatory to Fill</span></span>
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
												<div class="modal-footer" style="text-align: center;">
													<img src="bootstrap/img/zbs.png"
														style="width: 60px; height: auto;"> <span>
														Copyright © 2021 Zanzibar Bereau of Standards. </span>
												</div>
											</div>
										</div>
									</div>
									<!-- Modal -->
									<div class="modal fade" id="sendTo<%out.print(count);%>"
										role="dialog">
										<div class="modal-dialog modal-md">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal">&times;</button>
													<h4 class="modal-title">Varify & Send To Lab</h4>
												</div>
												<div class="modal-body">
													<form action="directSendTO.jsp" method="POST">
														<input type="text" name="SCode" value="${u.getSCode()}"
															hidden="">
														<div class="row">
															<div class="col-sm-6">
																<b>Sample Name</b>
															</div>
															<div class="col-sm-6">${u.getSName()}</div>
															<hr>
														</div>
														<div class="row">
															<div class="col-sm-6">
																<b>Sample Type</b>
															</div>
															<div class="col-sm-6">${u.getSType()}</div>
															<hr>
														</div>
														<div class="row">
															<div class="col-sm-12">
																<div class="form-group">
																	<label for="lName">Sample Code </label>
																	<div class="form-group has-success has-feedback">
																		<div class="input-group">
																			<span class="input-group-addon"> <i
																				class="fa fa-code"></i>
																			</span> <input type="text" name="RQuantity"
																				class="form-control" value="${u.getRQuantity()}"
																				readonly>
																		</div>
																	</div>
																</div>
															</div>
															<hr>
														</div>
														<div class="row">
															<div class="col-sm-12">
																<div class="form-group">
																	<label for="lName">SubmissionDate </label>
																	<div class="form-group has-success has-feedback">
																		<div class="input-group">
																			<span class="input-group-addon"> <i
																				class="fa fa-calendar"></i>
																			</span> <input type="text" name="submDate"
																				class="form-control" required="" readonly
																				style="padding: 0px 0px 5px 10px;"
																				value="<fmt:formatDate type = "date" value = "${now}" />">
																		</div>
																	</div>
																</div>
															</div>
															<hr>
														</div>
														<div class="row">
															<div class="col-sm-12">
																<div class="form-group">
																	<label for="Status"> <i id="star">*&nbsp</i>
																		Send To
																	</label>
																	<div class="form-group has-success has-feedback">
																		<div class="input-group">
																			<span class="input-group-addon"> <i
																				class="fa fa-table"></i>
																			</span> <select name="submTo" id="submTo"
																				class="form-control" required="">
																				<option value="">---- Select Lab ----</option>
																				<option value="ZLab02">FOOD LAB</option>
																				<option value="ZLab03">DRUG LAB</option>
																			</select>
																		</div>
																	</div>
																</div>
															</div>
														</div>
														<div class="row">
															<div class="col-sm-12">
																<div class="form-group"
																	style="margin: 10px 1px 10px 1px;">
																	<input type="submit" name="submit" value="SEND TO LAB"
																		class="btn btn-primary" style="width: 100%;">
																</div>
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
									<!-- END MODAL -->
								</c:forEach>
							</tbody>
						</table>
						<%
							Connection connections = null;
									Statement statements = null;
									ResultSet resultSets = null;
									try {
										connections = DriverManager.getConnection("jdbc:mysql://localhost:3306/FINAL", "root", "");
										statements = connections.createStatement();
										String sqls = "SELECT COUNT(Request) FROM appointdate, customer WHERE(customer.CCode=appointdate.CCode AND customer.Request='Registered')";

										resultSets = statements.executeQuery(sqls);
										String Countrow = "";
										while (resultSets.next()) {
											Countrow = resultSets.getString(1);
										}
						%>
						<span><img src="bootstrap/img/news.gif" alt="news"
							style="width: 40px; height: auto">_</span> <span
							style="font-weight: bold; font-size: 18px;"> <a href="#"><span
								class="badge"> <%
							 	out.println(Countrow);
							 %>
							</span></a>
						</span> <span>_New Request </span> <span>| <a
							href="viewNewsCust.jsp"><i class="fa fa-eye"></i></a> |
						</span>
						<%
							} catch (Exception e) {
										e.printStackTrace();
									}
						%>
					</div>
				</div>
				<div
					style="height: 35px; background: #fff; padding: 12px 25px; display: flex; color: #000000; font-weight: bold;">
					<span>Copyright © 2021 | Mohd. M. Seif</span>
				</div>
			</div>
		</div>
	</div>
	<!-- **************************************The Modal************************************ -->
	<div class="modal fade" id="sampleModal" role="dialog">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">
						<i class="fa fa-plus"></i>&nbsp;Add Sample
					</h4>
				</div>
				<%
					Class.forName("com.mysql.jdbc.Driver").newInstance();
							Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/FINAL", "root", "");
							Statement st = con.createStatement();
							String strQuery = "SELECT COUNT(*) FROM sample";
							ResultSet rs = st.executeQuery(strQuery);
							String Countrow = "";
							while (rs.next()) {
								int x = Integer.parseUnsignedInt(rs.getString(1));
								x = x + 1;
								Countrow = String.valueOf(x);
							}
				%>
				<form action='directAddSampRec.jsp' method='POST'
					name="ValidateSample">
					<div class="modal-body">
						<div class="row">
							<div class="col-sm-12">
								<div class="row">
									<div class="col-sm-6">
										<div class="form-group">
											<label for="SCode"> <i id="star">*&nbsp</i>Sample
												Code
											</label>
											<div class="form-group has-success has-feedback">
												<div class="input-group">
													<span class="input-group-addon"> <i
														class="fa fa-code"></i>
													</span> <input type="text" name="SCode" id="SCode"
														readonly="readonly" required class="form-control"
														value="ZBS-Samp000<%out.println(Countrow);%>">
												</div>
											</div>
										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group">
											<label for="SName"> <i id="star">*&nbsp</i>Sample
												Name
											</label>
											<div class="form-group has-success has-feedback">
												<div class="input-group">
													<span class="input-group-addon"> <i
														class="fa fa-exclamation-circle"></i>
													</span> <input type="text" name="SName" id="SName" required
														class="form-control" placeholder="Sample Name">
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
												String sql = "select * from Customer,appointdate WHERE (Customer.CCode=appointdate.CCode AND Customer.Request='Accepted' AND appointdate.AppID IS NOT NULL)";
												resultSet = statement.executeQuery(sql);
								%>
								<div class="row">
									<div class="col-sm-6">
										<div class="form-group">
											<label for="CCode"> <i id="star">*&nbsp</i>Customer
												Name
											</label>
											<div class="form-group has-success has-feedback">
												<div class="input-group">
													<span class="input-group-addon"> <i
														class="fa fa-user"></i>
													</span> <select name="CCode" id="CCode" class="form-control"
														required>
														<option value="">-- Select Customer --</option>
														<%
															while (resultSet.next()) {
														%>
														<option value='<%=resultSet.getString("CCode")%>'>
															<%=resultSet.getString("FName")%>
															<%=resultSet.getString("MName")%>
															<%=resultSet.getString("LName")%>
														</option>
														<%
															}
														%>
													</select>
												</div>
											</div>
										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group">
											<label for="SType"> <i id="star">*&nbsp</i>Sample
												Type
											</label>
											<div class="form-group has-success has-feedback">
												<div class="input-group">
													<span class="input-group-addon"> <i
														class="fa fa-table"></i>
													</span> <select name="SType" id="SType" class="form-control"
														required="">
														<option value="">--Sample Type--</option>
														<option value="Food">Food</option>
														<option value="Drugs">Drugs</option>
													</select>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-6">
										<div class="form-group">
											<label for="batch"> <i id="star">*&nbsp</i>Batch
												Number
											</label>
											<div class="form-group has-success has-feedback">
												<div class="input-group">
													<span class="input-group-addon"> <i
														class="fa fa-sort-numeric-asc"></i>
													</span> <input type="text" name="batch" id="batch" required
														class="form-control" placeholder="Enter Batch">
												</div>
											</div>
										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group">
											<label for="prodDate"> <i id="star">*&nbsp</i>Production
												Date
											</label>
											<div class="form-group has-success has-feedback">
												<div class="input-group">
													<span class="input-group-addon"> <i
														class="fa fa-calendar"></i>
													</span> <input type="date" name="prodDate" id="prodDate" required
														class="form-control" placeholder="Enter Production Date"
														style="padding: 0px 0px 5px 10px;">
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-6">
										<div class="form-group">
											<label for="expDate"> <i id="star">*&nbsp</i>Expire
												Date
											</label>
											<div class="form-group has-success has-feedback">
												<div class="input-group">
													<span class="input-group-addon"> <i
														class="fa fa-calendar"></i>
													</span> <input type="date" name="expDate" id="expDate"
														class="form-control" required=""
														style="padding: 0px 0px 5px 10px;"
														placeholder="Enter Expire Date">
												</div>
											</div>
										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group">
											<label for="manufacture"> <i id="star">*&nbsp</i>Manufacturer
											</label>
											<div class="form-group has-success has-feedback">
												<div class="input-group">
													<span class="input-group-addon"> <i
														class="fa fa-user"></i>
													</span> <input type="text" name="manufacture" id="manufacture"
														class="form-control" required=""
														placeholder="Enter Manufacture">
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-6">
										<div class="form-group">
											<label for="RQuantity"> <i id="star">*&nbsp</i>Received
												Quantity
											</label>
											<div class="form-group has-success has-feedback">
												<div class="input-group">
													<span class="input-group-addon"> <i
														class="fa fa-info-circle"></i>
													</span> <input type="text" name="RQuantity" id="RQuantity"
														class="form-control" required=""
														placeholder="Enter Quantity">
												</div>
											</div>
										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group">
											<label for="recDate"> <i id="star">*&nbsp</i>Received
												Date
											</label>
											<div class="form-group has-success has-feedback">
												<div class="input-group">
													<span class="input-group-addon"> <i
														class="fa fa-calendar"></i>
													</span> <input type="text" name="recDate"
														style="padding: 0px 0px 5px 10px;" id="recDate"
														value='<fmt:formatDate type = "date" value = "${now}"/>'
														class="form-control" required readonly>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-6">
										<div class="form-group">
											<label for="custType"> <i id="star">*&nbsp</i>Customer
												Type
											</label>
											<div class="form-group has-success has-feedback">
												<div class="input-group">
													<span class="input-group-addon"> <i
														class="fa fa-info-circle"></i>
													</span> <select name="custType" id="custType" class="form-control"
														required="">
														<option value="">---Select Customer Type---</option>
														<option value="External">External</option>
														<option value="Certification">Certification</option>
													</select>
												</div>
											</div>
										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group">
											<label for="brand"> <i id="star">*&nbsp</i>Brand
											</label>
											<div class="form-group has-success has-feedback">
												<div class="input-group">
													<span class="input-group-addon"> <i
														class="fa fa-info-circle"></i>
													</span> <input type="text" name="brand" id="brand"
														class="form-control" required="" placeholder="Enter Brand">
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
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary" name="submit"
							onclick="return EditValidateSample()" style="float: left;">SAVE
							SAMPLE</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</form>
				<script type="text/javascript">
					function EditValidateSample() {
						if (document.EditSample.SName.value == "") {
							alert("Enter Sample Name");
							document.EditSample.SName.focus();
							return false;
						}
						if (document.EditSample.brand.value == "") {
							alert("Please provide Brand Name!");
							document.EditSample.brand.focus();
							return false;
						}

						if (document.EditSample.SType.value == "") {
							alert("Please provide Sample Type!");
							document.EditSample.SType.focus();
							return false;
						}

						if (document.EditSample.batch.value == "") {
							alert("Please provide Batch Number!");
							document.EditSample.batch.focus();
							return false;
						}

						if (document.EditSample.RQuantity.value == "") {
							alert("Please provide Quantity!");
							document.EditSample.RQuantity.focus();
							return false;
						}

						if (document.EditSample.prodDate.value == "") {
							alert("Please provide Date Production of Sample!");
							document.EditSample.prodDate.focus();
							return false;
						}

						if (document.EditSample.expDate.value == "") {
							alert("Please provide Expire Date of Sample!");
							document.EditSample.expDate.focus();
							return false;
						}

						if (document.EditSample.custType.value == "") {
							alert("Please provide Type of Customer!");
							document.EditSample.custType.focus();
							return false;
						}

						if (document.EditSample.CCode.value == "") {
							alert("Please provide Customer Name!");
							document.EditSample.CCode.focus();
							return false;
						}

						if (document.EditSample.manufacture.value == "") {
							alert("Please provide Manufacture Name!");
							document.EditSample.manufacture.focus();
							return false;
						}
					}
				</script>
			</div>
		</div>
	</div>
	<!-- ************************************************************************** -->
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
<!-- START MODAL -->
<%
	if (request.getParameter("SCode") != null) {
		String id = request.getParameter("SCode");
		sampleVariable L = UserQuery.getRecordById1(id);
%>
<%
	}
%>
<%
	session.setAttribute("rejReq", null);
%>
<%
	session.setAttribute("addReq", null);
%>
<%
	session.setAttribute("addSamp", null);
%>
<%
	session.setAttribute("updateSamp", null);
%>
<%
	session.setAttribute("dirLab", null);
%>