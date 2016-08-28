<%@ page language="java" import="javax.servlet.http.HttpSession,DAO.*" session="false" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
HttpSession session = request.getSession(false);
session.setMaxInactiveInterval(2700);
Encode ob = new Encode();
int f;
String s, a, tn;
tn = (String)session.getAttribute("TN");
double mark=0.0;
for(int i=0;i<30;i++){
 s=(String)request.getParameter(Integer.toString(i));
 System.out.println(s);
 a= (String)session.getAttribute(Integer.toString(i));
 System.out.println("\n"+a);
 if(!s.equals("0")){
if(s.equals(a))
mark++;
else
mark -= 0.25;}

}
ob.marking(mark, tn);%><jsp:forward page="complete.jsp"></jsp:forward>
</body>
</html>