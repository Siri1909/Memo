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
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>    

<title>Insert title here</title>
</head>
<body><br><br>
    <div class="container">
        <table class="table table-bordered">
            <thead>
                <tr style="background-color:rgb(44, 126, 194);color:white;">
        <th>PIN NO</th><th>BRANCH</th><th>SEMESTER</th><th>YEAR</th><th>RESULT</th><th>MEMO</th></tr>
</thead>
<%

String id=null,pin=null,branch=null,semester=null,year=null,result=null,memo=null;

try
{
    
	Connection con=Dbconnection.getConnection();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from memo");
	
	while(rs.next())
{
		
		 id=rs.getString("id");
		 pin=rs.getString("pin");
         branch=rs.getString("branch");
         semester=rs.getString("semester");
		 year=rs.getString("year");
		 result=rs.getString("result");
		 
	
%>
<tbody>
<tr><td><%=pin%></td><td><%=branch%></td><td><%=semester%></td><td><%=year%></td><td><%=result%></td><td><img src="mimage.jsp?id=<%=id%>" width="100px" height="50px"></td></tr>

<%
}
	
}catch(Exception e){
	out.println(e);
}

%>
<tbody>
</table>
</body>
</html>