<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="quuery.UserQuery,loginVar.labVariable.*,java.util.*"%>
<%@page import="quuery.UserQuery,loginVar.userVariable.*,java.util.*"%>
<%@page import="quuery.UserQuery,loginVar.loginVariable.*,java.util.*"%>
<%@page import="quuery.UserQuery"%>
<%@page import="loginVar.labVariable"%>
<jsp:useBean id="u" class="loginVar.labVariable"></jsp:useBean>
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
					List<labVariable> list = UserQuery.getLabRec();
							request.setAttribute("list", list);
				%>
				<div class="content"
					style="height: 690px; width: 100%; background: #E3F2F1; padding: 9px 35px">
					<h3 style="margin-left: -12px;">Add New Lab</h3>
					<div class="row"
						style="background: #fff; height: 600px; padding: 80px 50px 50px 50px; overflow: auto;"
						class="table-responsive;">
						<!-- Content -->
						<button class="btn btn-success"
							style="margin-bottom: -45px; width: 10%" data-toggle="modal"
							data-target="#foodLab">Add New</button>
						<!-- Modal -->
						<form action="direct.jsp" method="POST">
							<div class="modal fade" id="foodLab" role="dialog">
								<div class="modal-dialog">
									<!-- Modal content-->
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">&times;</button>
											<h4 class="modal-title">Add New Lab</h4>
										</div>
										<div class="modal-body">
											<p>
												<%
													try {
																Class.forName("com.mysql.jdbc.Driver").newInstance();
																Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/FINAL", "root", "");
																Statement st = con.createStatement();
																String strQuery = "SELECT COUNT(*) FROM Lab";
																ResultSet rs = st.executeQuery(strQuery);
																String Countrow = "";
																while (rs.next()) {
																	int x = Integer.parseUnsignedInt(rs.getString(1));
																	x = x + 1;
																	Countrow = String.valueOf(x);
																}
												%>
											
											<div class="form-group">
												<label class="control-label">Lab ID</label> <input
													type="text" class="form-control"
													aria-describedby="helpBlock2"
													value="ZLab0<%out.println(Countrow);%>" name="labID"
													required="required" readonly>
											</div>
											<%
												} catch (Exception e) {
															e.printStackTrace();
														}
											%>
											<div class="form-group">
												<label class="control-label">Lab Name</label> <input
													type="text" class="form-control"
													aria-describedby="helpBlock2" name="labName"
													required="required">
											</div>
											<div class="form-group">
												<label for="Lab Location">Lab Location</label> <select
													name="location"
													class="form-control mb-2 mr-sm-2 custom-select lab"
													required="required">
													<option>---- Lab Location ----</option>
													<option value="AMANI">AMANI</option>
													<option value="MOMBASA">MOMBASA</option>
												</select>
											</div>
											<!-- SUPERVISOR JAVA CODE -->
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
											<div class="form-group">
												<label for="Lab Location">Supervisor Name</label> <select
													name="sup_ID" required=""
													class="form-control mb-2 mr-sm-2 custom-select lab">
													<%
														while (resultSet.next()) {
													%>
													<option value="<%=resultSet.getString("SID")%>">
														<%=resultSet.getString("FName")%>
														<%=resultSet.getString("mName")%>
														<%=resultSet.getString("lName")%>
													</option>
													<%
														}
																	connection.close();
													%>
												</select>
											</div>
											<!-- SUPERVISOR JAVA CODE -->
											</p>
										</div>
										<div class="modal-footer">
											<button type="submit" class="btn btn-primary"
												style="float: left;">ADD NEW LAB</button>
										</div>
									</div>
								</div>
							</div>
						</form>
						<!--   END MODAL -->
						<%
							if (session.getAttribute("updateLab") != null) {
						%>
						<span
							style="margin: 0px 0px; text-align: center; font-size: 18px; color: green;">
							<script>
								swal("YOU HAVE SUCCESS TO UPDATE LAB..!!",
										"Say OK!", "success")
							</script>
						</span>
						<%
							}
						%>
						<%
							if (session.getAttribute("addLab") != null) {
						%>
						<span
							style="margin: 0px 0px; text-align: center; font-size: 18px; color: green;">
							<script>
								swal("YOU HAVE SUCCESS TO ADD LAB..!!",
										"Say OK!", "success")
							</script>
						</span>
						<%
							}
						%>
						<%
							if (session.getAttribute("deleteteLab") != null) {
						%>
						<span
							style="margin: 0px 0px; text-align: center; font-size: 18px; color: green;">
							<script>
								swal("YOU HAVE SUCCESS TO DELETE LAB..!!",
										"Say OK!", "success")
							</script>
						</span>
						<%
							}
						%>
						<table class="table table-striped table-bordered"
							style="text-align: center;" id="data">
							<thead style="text-align: center; background: #E3F2F1;">
								<tr>
									<th id="th">Lab ID</th>
									<th id="th">Lab Name</th>
									<th id="th">Loocation</th>
									<th id="th">Supervior ID</th>
									<th id="th">Edit</th>
									<th id="th">Delete</th>
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
										<td>${u.getLabID()}</td>
										<td>${u.getLabName()}</td>
										<td>${u.getLocation()}</td>
										<td>${u.getSup_ID()}</td>
										<td><a href=""
											class="btn  border border-light border-2 rounded-pill"
											data-toggle="modal"
											data-target="#editLab<%out.print(count);%>"><i
												class="fa fa-edit"></i></a></td>
										<td id="th"><a href="deleteLab.jsp?labID=${u.getLabID()}"
											onclick="return Delete()"><i class="fa fa-trash-o"
												style="color: red;"></i></a></td>
									</tr>
									<div class="modal fade" id="editLab<%out.print(count);%>"
										role="dialog">
										<div class="modal-dialog modal-md">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal">&times;</button>
													<h4 class="modal-title">Edit Laboratory</h4>
												</div>
												<div class="modal-body">
													<div class="row">
														<div class="col-sm-12">
															<form action="updateLabHandler.jsp" method="POST">
																<div class="row">
																	<div class="col-xs-12 col-sm-6">
																		<div class="form-group">
																			<label for="lName"> <i id="star">*&nbsp</i>Lab
																				ID
																			</label>
																			<div class="form-group has-success has-feedback">
																				<div class="input-group">
																					<span class="input-group-addon"> <i
																						class="fa fa-credit-card-alt"></i>
																					</span> <input type="text" name="labID"
																						class="form-control" value="${u.getLabID()}"
																						required="" readonly="">
																				</div>
																			</div>
																		</div>
																	</div>
																	<div class="col-xs-12 col-sm-6">
																		<div class="form-group">
																			<label for="lName"> <i id="star">*&nbsp</i>Lab
																				Name
																			</label>
																			<div class="form-group has-success has-feedback">
																				<div class="input-group">
																					<span class="input-group-addon"> <i
																						class="fa fa-table"></i>
																					</span> <input type="text" name="labName"
																						class="form-control" value="${u.getLabName()}"
																						required="">
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
																<div class="row">
																	<div class="col-xs-12 col-sm-12">
																		<div class="form-group">
																			<label for="lName"> <i id="star">*&nbsp</i>Lab
																				Location
																			</label>
																			<div class="form-group has-success has-feedback">
																				<div class="input-group">
																					<span class="input-group-addon"> <i
																						class="fa fa-home"></i>
																					</span> <input type="text" id="lName" name="location"
																						class="form-control" value="${u.getLocation()}"
																						required="">
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
																<%
																	Connection con1 = null;
																					Statement stat1 = null;
																					ResultSet result1 = null;
																					con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/FINAL", "root", "");
																					stat1 = con1.createStatement();
																					String sq = "select * from staff WHERE Status='Lab Expart'";
																					result1 = stat1.executeQuery(sq);
																%>
																<div class="row">
																	<div class="col-xs-12 col-sm-12">
																		<div class="form-group">
																			<label for="lName"> <i id="star">*&nbsp</i>
																				Supervisor Name
																			</label>
																			<div class="form-group has-success has-feedback">
																				<div class="input-group">
																					<span class="input-group-addon"> <i
																						class="fa fa-user"></i>
																					</span> <select name="sup_ID"
																						class="form-control mb-2 mr-sm-2 custom-select lab"
																						required="required">
																						<%
																							while (result1.next()) {
																						%>
																						<option value='<%=result1.getString("SID")%>'>
																							<%=result1.getString("fName")%>
																							<%=result1.getString("mName")%>
																							<%=result1.getString("lName")%>
																						</option>
																						<%
																							}
																											con1.close();
																						%>
																					</select>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
																<br>
																<div class="row">
																	<div class="col-xs-12 col-sm-12">
																		<button type="submit" name="submit"
																			class="btn btn-success" style="font-weight: bold">UPDATE
																			LAB</button>
																		<span id="star" style="float: right">*&nbsp; <span
																			style="color: black; font-size: 16px;" id="Mandatory">Means
																				Mandatory to Fill</span>
																		</span> <br> <br>
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
								</c:forEach>
							</tbody>
						</table>
						<%
							} catch (Exception e) {
										e.printStackTrace();
									}
						%>
						<!-- *********** -->
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
<%
	session.setAttribute("addLab", null);
%>
<%
	session.setAttribute("updateLab", null);
%>
<%
	session.setAttribute("deleteteLab", null);
%>
</html>