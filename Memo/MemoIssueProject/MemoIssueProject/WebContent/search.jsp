
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
<script>
function search() {
	

	 const result= document.getElementById("result").value;

	
     window.location.replace("search.jsp?result="+result);

}
function searchs() {
	

	 const result= document.getElementById("results").value;

	
    window.location.replace("search.jsp?result="+result);

}

</script>
</head>
<div >
<h1 align="center">Search Memo</h1>
<form name="form" action="">
<center><label >Result:</label>
 <input type="radio" id="results" value="pass"  onchange="searchs()" />Passed <input type="radio" id="result" value="fail" onchange="search()" />Failed
</center><br><br>
<!-- <input type="submit" value="search"> -->
</form>
</div>
<div>
<br><br>
    <div class="container">
        <table class="table table-bordered">
            <thead>
                <tr style="background-color:rgb(44, 126, 194);color:white;">
       <th>PIN NO</th><th>BRANCH</th><th>SEMESTER</th><th>YEAR</th><th>RESULT</th><th>MEMO</th></tr></thead>

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
<tbody>
<tr><td><%=pin%></td><td><%=branch%></td><td><%=semester%></td><td><%=year%></td><td><%=result%></td><td><img src="mimage.jsp?id=<%=id%>" width="100px" height="50px"></td></tr>

<%
}
	
}catch(Exception e){
	out.println(e);
}

%>



</tbody>
</table>
</body>
</html>