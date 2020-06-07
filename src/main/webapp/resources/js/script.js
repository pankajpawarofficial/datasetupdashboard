
function getoption(){
	var quarter=$("#quarter option:selected").text();
	var currentURL=window.location.href;
	currentURL = currentURL.substring(0, currentURL.indexOf('='));
	currentURL = currentURL + "=" + quarter;
	window.open(currentURL,"_self");

}

$(document).ready(function() {
	var currentURL=window.location.href;
	currentURL = (String)(currentURL.substring(currentURL.indexOf("=") + 1));
	var quarter;
	$('#quarter').children().each(function( index ) {
		  if (currentURL===$(this).text()){
			  quarter=(String)(currentURL);
		  }			  
	});	
	$('#quarter').val(quarter);
	
});

/*toggle buttons*/

$(document).ready(function() {
	$("#timetoggle").click(function(){
    	/*$("#timeline1").show();*/
    	$("#spacetoggle").addClass("dtoggle");
	    $("#spacetoggle").removeClass("otoggle");
	    $("#timetoggle").addClass("otoggle");
	    $("#timetoggle").removeClass("dtoggle");
    });
});
$(document).ready(function() {
	$("#spacetoggle").click(function(){
    	/*$("#timeline1").hide();*/
    	$("#timetoggle").addClass("dtoggle");
	    $("#timetoggle").removeClass("otoggle");
	    $("#spacetoggle").addClass("otoggle");
	    $("#spacetoggle").removeClass("dtoggle");
    });
});



