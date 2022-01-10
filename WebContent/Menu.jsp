<link rel="stylesheet" type="text/css" href="bootstrap/css/sweetalert.css" />
<script src="bootstrap/js/sweetalert.js"></script>
<script src="bootstrap/js/sweetalert.min.js"></script>
<%
	/* SESSION SETTING */
	String username = (String) session.getAttribute("username");
	String password = (String) session.getAttribute("password");
	String fName = (String) session.getAttribute("fName");
	String mName = (String) session.getAttribute("mName");
	String lName = (String) session.getAttribute("lName");
	String homeStatus = (String) session.getAttribute("Status");
	String id = (String) session.getAttribute("id");
	String Photo = (String) session.getAttribute("Photo");
	session.setAttribute("fName", fName);
	session.setAttribute("mName", mName);
	session.setAttribute("lName", lName);
	session.setAttribute("Photo", Photo);
	session.setAttribute("username", username);
	session.setAttribute("password", password);
	session.setAttribute("Status", homeStatus);
	session.setAttribute("id", id);
	/* END SESSION SETTING */
%>
<!-- ************************************************************Admin or Distributer********************************************** -->
<%
	if (request.getSession(false).getAttribute("Status") == "Distributer") {
%>
<div class="profile_info">
	<div class="#">
		<img src="bootstrap/img/<%out.println(Photo);%>" alt="profile_pic"
			style="width: 50%;">
	</div>
	<p class="title" style="margin: 5px;">
		<%
			out.print(fName);
		%>&nbsp;<%
			out.print(lName);
		%>
	</p>
	<span style="color: #fff;"> <%
 	out.print(homeStatus);
 %>
	</span>
	<hr />
</div>
<ul class="menu">
	<li><a href="home.jsp"> <span class="icon"><i
				class="fa fa-home"></i></span> <span class="text">User Profile</span>
	</a></li>
	<li><a href="LabRecords.jsp"> <span class="icon"><i
				class="fa fa-table"></i></span> <span class="text"> Manage labs</span>
	</a></li>
	<li class="dropdown"><a href="" class="btn dropdown-toggle"
		style="margin-left: -80px;" data-toggle="dropdown"> <span
			class="icon"> <i class="fa fa-user"></i>
		</span> <span> Manage Staff</ </span> <span class="caret"></span></a>
		<ul class="dropdown-menu" aria-labelledby="menu1">
			<li style="width: 275px;"><a id="dropL" href="ViewUsers.jsp">Lab
					Expert</a></li>
			<li style="width: 275px;"><a id="dropL"
				href="viewSampReceiver.jsp">Sample Receiver</a></li>
		</ul></li>
	<li class="dropdown"><a href="" class="btn dropdown-toggle"
		style="margin-left: -60px;" data-toggle="dropdown"> <span
			class="icon"> <i class="fa fa-flask"></i>
		</span> <span> Manage Samples </span> <span class="caret"></span></a>
		<ul class="dropdown-menu" aria-labelledby="menu1">
			<li style="width: 275px;"><a id="dropL" href="newLabSample.jsp">New
					Lab Samples</a></li>
			<li style="width: 275px;"><a id="dropL"
				href="CurrentAnalysis.jsp">Current Analysis</a></li>
			<li style="width: 275px;"><a id="dropL"
				href="manageLabSample.jsp">All Lab Samples</a></li>
		</ul></li>
	<li><a href="GenerateReport.jsp"> <span class="icon"><i
				class="fa fa-book"></i></span> <span class="text">Generate Reports</span>
	</a></li>
	<li><a href="logout.jsp"> <span class="icon"><i
				class="fa fa-sign-out"></i></span> <span class="text">sign-out</span>
	</a></li>
</ul>
<!-- *****************************************Receiver***************************************************************** -->
<%
	} else if (request.getSession(false).getAttribute("Status") == "Receiver") {
%>
<div class="profile_info">
	<div class="#">
		<img src="bootstrap/img/<%out.println(Photo);%>" alt="profile_pic"
			style="width: 50%">
	</div>
	<p class="title" style="margin: 5px;">
		<%
			out.print(fName);
		%>&nbsp;<%
			out.print(lName);
		%>
	</p>
	<span style="color: #fff;"> <%
 	out.print(homeStatus);
 %>
	</span>
	<hr />
</div>
<ul class="menu">
	<li><a href="home.jsp"> <span class="icon"><i
				class="fa fa-home"></i></span> <span class="text">User Profile</span>
	</a></li>
	<li><a href="receiverSample.jsp"> <span class="icon"><i
				class="fa fa-book"></i></span> <span class="text">Received Sample</span>
	</a></li>
	<li><a href="ManageCust.jsp"> <span class="icon"><i
				class="fa fa-book"></i></span> <span class="text"> Manage Customer </span>
	</a></li>
	<li><a href="recAllReceivedSample.jsp"> <span class="icon"><i
				class="fa fa-user"></i></span> <span class="text">All Received
				Sample</span>
	</a></li>
	<li><a href="logout.jsp"> <span class="icon"><i
				class="fa fa-sign-out"></i></span> <span class="text">sign-out</span>
	</a></li>
</ul>
<!-- **********************************************************Customer************************************************************* -->
<%
	}
	if (request.getSession(false).getAttribute("Status") == "Customer") {
%>
<div class="profile_info">
	<div class="#">
		<img src="bootstrap/img/<%out.println(Photo);%>" alt="profile_pic"
			style="width: 50%">
	</div>
	<p class="title" style="margin: 5px;">
		<%
			out.print(fName);
		%>&nbsp;<%
			out.print(lName);
		%>
	</p>
	<span style="color: #fff;"> <%
 	out.print(homeStatus);
 %>
	</span>
	<hr />
</div>
<ul class="menu">
	<li><a href="homeCust.jsp"> <span class="icon"><i
				class="fa fa-home"></i></span> <span class="text">User Profile</span>
	</a></li>
	<li><a href="CustReq.jsp"> <span class="icon"><i
				class="fa fa-book"></i></span> <span class="text">Make Request</span>
	</a></li>
	<li><a href="CustViewReq.jsp"> <span class="icon"><i
				class="fa fa-eye"></i></span> <span class="text">View Request</span>
	</a></li>
	<li><a href="CustViewCurrentStep.jsp"> <span class="icon"><i
				class="fa fa-user"></i></span> <span class="text">View Cureent Step</span>
	</a></li>
	<li><a href="logout.jsp"> <span class="icon"><i
				class="fa fa-sign-out"></i></span> <span class="text">sign-out</span>
	</a></li>
</ul>
<!-- **************************************************LabExpert******************************************************* -->
<%
	} else if (request.getSession(false).getAttribute("Status") == "Lab Expart") {
%>
<div class="profile_info">
	<div class="#">
		<img src="bootstrap/img/<%out.println(Photo);%>" alt="profile_pic"
			style="width: 50%">
	</div>
	<p class="title" style="margin: 5px;">
		<%
			out.print(fName);
		%>&nbsp;<%
			out.print(lName);
		%>
	</p>
	<span style="color: #fff;"> <%
 	out.print(homeStatus);
 %>
	</span>
	<hr />
</div>
<ul class="menu">
	<li><a href="home.jsp"> <span class="icon"><i
				class="fa fa-home"></i></span> <span class="text">User Profile</span>
	</a></li>
	<li><a href="currentAssignedSample.jsp"> <span class="icon"><i
				class="fa fa-book"></i></span> <span class="text">Current Analysis</span>
	</a></li>
	<li><a href="myAssignedSamples.jsp"> <span class="icon"><i
				class="fa fa-user"></i></span> <span class="text">Assigned Analysis</span>
	</a></li>
	<li><a href="referenceAnalysis.jsp"> <span class="icon"><i
				class="fa fa-user"></i></span> <span class="text">References
				Analysis</span>
	</a></li>
	<li><a href="logout.jsp"> <span class="icon"><i
				class="fa fa-sign-out"></i></span> <span class="text">sign-out</span>
	</a></li>
</ul>
<!-- **********************************************************END SESSION************************************************************* -->
<%
	}
%>