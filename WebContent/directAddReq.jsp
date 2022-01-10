<%@page import="quuery.UserQuery"%>
<jsp:useBean id="u" class="loginVar.appointmentVariable"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>
<%
    int i = UserQuery.saveRequests(u);
    if(i>0){
    	session.setAttribute("success", "You have been success to make Request");
        response.sendRedirect("CustReq.jsp");
    }else{
        response.sendRedirect("CustReq.jsp");
    }
%>
