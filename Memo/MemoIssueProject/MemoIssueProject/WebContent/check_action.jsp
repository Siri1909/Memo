<%@page import="Action.Dbconnection"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<div>
<div class="row">
            <div class="col-sm-4"></div>
            <div class="col-sm-6">
                <h1>STUDENT DETAILS</h1>
            </div>
            <div class="col-sm-2"></div>
        </div>
<form name="form" action="check_action.jsp" method="get">

<div class="row">
        <div class="col-sm-4"></div>
        <div class="col-sm-1"><label style="margin-top:5px;">PIN-NO:</label></div>
     <div class="col-sm-3"><input type="text" placeholder="PIN-NO"  id="pin" name="pin" class="form-control" required></div>
        <div class="col-sm-4"></div>
    </div><br>
	
	
	
	<div class="row">
        <div class="col-sm-4"></div>
        <div class="col-sm-1"><label style="margin-top:5px;">OTP:</label></div>
     <div class="col-sm-3"><input type="number" placeholder="OTP NUMBER" name="otp" class="form-control" required></div>
        <div class="col-sm-4"></div>
    </div><br>

 <div class="row">
        <div class="col-sm-5"></div>
        <div class="col-sm-4"><input type="submit"  class="btn btn-primary" value="CHECK"> <input type="reset"  class="btn btn-primary" value="Clear"></div>
        <div class="col-sm-3"></div>
    </div><br>

</form>
</div>
<%
String URL = "jdbc:mysql://localhost:3306/memoissues";
String USER = "root";
String PASS = "root";
Connection con = DriverManager.getConnection(URL, USER, PASS);
String s=request.getParameter("pin");
String s1=request.getParameter("otp");
Statement st;
try
{

 
  st=con.createStatement();
 ResultSet rs=st.executeQuery("select * from student where pin='"+s+"' and otp='"+s1+"' ");
	if(rs.next())
{
		
		 response.sendRedirect("memo.jsp?pin="+s);

}}
catch(Exception e){
  out.println(e);	

}


%>
</body>
</html>