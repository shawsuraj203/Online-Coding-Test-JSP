<%@ page language="java" import="javax.servlet.http.HttpSession" import="DAO.Encode" session="false" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
//HttpSession ses = request.getSession(false);
Encode ob =new Encode();
String tn = request.getParameter("tn");
System.out.println(tn);
String mob = request.getParameter("mob");
String email = request.getParameter("email");
String qn = "1";
boolean flag = ob.login(tn,mob,email);
if(flag)
{
	HttpSession session = request.getSession(true);
	session.setMaxInactiveInterval(7320);
	long t = System.currentTimeMillis()/1000;
	String s = Long.toString(t);
	session.setAttribute("d","7320" );
	session.setAttribute("TN", tn);
	session.setAttribute("QN", qn);
	session.setAttribute("1","0");
	session.setAttribute("2","0");
	session.setAttribute("3","0");
	session.setAttribute("4","0");
	session.setAttribute("5","0");
	%>
	<jsp:forward page="exam.jsp?QN=1"></jsp:forward>
<%}
%>
</body>
</html>