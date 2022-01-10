
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
	String SID = request.getParameter("SID");
	String Photo = request.getParameter("Photo");
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/FINAL", "root", "");
		Statement st = conn.createStatement();

		int i = st.executeUpdate("UPDATE Staff SET Photo='" + Photo + "' WHERE SID='" + SID + "'");
		session.setAttribute("upload", "You have been success to Upload Profile");
		response.sendRedirect("home.jsp");

	} catch (Exception e) {
		System.out.print(e);
		e.printStackTrace();
	}
%>
