<%@page import="loginVar.sampleVariable"%>
<%@page import="quuery.UserQuery"%>
<jsp:useBean id="u" class="loginVar.sampleVariable"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>
<%
    int i = UserQuery.updateSendSamp(u);
    if(i>0){
    	session.setAttribute("dirLab", "");
        response.sendRedirect("receiverSample.jsp");
    }else{
        response.sendRedirect("receiverSample.jsp");
    }
%>
