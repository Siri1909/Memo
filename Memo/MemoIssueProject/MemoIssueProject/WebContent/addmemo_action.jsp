<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext"%>
<%@page import="Action.Email"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Action.Dbconnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.util.Random"%>
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

String pin=null,branch=null,semester=null,year=null,result=null,memo=null;


try {
	DiskFileItemFactory factory=new DiskFileItemFactory();
	ServletFileUpload sfu=new ServletFileUpload(factory);
if(!ServletFileUpload.isMultipartContent(request))
{
	System.out.println("Sorry. No Image Uploaded");
	return;
}

List items = sfu.parseRequest( new  ServletRequestContext(request));

FileItem fc1 = (FileItem) items.get(0);
pin= fc1.getString();

FileItem fc2 = (FileItem) items.get(1);
 branch= fc2.getString();
 
 
FileItem fc3 = (FileItem) items.get(2);
 semester= fc3.getString();
 
 
 System.out.println("KKK");
 FileItem fc4 = (FileItem) items.get(3);
  year= fc4.getString();
 
 
 FileItem fc5 = (FileItem) items.get(4);
     result= fc5.getString();
 
 FileItem fc6 = (FileItem) items.get(5);
        
 

 int km=0;
 

 Connection con=Dbconnection.getConnection();
 	PreparedStatement ps2 = con.prepareStatement("insert into memo (pin,branch,semester,year,result,memo,status)  values(?,?,?,?,?,?,?)");
 	 System.out.println(ps2);
 	
 	ps2.setString(1, pin);
 	ps2.setString(2, branch);
	ps2.setString(3, semester);
	ps2.setString(4, year);
	ps2.setString(5,result);
	ps2.setBinaryStream(6, fc6.getInputStream(), (int) fc6.getSize());
	ps2.setInt(7, km);
	int i=ps2.executeUpdate();
	if(i>0)
	{
		
		
	out.print("insert  success");
	System.out.println("INSERT SUCCESS");
	response.sendRedirect("Admin.html");
	}
	else{
		out.print("try once more");
	}
}
catch(Exception e){
  out.println(e);	

}
%>

</body>
</html>