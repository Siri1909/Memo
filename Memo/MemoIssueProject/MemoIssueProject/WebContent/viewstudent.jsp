<%@page import="Action.Dbconnection"%>
<%@page import="java.sql.*"%>
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
  
                 <th>PIN NO</th><th>NAME</th><th>FNAME</th><th>ADDRESS</th><th>GENDER</th><th>E-MAIL</th><th>PHONE</th><th>DOB</th><th>IMAGE</th></tr>
</thead>
      
<%

String id=null,pin=null,name=null,fname=null,gender=null,email=null, phone=null,dob=null,address=null,status=null;

name=session.getAttribute("name").toString();
try
{
    
	Connection con=Dbconnection.getConnection();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from student where name='"+name+"'  ");
	
	while(rs.next())
{
		
		id=rs.getString("id");
		 pin=rs.getString("pin");
         name=rs.getString("name");
         fname=rs.getString("father");
		 gender=rs.getString("gender");
		 email=rs.getString("email");
		 phone=rs.getString("phone");
		 dob=rs.getString("dob");	
	     address=rs.getString("address");
	     status=rs.getString("status");
	
%>
<tbody>
<tr><td><%=pin%></td><td><%=name%></td><td><%=fname%></td><td><%=address%></td><td><%=gender%></td><td><%=email%></td><td><%=phone%></td><td><%=dob%></td><td><img src="image.jsp?id=<%=id%>" width="100px" height="50px"></td></tr>

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