<%@ page session="true"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="now" value="<%=new java.util.Date()%>" />
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" import="java.util.*"%>
<%@page
	import="quuery.UserQuery,loginVar.AnalysisSampleVariable.*,java.util.*"%>
<%@page import="quuery.UserQuery"%>
<%@page import="loginVar.AnalysisSampleVariable"%>
<jsp:useBean id="u" class="loginVar.AnalysisSampleVariable"></jsp:useBean>
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
					<!-- Content -->
					<%
								if (session.getAttribute("Approve") != null) {
							%>
							<span
								style="margin: 0px 300px; text-align: center; font-size: 18px; color: green; font-weight: bold">
								<script type="text/javascript">
									swal(
											"You have been success to Approve Sample Result",
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
								<th id="th">Sample Code</th>
								<th id="th">Sample Name</th>
								<th id="th">Analyser Name</th>
								<th id="th">Received On</th>
								<th id="th">View Result</th>
								<th id="th">Final</th>
							</tr>
						</thead>
						<%
							Connection connection = null;
							Statement statement = null;
							ResultSet resultSet = null;
							try {
								String id = (String) session.getAttribute("id");
								connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/FINAL", "root", "");
								statement = connection.createStatement();
								String sql = "SELECT * FROM sample, staff WHERE (sample.Approval='Not Yet' AND sample.AnalyzerID=staff.SID)";
								resultSet = statement.executeQuery(sql);
								int count=0;
						%>
						<tbody>
						<%
									while (resultSet.next()) {
										count=count+1;
								%>
							<tr>
								<td><%=resultSet.getString("SCode")%></td>
								<td><%=resultSet.getString("SName")%></td>
								<td><%=resultSet.getString("fName")%> 
								<%=resultSet.getString("mName")%> 
								<%=resultSet.getString("lName")%></td>
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
									href='viewCurrentAnalysis.jsp?SCode=<%=resultSet.getString("SCode")%>'><i
										class="fa fa-book"></i></a> <%
									 	}
									 			}
									 %>
								</td>
								<td id="th"><a style="color: #218838; font-weight: bold; cursor:pointer;"
									data-toggle="modal" data-target="#view-modal<%out.print(count);%>"
									id="<%=resultSet.getString("SCode")%>"> <i
										class="fa fa-check-square-o"
										style="color: #218838; font-weight: bold;"></i> Aproval
								</a>
								<%Date date = new Date();
								SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
								String strDate = formatter.format(date); %>
									<form action="ApprovalResult.jsp" method="POST">
									<input type="text"  name="SampDate" value="<%out.print(strDate);%>" hidden>
										<input type="text"  name="Approval" value="YES" hidden>
										<div id="view-modal<%out.print(count);%>" class="modal fade" tabindex="-1"
											role="dialog" aria-labelledby="myModalLabel"
											aria-hidden="true" style="display: none;">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal"
															aria-hidden="true">×</button>
														<h4 class="modal-title">Aprove Records</h4>
													</div>
													<div class="modal-body">
														<!-- all data will be show here -->
														<div class="row">
															<div class="col-sm-12">
																<div class="row">
																	<div class="col-sm-12">
																		<div class="form-group">
																			<label for="sName" style="margin-left: -82%;">
																				<i id="star">*&nbsp</i>Sample Name
																			</label>
																			<div class="form-group has-success has-feedback">
																				<div class="input-group">
																					<span class="input-group-addon"> <i
																						class="fa fa-product-hunt"></i>
																					</span> <input type="text"
																						class="form-control"
																						value="<%=resultSet.getString("SName")%>"
																						required="" readonly>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
																<div class="row">
																	<div class="col-sm-6">
																		<div class="form-group">
																			<label for="sCode"> <i id="star"
																				style="margin-left: -152%;">*&nbsp</i>Sample Code
																			</label>
																			<div class="form-group has-success has-feedback">
																				<div class="input-group">
																					<span class="input-group-addon"> <i
																						class="fa fa-code"></i>
																					</span> <input type="text" name="SCode"
																						class="form-control"
																						value="<%=resultSet.getString("SCode")%>"
																						required="" readonly>
																				</div>
																			</div>
																		</div>
																	</div>
																	<div class="col-sm-6">
																		<div class="form-group">
																			<label for="lName"> <i id="star" style="margin-left: -152%;">*&nbsp</i>
																				Sample Result
																			</label>
																			<div class="form-group has-success has-feedback">
																				<div class="input-group">
																					<span class="input-group-addon"> <i
																						class="fa fa-list-alt"></i>
																					</span> <select class="form-control" name="Remark"
																						required>
																						<option value="">--Final Result--</option>
																						<option value="Pass">Pass</option>
																						<option value="Fail">Fail</option>
																					</select>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
																<div class="row" style="padding: 0px 15px;">
																	<div class="form-group">
																		<button class="form-control btn btn-primary"
																			name="submit" type="submit">Save Analysis
																			Report</button>
																	</div>
																</div>
															</div>
														</div>
														<!-- end show all data -->
													</div>
													<div class="modal-footer" style="text-align: center;">
														<img src="bootstrap/img/zbs.png"
															style="width: 60px; height: auto;"> <span>
															Copyright © 2021 Zanzibar Bereau of Standards. </span>
													</div>
												</div>
											</div>
										</div>
										<!-- /.modal -->
									</form>
								</td>
							</tr>
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
	session.setAttribute("Approve", null);
%>
</html>
