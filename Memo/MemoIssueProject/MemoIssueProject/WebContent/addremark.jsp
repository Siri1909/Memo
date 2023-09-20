<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>

<%

String id=null,pin=null;
id=request.getParameter("id");
pin=request.getParameter("pin");
%>

 <div class="row">
            <div class="col-sm-4"></div>
            <div class="col-sm-6">
                <h1>ADD REMARKS</h1>
            </div>
            <div class="col-sm-2"></div>
        </div><br>
<form  action="addremark_action.jsp" method="post"> 


<div class="row">
        <div class="col-sm-4"></div>
        <div class="col-sm-1"></div>
     <div class="col-sm-3"><input type="hidden"   name="id" value="<%=id%>" class="form-control" required></div>
        <div class="col-sm-4"></div>
    </div><br>


<div class="row">
        <div class="col-sm-4"></div>
        <div class="col-sm-1"><label style="margin-top:5px;">PIN-NO:</label></div>
     <div class="col-sm-3"><input type="text"  name="pin"  value="<%=pin %>" class="form-control" required></div>
        <div class="col-sm-4"></div>
    </div><br>
	
 <div class="row">
        <div class="col-sm-4"></div>
        <div class="col-sm-1"><label style="margin-top:5px;">REMARKS:</label></div>
       <div class="col-sm-6">   <textarea name="remark" placeholder="Add remarks....."  rows=3 cols=15> </textarea></div>
        <div class="col-sm-1"></div>
    </div><br>
 <div class="row">
        <div class="col-sm-5"></div>
        <div class="col-sm-4"><input type="submit"  class="btn btn-primary" value="ADD"> <input type="reset"  class="btn btn-primary" value="Clear"></div>
        <div class="col-sm-3"></div>
    </div><br>	
</form>
</body>
</html>