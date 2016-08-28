<%@page import="java.sql.ResultSet"%>
<%@ page language="java" import="javax.servlet.http.HttpSession,java.util.*, java.io.*,java.nio.charset.*,DAO.Encode" session="false"  contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>MCQ based</title>
<link rel="stylesheet" type="text/css" href="style.css"/>
</head>
<body>
<script type="text/javascript">

function preparePage(){
	
	var i;
	for(i=1;i<=30;i++)
		{
		if(i==j){
			document.getElementById(i).style.display = "block";}
		else
			{document.getElementById(i).style.display = "none";}
			
		}
	}
var j=1;
function mynext()
{
	if(j==30)
		j=1;
	else
		j++;
preparePage();
}
function myprev()
{
	if(j==1)
		j=30;
	else
		j--;
preparePage();
}

window.onload=function(){
	preparePage();
};
</script>
<%
HttpSession session = request.getSession(false);
session.setMaxInactiveInterval(2700);
if(session != null){
String name = (String)session.getAttribute("TN");
System.out.println(name);
String qno = (String)request.getParameter("QN");
System.out.print(qno);
Encode ob = new Encode();
long t = ob.getTime(name);
System.out.println("Time:"+ t);
long ct=System.currentTimeMillis()/1000;
%>
<header><img src="logo.svg" /><h1>Prelims</h1>
<div id="timer"></div>
</header>
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
					//window.location.href="test.jsp";
					document.getElementById("prev").style.display="none";
					document.getElementById("next").style.display="none";
                                        break;
                                    }   
                                 //alert("time out");
                             }
                                }
                            }
                        
                    
	</script>
<form action="test.jsp">
<%
Random r=new Random(); 
	int a[]=new int[30];
    
    for(int i=0;i<30;i++)
    {
        int b=r.nextInt(30)+1;
       if(a[0]!=b && a[1]!=b && a[2]!=b && a[3]!=b && a[4]!=b && a[5]!=b && a[6]!=b && a[7]!=b && a[8]!=b && a[9]!=b && a[10]!=b
    		   && a[11]!=b && a[12]!=b&& a[13]!=b && a[14]!=b && a[15]!=b && a[16]!=b && a[17]!=b && a[18]!=b && a[19]!=b && a[20]!=b
    		   && a[21]!=b && a[22]!=b && a[23]!=b && a[24]!=b && a[25]!=b && a[26]!=b && a[27]!=b && a[28]!=b && a[29]!=b )
        {
            a[i]=b;
         
        }
        else{
            i--;
			
        }} 

ResultSet rs=ob.fetch();%>
<div id="question-container">
  
<%

        for(int i=0;i<30;i++){

            rs.absolute(a[i]);
        	  %>
        	  
        	  <div id="<%=i+1%>">
        	  <input type="text" id="no" style=" width: 50px; font-size:14; font-color:red;" value="<%=i+1%>" disabled></br>
              <div id="question-text"><%= rs.getString("qn") %></div> <br/>
               <div id="option-1"><input type="radio" value="1" name="<%=i%>"><%= rs.getString("op1") %></div>
                <div id="option-2"><input type="radio" value="2" name="<%=i%>"><%=rs.getString("op2") %></div>
               <div id="option-3"><input type="radio" value="3" name="<%=i%>"> <%=rs.getString("op3") %></div>
               <div id="option-4"><input type="radio" value="4" name="<%=i%>"><%= rs.getString("op4") %></div>
               <div id="option-0"><input type="radio" value="0" name="<%=i%>" checked><% //rs.getString("soln"); %>Skip</div>
                <br/>
                </div>
                <%
                session.setAttribute(Integer.toString(i), rs.getString("soln"));
                System.out.println(i+"\t"+session.getAttribute(Integer.toString(i)));}%>
<div id="butt-grp">              
<input type="button" value="Prev" id="prev" onclick="myprev()">
<input type="button" value="Next" id="next" onclick="mynext()">
<button id="submit">SUBMIT</button>
</div>
</div>
<div id="error" style="color:Red; font-size:12px;"></div>
<%}
String choice = request.getParameter("flag");
if(choice != null && choice.equals("1"))
{
%>
<script type="text/javascript">
		document.getElementById("error").innerHTML = "<u>Correct Answer/u>";
		</script><%} else if(choice != null && choice.equals("0")){ %>
		<script type="text/javascript">
		document.getElementById("error").innerHTML = "<u>InCorrect Answer/u>";
		</script><%} %>
</form>
</html>