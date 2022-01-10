<%@page import="loginVar.userVariable"%>
<%@page import="quuery.UserQuery"%>
<jsp:useBean id="u" class="loginVar.userLoginVariable"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>
<%
    int i = UserQuery.saveUser(u);
    if(i>0){
    	 session.setAttribute("addRec", "");
        response.sendRedirect("viewSampReceiver.jsp");
    }else{
        response.sendRedirect("viewSampReceiver.jsp");
    }
%>
