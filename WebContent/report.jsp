<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="now" value="<%=new java.util.Date()%>" />
<%@page contentType="text/html" import="java.util.*"%>
<%@page import="quuery.UserQuery,loginVar.sampleVariable.*,java.util.*"%>
<%
	String driver = "com.mysql.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost:3306/";
	String database = "FINAL";
	String userid = "root";
	String password = "";
	try {
		Class.forName(driver);
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}
	Connection connection = null;
	connection = DriverManager.getConnection(connectionUrl + database, userid, password);
%>
<strong>Sampling Type</strong>
<table class="table table-bordered">
	<thead>
		<tr class="active">
			<th>Certification</th>
			<th>External</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<%
				Statement st1 = null;
				ResultSet rs1 = null;
				st1 = connection.createStatement();
				String sql1 = "SELECT COUNT('CustType') AS a FROM sample WHERE CustType='External' ";
				rs1 = st1.executeQuery(sql1);
				while (rs1.next()) {
			%>
			<td><%=rs1.getString("a")%></td>
			<%
				}
			%>
			<%
				Statement st2 = null;
				ResultSet rs2 = null;
				st2 = connection.createStatement();
				String sql2 = "SELECT COUNT('CustType') AS b FROM sample WHERE CustType='Certification' ";
				rs2 = st2.executeQuery(sql2);
				while (rs2.next()) {
			%>
			<td><%=rs2.getString("b")%></td>
			<%
				}
			%>
		</tr>
	</tbody>
</table>
<strong>Sample Results</strong>
<table class="table table-bordered">
	<thead>
		<tr class="active">
			<th>Sample Name</th>
			<th>Brand</th>
			<th>Remark</th>
			<th>Approval</th>
		</tr>
	</thead>
	<tbody>
		<%
			Statement st3 = null;
			ResultSet rs3 = null;
			st3 = connection.createStatement();
			String sql3 = "SELECT * FROM sample";
			rs3 = st3.executeQuery(sql3);
			while (rs3.next()) {
		%>
		<tr>
			<td id="center"><%=rs3.getString("SName")%></td>
			<td id="center"><%=rs3.getString("Brand")%></td>
			<td id="center">
				<%
					if (rs3.getString("Remark").equals("Pass")) {
				%> <span style="color: green; padding: 5px 0px;">Pass &nbsp;(<i
					class="fa fa-check-square-o"></i>)
			</span> <%
 	} else {
 %><span style="color: red; padding: 5px 0px;">Fail&nbsp;(<i
					class="fa fa-remove"></i>)
			</span> <%
 	}
 %>
			</td>
			<td id="center">
				<%
					if (rs3.getString("Approval").equals("YES")) {
				%> <span style="color: green; padding: 5px 0px;">YES &nbsp;(<i
					class="fa fa-check-square-o"></i>)
			</span> <%
 	} else {
 %><span style="color: red; padding: 5px 0px;">NO&nbsp;(<i
					class="fa fa-remove"></i>)
			</span> <%
 	}
 %>
			</td>
		</tr>
		<%
			}
		%>
	</tbody>
</table>
<table class="table table-hover">
	<thead>
		<tr>
			<th colspan="3">Avg Results</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>Total Sample</td>
			<%
				Statement st4 = null;
				ResultSet rs4 = null;
				st4 = connection.createStatement();
				String sql4 = "SELECT COUNT('SCode') AS c FROM sample";
				rs4 = st4.executeQuery(sql4);
				while (rs4.next()) {
			%>
			<td><%=rs4.getString("c")%></td>
			<%
				}
			%>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>Accepted Sample</td>
			<%
				Statement st5 = null;
				ResultSet rs5 = null;
				st5 = connection.createStatement();
				String sql5 = "SELECT COUNT('Approval') AS d FROM sample WHERE Remark='Pass' AND Approval='YES'";
				rs5 = st5.executeQuery(sql5);
				while (rs5.next()) {
			%>
			<td><%=rs5.getString("d")%></td>
			<%
				}
			%>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>Accepted Customer</td>
			<%
				Statement st7 = null;
				ResultSet rs7 = null;
				st7 = connection.createStatement();
				String sql7 = "SELECT COUNT('Request') AS f FROM Customer WHERE Request='Accepted'";
				rs7 = st7.executeQuery(sql7);
				while (rs7.next()) {
			%>
			<td><%=rs7.getString("f")%></td>
			<%
				}
			%>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>Rejected Customer</td>
			<%
				Statement st6 = null;
				ResultSet rs6 = null;
				st6 = connection.createStatement();
				String sql6 = "SELECT COUNT('Request') AS e FROM Customer WHERE Request='Rejected'";
				rs6 = st6.executeQuery(sql6);
				while (rs6.next()) {
			%>
			<td><%=rs6.getString("e")%></td>
			<%
				}
			%>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>Expired Sample</td>
			<%
				Statement st8 = null;
				ResultSet rs8 = null;
				st8 = connection.createStatement();

				Date date = new Date();
				SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
				String strDate = formatter.format(date);
				String sql8 = "SELECT COUNT(ExpDate) as g FROM sample WHERE (ExpDate<'"+strDate+"')";
				rs8 = st8.executeQuery(sql8);
				while (rs8.next()) {
			%>
			<td><%=rs8.getString("g")%></td>
			<%
				}
			%>
			<td>&nbsp;</td>
		</tr>
	</tbody>
	<tbody>
		<tr></tr>
	</tbody>
</table>
<%
	connection.close();
%>
