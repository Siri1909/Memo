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
  
<th>ID</th><th>MEMO ID</th><th>PIN NO</th><th>DATE</th><th>REMARK</th></tr>
</thead>
<%

String  id=null,mid=null,pin=null,date=null,remark=null;

 pin=request.getParameter("pin");
try
{
    
	Connection con=Dbconnection.getConnection();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from issued where pin='"+pin+"'   ");
	
	while(rs.next())
{
		
		 id=rs.getString("id");
		 mid=rs.getString("mid");
		 pin=rs.getString("pin");
         date=rs.getString("date");
         remark=rs.getString("remark");
		 
		 
	
%>
<tbody>
<tr><td><%=id%></td><td><%=mid%></td><td><%=pin%></td><td><%=date%></td><td><%=remark%></td></tr>

<%
}
	
}catch(Exception e){
	out.println(e);
}

%>
</tbody>
</table>
</div>
</body>
</html>