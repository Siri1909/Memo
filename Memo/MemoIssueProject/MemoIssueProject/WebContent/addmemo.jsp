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
           <div class="row">
            <div class="col-sm-4"></div>
            <div class="col-sm-6">
                <h1>ADD MEMO DETAILS</h1>
            </div>
            <div class="col-sm-2"></div>
        </div>
<form  action="addmemo_action.jsp" method="post" enctype="multipart/form-data">
<div class="row">
        <div class="col-sm-4"></div>
        <div class="col-sm-1"><label style="margin-top:5px;">PIN:</label></div>
     <div class="col-sm-3"><input type="text" placeholder="PIN" name="pin" class="form-control" required></div>
        <div class="col-sm-4"></div>
    </div><br>
<div class="row">
        <div class="col-sm-4"></div>
        <div class="col-sm-1"><label style="margin-top:5px;">BRANCH:</label></div>
     <div class="col-sm-3"><select name="branch" >
	<option value="DCME">DCME</option>
	<option value="DAEIE">DAEIE</option>
	<option value="DECE">DECE</option>
	</select></div>
        <div class="col-sm-4"></div>
    </div><br>
   <div class="row">
        <div class="col-sm-4"></div>
        <div class="col-sm-1"><label style="margin-top:5px;">Year:</label></div>
     <div class="col-sm-3"><select name="year" >
	<option value="1">1</option>
	<option value="2">2</option>
	<option value="3">3</option>
	</select></div>
        <div class="col-sm-4"></div>
    </div><br>
    <div class="row">
        <div class="col-sm-4"></div>
        <div class="col-sm-1"><label style="margin-top:5px;">semester:</label></div>
     <div class="col-sm-3"><select name="semester" >
	<option value="1">1</option>
	<option value="2">2</option>
	
	</select></div>
        <div class="col-sm-4"></div>
    </div><br>
 <div class="row">
    <div class="col-sm-4"></div>
        <div class="col-sm-1"><label>Gender</label></div>
         <div class="col-sm-3">
       <input type="radio" name="result" value="pass" checked="checked">Pass
            <input type="radio" name="result" value="fail">Fail
        </div>
        <div class="col-sm-4"></div>
        </div><br>
	<div class="row">
        <div class="col-sm-4"></div>
        <div class="col-sm-1"><label style="margin-top:5px;">Memo</label></div>
       <div class="col-sm-3"><input type="file" placeholder="Image" name="image"  class="form-control" required></div>
        <div class="col-sm-4"></div>
    </div><br>
 <div class="row">
        <div class="col-sm-5"></div>
        <div class="col-sm-4"><input type="submit"  class="btn btn-primary" value="ADD"> <input type="reset"  class="btn btn-primary" value="Clear"></div>
        <div class="col-sm-3"></div>
    </div><br>				
</form>
</body>
</html>