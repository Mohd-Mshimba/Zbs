<%@page import="quuery.UserQuery"%>
<%@page import="loginVar.labVariable"%>
<jsp:useBean id="u" class="loginVar.labVariable"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>
<%
    UserQuery.deleteLab(u);
session.setAttribute("deleteteLab", "");
    response.sendRedirect("LabRecords.jsp");
%>
