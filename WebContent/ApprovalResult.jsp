<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
	String SCode = request.getParameter("SCode");
	String Approval = request.getParameter("Approval");
	String Remark = request.getParameter("Remark");
	String SampDate = request.getParameter("SampDate");
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/FINAL", "root", "");
		Statement st = conn.createStatement();
		int i = st.executeUpdate("UPDATE sample SET Approval='" + Approval + "', Remark='" + Remark
				+ "',SampDate='" + SampDate + "' WHERE SCode='" + SCode + "'");
		session.setAttribute("Approve", "");
		System.out.println("Data Approve Successfully!");
		response.sendRedirect("CurrentAnalysis.jsp");
	} catch (Exception e) {
		System.out.print(e);
		e.printStackTrace();
	}
%>