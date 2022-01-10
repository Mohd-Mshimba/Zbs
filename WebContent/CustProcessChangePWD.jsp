<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%
	String username = (String) session.getAttribute("username");
	String password = (String) session.getAttribute("password");
	String homeStatus = (String) session.getAttribute("Status");
	String id = (String) session.getAttribute("id");
	session.setAttribute("username", username);
	session.setAttribute("password", password);
	session.setAttribute("Status", homeStatus);
	session.setAttribute("id", id);
%>
<%
	String currentPassword = request.getParameter("current");
	String Newpass = request.getParameter("password1");
	String conpass = request.getParameter("password2");
	String connurl = "jdbc:mysql://localhost:3306/FINAL";
	Connection con = null;
	String pass = "";
	int ids = 0;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection(connurl, "root", "");
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(
				"select * from login where password='" + currentPassword + "' AND CCode='" + id + "'");
		while (rs.next()) {
			ids = rs.getInt(1);
			pass = rs.getString(3);
		}
		System.out.println(id + " " + pass);
		if (pass.equals(currentPassword)) {
			Statement st1 = con.createStatement();
			int i = st1.executeUpdate("update login set password='" + Newpass + "' where CCode='" + id + "'");
		
			session.setAttribute("changedSuccess", "Password changed successfully");
	        response.sendRedirect("Login.jsp");
			st1.close();
			con.close();
		} else {
			session.setAttribute("fail", "");
	        response.sendRedirect("Login.jsp");
		}
	} catch (Exception e) {
		out.println(e);
	}
%>