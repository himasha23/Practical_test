/**
 * 
 */

$('input[name="pmobile"]').keyup(function(e)
                                {
  if (/\D/g.test(this.value))
  {
    // Filter non-digits from input value.
    this.value = this.value.replace(/\D/g, '');
  }
});

var checknumber = $('#page').val();

if(jQuery.isNumeric(checknumber) == false){
    alert('Please enter numeric value');
    $('#special_price').focus();
    return;
    
  
}

$(document).ready(function()
{
if ($("#alertSuccess").text().trim() == "")
 {
 $("#alertSuccess").hide();
 }
 $("#alertError").hide();
});

//save
$(document).on("click", "#btnSave", function(event)
		{
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
	 
	 $("#formItem").submit();
	 
		}); 
	 
	 $(document).on("click", "#btnSave", function(event)
			 {
			 // Clear alerts---------------------
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
			  // If valid-------------------------
			   $("#formItem").submit();
			  });

	 
	// UPDATE==========================================
	 $(document).on("click", ".btnUpdate", function(event)
	 {
	  $("#hidItemIDSave").val($(this).closest("tr").find('#hidItemIDUpdate').val());
	  $("#pid").val($(this).closest("tr").find('td:eq(0)').text());
	  $("#pname").val($(this).closest("tr").find('td:eq(1)').text());
	  $("#paddress").val($(this).closest("tr").find('td:eq(2)').text());
	  $("#pmobile").val($(this).closest("tr").find('td:eq(3)').text());
	  $("#page").val($(this).closest("tr").find('td:eq(3)').text());
	  $("#pwd").val($(this).closest("tr").find('td:eq(3)').text());
	 }); 
	 
	 
	// CLIENTMODEL=========================================================================
	 function validateItemForm()
	 {
	 // CODE
	 if ($("#pid").val().trim() == "")
	  {
	  return "Insert ID.";
	  }
	 // NAME
	 if ($("#pname").val().trim() == "")
	  {
	  return "Insert  Name.";
	  } 
	 
	 
	// PRICE-------------------------------
	 if ($("#paddress").val().trim() == "")
	  {
	  return "Insert address";
	  }
	 // is numerical value
	 var tmpage = $("#page").val().trim();
	 if (!$.isNumeric(tmpage))
	  {
	  return "Insert a numerical value";
	  }
	
	 return true;
	 }
