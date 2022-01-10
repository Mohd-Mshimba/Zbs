<%@page import="quuery.UserQuery"%>
<%@page import="loginVar.analysisVariable"%>
<jsp:useBean id="u" class="loginVar.analysisVariable"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<%
    int i=UserQuery.updateResult(u);
    session.setAttribute("successUpdate", "You have been success to Update Sample Result");
    response.sendRedirect("currentAssignedSample.jsp");
%>
