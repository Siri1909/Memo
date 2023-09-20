<%@page import="java.sql.*"%>
<%@page import="Action.Dbconnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
String s1=request.getParameter("name");
String s2=request.getParameter("pwd");
try
{

 
 Statement st=con.createStatement();
 ResultSet rs=st.executeQuery("select * from  admin where user='"+s1+"' and pwd='"+s2+"'");
 if(rs.next()){
	 response.sendRedirect("Admin.html");
	 
 }
}
catch(Exception e){
  out.println(e);	

}
%>
</body>
</html>