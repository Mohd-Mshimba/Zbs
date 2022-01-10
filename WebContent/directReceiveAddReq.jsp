<%@page import="quuery.UserQuery"%>
<jsp:useBean id="u" class="loginVar.appointmentVariable"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>
<%
    int i = UserQuery.acceptRequest(u);
    	session.setAttribute("addReq", "");
        response.sendRedirect("receiverSample.jsp");
%>
