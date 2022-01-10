<%@page import="quuery.UserQuery"%>
<%@page import="loginVar.customerVariable"%>
<jsp:useBean id="u" class="loginVar.customerVariable"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>
<%
    UserQuery.rejectCustomer(u);
session.setAttribute("rejReq", "");
    response.sendRedirect("receiverSample.jsp");
%>
