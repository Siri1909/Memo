<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Action.Dbconnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<table  align="center" border="2">
<tr><td>PIN NO</td><td>BRANCH</td><td>SEMESTER</td><td>YEAR</td><td>RESULT</td><td>MEMO</td></tr>

<%

String res=request.getParameter("result"); 


String id=null,pin=null,branch=null,semester=null,year=null,result=null,memo=null;

try
{
    
	Connection con=Dbconnection.getConnection();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from memo where result='"+res+"'");
	
	while(rs.next())
{
		
		 id=rs.getString("id");
		 pin=rs.getString("pin");
         branch=rs.getString("branch");
         semester=rs.getString("semester");
		 year=rs.getString("year");
		 result=rs.getString("result");
		 
	
%>
<tr><td><%=pin%></td><td><%=branch%></td><td><%=semester%></td><td><%=year%></td><td><%=result%></td><td><img src="mimage.jsp?id=<%=id%>" width="100px" height="50px"></td></tr>

<%
}
	
}catch(Exception e){
	out.println(e);
}

%>
</body>
</html>