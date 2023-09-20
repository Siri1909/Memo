<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Action.Dbconnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
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

String s1=request.getParameter("id");
String s2=request.getParameter("pin");
String s3=request.getParameter("remark");  

SimpleDateFormat formatter = new SimpleDateFormat(" dd MM yyyy, hh:mm:ss a");
String s4 = formatter.format(new Date());
System.out.println("Today : " + s4);

try
{

 Connection con=Dbconnection.getConnection();
Statement  st=con.createStatement();
int i= st.executeUpdate("insert into issued (mid,pin,date,remark) values('"+s1+"','"+s2+"','"+s4+"','"+s3+"') ");
out.println("inserted Sucessfully");
if(i>0){
	
	
	response.sendRedirect("Admin.html");
}

}
catch(Exception e){
	out.println(e);


}


%>
</body>
</html>