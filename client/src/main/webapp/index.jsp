<%@page import="com.bin.projec.client.Patientmokup"%>
<%@page import="com.bin.projec.client.Patient"%>

<%


//Save---------------------------------
if (request.getParameter("pid") != null)
{
	Patientmokup patientobj = new Patientmokup();
	String stsMsg = ""; 



	//Insert--------------------------
	if (request.getParameter("hidItemIDSave") == "")
 {
 stsMsg = patientobj.insertItem(request.getParameter("itemCode"),
 request.getParameter("itemName"),
 request.getParameter("itemPrice"),
 request.getParameter("itemDesc"));
 } 

	else//Update----------------------
	 {
	 stsMsg = patientobj.updatepatient(request.getParameter("hidItemIDSave"),
	 request.getParameter("pname"),
	 request.getParameter("paddress"),
	 request.getParameter("pmobile"),
	 request.getParameter("page"),
	 request.getParameter("pwd"));
	 } 

	session.setAttribute("statusMsg", stsMsg);
	}



//Delete-----------------------------
if (request.getParameter("hidItemIDDelete") != null)
{
Patientmokup patientobj = new Patientmokup();
String stsMsg =
patientobj.droppatient(request.getParameter("hidItemIDDelete"));
session.setAttribute("statusMsg", stsMsg);
}
%>

<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/patient.js"></script>
</head>
<body>
  <!--    <h2>Jersey RESTful Web Application!</h2>
    <p><a href="webapi/myresource">Jersey resource</a>
    <p>Visit <a href="http://jersey.java.net">Project Jersey website</a>
    for more information on Jersey!
    
    -->
<form id="formItem" name="formItem" method="post" action="index.jsp" style="width:50%;">
 Id:
<input id="pid" name="pid" type="text"
 class="form-control form-control-sm" required>
<br> Name:
<input id="itemName" name="itemName" type="text"
 class="form-control form-control-sm">
<br> Address:
<input id="addr" name="addr" type="text"
 class="form-control form-control-sm">
 <br> Mobile:
 <input id="mobile" name="mobile" type="text"
 class="form-control form-control-sm">
<br> Age:
<input id="age" name="age" type="text"
 class="form-control form-control-sm">
<br>Password
<input id="pass" name="pass" type="text"
 class="form-control form-control-sm">
<br>
<input id="btnSave" name="btnSave" type="button" value="Save"
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
    
    </div>
</body>
</html>
