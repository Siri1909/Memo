<%@page import="Action.Dbconnection"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>memo details</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

    <style>
        h1 {
            font-size: 50px;
            padding: 20px;
            text-align: center;
            background-color: #E5E7E9;
            color: #34495E;
            font-family: Georgia, 'Times New Roman', Times, serif;
        }

        h4 {
            text-align: center;
            color: red;
        }

        h5 {
            text-align: center;
            color: #F1C40F;
        }
    </style>

    <script>
        function submitmemo1() {
            document.getElementById('memo1').style.backgroundColor = '#26C22F';
        }
        function submitmemo2() {
            document.getElementById('memo2').style.backgroundColor = '#26C22F';
        }
        function submitmemo3() {
            document.getElementById('memo3').style.backgroundColor = '#26C22F';
        }
        function submitmemo4() {
            document.getElementById('memo4').style.backgroundColor = '#26C22F';
        }
        function submitmemo5() {
            document.getElementById('memo5').style.backgroundColor = '#26C22F';
        }
        function submitmemo6() {
            document.getElementById('memo6').style.backgroundColor = '#26C22F';
        }
    </script>

</head>
<%


//String pin=request.getParameter("pin");

String pin=session.getAttribute("pin").toString();

%>

<body>
    <header>
        <h2 align="center">Memo Details</h2>
    </header><br><br>
    <div class="container">

        <div class="row">
                <div class="col col-sm-2"></div>
                <div class="col col-sm-6"><h3>Your Hallticket No is: <%=pin %></h3></div>
                <div class="col col-sm-2"></div>
                <div class="col col-sm-2"></div>
            
        </div><br><br>

        <div>
            <h4>Year - 1</h4>
        </div><br>

        <div class="row">
            <div class="col col-sm-1"></div>
            <div class="col col-sm-5">
                <h5>Semester - 1</h5>
            </div>
            <div class="col col-sm-5">
                <h5>Semester - 2</h5>
            </div>
            <div class="col col-sm-1"></div>
        </div>

        <div class="row">
            <div class="col col-sm-1"></div>
            <div class="col col-sm-5">
                <div style="border: 2px solid #D7DBDD;" id="memo1">
                       
                       <table  align="center" border="2">
<tr><td>S.NO</td><td>RESULT</td><td>IMAGE</td><td>ACTION</td> </tr>

<%

String result=null,id=null,status=null;

try
{
    
	Connection con=Dbconnection.getConnection();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from memo where pin='"+pin+"' and semester='1' and year='1'");
	
	while(rs.next())
{
		
		 
		 
		id=rs.getString("id");
		 result=rs.getString("result");
		 status=rs.getString("status");
		 String approve;
			if(status.equals("0")){
				
				approve="NOT ISSUED";
			}else{
				approve="ISSUED";
			}
			 
%>
<tr><td><%=id%></td><td><%=result%></td><td><img src="mimage.jsp?id=<%=id%>" width="100px" height="50px"></td><td><%=approve%></td></tr>

<%
}
	
}catch(Exception e){
	out.println(e);
}

%>
</table>
                
          
                        <div class="row">
                       
                            <div class="col-sm-3">
                            
                                                 </div>
                          <!--   <div class="col-sm-3"><button type="button" class="btn btn-primary"
                                    onclick="submitmemo1()">Submit</button></div>
                            <div class="col-sm-3"><button type="reset" class="btn btn-danger">Cancel</button></div>
                        -->    <div class="col-sm-3"> <a href="viewremark.jsp?pin=<%=pin%>">ViewRemarks</a></div>
                        </div>
                    
                </div>
            </div>
            <div class="col col-sm-5">
                <div style="border: 2px solid #D7DBDD;" id="memo2">
                
                  <table  align="center" border="2">
<tr><td>S.NO</td><td>RESULT</td><td>IMAGE</td><td>ACTION</td> </tr>

<%

String result2=null,id2=null,status2=null;

try
{
    
	Connection con=Dbconnection.getConnection();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from memo where pin='"+pin+"' and semester='2' and year='1'");
	
	while(rs.next())
{
		
		 
		 
		id2=rs.getString("id");
		 result2=rs.getString("result");
		 status2=rs.getString("status");
		 String approve;
			if(status2.equals("0")){
				
				approve="NOT ISSUED";
			}else{
				approve="ISSUED";
			}
			 
%>
<tr><td><%=id2%></td><td><%=result2%></td><td><img src="mimage.jsp?id=<%=id2%>" width="100px" height="50px"></td><td><%=approve%></td></tr>

<%
}
	
}catch(Exception e){
	out.println(e);
}

%>
</table>
                        <div class="row">
                            <div class="col-sm-3"></div>
                            <!-- <div class="col-sm-3"><button type="button" class="btn btn-primary"
                                    onclick="submitmemo2()">Submit</button></div>
                            <div class="col-sm-3"><button type="reset" class="btn btn-danger">Cancel</button></div>
                     -->     <div class="col-sm-3"> <a href="viewremark.jsp?pin=<%=pin%>">ViewRemarks</a></div>
                        </div>
                   
                </div>
            </div>
            <div class="col col-sm-1"></div>
        </div><br><br>

        <div>
            <h4>Year - 2</h4>
        </div><br>

        <div class="row">
            <div class="col col-sm-1"></div>
            <div class="col col-sm-5">
                <h5>Semester - 3</h5>
            </div>
            <div class="col col-sm-5">
                <h5>Semester - 4</h5>
            </div>
            <div class="col col-sm-1"></div>
        </div>

        <div class="row">
            <div class="col col-sm-1"></div>
            <div class="col col-sm-5">
                <div style="border: 2px solid #D7DBDD;" id="memo3">
                  
                  <table  align="center" border="2">
<tr><td>S.NO</td><td>RESULT</td><td>IMAGE</td><td>ACTION</td> </tr>

<%

String result3=null,id3=null,status3=null;

try
{
    
	Connection con=Dbconnection.getConnection();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from memo where pin='"+pin+"' and semester='1' and year='2'");
	
	while(rs.next())
{
		
		 
		 
		id3=rs.getString("id");
		 result3=rs.getString("result");
		 status3=rs.getString("status");
		 String approve;
			if(status3.equals("0")){
				
				approve="NOT ISSUED";
			}else{
				approve="ISSUED";
			}
			 
%>
<tr><td><%=id3%></td><td><%=result3%></td><td><img src="mimage.jsp?id=<%=id3%>" width="100px" height="50px"></td><td><%=approve%></td></tr>

<%
}
	
}catch(Exception e){
	out.println(e);
}

%>
</table>
                        <div class="row">
                            <div class="col-sm-3"></div>
                         <!--    <div class="col-sm-3"><button type="button" class="btn btn-primary"
                                    onclick="submitmemo3()">Submit</button></div>
                            <div class="col-sm-3"><button type="reset" class="btn btn-danger">Cancel</button></div>
                      -->        <div class="col-sm-3"> <a href="viewremark.jsp?pin=<%=pin%>">ViewRemarks</a></div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col col-sm-5">
                <div style="border: 2px solid #D7DBDD;" id="memo4">
                    
                  <table  align="center" border="2">
<tr><td>S.NO</td><td>RESULT</td><td>IMAGE</td><td>ACTION</td> </tr>

<%

String result4=null,id4=null,status4=null;

try
{
    
	Connection con=Dbconnection.getConnection();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from memo where pin='"+pin+"' and semester='2' and year='2'");
	
	while(rs.next())
{
		
		 
		 
		id4=rs.getString("id");
		 result4=rs.getString("result");
		 status4=rs.getString("status");
		 String approve;
			if(status4.equals("0")){
				
				approve="NOT ISSUED";
			}else{
				approve="ISSUED";
			}
			 
%>
<tr><td><%=id4%></td><td><%=result4%></td><td><img src="mimage.jsp?id=<%=id4%>" width="100px" height="50px"></td><td><%=approve%></td></tr>

<%
}
	
}catch(Exception e){
	out.println(e);
}

%>
</table>
                        <div class="row">
                            <div class="col-sm-3"></div>
                            <!-- <div class="col-sm-3"><button type="button" class="btn btn-primary"
                                    onclick="submitmemo4()">Submit</button></div>
                            <div class="col-sm-3"><button type="reset" class="btn btn-danger">Cancel</button></div>
                           -->  <div class="col-sm-3"> <a href="viewremark.jsp?pin=<%=pin%>">ViewRemarks</a></div>
                        </div>
                    
                </div>
            </div>
            <div class="col col-sm-1"></div>
        </div><br><br>

        <div>
            <h4>Year - 3</h4>
        </div><br>

        <div class="row">
            <div class="col col-sm-1"></div>
            <div class="col col-sm-5">
                <h5>Semester - 5</h5>
            </div>
            <div class="col col-sm-5">
                <h5>Semester - 6</h5>
            </div>
            <div class="col col-sm-1"></div>
        </div>

        <div class="row">
            <div class="col col-sm-1"></div>
            <div class="col col-sm-5">
                <div style="border: 2px solid #D7DBDD;" id="memo5">
                
                  <table  align="center" border="2">
<tr><td>S.NO</td><td>RESULT</td><td>IMAGE</td><td>ACTION</td> </tr>

<%

String result5=null,id5=null,status5=null;

try
{
    
	Connection con=Dbconnection.getConnection();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from memo where pin='"+pin+"' and semester='1' and year='3'");
	
	while(rs.next())
{
		
		 
		 
		id5=rs.getString("id");
		 result5=rs.getString("result");
		 status5=rs.getString("status");
		 String approve;
			if(status5.equals("0")){
				
				approve="NOT ISSUED";
			}else{
				approve="ISSUED";
			}
			 
%>
<tr><td><%=id5%></td><td><%=result5%></td><td><img src="mimage.jsp?id=<%=id5%>" width="100px" height="50px"></td><td><%=approve%></td></tr>

<%
}
	
}catch(Exception e){
	out.println(e);
}

%>
</table>
                        <div class="row">
                            <div class="col-sm-3"></div>
                            <!-- <div class="col-sm-3"><button type="button" class="btn btn-primary"
                                    onclick="submitmemo5()">Submit</button></div>
                            <div class="col-sm-3"><button type="reset" class="btn btn-danger">Cancel</button></div>
                           -->   <div class="col-sm-3"> <a href="viewremark.jsp?pin=<%=pin%>">ViewRemarks</a></div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col col-sm-5">
                <div style="border: 2px solid #D7DBDD;" id="memo6">
                
                  <table  align="center" border="2">
<tr><td>S.NO</td><td>RESULT</td><td>IMAGE</td><td>ACTION</td> </tr>

<%

String result6=null,id6=null,status6=null;

try
{
    
	Connection con=Dbconnection.getConnection();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from memo where pin='"+pin+"' and semester='2' and year='3'");
	
	while(rs.next())
{
		
		 
		 
		id6=rs.getString("id");
		 result6=rs.getString("result");
		 status6=rs.getString("status");
		 String approve;
			if(status6.equals("0")){
				
				approve="NOT ISSUED";
			}else{
				approve="ISSUED";
			}
			 
%>
<tr><td><%=id6%></td><td><%=result6%></td><td><img src="mimage.jsp?id=<%=id6%>" width="100px" height="50px"></td><td><%=approve%></td></tr>

<%
}
	
}catch(Exception e){
	out.println(e);
}

%>
</table>
       <div class="row">
                            <div class="col-sm-3"></div>
                            <!-- <div class="col-sm-3"><button type="button" class="btn btn-primary"
                                    onclick="submitmemo6()">Submit</button></div>
                            <div class="col-sm-3"><button type="reset" class="btn btn-danger">Cancel</button></div>
                           -->  
                           <div class="col-sm-3"> <a href="viewremark.jsp?pin=<%=pin%>">ViewRemarks</a></div>
                        </div>
                    
                </div>
            </div>
            <div class="col col-sm-1"></div>
        </div><br><br><br><br><br><br>
    </div>

  

</body>
</html>