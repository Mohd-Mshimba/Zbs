<%@ page session="true"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page
	import="quuery.UserQuery,loginVar.AnalysisSampleVariable.*,java.util.*"%>
<%@page import="quuery.UserQuery"%>
<%@page import="loginVar.AnalysisSampleVariable"%>
<jsp:useBean id="u" class="loginVar.AnalysisSampleVariable"></jsp:useBean>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="now" value="<%=new java.util.Date()%>" />
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
				<div class="content"
					style="height: 690px; width: 100%; background: #E3F2F1; padding: 9px 35px">
					<h3 style="margin-left: -12px;">Current Analysis Sample</h3>
					<div class="row"
						style="background: #fff; height: 600px; padding: 80px 50px 50px 50px; overflow: auto;"
						class="table-responsive;">
						<%
								if (session.getAttribute("addRes") != null) {
							%>
							<span
								style="margin: 0px 300px; text-align: center; font-size: 18px; color: green; font-weight: bold">
								<script type="text/javascript">
									swal(
											"You have been success to Add Result",
											"Say OK!", "success")
								</script>
							</span>
							<%
								}
							%>
						<!-- Content -->
						<table class="table table-striped table-bordered"
							style="text-align: center;" id="data">
							<thead style="text-align: center; background: #E3F2F1;">
								<tr>
									<th id="th">Sample Code</th>
									<th id="th">Sample Name</th>
									<th id="th">Brand</th>
									<th id="th">Received On</th>
									<th id="th">View Result</th>
									<th id="th">Add Result</th>
								</tr>
							</thead>
							<%
								Connection connection = null;
										Statement statement = null;
										ResultSet resultSet = null;
										try {
											String ids = (String) session.getAttribute("id");
											connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/FINAL", "root", "");
											statement = connection.createStatement();
											String sql = "SELECT * FROM sample,staff WHERE sample.Approval='Not Yet' AND sample.AnalyzerID=staff.SID AND staff.SID='"
													+ ids + "'";
											resultSet = statement.executeQuery(sql);
											int m = 0;
							%>
							<tbody>
								<%
									while (resultSet.next()) {
													m = m + 1;
								%>
								<tr>
									<td><%=resultSet.getString("SCode")%></td>
									<td><%=resultSet.getString("SName")%></td>
									<td><%=resultSet.getString("Brand")%></td>
									<td><%=resultSet.getString("SubmDate")%></td>
									<%
										String SCode = resultSet.getString("SCode");
														Connection con = null;
														Statement stmt = null;
														ResultSet rs = null;
														con = DriverManager.getConnection("jdbc:mysql://localhost:3306/FINAL", "root", "");
														stmt = con.createStatement();
														String strQuery = "SELECT * FROM analysis WHERE SCode='" + SCode + "'";
														rs = stmt.executeQuery(strQuery);
														String Countrow = "";
														String z = new String();
														int y = 0;
														while (rs.next()) {
															y++;
															z = z + rs.getString("Analyzer").toString() + "%";
															int x = Integer.parseUnsignedInt(rs.getString(1));
															Countrow = String.valueOf(x);

															String Analyzer = rs.getString("Analyzer");

														}
									%><td id="th">
										<%
											if (y < 1) {
																out.print("Not Result");

															} else {
																for (String fl : z.split("%")) {
										%> <a
										href='ExpViewResult.jsp?SCode=<%=resultSet.getString("SCode")%>'><i
											class="fa fa-book"></i></a> <%
 	}
 					}
 %>
									</td>
									<td id="th">
										<a href=""
										class="btn  border border-light border-2 rounded-pill"
										data-toggle="modal" data-target="#addResult<%out.print(m);%>">
											<i class="fa fa-plus"
											style="color: #218838; font-weight: bold;">Add</i>
									</a>
									</td>
								</tr>
								<div class="modal fade" id="addResult<%out.print(m);%>"
									role="dialog">
									<div class="modal-dialog modal-md">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal">&times;</button>
												<h4 class="modal-title">ASSIGN RESULT</h4>
											</div>
											<div class="modal-body">
												<div class="row">
													<div class="col-sm-12">
														<form action="directAddResult.jsp" method="POST">
															<input TYPE="text" name="resultDate"
																value="<fmt:formatDate type = "date" value = "${now}"/>"
																hidden>
															<div class="row">
																<div class="col-xs-12 col-sm-8 col-md-6 col-lg-6">
																	<div class="form-group">
																		<label for="lName"> <i id="star">*&nbsp</i>Sample
																			Code
																		</label>
																		<div class="form-group has-success has-feedback">
																			<div class="input-group">
																				<span class="input-group-addon"> <i
																					class="fa fa-code"></i>
																				</span> <input type="text" name="SCode"
																					class="form-control"
																					value='<%=resultSet.getString("SCode")%>' required
																					readonly>
																			</div>
																		</div>
																	</div>
																</div>
																<div class="col-xs-12 col-sm-4 col-md-6 col-lg-6">
																	<div class="form-group">
																		<label for="lName"> <i id="star">*&nbsp</i>Water
																		</label>
																		<div class="form-group has-success has-feedback">
																			<div class="input-group">
																				<span class="input-group-addon"> <i
																					class="fa fa-tint"></i>
																				</span> <input type="text" name="water"
																					class="form-control" required=""
																					placeholder="Water">
																			</div>
																		</div>
																	</div>
																</div>
															</div>
															<div class="row">
																<div class="col-sm-4">
																	<div class="form-group">
																		<label for="lName"> <i id="star">*&nbsp</i>Protein
																		</label>
																		<div class="form-group has-success has-feedback">
																			<div class="input-group">
																				<span class="input-group-addon"> <i
																					class="fa fa-question-circle"></i>
																				</span> <input type="text" name="protein"
																					class="form-control" required=""
																					placeholder="Protein">
																			</div>
																		</div>
																	</div>
																</div>
																<div class="col-sm-4">
																	<div class="form-group">
																		<label for="lName"> <i id="star">*&nbsp</i>Sugar
																		</label>
																		<div class="form-group has-success has-feedback">
																			<div class="input-group">
																				<span class="input-group-addon"> <i
																					class="fa fa-question-circle"></i>
																				</span> <input type="text" name="sugar"
																					class="form-control" required=""
																					placeholder="Sugar">
																			</div>
																		</div>
																	</div>
																</div>
																<div class="col-sm-4">
																	<div class="form-group">
																		<label for="lName"> <i id="star">*&nbsp</i>Calcium
																		</label>
																		<div class="form-group has-success has-feedback">
																			<div class="input-group">
																				<span class="input-group-addon"> <i
																					class="fa fa-flask"></i>
																				</span> <input type="text" name="calcium"
																					class="form-control" required=""
																					placeholder="Calcium">
																			</div>
																		</div>
																	</div>
																</div>
															</div>
															<div class="row">
																<div class="col-xs-12 col-sm-8 col-md-6 col-lg-6">
																	<div class="form-group">
																		<label for="lName"> <i id="star">*&nbsp</i>Caffein
																		</label>
																		<div class="form-group has-success has-feedback">
																			<div class="input-group">
																				<span class="input-group-addon"> <i
																					class="fa fa-coffee"></i>
																				</span> <input type="text" name="caffein"
																					class="form-control" required=""
																					placeholder="Caffein">
																			</div>
																		</div>
																	</div>
																</div>
																<div class="col-xs-12 col-sm-4 col-md-6 col-lg-6">
																	<div class="form-group">
																		<label for="lName"> <i id="star">*&nbsp</i>Alkohol
																		</label>
																		<div class="form-group has-success has-feedback">
																			<div class="input-group">
																				<span class="input-group-addon"> <i
																					class="fa fa-question-circle"></i>
																				</span> <input type="text" name="alkohol"
																					class="form-control" required=""
																					placeholder="Alkohol">
																			</div>
																		</div>
																	</div>
																</div>
															</div>
															<div class="row">
																<div class="col-xs-12 col-sm-8 col-md-6 col-lg-6">
																	<div class="form-group">
																		<label for="lName"> <i id="star">*&nbsp</i>Starch
																		</label>
																		<div class="form-group has-success has-feedback">
																			<div class="input-group">
																				<span class="input-group-addon"> <i
																					class="fa fa-question-circle"></i>
																				</span> <input type="text" name="starch"
																					class="form-control" required=""
																					placeholder="Starch">
																			</div>
																		</div>
																	</div>
																</div>
																<div class="col-xs-12 col-sm-4 col-md-6 col-lg-6">
																	<div class="form-group">
																		<label for="lName"> <i id="star">*&nbsp</i>Energy
																		</label>
																		<div class="form-group has-success has-feedback">
																			<div class="input-group">
																				<span class="input-group-addon"> <i
																					class="fa fa-bolt"></i>
																				</span> <input type="text" name="energy"
																					class="form-control" required=""
																					placeholder="Energy">
																			</div>
																		</div>
																	</div>
																</div>
															</div>
															<div class="row">
																<div class="col-sm-4">
																	<div class="form-group">
																		<label for="lName"> <i id="star">*&nbsp</i>Sodium
																		</label>
																		<div class="form-group has-success has-feedback">
																			<div class="input-group">
																				<span class="input-group-addon"> <i
																					class="fa fa-connectdevelop"></i>
																				</span> <input type="text" name="sodium"
																					class="form-control" required=""
																					placeholder="Sodium ">
																			</div>
																		</div>
																	</div>
																</div>
																<div class="col-sm-4">
																	<div class="form-group">
																		<label for="lName"> <i id="star">*&nbsp</i>Zink
																		</label>
																		<div class="form-group has-success has-feedback">
																			<div class="input-group">
																				<span class="input-group-addon"> <i
																					class="fa fa-question-circle"></i>
																				</span> <input type="text" name="zink" class="form-control"
																					required="" placeholder="Zink ">
																			</div>
																		</div>
																	</div>
																</div>
																<div class="col-sm-4">
																	<div class="form-group">
																		<label for="lName"> <i id="star">*&nbsp</i>Faty-Acid
																		</label>
																		<div class="form-group has-success has-feedback">
																			<div class="input-group">
																				<span class="input-group-addon"> <i
																					class="fa fa-question-circle"></i>
																				</span> <input type="text" name="fatyAcid"
																					class="form-control" required=""
																					placeholder="Faty - Acid">
																			</div>
																		</div>
																	</div>
																</div>
															</div>
															<div class="row">
																<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
																	<div class="form-group">
																		<label for="lName"> <i id="star">*&nbsp</i>
																			Resulted Remark
																		</label>
																		<div class="form-group has-success has-feedback">
																			<div class="input-group">
																				<span class="input-group-addon"> <i
																					class="fa fa-check-square"></i> / <i
																					class="fa fa-remove" style="color: red;"></i>
																				</span> <select class="form-control" name="remark" required>
																					<option value="">-- Select Result</option>
																					<option value="Pass">Pass</option>
																					<option value="Fail">Fail</option>
																				</select>
																			</div>
																		</div>
																	</div>
																</div>
																<div class="row">
																	<div class="col-xs-12 col-sm-12">
																		&nbsp;&nbsp;&nbsp;
																		<button type="submit" name="submit"
																			class="btn btn-success" style="font-weight: bold;">SAVE
																			RESULT</button>
																		<i id="star" style="margin-left: 45%;">*&nbsp</i> <span>Means
																			Mandatory to Fill</span>
																	</div>
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
								<%
									}
								%>
							</tbody>
							<%
								} catch (Exception e) {
											e.printStackTrace();
										}
							%>
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
<%
	session.setAttribute("addRes", null);
%>
</html>
