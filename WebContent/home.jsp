<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.util.*;"%>
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
</head>
<!------------------- JAVA BLOCK ------------------------------>
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
			Connection connection = null;
			Statement statement = null;
			ResultSet resultSet = null;
			String username = (String) session.getAttribute("username");
			String password = (String) session.getAttribute("password");
			try {
				connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/FINAL", "root", "");
				statement = connection.createStatement();
				String sql = "SELECT * FROM STAFF, LOGIN WHERE (STAFF.Email=LOGIN.Username AND STAFF.Email='"
						+ username + "' AND LOGIN.Password='" + password + "')";
				resultSet = statement.executeQuery(sql);
				while (resultSet.next()) {
					session.setAttribute("username", username);
					session.setAttribute("password", password);
					session.setAttribute("homeStatus", resultSet.getString("Status"));
					session.setAttribute("Photo", resultSet.getString("Photo"));
					session.setAttribute("id", resultSet.getString("SID"));
					session.setAttribute("fName", resultSet.getString("fName"));
					session.setAttribute("mName", resultSet.getString("mName"));
					session.setAttribute("lName", resultSet.getString("lName"));
%>
<!------------------- END JAVA BLOCK ------------------------------>
<body>
	<div class="wrapper">
		<div class="wrapper_inner">
			<div class="vertical_wrap">
				<div class="backdrop"></div>
				<div class="vertical_bar">
					<!--********************************************************************************* -->
					<jsp:include page="Menu.jsp" />
					<!--********************************************************************************* -->
				</div>
			</div>
			<div class="main_container">
				<div class="top_bar">
					<div class="hamburger">
						<i class="fa fa-bars"></i>
					</div>
					<div class="logo">
						FOOD & DRUD INSPECTION <span>USING BARCODE</span>
					</div>
				</div>
				<div class="container">
					<div class="content" style="margin: -25px 0px 0px 0px;">
						<h3 style="font-family: Lucida Bright; margin-left: 20px">
							<span>USER PROFILE</span>
							<!-- ############### SUCCESS MSG ############# -->
							<%
								if (session.getAttribute("success") != null) {
							%>
							<span
								style="margin: 0px 300px; text-align: center; font-size: 18px; color: green; font-weight: bold">
								<script type="text/javascript">
									swal(
											"You have been success to Upadte Data",
											"Say OK!", "success")
								</script>
							</span>
							<%
								}
							%>
							<%
								if (session.getAttribute("upload") != null) {
							%>
							<span
								style="margin: 0px 300px; text-align: center; font-size: 18px; color: green; font-weight: bold">
								<script>
									swal(
											"You have been success to Upadte Profile..!!!",
											"Say OK!", "success")
								</script>
							</span>
							<%
								}
							%>
							<!-- ######################################## -->
						</h3>
						<!--******************CONTENTS************************* -->
						<div class="col-sm-9"
							style="background: #fff; min-height: 500px; width: 95%; margin: 0px 0px 0px 25px;">
							<!-- ####### CONTENT ###### -->
							<div class="row content"
								style="border-bottom: 2px solid #f7f7f7; border-top: 2px solid #f7f7f7;">
								<div class="col-sm-12"
									style="padding: 15px 5px; font-size: medium; font-weight: bold; text-align: center; border-bottom: 2px solid #f7f7f7;">
									<button data-toggle="modal" data-target="#view-modal"
										id="<%=resultSet.getString("SID")%>"
										class="btn btn-sm btn-primary">
										<i class="fa fa-edit" style="margin-right: 10px;"></i> Edit
										Profile
									</button>
									<button data-toggle="modal" data-target="#passModal"
										class="fa fa-lock btn btn-danger">&nbsp&nbspChange
										Password</button>
								</div>
								<div class="col-lg-8 col-md-8 col-sm-7 col-12"
									style="border-right: 2px solid #f7f7f7;">
									<fieldset>
										<legend style="color: #4caf50; margin: 0px;">Personal
											Information</legend>
										<table class="table table-sm table-hover">
											<tr>
												<th style="width: 150px;">Title:</th>
												<td><%=resultSet.getString("Title")%></td>
											</tr>
											<tr>
												<th>Full Name:</th>
												<td><%=resultSet.getString("FName")%>&nbsp&nbsp&nbsp <%=resultSet.getString("MName")%>&nbsp&nbsp&nbsp
													<%=resultSet.getString("LName")%>&nbsp&nbsp&nbsp</td>
											</tr>
											<tr>
												<th>Date of Birth:</th>
												<td><%=resultSet.getString("Dob")%></td>
											</tr>
											<tr>
												<th>Genger:</th>
												<td><%=resultSet.getString("Gender")%></td>
											</tr>
										</table>
									</fieldset>
									<fieldset>
										<legend style="color: #4caf50; margin: 0px;">Account
											Information</legend>
										<table class="table table-sm table-hover">
											<tr>
												<th style="width: 150px;">Employee ID:</th>
												<td>FDI_<%=resultSet.getString("SID")%></td>
											</tr>
											<tr>
												<th>Username:</th>
												<td><%=resultSet.getString("Username")%></td>
											</tr>
											<tr>
												<th>Position:</th>
												<td><%=resultSet.getString("Status")%></td>
											</tr>
										</table>
									</fieldset>
									<fieldset>
										<legend style="color: #4caf50; margin: 0px;">Contact
											Information</legend>
										<table class="table table-sm table-hover">
											<tr>
												<th style="width: 150px;">Address:</th>
												<td><%=resultSet.getString("Address")%></td>
											</tr>
											<tr>
												<th>Mobile:</th>
												<td><%=resultSet.getString("Phone")%></td>
											</tr>
											<tr>
												<th>Email:</th>
												<td><%=resultSet.getString("Email")%></td>
											</tr>
										</table>
									</fieldset>
								</div>
								<div class="col-lg-4 col-md-4 col-sm-5 col-12"
									style="margin-top: 10px; padding: 20px;">
									<div style="width: 100%;">
										<img src="bootstrap/img/<%=resultSet.getString("Photo")%>"
											style="max-width: 90%; border-radius: 20px; border: 5px double #515151;"
											class="img-responsive">
									</div>
									<form method="post" action="image-process.jsp">
										<div class="form-group">
											<input type="file" name="Photo"
												class="form-control mb-2 mr-sm-2 photo" required=""
												style="width: 90%; border: 0px; color: #515151;" />
										</div>
										<input type="text" name="SID"
											value="<%=resultSet.getString("SID")%>" hidden>
										<div class="form-group">
											<input type="submit" class="form-control mb-2 mr-sm-2"
												value="Change Picture"
												style="background-color: #4caf50; color: #ffffff; width: 90%" />
										</div>
									</form>
								</div>
							</div>
							<!-- MODAL EDIT PROFILE -->
							<div id="view-modal" class="modal fade" tabindex="-1"
								role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
								style="display: none;">
								<div class="modal-dialog">
									<div class="modal-content">
										<form method="POST" action="updateProfileHandler.jsp"
											name="ProfValidate">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"
													aria-hidden="true">×</button>
												<h4 class="modal-title">Edit Profile</h4>
											</div>
											<div class="modal-body">
												<div class="row">
													<div class="col-sm-12">
														<div class="row">
															<div class="col-sm-6">
																<input type="text" name="SID" id="SID" hidden=""
																	value="<%=resultSet.getString("SID")%>">
																<div class="form-group">
																	<label for="fName"> <i id="star">*&nbsp</i>First
																		Name
																	</label>
																	<div class="form-group has-success has-feedback">
																		<div class="input-group">
																			<span class="input-group-addon"> <i
																				class="fa fa-user"></i>
																			</span> <input type="text" name="FName" id="fName"
																				class="form-control"
																				value="<%=resultSet.getString("FName")%>"
																				required="">
																		</div>
																	</div>
																</div>
															</div>
															<div class="col-sm-6">
																<div class="form-group">
																	<label for="mName"> <i id="star">&nbsp</i>Middle
																		Name
																	</label>
																	<div class="form-group has-success has-feedback">
																		<div class="input-group">
																			<span class="input-group-addon"> <i
																				class="fa fa-user"></i>
																			</span> <input type="text" id="mName" name="MName"
																				class="form-control"
																				value="<%=resultSet.getString("MName")%>">
																		</div>
																	</div>
																</div>
															</div>
															<div class="col-sm-6">
																<div class="form-group">
																	<label for="lName"> <i id="star">*&nbsp</i>Last
																		Name
																	</label>
																	<div class="form-group has-success has-feedback">
																		<div class="input-group">
																			<span class="input-group-addon"> <i
																				class="fa fa-user"></i>
																			</span> <input type="text" id="lName" name="LName"
																				class="form-control"
																				value="<%=resultSet.getString("LName")%>"
																				required="">
																		</div>
																	</div>
																</div>
															</div>
															<div class="col-sm-6">
																<div class="form-group">
																	<label for="gender"> <i id="star">*&nbsp</i>Gender
																	</label>
																	<div class="form-group has-success has-feedback">
																		<div class="input-group">
																			<span class="input-group-addon"> <i
																				class="fa fa-user"></i>
																			</span> <select name="gender" id="gender"
																				class="form-control" required>
																				<option value="<%=resultSet.getString("Gender")%>">
																					<%=resultSet.getString("Gender")%>
																				</option>
																				<option value="Male">Male</option>
																				<option value="Female">Female</option>
																			</select>
																		</div>
																	</div>
																</div>
															</div>
															<div class="col-sm-6">
																<div class="form-group">
																	<label for="dob"> <i id="star">*&nbsp</i>Date
																		of Birth
																	</label>
																	<div class="form-group has-success has-feedback">
																		<div class="input-group">
																			<span class="input-group-addon"> <i
																				class="fa fa-calendar"></i>
																			</span> <input type="date" name="DOB" id="dob"
																				class="form-control"
																				value="<%=resultSet.getString("Dob")%>" required=""
																				style="padding: 0px 0px 12px 5px;">
																		</div>
																	</div>
																</div>
															</div>
															<div class="col-sm-6">
																<div class="form-group">
																	<label for="phone"> <i id="star">*&nbsp</i>Phone
																		Number
																	</label>
																	<div class="form-group has-success has-feedback">
																		<div class="input-group">
																			<span class="input-group-addon"> <i
																				class="fa fa-phone"></i>
																			</span> <input type="text" name="phone" id="phone"
																				class="form-control"
																				value="<%=resultSet.getString("Phone")%>"
																				required="">
																		</div>
																	</div>
																</div>
															</div>
															<div class="col-sm-12">
																<div class="form-group">
																	<label for="address"> <i id="star">*&nbsp</i>Address
																	</label>
																	<div class="form-group has-success has-feedback">
																		<div class="input-group">
																			<span class="input-group-addon"> <i
																				class="fa fa-home"></i>
																			</span> <input type="text" name="address" id="address"
																				class="form-control"
																				value="<%=resultSet.getString("Address")%>"
																				required="">
																		</div>
																	</div>
																</div>
															</div>
															<div class="col-sm-6">
																<div class="form-group">
																	<label for="title"> <i id="star">*&nbsp</i>Title
																	</label>
																	<div class="form-group has-success has-feedback">
																		<div class="input-group">
																			<span class="input-group-addon"> <i
																				class="fa fa-"></i><i class="fa fa-user"></i>
																			</span> <select name="title" id="title" class="form-control"
																				required="">
																				<option value="<%=resultSet.getString("Title")%>"><%=resultSet.getString("Title")%></option>
																				<option value="Mr">Mr.</option>
																				<option value="Ms">Ms.</option>
																				<option value="Dr">Dr.</option>
																				<option value="Pr">Pr.</option>
																			</select>
																		</div>
																	</div>
																</div>
															</div>
															<div class="col-sm-6">
																<div class="form-group">
																	<label for="email"> <i id="star">*&nbsp</i>Email
																		(Username)
																	</label>
																	<div class="form-group has-success has-feedback">
																		<div class="input-group">
																			<span class="input-group-addon"> <i>@</i>
																			</span> <input type="email" name="email" id="email"
																				class="form-control"
																				value="<%=resultSet.getString("Email")%>" readonly
																				required="">
																		</div>
																	</div>
																</div>
															</div>
															<div class="col-sm-6">
																<div class="form-group">
																	<label for="nida"> <i id="star">*&nbsp</i>Employee
																		ID
																	</label>
																	<div class="form-group has-success has-feedback">
																		<div class="input-group">
																			<span class="input-group-addon"> <i
																				class="fa fa-credit-card-alt"></i>
																			</span> <input type="text" name="nida" id="nida"
																				class="form-control"
																				value="<%=resultSet.getString("SID")%>" required=""
																				readonly>
																		</div>
																	</div>
																</div>
															</div>
															<div class="col-sm-6">
																<div class="form-group">
																	<label for="nida"> <i id="star">*&nbsp</i>Status
																	</label>
																	<div class="form-group has-success has-feedback">
																		<div class="input-group">
																			<span class="input-group-addon"> <i
																				class="fa fa-info-circle"></i>
																			</span> <input type="text" name="status" id="Status"
																				class="form-control"
																				value="<%=resultSet.getString("Status")%>"
																				required="" readonly>
																		</div>
																	</div>
																</div>
															</div>
															<div class="col-sm-12">
																<i id="star">*&nbsp</i> <span id="Mandatory">Means
																	Required to Fill</span>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="modal-footer">
												<button class="btn btn-primary" style="float: left"
													type='submit' onclick="return ProfileValidate()">
													Update Profile</button>
												<button type="button" class="btn btn-default"
													data-dismiss="modal">Close</button>
											</div>
										</form>
									</div>
								</div>
							</div>
							<script type="text/javascript">
								function ProfileValidate() {
									// FIRST NAME
									if (document.ProfValidate.fName.value == "") {
										alert("Please Enter the First Name");
										document.ProfValidate.fName.focus();
										return false;
									}
									if (!/^[a-zA-Z]*$/g
											.test(document.ProfValidate.fName.value)) {
										alert("In First Name Please Enetr Valid Characters ( a-zA-Z )");
										document.ProfValidate.fName.focus();
										return false;
									}

									// LAST NAME
									if (document.ProfValidate.lName.value == "") {
										alert("Please Enter the Last Name");
										document.ProfValidate.lName.focus();
										return false;
									}
									if (!/^[a-zA-Z]*$/g
											.test(document.ProfValidate.lName.value)) {
										alert("In Last Name Please Enetr Valid Characters ( a-zA-Z )");
										document.ProfValidate.lName.focus();
										return false;
									}

									// GENDER
									if (document.ProfValidate.gender.value == "") {
										alert("Please Enter Gender");
										document.ProfValidate.gender.focus();
										return false;
									}

									// DATE OF BIRTH
									if (document.ProfValidate.dob.value == "") {
										alert("Please provide your Date of Birth!");
										document.ProfValidate.dob.focus();
										return false;
									}

									// PHONE NUMBER
									if (document.ProfValidate.phone.value == "") {
										alert("Please provide your Phone number!");
										document.ProfValidate.phone.focus();
										return false;
									}
									if (isNaN(document.ProfValidate.phone.value)
											|| document.ProfValidate.phone.value.length != 10) {
										alert("Mobile number should contain only 10 digits(number)");
										document.ProfValidate.phone.focus();
										return false;
									}

									// ADDRESS
									if (document.ProfValidate.address.value == "") {
										alert("Please Enter Address");
										document.ProfValidate.address.focus();
										return false;
									}
									if (!/^[a-zA-Z]*$/g
											.test(document.ProfValidate.address.value)) {
										alert("In Address Please Enetr Valid Characters ( a-zA-Z )");
										document.ProfValidate.address.focus();
										return false;
									}

									// TITLE
									if (document.ProfValidate.title.value == "") {
										alert("Please Enter Title");
										document.ProfValidate.title.focus();
										return false;
									}
								}
							</script>
							<!-- /.modal -->
							<%
								}
											connection.close();
										} catch (Exception e) {
											e.printStackTrace();
										}
							%>
						</div>
						<!--******************END CONTENTS************************* -->
					</div>
					<div
						style="height: 45px; background: #fff; padding: 15px 25px; color: #000000; margin: 640px 0px 0px -25px; width: 104%; font-weight: bold;">
						<span>Copyright © 2021 | Mohd. M. Seif</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="passModal" role="dialog">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Change Password</h4>
				</div>
				<div class="modal-body">
					<form method="POST" action="processChangePWD.jsp"
						onSubmit="return checkPassword(this)" name="PassValidate">
						<div class="form-group has-success has-feedback">
							<label class="control-label" for="inputSuccess2"> Current
								Password</label> <input type="text" name="current" class="form-control"
								id="current" aria-describedby="inputSuccess2Status" required>
							<span class="fa fa-lock form-control-feedback"
								style="padding: 10px 0px 0px 0px" aria-hidden="true"></span> <span
								id="inputSuccess2Status" class="sr-only">(success)</span>
						</div>
						<div class="form-group has-success has-feedback">
							<label class="control-label" for="inputSuccess2"> New
								Password</label> <input type="password" name="password1"
								class="form-control" id="password1"
								aria-describedby="inputSuccess2Status" required> <span
								class="fa fa-lock form-control-feedback"
								style="padding: 10px 0px 0px 0px" aria-hidden="true"></span> <span
								id="inputSuccess2Status" class="sr-only">(success)</span>
						</div>
						<div class="form-group has-success has-feedback">
							<label class="control-label" for="inputSuccess2"> Confirm
								Password</label> <input type="password" name="password2"
								class="form-control" id="password2"
								aria-describedby="inputSuccess2Status" required> <span
								class="fa fa-lock form-control-feedback"
								style="padding: 10px 0px 0px 0px" aria-hidden="true"></span> <span
								id="inputSuccess2Status" class="sr-only">(success)</span>
						</div>
						<span style="color: red; font-size: 16px">If you change
							Password system automatic will take you out to login again!! </span>
						<hr>
						<div class="form-group has-success has-feedback">
							<input type="submit" name="submit" class="btn btn-success"
								value="SAVE" onclick="return PasswValidate()"> <a
								href="" type="submit" name="submit" class="btn btn-warning"
								data-dismiss="modal">CANCEL</a>
						</div>
					</form>
					<script type="text/javascript">
						function PasswValidate() {
							//CURRENT PASSWORD
							if (document.PassValidate.current.value == "") {
								alert("Please Provide Current Password!!");
								document.PassValidate.current.focus();
								return false;
							}

							if (document.PassValidate.current.value.length <= 4) {
								alert("Passowrd Should Contain Minimum ( 5 ) Character");
								document.PassValidate.current.focus();
								return false;
							}

							// NEW PASSWORD
							if (document.PassValidate.password1.value == "") {
								alert("Please Provide New Password!!");
								document.PassValidate.password1.focus();
								return false;
							}

							if (document.PassValidate.password1.value.length <= 4) {
								alert("Passowrd Should Contain Minimum ( 5 ) Character");
								document.PassValidate.password1.focus();
								return false;
							}

							//CONFIRM PASSWORD
							if (document.PassValidate.password2.value == "") {
								alert("Please Provide Confrim Password!!");
								document.PassValidate.password2.focus();
								return false;
							}

							if (document.PassValidate.password2.value.length <= 4) {
								alert("Passowrd Should Contain Minimum ( 5 ) Character");
								document.PassValidate.password2.focus();
								return false;
							}

						}
					</script>
				</div>
			</div>
		</div>
	</div>
	<!-- end modal -->
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

		// Function to check Whether both passwords
		// is same or not.
		function checkPassword(form) {
			password1 = form.password1.value;
			password2 = form.password2.value;

			// If password not entered
			if (password1 == '')
				alert("Please enter Password");

			// If confirm password not entered
			else if (password2 == '')
				alert("Please enter confirm password");

			// If Not same return False.	
			else if (password1 != password2) {
				swal("Password did not match: Please try again..!!!","Say OK!", "error")
				return false;
			}
		}

		$(document).ready(function() {
			$('.btn-success').click(function() {
				var id = $(this).attr("id");
				$.ajax({
					url : "getData.jsp",
					type : "post",
					data : "uid=" + id,
					success : function(data) {
						$("#show-data").html(data);

					}
				});
			});
		});
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
<%
	session.setAttribute("upload", null);
%>
</html>