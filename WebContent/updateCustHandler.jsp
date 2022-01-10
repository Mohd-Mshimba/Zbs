<%@page import="quuery.UserQuery"%>
<%@page import="loginVar.userLoginVariable"%>
<jsp:useBean id="u" class="loginVar.userLoginVariable"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<%
    int i=UserQuery.updateCust(u);
    response.sendRedirect("ManageCust.jsp");
%>
