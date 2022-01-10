<%@page import="quuery.UserQuery"%>
<%@page import="loginVar.userLoginVariable"%>
<jsp:useBean id="u" class="loginVar.userLoginVariable"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>
<%
/* SESSION SETTING */
String username = (String)session.getAttribute("username");
String password = (String)session.getAttribute("password");
String homeStatus = (String)session.getAttribute("Status");
String id = (String)session.getAttribute("id");
session.setAttribute("username", username);
session.setAttribute("password", password);
session.setAttribute("Status", homeStatus);
session.setAttribute("id", id);
			   /* END SESSION SETTING */
%>
<%
    int i = UserQuery.updateCustProfile(u);
    	session.setAttribute("success", "You have been success to Upadte Data");
        response.sendRedirect("homeCust.jsp");
%>