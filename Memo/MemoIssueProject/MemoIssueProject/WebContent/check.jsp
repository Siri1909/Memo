<%@page import="Action.Email"%>
<%@page import="java.sql.*"%>
<%@page import="Action.Dbconnection"%>
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
<script>
function Pswd() {
	
	const num = Math.floor(1000 + Math.random() * 9000);
	 const pin= document.getElementById("pin").value;

	
     window.location.replace("check.jsp?pins="+pin+"&otps="+num);
	 document.getElementById("pin").style.display='none';

}


</script>

<body>  

<div   align="center" style="margin-top:80px">
<div class="row">
            <div class="col-sm-4"></div>
            <div class="col-sm-4">
                <h5>ISSUE CERTIFICATES</h5>
            </div>
            <div class="col-sm-6"></div>
        </div><br>
<form name="form" action="">
<div class="row">
        <div class="col-sm-4"></div>
        <div class="col-sm-1"><label style="margin-top:5px;">PIN-NO</label></div>
     <div class="col-sm-3"><input type="text" placeholder="PIN-NO" id="pin" onchange="Pswd()" class="form-control" required></div>
        <div class="col-sm-4"></div>
    </div><br>

<!-- <div id="divs">
<input type="hidden" id="otps"  >
<input type="hidden" id="pins"  >
</div> -->
<%
String s=request.getParameter("pins");
String s1=request.getParameter("otps");
String mail=null,msg=null,sub=null;
Statement st;
try
{

 Connection con=Dbconnection.getConnection();
  st=con.createStatement();
 ResultSet rs=st.executeQuery("select * from student where pin='"+s+"' ");
	if(rs.next())
{
		mail=rs.getString("email");

st.executeUpdate("update student set otp='"+s1+"' where pin='"+s+"' ");
System.out.println("changed Sucessfully"+s+"" +s1);

sub="Otp";
msg="your otp is:"+s1;

Email.sendMail(sub, msg, mail);

%>
<script type="text/javascript">

alert("Sented otp to Email");
</script>


<% 

 response.setHeader("Refresh","1,url=check_action.jsp");
%>


<%

}}
catch(Exception e){
  out.println(e);	

}


%>
</form>

</div>
</body>
</html>