<%@page import="quuery.UserQuery"%>
<%@page import="loginVar.userVariable"%>
<jsp:useBean id="u" class="loginVar.userVariable"></jsp:useBean>
<jsp:setProperty property="*" name="u" />
<%
    int i=UserQuery.updateLabExp(u);
session.setAttribute("updateLabExp", "");
    response.sendRedirect("ViewUsers.jsp");
%>
