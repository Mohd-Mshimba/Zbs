<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="quuery.UserQuery,loginVar.userVariable"%>
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
<%
	String id = request.getParameter("SID");
	userVariable U = UserQuery.getRecordByIds(id);
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
				style="height: 690px; width: 100%; background: #E3F2F1; padding: 9px 35px">
				<h3 style="margin-left: -12px;">Lab Expart Info</h3>
				<div class="row"
					style="background: #fff; height: 600px; padding: 80px 50px 50px 50px; overflow: auto;"
					class="table-responsive;">
					             <!-- ####### CONTENT ###### -->
             <div class="row">
            <div class="col-sm-12">
              <a href="ViewUsers.jsp" class="btn" style="background:#019950; color:#fff; border:2px solid #f6eb51; box-shadow: none; margin: 6px;">
                <i class="fa fa-arrow-left">&nbsp;BACK</i>
              </a>
            </div>
          </div>
          
          <div class="row">
              <div class="col-sm-8"style="padding-left: 50px">
                <table class="table table-hover" >
                  <center>
                    <h4 style="font-family: Lucida Bright; font-weight: bold; color: #218717;">
                    PERSONAL INFORMATIONS
                    </h4>
                  </center>
                  <!-- 1 ROW -->
                  <tr>
                    <td>
                      <b>Full Name</b>
                    </td>
                    <td> 
                      <%=U.getFName()%>
                    </td>
                    <td>
                     <%=U.getMName()%>
                    </td>
                    <td>
                      <%=U.getLName()%>
                    </td>
                  </tr>
                  <!-- 2 ROW -->
                  <tr>
                    <td>
                      <b>Gender</b>
                    </td>
                    <td>
                      <%=U.getGender()%>
                    </td>
                    <td>
                      <b>Date of Birth</b>
                    </td>
                    <td>
                      <%=U.getDOB()%>
                    </td>
                  </tr>
                  <!-- 3 ROW -->
                  <tr>
                    <td>
                      <b>Email</b>
                    </td>
                    <td>
                      <%=U.getEmail()%>
                    </td>
                    <td>
                      <b>Status</b>
                    </td>
                    <td> 
                      <%=U.getStatus()%>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <b>Address</b>
                    </td>
                    <td>
                     <%=U.getAddress()%>
                    </td>
                    <td>
                      <b>Title</b>
                    </td>
                    <td> 
                      <%=U.getTitle()%>.
                    </td>
                  </tr>
                  <tr><td></td><td></td><td></td><td></td></tr>
                </table>
              <table class="table table-hover" >
                  <center>
                    <h4 style="font-family: Lucida Bright; font-weight: bold; color: #218717;">
                    OTHER INFORMATIONS
                    </h4>
                  </center>
                  <!-- 1 ROW -->
                   <tr>
                    <td colspan="2">
                      <b>Phone Number</b>
                    </td>
                    <td colspan="2"> 
                      <%=U.getPhone()%>
                    </td>
                  </tr>
                  <!-- 2 ROW -->
                  <tr>
                    <td>
                      <b>Username</b>
                    </td>
                    <td>
                      <%=U.getEmail()%> 
                    </td>
                    <td>
                      <b>Employee ID</b>
                    </td>
                    <td>
                      <%=U.getSID()%> 
                    </td>
                  </tr>
                  <tr><td></td><td></td><td></td><td></td></tr>
              </table>
            </div>
          </div>
          <!-- ==== PROFILE PICT ===== -->
					<!-- *******************END CONETENT********************* -->
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
</html>