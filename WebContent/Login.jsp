<%@ page import="java.sql.*"%>
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
<link href="bootstrap/css/styleee.css" rel="stylesheet" type="text/css"
	media="all" />
<script src="bootstrap/js/jquery-2.1.1.min.js"></script>
<script src="bootstrap/js/datatables.min.js "></script>
<script src="bootstrap/js/bootstrap.js"></script>
<script src="bootstrap/js/sweetalert2.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/sweetalert.css" />
<script src="bootstrap/js/sweetalert.js"></script>
<script src="bootstrap/js/sweetalert.min.js"></script>
<link href="bootstrap/css/font-awesome.css" rel="stylesheet">
<link href="bootstrap/css/sweetalert2.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="bootstrap/css/style.css" />
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/datatables.min.css" />
</head>
<body style="background-image: url(bootstrap/img/bg.png);">
	<div id="container"
		style="border-radius: 6px; margin-top: 100px; background-color: #fff; padding-top: 5px;"
		class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3 col-xs-10 col-xs-offset-1">
		<div class="row">
			<div class="row text-center " style="padding-top: 2px;">
				<div
					class="col-md-8 col-md-offset-4 col-sm-6 col-sm-offset-3 col-xs-10 col-xs-offset-1"
					style="margin-left: 0px; width: 100%; min-height: 10%;">
					<img src="bootstrap/img/header.png" alt="" class="img-responsive"
						style="padding: 30px 30px 0px 30px;">
				</div>
			</div>
		</div>
		<div class="clearfix"></div>
		<div class="border-bottom"></div>
		<div class="panel-body">
			<hr />
			<form action="<%=request.getContextPath()%>/LoginServlet"
				method="post" name="LoginForm">
				<div class="form-group has-success has-feedback">
					<label class="control-label" for="inputGroupSuccess1">Username</label>
					<div class="input-group">
						<span class="input-group-addon"> <i class="fa fa-user"></i>
						</span> <input type="text" name="username" class="form-control"
							id="username" aria-describedby="" required="">
					</div>
					<span class="sr-only">(success)</span>
				</div>
				<div class="form-group has-success has-feedback">
					<label class="control-label" for="inputGroupSuccess1">Password</label>
					<div class="input-group">
						<span class="input-group-addon"> <i class="fa fa-lock"></i>
						</span> <input type="password" name="password" class="form-control"
							id="password" aria-describedby="inputGroupSuccess1Status"
							required="">
					</div>
					<span id="inputGroupSuccess1Status" class="sr-only">(success)</span>
				</div>
				<div class="checkbox mb-3">
					<label> <input type="checkbox" value="remember-me">
						Remember Me
					</label>
				</div>
				<div class="col-md-12 style="margin-bottom:10px">
					<label style="color: red; text-align: center;"> <span>
							<%
								if (request.getAttribute("errMessage") == null) {
							%> <%
							 	} else {
							 %> <script>
								swal("Incorrect Login Information..!!!","Say OK!", "error")
							</script> <%
								}
							%>
					</span>
					</label>
				</div>
				<%
					if (session.getAttribute("changedSuccess") != null) {
				%>
				<span
					style="margin: 0px 0px; text-align: center; font-size: 18px; color: green;">
					<script>
						swal("YOU HAVE SUCCESS TO CHANGE PASSWORD..!!",
								"Say OK!", "success")
					</script>
				</span>
				<%
					}
				%>
				<%
					if (session.getAttribute("regSuccess") != null) {
				%>
				<span
					style="margin: 0px 0px; text-align: center; font-size: 16px; color: green;">
					<script type="text/javascript">
						swal("YOU HAVE SUCCESS TO BE REGISTERED..!!!",
								"Username: <%out.print(session.getAttribute("email"));%> \n Password: <%out.print(session.getAttribute("pass"));%>",
								"success")
					</script>
				</span>
				<%
					}
				%>
				<%
					if (session.getAttribute("regFail") != null) {
				%>
				<span
					style="margin: 0px 0px; text-align: center; font-size: 18px; color: red;">
					<script>
						Swal.fire({
							icon : 'error',
							title : 'SORRY...',
							text : 'USER ALREADY EXIST..!!',
							footer : '<a href="">Why do I have this issue?</a>'
						})
					</script>
				</span>
				<%
					}
				%>
				
				<%
					if (session.getAttribute("fail") != null) {
				%>
				<span
					style="margin: 0px 0px; text-align: center; font-size: 18px; color: red;">
					<script>
						Swal.fire({
							icon : 'error',
							title : 'SORRY...',
							text : 'Invalid Current Password! Please try again...!!',
							footer : '<a href="">Why do I have this issue?</a>'
						})
					</script>
				</span>
				<%
					}
				%>
				<div class="form-group">
					<label class="checkbox-inline"> </label>
				</div>
				<input type="submit" class="btn btn-primary" value="Login Now"
					onclick="return LoginValidate()"></input> <input type="reset"
					class="btn btn-warning" value="Reset"> <br>
				<p style="margin: 10px 0px 0px 0px">
					Not registered? <a href="#" data-toggle="modal"
						data-target="#myModal"><b>Create New Account</b></a>
				</p>
				<hr />
				<p style="margin: 20px; text-align: center; opacity: 0.5">
					Copyright © 2021 | Mohd. M. Seif</p>
			</form>
		</div>
	</div>
	<script type="text/javascript">
		function LoginValidate() {
			if (document.LoginForm.username.value == "") {
				alert("Please provide your Username!!");
				document.LoginForm.username.focus();
				return false;
			}

			var emailID = document.LoginForm.username.value;
			atpos = emailID.indexOf("@");
			dotpos = emailID.lastIndexOf(".");

			if (atpos < 1 || (dotpos - atpos < 2)) {
				alert("Please enter correct Username ( Eg. example@gmai.com )")
				document.LoginForm.username.focus();
				return false;
			}

			if (document.LoginForm.password.value == "") {
				alert("Please provide your Password!!");
				document.LoginForm.password.focus();
				return false;
			}

			if (document.LoginForm.password.value.length <= 4) {
				alert("Passowrd should contain minimum ( 5 ) Character");
				document.LoginForm.password.focus();
				return false;
			}
		}
	</script>
	<!-- MODAL -->
	<div class="container">
		<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h3 class="modal-title">Register Account</h3>
					</div>
					<%
						try {
							Class.forName("com.mysql.jdbc.Driver").newInstance();
							Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/FINAL", "root", "");
							Statement st = con.createStatement();
							String strQuery = "SELECT COUNT(*) FROM Customer";
							ResultSet rs = st.executeQuery(strQuery);
							String Countrow = "";
							while (rs.next()) {
								int x = Integer.parseUnsignedInt(rs.getString(1));
								x = x + 1;
								Countrow = String.valueOf(x);
							}
					%>
					<form action="RegistHandler.jsp" method="POST"
						name="RegistValidate">
						<input type="text" name="CCode"
							value="ZBS-C000<%out.println(Countrow);%>" hidden=""> <input
							type="text" name="Status" value="Customer" hidden="">
						<div class="modal-body">
							<p>
							<div class="panel-body">
								<!---- REGISTER INFO ---->
								<input type="text" name="labID" value="0" hidden="">
								<div class="row">
									<div class="col-sm-6">
										<div class="form-group">
											<label for="fName"> <i id="star">*&nbsp</i>First Name
											</label>
											<div class="form-group has-success has-feedback">
												<div class="input-group">
													<span class="input-group-addon"> <i
														class="fa fa-user"></i>
													</span> <input type="text" name="FName" id="fName"
														class="form-control" required="" placeholder="Eg: Moh'd">
												</div>
											</div>
										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group">
											<label for="mName"> <i id="star">&nbsp;</i>Middle
												Name
											</label>
											<div class="form-group has-success has-feedback">
												<div class="input-group">
													<span class="input-group-addon"> <i
														class="fa fa-user"></i>
													</span> <input type="text" id="mName" name="MName"
														class="form-control" placeholder="Eg: Mshimba">
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-6">
										<div class="form-group">
											<label for="lName"> <i id="star">*&nbsp</i>Last Name
											</label>
											<div class="form-group has-success has-feedback">
												<div class="input-group">
													<span class="input-group-addon"> <i
														class="fa fa-user"></i>
													</span> <input type="text" id="lName" name="LName"
														class="form-control" required="" placeholder="Eg: Seif">
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
														class="fa fa-female"></i><i class="fa fa-male"></i>
													</span> <select name="gender" id="gender" class="form-control"
														required="">
														<option value="">---Select Gender---</option>
														<option value="Male">Male</option>
														<option value="Female">Female</option>
													</select>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-6">
										<div class="form-group">
											<label for="gender"> <i id="star">*&nbsp</i>Status
											</label>
											<div class="form-group has-success has-feedback">
												<div class="input-group">
													<span class="input-group-addon"> <i class="fa fa-"></i><i
														class="fa fa-exclamation-circle"></i>
													</span><select name="status" id="status" class="form-control"
														required="">
														<option value="">---Select Status---</option>
														<option value="Customer">Customer</option>
													</select>
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
													<span class="input-group-addon"> <i class="fa fa-"></i><i
														class="fa fa-user"></i>
													</span> <select name="title" id="title" class="form-control"
														required="">
														<option value="">--Staff Title--</option>
														<option value="Mr">Mr.</option>
														<option value="Ms">Ms.</option>
														<option value="Dr">Dr.</option>
														<option value="Pr">Pr.</option>
													</select>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-6">
										<div class="form-group">
											<label for="Phone"> <i id="star">*&nbsp</i>Phone
												Number
											</label>
											<div class="form-group has-success has-feedback">
												<div class="input-group">
													<span class="input-group-addon"> <i
														class="fa fa-phone"></i>
													</span> <input id="phone" class="form-control" required=""
														name="phone" placeholder="Eg: 077 766 666 813">
												</div>
											</div>
										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group">
											<label for="dob"> <i id="star">*&nbsp</i>Date of
												Birth
											</label>
											<div class="form-group has-success has-feedback">
												<div class="input-group">
													<span class="input-group-addon"> <i
														class="fa fa-calendar"></i>
													</span> <input type="date" name="dob" id="dob"
														class="form-control" required=""
														style="padding: 0px 0px 12px 5px;">
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-6">
										<div class="form-group">
											<label for="email"> <i id="star">*&nbsp</i>Email (
												Username )
											</label>
											<div class="form-group has-success has-feedback">
												<div class="input-group">
													<span class="input-group-addon"> <i>@</i>
													</span> <input type="email" name="email" id="username"
														class="form-control" required=""
														placeholder="mohd.m.seif@gmail.com">
												</div>
											</div>
										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group">
											<label for="address"> <i id="star">*&nbsp</i>Address
											</label>
											<div class="form-group has-success has-feedback">
												<div class="input-group">
													<span class="input-group-addon"> <i
														class="fa fa-home"></i>
													</span> <input type="text" name="address" id="address"
														class="form-control" required=""
														placeholder="Eg: M/kwerekwe">
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-6">
										<div class="form-group">
											<label for="mName"> <i id="star">*&nbsp</i>Password
											</label>
											<div class="form-group has-success has-feedback">
												<div class="input-group">
													<span class="input-group-addon"> <i
														class="fa fa-lock"></i>
													</span> <input type="password" id="password" name="password"
														class="form-control" required=""
														placeholder="Eg: **********">
												</div>
											</div>
										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group">
											<label for="mName"> <i id="star">*&nbsp</i>Comapany
												Name
											</label>
											<div class="form-group has-success has-feedback">
												<div class="input-group">
													<span class="input-group-addon"> <i
														class="fa fa-lock"></i>
													</span> <input type="text" id="CName" name="CName"
														class="form-control" required=""
														placeholder="Eg: Azam bakhresa">
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							</p>
							<p style="margin: 5px 0px 0px 0px">
								<a href="index.jsp" data-toggle="modal" data-target="#myModal"><b>Already
										Have Account...?</b></a>
							</p>
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-primary" style="float: left"
								onclick="return RegValidate()">Register Now</button>
						</div>
					</form>
					<%
						} catch (Exception e) {
							e.printStackTrace();
						}
					%>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function RegValidate() {
			// FIRST NAME
			if (document.RegistValidate.fName.value == "") {
				alert("Please Enter the First Name");
				document.RegistValidate.fName.focus();
				return false;
			}
			if (!/^[a-zA-Z]*$/g.test(document.RegistValidate.fName.value)) {
				alert("Please Enetr Valid Characters ( a-zA-Z )");
				document.RegistValidate.fName.focus();
				return false;
			}

			// LAST NAME
			if (document.RegistValidate.lName.value == "") {
				alert("Please Enter the Last Name");
				document.RegistValidate.lName.focus();
				return false;
			}
			if (!/^[a-zA-Z]*$/g.test(document.RegistValidate.lName.value)) {
				alert("Please Enetr Valid Characters ( a-zA-Z )");
				document.RegistValidate.lName.focus();
				return false;
			}

			// GENDER
			if (document.RegistValidate.gender.value == "") {
				alert("Please Enter Gender");
				document.RegistValidate.gender.focus();
				return false;
			}

			// STATUS
			if (document.RegistValidate.status.value == "") {
				alert("Please Enter Status");
				document.RegistValidate.status.focus();
				return false;
			}

			// TITLE
			if (document.RegistValidate.title.value == "") {
				alert("Please Enter Title");
				document.RegistValidate.title.focus();
				return false;
			}

			// PHONE NUMBER
			if (document.RegistValidate.phone.value == "") {
				alert("Please provide your Phone number!");
				document.RegistValidate.phone.focus();
				return false;
			}
			if (isNaN(document.RegistValidate.phone.value)
					|| document.RegistValidate.phone.value.length != 10) {
				alert("Mobile number should contain only 10 digits(number)");
				document.RegistValidate.phone.focus();
				return false;
			}

			// DATE OF BIRTH
			if (document.RegistValidate.dob.value == "") {
				alert("Please provide your Date of Birth!");
				document.RegistValidate.dob.focus();
				return false;
			}

			// USERNAME ( EMAIL )
			if (document.RegistValidate.username.value == "") {
				alert("Please provide your Username!!");
				document.RegistValidate.username.focus();
				return false;
			}

			var emailID = document.RegistValidate.username.value;
			atpos = emailID.indexOf("@");
			dotpos = emailID.lastIndexOf(".");

			if (atpos < 1 || (dotpos - atpos < 2)) {
				alert("Please enter correct Username ( Eg. example@gmai.com )")
				document.RegistValidate.username.focus();
				return false;
			}

			// ADDRESS
			if (document.RegistValidate.address.value == "") {
				alert("Please Enter Address");
				document.RegistValidate.address.focus();
				return false;
			}
			if (!/^[a-zA-Z]*$/g.test(document.RegistValidate.address.value)) {
				alert("Please Enetr Valid Characters ( a-zA-Z )");
				document.RegistValidate.address.focus();
				return false;
			}

			// PASSWORD
			if (document.RegistValidate.password.value == "") {
				alert("Please provide your Password!!");
				document.RegistValidate.password.focus();
				return false;
			}

			if (document.RegistValidate.password.value.length <= 4) {
				alert("Passowrd should contain minimum ( 5 ) Character");
				document.RegistValidate.password.focus();
				return false;
			}

			// COMPANY NAME
			if (document.RegistValidate.CName.value == "") {
				alert("Please provide Company Name!!");
				document.RegistValidate.CName.focus();
				return false;
			}
		}
	</script>
	<!-- END MODAL -->
</body>
<%
	session.setAttribute("regSuccess", null);
%>
<%
	session.setAttribute("changedSuccess", null);
%>
<%
	session.setAttribute("regFail", null);
%>
<%
	session.setAttribute("fail", null);
%>
</html>