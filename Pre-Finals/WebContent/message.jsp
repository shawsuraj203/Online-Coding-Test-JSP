<%@ page language="java" import="java.io.*, javax.servlet.http.HttpSession" import="DAO.Encode" session="false" contentType="text/html;  charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
	"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Upload</title>
</head>
<body>
	<h2>${requestScope.message}</h2>
	<%
	//HttpSession session =request.getSession(false);
	HttpSession session = request.getSession(false);
	session.setMaxInactiveInterval(7320);
	String qn = request.getParameter("qn");
	String output="C:\\Users\\shaws\\OneDrive\\Workplace\\Pre-Finals\\WebContent\\Output\\"+qn+".txt";
	String s = request.getParameter("tempfile");
	try{
	File f1 = new File(s);// OUTFILE
    File f2 = new File(output);// INPUT

    FileReader fR1 = new FileReader(f1);
    FileReader fR2 = new FileReader(f2);

    BufferedReader reader1 = new BufferedReader(fR1);
    BufferedReader reader2 = new BufferedReader(fR2);

    String line1 = null;
    String line2 = null;
    int flag = 1;
    while ((flag == 1) && ((line1 = reader1.readLine()) != null)
            && ((line2 = reader2.readLine()) != null)) {
        if (!line1.equalsIgnoreCase(line2))
            flag = 0;
    }
	if(flag==1&&(((line1=reader1.readLine())!=null&&(line2=reader2.readLine())==null)||((line1=reader1.readLine())==null&&(line2=reader2.readLine())!=null)))
		flag =0;
    reader1.close();
    reader2.close();
    System.out.println("Flag " + flag);
    if(flag==1)
    	session.setAttribute(qn,"1");
    Encode ob =new Encode();
	String tn = (String)session.getAttribute("TN");
	boolean f = ob.marking(flag, tn);
	String site= "exam.jsp?QN="+qn+"&flag="+ flag;
	response.sendRedirect(site);
	}
	catch(Exception e){
		System.out.println("Exception:" + e);
	}
	
	%>
</body>
</html>