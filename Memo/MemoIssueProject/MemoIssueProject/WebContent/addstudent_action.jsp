<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.Random.*"%>
<%@page import="Action.Email"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Action.Dbconnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
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
String pin=null,name=null,father=null,pwd=null,repwd=null,email=null,phone=null,address=null,dob=null,gender=null,sub=null,msg=null,to=null;

Random r=new Random();
int num=r.nextInt(9999)+1;
String s6=String.valueOf(num);


try {
	DiskFileItemFactory factory=new DiskFileItemFactory();
	ServletFileUpload sfu=new ServletFileUpload(factory);
if(!ServletFileUpload.isMultipartContent(request))
{
	System.out.println("Sorry. No Image Uploaded");
	return;
}

List items = sfu.parseRequest(new  ServletRequestContext(request));

FileItem fc1 = (FileItem) items.get(1);
pin= fc1.getString();

FileItem fc2 = (FileItem) items.get(2);
 name= fc2.getString();
 
 
FileItem fc3 = (FileItem) items.get(3);
 father= fc3.getString();
 
 
 
 FileItem fc4 = (FileItem) items.get(4);
  gender= fc4.getString();
 
 
 FileItem fc5 = (FileItem) items.get(5);
     email= fc5.getString();
 
 FileItem fc6 = (FileItem) items.get(6);
         phone= fc6.getString();
 
 
 FileItem fc7 = (FileItem) items.get(7);
          dob= fc7.getString();
 
 FileItem fc8 = (FileItem) items.get(8);
     address= fc8.getString();
 
 
 FileItem fc9 = (FileItem) items.get(9);
 
 
 int km=0;
 

 Connection con=Dbconnection.getConnection();
 	PreparedStatement ps2 = con.prepareStatement("insert into student(pin,name,pwd,father,gender,email,phone,dob,address,image,otp,status) values(?,?,?,?,?,?,?,?,?,?,?,?)");
	ps2.setString(1, pin);
 	ps2.setString(2, name);
	ps2.setString(3, phone);
	ps2.setString(4, father);
	ps2.setString(5,gender);
	ps2.setString(6, email);
	ps2.setString(7, phone);
	ps2.setString(8, dob);
	ps2.setString(9, address);
	ps2.setBinaryStream(10, fc9.getInputStream(), (int) fc9.getSize());
	ps2.setString(11, s6);
	ps2.setInt(12, km);
	int i=ps2.executeUpdate();
if(i>0)
{
      msg="you have register in Memoissue project.Your Username is"+name+" and Password is:"+phone+".";
      sub="MemoIssue Details";
      
      
	Email.sendMail(sub, msg, email);
out.print("insert  success");
System.out.println("INSERT SUCCESS");
response.sendRedirect("accept.jsp");
}
else{
	out.print("try once more");
}

}catch
(Exception e)
{
e.printStackTrace();
}

%>
</body>
</html>