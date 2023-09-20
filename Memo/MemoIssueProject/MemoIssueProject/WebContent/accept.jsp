
<%@page import="Action.Email"%>
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
 String URL = "jdbc:mysql://localhost:3306/memoissues";
 String USER = "root";
 String PASS = "root";
 Connection con = DriverManager.getConnection(URL, USER, PASS);
 String id=null,pin=null,year=null,semester=null,result=null,email=null,msg=null,sub=null;
 id=request.getParameter("id");
int i=1;
try{

Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from memo where id='"+id+"'");

if(rs.next()){


pin=rs.getString("pin");
year=rs.getString("year");
semester=rs.getString("semester");
result=rs.getString("result");

/* ResultSet rss=st.executeQuery("select * from student where pin='"+pin+"'");

if(rss.next()){

msg="you have been received  your  memo  year:"+year+"semester:"+semester+"result:"+result;
sub="MemoIssue Details";

email=rs.getString("email");
Email.sendMail(sub, msg, email);
} */
String s1="update memo set status='"+i+"' where id='"+id+"'";
int j=st.executeUpdate(s1);
if(j==1)
{
	
 response.sendRedirect("addremark.jsp?id="+id+"&pin="+pin);
 
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