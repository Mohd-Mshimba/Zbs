<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String Analyzer = (String) session.getAttribute("Analyzer");
String SCode = (String) session.getAttribute("SCode");
out.print(Analyzer);
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/FINAL", "root", "");
		Statement st = conn.createStatement();
		int i = st.executeUpdate("DELETE FROM analysis WHERE analyzer='"+ Analyzer+ "' AND SCode='"+SCode+"'");
		int j = st.executeUpdate("UPDATE sample SET Remark='Not Yet' WHERE SCode='"+SCode+"'");
		session.setAttribute("success", "You have been success to Delete Sample Result");
		System.out.println("Data Deleted Successfully!");
		response.sendRedirect("currentAssignedSample.jsp");
	} catch (Exception e) {
		System.out.print(e);
		e.printStackTrace();
	}
%>