<%@page import="quuery.UserQuery"%>
<jsp:useBean id="u" class="loginVar.userVariable"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>
<%
try{
    int i=UserQuery.updateLabExp(u);
    session.setAttribute("updateRec", "");
    response.sendRedirect("viewSampReceiver.jsp");
}catch(Exception e){
	System.out.println(e);
}
%>
