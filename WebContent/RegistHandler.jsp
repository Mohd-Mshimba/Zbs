<%@page import="loginVar.userLoginVariable"%>
<%@page import="quuery.UserQuery"%>
<jsp:useBean id="u" class="loginVar.userLoginVariable"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>
<%
    int i = UserQuery.regCustomer(u);
	String email = request.getParameter("email");
	String pass = request.getParameter("password");
	
    if(i>0){
    	session.setAttribute("email",email);
    	session.setAttribute("pass",pass);
    	session.setAttribute("regSuccess", "");
        response.sendRedirect("Login.jsp");
    }else{
    	session.setAttribute("regFail","");
        response.sendRedirect("Login.jsp");
    }
%>
