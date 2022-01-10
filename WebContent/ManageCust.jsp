<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page
	import="quuery.UserQuery,loginVar.userLoginVariable.*,java.util.*"%>
<%@page import="quuery.UserQuery"%>
<%@page import="loginVar.userLoginVariable"%>
<jsp:useBean id="u" class="loginVar.userLoginVariable"></jsp:useBean>
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
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/sweetalert.css" />
<script src="bootstrap/js/sweetalert.js"></script>
<script src="bootstrap/js/sweetalert.min.js"></script>
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
				List<userLoginVariable> list = UserQuery.getCustomer();
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
					<h3 style="margin-left: -12px;">Manage Customer</h3>
					<%
							if (session.getAttribute("deleteCust") != null) {
						%>
						
						<span
							style="margin: 0px 0px; text-align: center; font-size: 18px; color: green;">
							<script>
								swal("You Have Success to Customer..!!",
										"Say OK!", "success")
							</script>
						</span>
						<%
							}
						%>
					<div class="row"
						style="background: #fff; height: 600px; padding: 60px 50px 50px 50px; overflow: auto;"
						class="table-responsive;">
						<!-- Content -->
						<table class="table table-striped table-bordered"
							style="text-align: center;" id="data">
							<thead style="text-align: center; background: #E3F2F1;">
								<tr>
									<th id="th">Cutomer Code</th>
									<th id="th">Company Name</th>
									<th id="th">Customer Name</th>
									<th id="th">Phone</th>
									<th id="th">Gender</th>
									<th id="th">Email</th>
									<th id="th">Address</th>
									<th id="th">Status</th>
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
										<td>${u.getCCode()}</td>
										<td>${u.getCName()}</td>
										<td>${u.getFName()}${u.getMName()}.${u.getLName()}</td>
										<td>${u.getPhone()}</td>
										<td>${u.getGender()}</td>
										<td>${u.getEmail()}</td>
										<td>${u.getAddress()}</td>
										<td><b>${u.getRequest()}</b></td>
										<!--(CUSTOMER CODE)-->
										<%-- <td id="th"><a
										href="editCust.jsp?CCode=${u.getCCode()}"><i
											class="fa fa-edit"></i></a></td> --%>
										<td id="th"><a href=""
											class="btn  border border-light border-2 rounded-pill"
											data-toggle="modal"
											data-target="#editCustr<%out.print(count);%>"><i
												class="fa fa-edit"></i></a></td>
										<td id="th"><a
											href="deleteCust.jsp?CCode=${u.getCCode()}"
											onclick="return Delete()"><i
												class="fa fa-trash" style="color: red;"></i></a></td>
									</tr>
									<script type="text/javascript">

    function deleteConfirmation(id) {

        swal({

            title: "Delete?",

            text: "Please ensure and then confirm!",

            type: "warning",

            showCancelButton: !0,

            confirmButtonText: "Yes, delete it!",

            cancelButtonText: "No, cancel!",

            reverseButtons: !0

        }).then(function (e) {


            if (e.value === true) {

                var CSRF_TOKEN = $('meta[name="csrf-token"]').attr('content');


                $.ajax({

                    type: 'POST',

                    url: "{{url('/users')}}/" + id,

                    data: {_token: CSRF_TOKEN},

                    dataType: 'JSON',

                    success: function (results) {


                        if (results.success === true) {

                            swal("Done!", results.message, "success");

                        } else {

                            swal("Error!", results.message, "error");

                        }

                    }

                });


            } else {

                e.dismiss;

            }


        }, function (dismiss) {

            return false;

        })

    }

</script>
									<div class="modal fade" id="editCustr<%out.print(count);%>"
										role="dialog">
										<div class="modal-dialog modal-md">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal">&times;</button>
													<h4 class="modal-title">Update Customer</h4>
												</div>
												<div class="modal-body">
													<div class="row">
														<div class="col-sm-12">
															<form action="updateCustHandler.jsp" method="POST">
																<div class="row">
																	<div class="col-sm-6">
																		<div class="form-group">
																			<label for="mName"> <i id="star">*&nbsp</i>Customer
																				Code
																			</label>
																			<div class="form-group has-success has-feedback">
																				<div class="input-group">
																					<span class="input-group-addon"> <i
																						class="fa fa-code"></i>
																					</span> <input type="text" id="CCode" name="CCode"
																						class="form-control" required=""
																						value="${u.getCCode()}"
																						placeholder="Eg: Azam bakhresa" readonly="">
																				</div>
																			</div>
																		</div>
																	</div>
																	<div class="col-sm-6">
																		<div class="form-group">
																			<label for="lName"> <i id="star">*&nbsp</i>First
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
																</div>
																<div class="row">
																	<div class="col-sm-6">
																		<div class="form-group">
																			<label for="lName"> <i id="star">*&nbsp</i>Middle
																				Name
																			</label>
																			<div class="form-group has-success has-feedback">
																				<div class="input-group">
																					<span class="input-group-addon"> <i
																						class="fa fa-user"></i>
																					</span> <input type="text" id="MName" name="MName"
																						class="form-control" value="${u.getMName()}"
																						required="">
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
																					</span> <input type="text" name="LName"
																						class="form-control" value="${u.getLName()}"
																						required="">
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
																<div class="row">
																	<div class="col-sm-6">
																		<div class="form-group">
																			<label for="gender"> <i id="star">*&nbsp</i>Gender
																			</label>
																			<div class="form-group has-success has-feedback">
																				<div class="input-group">
																					<span class="input-group-addon"> <i
																						class="fa fa-female"></i><i class="fa fa-male"></i>
																					</span> <select name="gender" id="gender"
																						class="form-control" required="">
																						<option value="${u.getGender()}">
																							${u.getGender()}</option>
																						<option value="Male">Male</option>
																						<option value="Female">Female</option>
																					</select>
																				</div>
																			</div>
																		</div>
																	</div>
																	<div class="col-sm-6">
																		<div class="form-group">
																			<label for="gender"> <i id="star">*&nbsp</i>Status
																			</label>
																			<div class="form-group has-success has-feedback">
																				<div class="input-group">
																					<span class="input-group-addon"> <i
																						class="fa fa-"></i><i
																						class="fa fa-exclamation-circle"></i>
																					</span><select name="status" id="status"
																						class="form-control" required="">
																						<option value="Customer">Customer</option>
																					</select>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
																<div class="row">
																	<div class="col-sm-6">
																		<div class="form-group">
																			<label for="title"> <i id="star">*&nbsp</i>Title
																			</label>
																			<div class="form-group has-success has-feedback">
																				<div class="input-group">
																					<span class="input-group-addon"> <i
																						class="fa fa-fa-exclamation-circle"></i><i
																						class="fa fa-user"></i>
																					</span> <select name="title" id="title"
																						class="form-control" required="">
																						<option value="${u.getTitle()}">
																							${u.getTitle()}</option>
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
																			<label for="lName"> <i id="star">*&nbsp</i>Phone
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
																			<label for="dob"> <i id="star">*&nbsp</i>Date
																				of Birth
																			</label>
																			<div class="form-group has-success has-feedback">
																				<div class="input-group">
																					<span class="input-group-addon"> <i
																						class="fa fa-calendar"></i>
																					</span> <input type="date" name="dob"
																						value="${u.getDob()}" id="Dob"
																						class="form-control" required=""
																						style="padding: 0px 0px 12px 5px;">
																				</div>
																			</div>
																		</div>
																	</div>
																	<div class="col-sm-6">
																		<div class="form-group">
																			<label for="email"> <i id="star">*&nbsp</i>Email
																				( Username )
																			</label>
																			<div class="form-group has-success has-feedback">
																				<div class="input-group">
																					<span class="input-group-addon"> <i>@</i>
																					</span> <input type="email" name="email" id="email"
																						class="form-control" required=""
																						value="${u.getEmail()}"
																						placeholder="mohd.m.seif@gmail.com" readonly="">
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
																<div class="row">
																	<div class="col-sm-6">
																		<div class="form-group">
																			<label for="address"> <i id="star">*&nbsp</i>Address
																			</label>
																			<div class="form-group has-success has-feedback">
																				<div class="input-group">
																					<span class="input-group-addon"> <i
																						class="fa fa-home"></i>
																					</span> <input type="text" name="address" id="Address"
																						value="${u.getAddress()}" class="form-control"
																						required="" placeholder="Eg: M/kwerekwe">
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
																						class="fa fa-exclamation-circle"></i>
																					</span> <input type="text" id="cName" name="CName"
																						class="form-control" required=""
																						value="${u.getCName()}"
																						placeholder="Eg: Azam bakhresa">
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
																<div class="row">
																	<div class="col-sm-12">
																		<button type="submit" name="submit"
																			class="btn btn-success" style="font-weight: bold">UPDATE
																			CUSTOMER</button>
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
	session.setAttribute("deleteCust", null);
%>
</html>