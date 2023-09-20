<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Action.Dbconnection"%>
<%@ page import="java.sql.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>        
            <%!
            Connection con;
            PreparedStatement pst;
            ResultSet rs;
            String frmsg,tomsg,message;
            %>
            <%
            frmsg="admin";
            tomsg=request.getParameter("un");
	    SimpleDateFormat formatter = new SimpleDateFormat(" dd MM yyyy, hh:mm:ss a");
	    String s4 = formatter.format(new Date());
	    System.out.println("Today : " + s4);

            message=request.getParameter("message");
            
        Connection con=Dbconnection.getConnection();
            pst=con.prepareStatement("insert into message(frmaddrs,toaddrs,message,date) values(?,?,?,?)");
            pst.setString(1,frmsg);
            pst.setString(2,tomsg);
            pst.setString(3,message);
            pst.setString(4, s4);
            int i=pst.executeUpdate();
            %>
            <jsp:include page="sendmsg.jsp"></jsp:include>
        <div style="position: absolute; width: 312px; height: 22px; z-index: 2; left: 320px; top: 406px" id="layer2">
            <font size=4 color="#008000">
                <h2><font size="2" face="Verdana">Message Submitted successfully</font></h2>
            </font>  
        </div>
           
    </body>
</html>
