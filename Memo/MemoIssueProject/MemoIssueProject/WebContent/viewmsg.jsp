<%@page import="Action.Dbconnection"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %> 
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
<body>




        <%

        String un,frmsg,tomsg,message,date,utype;

try {
       
        un=session.getAttribute("pin").toString();
     
        Connection con =Dbconnection.getConnection();
        Statement  st=con.createStatement();
        ResultSet rs=st.executeQuery("select * from message where toaddrs='"+un+"' or toaddrs='All' ");
        %>
        
          <div style="position: absolute; width: 660px; height: 89px; z-index: 4; left: 91px; top: 162px" id="layer4">
            <div class="container">
        <table class="table table-bordered">
            <thead>
                <tr style="background-color:rgb(44, 126, 194);color:white;">
 
                            <th><b><font face="Tahoma" color="#303030">From</font></b></th>
                           <th><b><font face="Tahoma" color="#303030">To </font></b>
                            </th>
                            <th><b><font face="Tahoma" color="#303030">Message</font></b></th>
                            <th><b><font face="Tahoma" color="#303030">Date</font></b></th>
                    </tr>
                    </thead>
                    <%while(rs.next())
                      {
                      frmsg=rs.getString(2);
                      tomsg=rs.getString(3);
                      message=rs.getString(4);
                      date=rs.getString(5);
                     
                    %>
                    <tbody>
                    <tr>
                            <td><b><font face="Tahoma" color="#996633" size="2"><%=frmsg%></font></b></td>
                            <td><b><font face="Tahoma" color="#996633" size="2"><%=tomsg%></font></b></td>
                            <td><b><font face="Tahoma" color="#996633" size="2"><%=message%></font></b></td>
                            <td><b><font face="Tahoma" color="#996633" size="2"><%=date%></font></b></td>
                                                </tr>
              <%       
                      }  }
catch(Exception e){
  out.println(e);	

}
%>
</tbody>
            </table>
	 </div>
    </body>
</html>