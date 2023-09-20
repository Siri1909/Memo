<%@page import="Action.Dbconnection"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%!
Connection con;
Statement st,st1;
Statement pst;
ResultSet rs,rs1;
String name,pwd;
int i;
%>
<%
String name=request.getParameter("name");
String pwd=request.getParameter("pwd");
        ResultSet rs;
      
     
      try{ 
      
        con = Dbconnection.getConnection();
        st=con.createStatement();
       int i=st.executeUpdate("update admin set user='"+name+"',pwd='"+pwd+"' where id='1' ");
       
       if(i>0){
    	   
    	   out.println("success");
       }
       else
       {
    	  System.out.println("unsuccessfully updated");
       }
      }
      catch(Exception e){
    	  
    	  e.printStackTrace();
      }    




        %>
</body>
</html>