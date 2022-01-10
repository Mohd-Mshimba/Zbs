<%@page import="quuery.UserQuery"%>
<jsp:useBean id="u" class="loginVar.labVariable"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>
<%
    int i = UserQuery.save(u);
    if(i>0){
    	session.setAttribute("addLab", "");
        response.sendRedirect("LabRecords.jsp");
    }else{
        response.sendRedirect("LabRecords.jsp");
    }
%>
