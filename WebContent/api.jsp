
<%@ page language="java" import="net.sf.json.JSONArray"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
	response.setContentType("application/json");
	String ids = request.getParameter("SCode");
%>
<%
	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
	try {
		connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/FINAL", "root", "");
		statement = connection.createStatement();
		String sql = "SELECT * FROM sample WHERE SCode='" + ids + "'";
		resultSet = statement.executeQuery(sql);
		while (resultSet.next()) {
%>
{ "SCode":"<%=resultSet.getString("SCode")%>", "SName":"<%=resultSet.getString("SName")%>",
"Batch":"<%=resultSet.getString("Batch")%>", "ProdDate":"<%=resultSet.getString("ProdDate")%>",
"ExpDate":"<%=resultSet.getString("ExpDate")%>", "Manufacture":"<%=resultSet.getString("Manufacture")%>"
}
<%
	}
	} catch (Exception e) {
		e.printStackTrace();
	}
%>