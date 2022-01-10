<%@page import="quuery.UserQuery"%>
<%@page import="loginVar.sampleVariable"%>
<jsp:useBean id="u" class="loginVar.sampleVariable"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<%
    int i=UserQuery.AssignUserSamples(u);
    response.sendRedirect("newLabSample.jsp");
%>
