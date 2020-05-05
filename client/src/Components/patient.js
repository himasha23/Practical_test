$(document).ready(function()
{
if ($("#alertSuccess").text().trim() == "")
 {
 $("#alertSuccess").hide();
 }
 $("#alertError").hide();
});

$(document).on("click", "#btnSave", function(event)
		{
	
		//clear alerts
		 $("#alertSuccess").text("");
		 $("#alertSuccess").hide();
		 $("#alertError").text("");
		 $("#alertError").hide();
		 
		// Form validation-------------------
		 var status = validateItemForm();
		 if (status != true)
		  {
		  $("#alertError").text(status);
		  $("#alertError").show();
		  return;
		  }

		// If valid------------------------
		 $("#formItem").submit();
		 
		 
		// SAVE ============================================
		 $(document).on("click", "#btnSave", function(event)
		 {
		 // Clear alerts---------------------
		  $("#alertSuccess").text("");
		  $("#alertSuccess").hide();
		  $("#alertError").text("");
		  $("#alertError").hide(); 
		
		  var status = validateItemForm();
		  if (status != true)
		   {
		   $("#alertError").text(status);
		   $("#alertError").show();
		   return;
		   }
		  // If valid-------------------------
		   $("#formItem").submit(); 

		 
		 });
		 
		 function validateItemForm()
		 {
		 // CODE
		 if ($("#pid").val().trim() == "")
		  {
		  return "Insert ID";
		  }
		 // NAME
		 if ($("#itemName").val().trim() == "")
		  {
		  return "Insert  Name.";
		  }
		 // PRICE-------------------------------
		 if ($("#addr").val().trim() == "")
		  {
		  return "Insert address.";
		  }
		 // is numerical value
		 var tmpmob = $("#mobile").val().trim();
		 if (!$.isNumeric(tmpmob))
		  {
		  return "Insert a numerical value .";
		  }
		// is numerical value
		 var tmpage = $("#age").val().trim();
		 if (!$.isNumeric(tmpage))
		  {
		  return "Insert a numerical value .";
		  }
		 
		 // DESCRIPTION------------------------
		 if ($("#pass").val().trim() == "")
		  {
		  return "Insert password.";
		  }
		 return true;
		 }