<%@page import="quuery.UserQuery"%>
<%@page import="loginVar.customerVariable"%>
<jsp:useBean id="u" class="loginVar.customerVariable"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>
<%
    UserQuery.deleteCustomer(u);
session.setAttribute("deleteCust", "");
    response.sendRedirect("ManageCust.jsp");
%>
