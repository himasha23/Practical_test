<%@page import="com.bin.projec.client.Patientmokup"%>
<%
//Save---------------------------------

Patientmokup patientobj = new Patientmokup();
	String stsMsg = ""; 



	//Insert--------------------------
	if (request.getParameter("hidItemIDSave") == "")
 	{
 		stsMsg = patientobj.createpatient(
 		request.getParameter("pid"),
 		request.getParameter("pname"),
 		request.getParameter("paddress"),
 		request.getParameter("pmobile"),
 		request.getParameter("page"),
 		request.getParameter("pwd"));
 } 

	
	
	
	else//Update----------------------
	 {
	out.println("");
	 }
	 session.setAttribute("statusMsg", stsMsg); 
	



	//Delete-----------------------------
	if (request.getParameter("hidItemIDDelete") != null)
	{
		Patientmokup pat = new Patientmokup();
	 String stsM =
	pat.droppatient(request.getParameter("hidItemIDDelete"));
	 session.setAttribute("statusMsg", stsM);
	}

%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="component/patientss.js"></script>
<script src="component/jquery-3.2.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
</head>
<body>
    
<h1 style="text-align:left">Patient Details</h1>
<form id="formItem" name="formItem" method="post" action="index.jsp" style="width:80%;">
 Id:
<input id="pid" name="pid" type="text"
 class="form-control form-control-sm" required>
<br> Name:
<input id="pname" name="pname" type="text"
 class="form-control form-control-sm" required>
<br> Address:
<input id="paddress" name="paddress" type="text"
 class="form-control form-control-sm" required>
 <br> Mobile:
 <input id="pmobile" name="pmobile" type="text"
 class="form-control form-control-sm" onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')" required>
<br> Age:
<input id="page" name="page" type="text"
 class="form-control form-control-sm" required>
<br>Password
<input id="pwd" name="pwd" type="password"
 class="form-control form-control-sm" required>
<br>
<input id="btnSave" name="btnSave" type="submit" value="Save"
 class="btn btn-primary">
<input type="hidden" id="hidItemIDSave" name="hidItemIDSave" value="">

</form>
   
    <div id ="alertSuccess" class="alert alert success">
    <%
    out.print(session.getAttribute("statusMsg"));
    %>
    </div>
    
    <div id="alertError" class="alert alert-danger"></div>
    
    <br>
    <%
    Patientmokup patientob = new Patientmokup();
    out.print(patientob.getPatients());
    
    %>
   
   
</body>
</html>
