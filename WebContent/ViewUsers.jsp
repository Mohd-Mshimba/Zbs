<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="quuery.UserQuery,loginVar.userVariable.*,java.util.*"%>
<%@page import="quuery.UserQuery"%>
<%@page import="loginVar.userVariable"%>
<jsp:useBean id="u" class="loginVar.userVariable"></jsp:useBean>
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
			<%
				List<userVariable> list = UserQuery.getAllUser();
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
					<h3 style="margin-left: -12px;">Manage Lab Expert Staff</h3>
					<div class="row"
						style="background: #fff; height: 600px; padding: 80px 50px 50px 50px; overflow: auto;"
						class="table-responsive;">
						<!-- Content -->
						<%
							if (session.getAttribute("updateLabExp") != null) {
						%>
						<span
							style="margin: 0px 0px; text-align: center; font-size: 18px; color: green;">
							<script>
								swal(
										"YOU HAVE SUCCESS TO UPDATE LAB EXPERT..!!",
										"Say OK!", "success")
							</script>
						</span>
						<%
							}
						%>
						<%
							if (session.getAttribute("addUser") != null) {
						%>
						<span
							style="margin: 0px 0px; text-align: center; font-size: 18px; color: green;">
							<script>
								swal("YOU HAVE SUCCESS TO ADD LAB EXPERT..!!",
										"Say OK!", "success")
							</script>
						</span>
						<%
							}
						%>
						<%
							if (session.getAttribute("deleteteLabExp") != null) {
						%>
						<span
							style="margin: 0px 0px; text-align: center; font-size: 18px; color: green;">
							<script>
								swal(
										"YOU HAVE SUCCESS TO DELETE LAB EXPERT..!!",
										"Say OK!", "success")
							</script>
						</span>
						<%
							}
						%>
						<button class="btn btn-success"
							style="margin-bottom: -45px; width: 10%" data-toggle="modal"
							data-target="#staffModal">Add New</button>
						<table class="table table-striped table-bordered"
							style="text-align: center;" id="data">
							<thead style="text-align: center; background: #E3F2F1;">
								<tr>
									<th id="th">View</th>
									<th id="th">First Name</th>
									<th id="th">Middle Name</th>
									<th id="th">Last Name</th>
									<th id="th">Address</th>
									<th id="th">Gender</th>
									<th id="th">Email</th>
									<th id="th">Status</th>
									<th id="th">Phone</th>
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
										<td id="th"><a href="viewLabExp.jsp?SID=${u.getSID()}"><i
												class="fa fa-eye"></i></a></td>
										<td>${u.getFName()}</td>
										<td>${u.getMName()}</td>
										<td>${u.getLName()}</td>
										<td>${u.getAddress()}</td>
										<td>${u.getGender()}</td>
										<td>${u.getEmail()}</td>
										<td>${u.getStatus()}</td>
										<td>${u.getPhone()}</td>
										<td id="th"><a href=""
											class="btn  border border-light border-2 rounded-pill"
											data-toggle="modal"
											data-target="#editLabExp<%out.print(count);%>"><i
												class="fa fa-edit"></i></a></td>
										<td id="th"><a href="deleteLabExp.jsp?SID=${u.getSID()}"
											onclick="return Delete()"><i class="fa fa-trash-o"
												style="color: red;"></i></a></td>
									</tr>
									<div class="modal fade" id="editLabExp<%out.print(count);%>"
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
															<form action="updateLabExpHandler.jsp" method="POST">
																<input type="text" hidden="" name="SID"
																	value="${u.getSID()}">
																<div class="row">
																	<div class="col-sm-6">
																		<div class="form-group">
																			<label for="payment"> <i id="star">*&nbsp</i>First
																				Name
																			</label>
																			<div class="form-group has-success has-feedback">
																				<div class="input-group">
																					<span class="input-group-addon"> <i
																						class="fa fa-user"></i>
																					</span> <input type="text" name="FName"
																						class="form-control" value="${u.getFName()}"
																						required="">
																				</div>
																			</div>
																		</div>
																	</div>
																	<div class="col-sm-6">
																		<div class="form-group">
																			<label for="payment"> <i id="star">*&nbsp</i>Middle
																				Name
																			</label>
																			<div class="form-group has-success has-feedback">
																				<div class="input-group">
																					<span class="input-group-addon"> <i
																						class="fa fa-user"></i>
																					</span> <input type="text" name="MName"
																						class="form-control" value="${u.getMName()}"
																						required="">
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
																<div class="row">
																	<div class="col-sm-6">
																		<div class="form-group">
																			<label for="payment"> <i id="star">*&nbsp</i>Last
																				Name
																			</label>
																			<div class="form-group has-success has-feedback">
																				<div class="input-group">
																					<span class="input-group-addon"> <i
																						class="fa fa-user"></i>
																					</span> <input type="text" name="LName"
																						class="form-control" value="${u.getLName()}"
																						required="">
																				</div>
																			</div>
																		</div>
																	</div>
																	<div class="col-sm-6">
																		<div class="form-group">
																			<label for="Status"> <i id="star">*&nbsp</i>Status
																			</label>
																			<div class="form-group has-success has-feedback">
																				<div class="input-group">
																					<span class="input-group-addon"> <i
																						class="fa fa-table"></i>
																					</span> <select name="status" id="Status"
																						class="form-control" required="">
																						<option value="Lab Expart">Lab Expart</option>
																					</select>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
																<div class="row">
																	<div class="col-sm-6">
																		<div class="form-group">
																			<label for="ticket_type"> <i id="star">*&nbsp</i>Title
																			</label>
																			<div class="form-group has-success has-feedback">
																				<div class="input-group">
																					<span class="input-group-addon"> <i
																						class="fa fa-question-circle"></i>
																					</span> <select name="title" id="Title"
																						class="form-control" value="${u.getTitle()}"
																						required="">
																						<option value="Mr">Ms.</option>
																						<option value="Ms">Mr.</option>
																						<option value="Dr">Dr.</option>
																						<option value="Pr">Pr.</option>
																					</select>
																				</div>
																			</div>
																		</div>
																	</div>
																	<div class="col-sm-6">
																		<div class="form-group">
																			<label for="Gender"> <i id="star">*&nbsp</i>Gender
																			</label>
																			<div class="form-group has-success has-feedback">
																				<div class="input-group">
																					<span class="input-group-addon"> <i
																						class="fa fa-male"></i> <i class="fa fa-female"></i>
																					</span> <select name="gender" id="Gender"
																						class="form-control" required="">
																						<option value="Male">Male</option>
																						<option value="Male">Female</option>
																					</select>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
																<div class="row">
																	<div class="col-sm-6">
																		<div class="form-group">
																			<label for="Address"> <i id="star">*&nbsp</i>Address
																			</label>
																			<div class="form-group has-success has-feedback">
																				<div class="input-group">
																					<span class="input-group-addon"> <i
																						class="fa fa-home"></i>
																					</span> <input type="text" name="address"
																						class="form-control" value="${u.getAddress()}"
																						required="">
																				</div>
																			</div>
																		</div>
																	</div>
																	<div class="col-sm-6">
																		<div class="form-group">
																			<label for="Phone"> <i id="star">*&nbsp</i>Phone
																			</label>
																			<div class="form-group has-success has-feedback">
																				<div class="input-group">
																					<span class="input-group-addon"> <i
																						class="fa fa-phone"></i>
																					</span> <input type="text" name="phone"
																						class="form-control" value="${u.getPhone()}"
																						required="">
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
																<div class="row">
																	<div class="col-sm-6">
																		<div class="form-group">
																			<label for="labID"> <i id="star">*&nbsp</i>
																				Lab Type
																			</label>
																			<div class="form-group has-success has-feedback">
																				<div class="input-group">
																					<span class="input-group-addon"> <i
																						class="fa fa-question-circle"></i>
																					</span> <select name="labID" id="labID"
																						class="form-control" value="" required="">
																						<option value="ZLab02">FOOD LAB</option>
																						<option value="ZLab01">DRUG LAB</option>
																					</select>
																				</div>
																			</div>
																		</div>
																	</div>
																	<div class="col-sm-6">
																		<div class="form-group">
																			<label for="payment"> <i id="star">*&nbsp</i>Date
																				of Birth
																			</label>
																			<div class="form-group has-success has-feedback">
																				<div class="input-group">
																					<span class="input-group-addon"> <i
																						class="fa fa-calendar"></i>
																					</span> <input type="date" id="DOB" name="DOB"
																						class="form-control" value="${u.getDOB()}"
																						required="" style="padding: 0px 0px 5px 10px">
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
																<div class="row">
																	<div class="col-sm-6">
																		<div class="form-group">
																			<label for="Password"> <i id="star">*&nbsp</i>
																				Employee ID
																			</label>
																			<div class="form-group has-success has-feedback">
																				<div class="input-group">
																					<span class="input-group-addon"> <i
																						class="fa fa-credit-card"></i>
																					</span> <input type="text" name="SID" id="SID"
																						class="form-control" required="" readonly
																						value="${u.getSID()}">
																				</div>
																			</div>
																		</div>
																	</div>
																	<div class="col-sm-6">
																		<div class="form-group">
																			<label for="Email"> <i id="star">*&nbsp</i>Email
																			</label>
																			<div class="form-group has-success has-feedback">
																				<div class="input-group">
																					<span class="input-group-addon"> <i
																						class="fa fa-envelope-o"></i>
																					</span> <input type="email" name="email" readonly
																						class="form-control" value="${u.getEmail()}"
																						required="">
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
																<div class="row">
																	<div class="col-sm-12">
																		<input type="submit" class="btn btn-success"
																			value="UPDATE USERS" name="submit"> <span
																			id="star" style="float: right;">*&nbsp<span
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
								</c:forEach>
							</tbody>
						</table>
						<!-- *********** -->
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
	<div class="modal fade" id="staffModal">
		<div class="modal-dialog modal-lg modal-dialog-right"
			style="z-index: 0">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">New Lab Staff</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<!-- Modal body -->
				<div class="modal-body">
					<form action='directAddUser.jsp' method='POST'>
						<div class="row">
							<input type="text" name="signature" value="OK" hidden="" /> <input
								type="text" name="photo" value="OK" hidden="" /> <input
								type="text" name="username" value="user01" hidden="" />
							<div class="col-xl-4 col-lg-4 col-md-4 col-sm-12 mbr-col">
								<div class="form-group">
									<label for="">First Name</label> <input type="text"
										name="FName" id="" class="form-control mb-2 mr-sm-2 fName"
										placeholder="First Name" required />
								</div>
							</div>
							<div class="col-xl-4 col-lg-4 col-md-4 col-sm-12 mbr-col">
								<div class="form-group">
									<label for="">Middle Name</label> <input type="text"
										name="MName" id="" class="form-control mb-2 mr-sm-2 mName"
										placeholder="Middle Name" required="">
								</div>
							</div>
							<div class="col-xl-4 col-lg-4 col-md-4 col-sm-12 mbr-col">
								<div class="form-group">
									<label for="">Last Name</label> <input type="text" name="LName"
										id="" class="form-control mb-2 mr-sm-2 lName"
										placeholder="Last Name" required="" />
								</div>
							</div>
							<div class="col-xl-4 col-lg-4 col-md-4 col-sm-12 mbr-col">
								<div class="form-group">
									<label for="">Gender</label> <select name="gender" id=""
										class="form-control mb-2 mr-sm-2 custom-select gender">
										<option value="">--Your gender--</option>
										<option value="Male">Male</option>
										<option value="Female">Female</option>
									</select>
								</div>
							</div>
							<div class="col-xl-4 col-lg-4 col-md-4 col-sm-12 mbr-col">
								<div class="form-group">
									<label for="">Date of Birth</label> <input type="date"
										name="DOB" id="" class="form-control mb-2 mr-sm-2 dob"
										required="">
								</div>
							</div>
							<div class="col-xl-4 col-lg-4 col-md-4 col-sm-12 mbr-col">
								<div class="form-group">
									<label for="">Address</label> <input type="text" name="address"
										id="" class="form-control mb-2 mr-sm-2 address"
										placeholder="Your Address" required="">
								</div>
							</div>
							<div class="col-xl-4 col-lg-4 col-md-4 col-sm-12 mbr-col">
								<div class="form-group">
									<label for="">Email (Username)</label> <span
										style="float: right; font-size: 20px;"></span> <input
										type="email" name="email" id=""
										class="form-control mb-2 mr-sm-2 email"
										placeholder="someone@email.com" required="">
								</div>
							</div>
							<div class="col-xl-4 col-lg-4 col-md-4 col-sm-12 mbr-col">
								<div class="form-group">
									<label for="">Phone number</label> <input type="text"
										name="phone" id="" class="form-control mb-2 mr-sm-2 phone"
										value="+255-" data-slots="_" required="">
								</div>
							</div>
							<div class="col-xl-4 col-lg-4 col-md-4 col-sm-12 mbr-col">
								<div class="form-group">
									<label for="">Title</label> <select name="title" id=""
										class="form-control mb-2 mr-sm-2 custom-select title"
										required="">
										<option value="">--Staff Title--</option>
										<option value="Mr">Mr.</option>
										<option value="Ms">Ms.</option>
										<option value="Dr">Dr.</option>
										<option value="Pr">Pr.</option>
									</select>
								</div>
							</div>
							<div class="col-xl-4 col-lg-4 col-md-4 col-sm-12 mbr-col">
								<div class="form-group">
									<label for="">Status</label> <select name="status" id=""
										class="form-control mb-2 mr-sm-2 custom-select status"
										required="">
										<option value="Lab Expart">Lab Expart</option>
									</select>
								</div>
							</div>
							<div class="col-xl-4 col-lg-4 col-md-4 col-sm-12 mbr-col">
								<!-- SUPERVISOR JAVA CODE -->
								<%
									Connection connection = null;
											Statement statement = null;
											ResultSet resultSet = null;
											try {
												connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/FINAL", "root", "");
												statement = connection.createStatement();
												String sql = "select * from Lab WHERE LabName!='STORE'";
												resultSet = statement.executeQuery(sql);
								%>
								<div class="form-group">
									<label for="Lab Location">Lab Name</label> <select name="labID"
										class="form-control mb-2 mr-sm-2 custom-select lab"
										required="required">
										<%
											while (resultSet.next()) {
										%>
										<option value="<%=resultSet.getString("LabID")%>">
											<%=resultSet.getString("LabName")%>
										</option>
										<%
											}
										%>
									</select>
								</div>
								<!-- SUPERVISOR JAVA CODE -->
							</div>
							<%
								try {
												Class.forName("com.mysql.jdbc.Driver").newInstance();
												Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/FINAL", "root",
														"");
												Statement st = con.createStatement();
												String strQuery = "SELECT COUNT(*) FROM Staff";
												ResultSet rs = st.executeQuery(strQuery);
												String Countrow = "";
												while (rs.next()) {
													int x = Integer.parseUnsignedInt(rs.getString(1));
													x = x + 1;
													Countrow = String.valueOf(x);
												}
							%>
							<div class="col-xl-4 col-lg-4 col-md-4 col-sm-12 mbr-col">
								<div class="form-group">
									<label for="">Employee ID</label> <span
										style="float: right; font-size: 20px;"></span> <input
										type="text" name="SID" id=""
										value="ZBS000<%out.println(Countrow);%>"
										class="form-control mb-2 mr-sm-2 Password"
										placeholder="ZBS0001" required="" readonly="">
								</div>
							</div>
							<%
								} catch (Exception e) {
												e.printStackTrace();
											}
							%>
						</div>
						<div class="form-group" id="submitDiv">
							<button class="form-control btn btn-primary" name="submit"
								type="submit">CREATE ACCOUNT</button>
						</div>
					</form>
				</div>
				<!-- Modal footer -->
				<div class="modal-footer" style="text-align: center;">
					<img src="bootstrap/img/zbs.png" style="width: 60px; height: auto;">
					<span> Copyright © 2021 Zanzibar Bereau of Standards. </span>
				</div>
			</div>
		</div>
	</div>
	<%
		} catch (Exception e) {
					e.printStackTrace();
				}
	%>
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
<%
	session.setAttribute("updateLabExp", null);
%>
<%
	session.setAttribute("addUser", null);
%>
<%
	session.setAttribute("deleteteLabExp", null);
%>
</html>