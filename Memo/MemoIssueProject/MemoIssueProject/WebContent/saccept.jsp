
<%@page import="Action.Dbconnection"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <%
String s=request.getParameter("id");
 String status=null;
int i=1;
try{

Connection con=Dbconnection.getConnection();
Statement st=con.createStatement();
String s1="update student set status='"+i+"' where id='"+s+"'";

ResultSet rs=st.executeQuery("select * from student where id='"+s+"'");

if(rs.next()){

	status=rs.getString("status");
	
	if(status.equals("1")){
		

int j=st.executeUpdate("update student set status='0' where id='"+s+"'");
if(j==1)
{
out.println("update succes");
}

	}
	
	else{
		
		
		int j=st.executeUpdate(s1);
		if(j==1)
		{
		out.println("update succes");
		}
	}
	

}
}
catch(Exception e)
{
System.out.println(e);
}

%>
</body>
</html>