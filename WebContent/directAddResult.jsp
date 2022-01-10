<%@page import="loginVar.analysisVariable"%>
<%@page import="quuery.UserQuery"%>
<jsp:useBean id="u" class="loginVar.analysisVariable"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>
<%
    int i = UserQuery.saveResult(u);
    if(i>0){
    	session.setAttribute("addRes", "");
        response.sendRedirect("currentAssignedSample.jsp");
    }else{
        response.sendRedirect("currentAssignedSample.jsp");
    }
%>
