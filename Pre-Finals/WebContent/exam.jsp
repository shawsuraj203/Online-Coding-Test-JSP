<%@ page language="java" import="javax.servlet.http.HttpSession, java.io.*, java.nio.charset.Charset" session="false" import="DAO.Encode" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		 <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		 <title>Competition</title>
		 <link rel="stylesheet" type="text/css" href="text-edit.css"/>
</head>
<body>
<header>
<img src="logo.svg" /><h1>Encoding Competition Page</h1>
<div id="timer"></div></header>
<%
HttpSession session = request.getSession(false);
session.setMaxInactiveInterval(7320);
if(session != null){
String name = (String)session.getAttribute("TN");
System.out.println(name);
String qno = (String)request.getParameter("QN");
System.out.print(qno);
Encode ob = new Encode();
long t = ob.getTime(name);
long ct=System.currentTimeMillis()/1000;
%>

<script>
		quizstarted = false;
                //var d = 1200;
              <% int d1=(Integer.parseInt((String)session.getAttribute("d")));
              //int d1 = 5*30;%> 
              
                    //int i = (int) d;
                
               var  d =<%= d1-(ct-t) %>;
                  
       
                //var d = i;
                startquiz();
		function startquiz() {
			if(!quizstarted) {
				myVar=setInterval(function(){myTimer()},1000);
				quizstarted = true;
			}
		}
                function myTimer() {
			d--;
			document.getElementById("timer").innerHTML = Math.floor((d/60)) + ":" + (d % 60);
                     if(d === 0) {
				clearInterval(myVar);
                          while(true){
				if (prompt("Call the VOLUNTEER", "******") === 'abc') {
                                    document.getElementById("timer").innerHTML = "END";
                                    //<% //session.invalidate();%>
					window.location.href="complete.jsp";
                                        break;
                                    }   
                                 //alert("time out");
                             }
                                }
                            }
                        
                    
	</script>
<%
int j=Integer.parseInt(qno);
if(j>=6){
	j=1;
	qno ="1";}
else if(j<=0){
	j=5; qno ="5";}
String s = "/Pre-Finals/MyServlet?qn="+j;
%>
<br/>
<div id="question-container">
<form  method="post" action="<%=s%>"
		enctype="multipart/form-data">
		<div id="q-no"><%=j %></div>
<textarea name="ques"  disabled>
<% 
try{
	
	FileInputStream fin = new FileInputStream("C:\\Users\\shaws\\OneDrive\\Workplace\\Pre-Finals\\WebContent\\Question\\"+j+".txt");
	Reader reader = new InputStreamReader(fin,Charset.forName("utf-8"));
	System.out.println(fin.toString());
	int i; 
	do{
		i= fin.read();
		if(i!=-1)
		out.print(Character.toString((char) i));
	}while(i !=-1);
	fin.close();
}catch(Exception e){
	
	System.out.println("Exception e:" +e);
}
String in = j +".txt";
%>
</textarea>	
<div id="file-dump">
<a href="<%=in%>" download="input<%=in%>" target="_blank"><input type="button" value="Input" id="check-file" ></a>
<input type="file" name="fileName" required>
<input type="submit" value="Check" id="check-file" <%if(((String)session.getAttribute(qno)).equals("1")){out.print(" disabled");} %>>
</div>
<div id="res">
			 </div>
<div id="butt-grp">

<a href="exam.jsp?QN=<%out.println(--j);%>"><input type="button" value="<"></a>
<a href="complete.jsp"><input type="button" value="End" onclick="confirm('Are You Sure');"></a>
<a href="exam.jsp?QN=<%out.println(j+=2);%>"><input type="button" value=">"></a>
</div>
<%}
String choice = request.getParameter("flag");
if(choice != null && choice.equals("1"))
{
%>
<script type="text/javascript">
		document.getElementById("res").innerHTML = "Correct Answer";
		document.getElementById("res").style.display="block";
		document.getElementById("res").style.background="#0f0";
		</script><%} else if(choice != null && choice.equals("0")){ %>
		<script type="text/javascript">
		document.getElementById("res").innerHTML = "Incorrect Answer";
		document.getElementById("res").style.display="block";
		document.getElementById("res").style.background="#f00";
		</script><%} %>
</form>
</div>
</html>