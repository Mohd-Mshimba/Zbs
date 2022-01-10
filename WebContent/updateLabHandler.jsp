<%@page import="quuery.UserQuery"%>
<%@page import="loginVar.labVariable"%>
<jsp:useBean id="u" class="loginVar.labVariable"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<%
    int i=UserQuery.updateLab(u);
   session.setAttribute("updateLab", "");
    response.sendRedirect("LabRecords.jsp");
%>
