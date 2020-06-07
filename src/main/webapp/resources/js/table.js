var table1;
var table2;
var idpicker="addDefect";
var addbuttonhead="<button type='button' class='btn btn-primary btn-sm pull-left' onclick='";
var addbuttonmid="'><span class='glyphicon glyphicon-plus'></span> Add ";
var addbuttontail="</button>";

	
$(document).ready(function() {
	table1=$('#raisetable').DataTable({
		scrollY:'180px',
		scrollX:false,
        scrollCollapse: true,
        paging: false,
        "dom":'<"addDefectbutton">fti',
        responsive: true        
    });
	$("div .addDefectbutton").html(addbuttonhead+"openAddDefectModal()"+addbuttonmid+addbuttontail);
});

$(document).ready(function() {
	table2=$('#owntable').DataTable({
    	scrollY:'180px',
		scrollX:false,
        scrollCollapse: true,
        paging: false,
        "dom":'<"addDefectbutton">fti',
        responsive: true       
    });
	$("div .addDefectbutton").html(addbuttonhead+"openAddDefectModal()"+addbuttonmid+addbuttontail);
});

$(document).ready(function() {
	$("#raisedtoggle").click(function(){
	    $("#raiseddiv").show();
	    $("#owneddiv").hide();
	    $("#raisedtoggle").addClass("otoggle");
	    $("#raisedtoggle").removeClass("dtoggle");
	    $("#ownedtoggle").addClass("dtoggle");
	    $("#ownedtoggle").removeClass("otoggle");
	    table1.destroy();
	    table1=$('#raisetable').DataTable({
	    	scrollY:'180px',
			scrollX:false,
	        scrollCollapse: true,
	        paging: false,
	        "dom":'<"addDefectbutton">fti',
	        responsive: true
	    });
	    $("div .addDefectbutton").html(addbuttonhead+"openAddDefectModal()"+addbuttonmid+addbuttontail);
	});
});
$(document).ready(function() {
	$("#ownedtoggle").click(function(){
	    $("#raiseddiv").hide();
	    $("#owneddiv").show();
	    $("#raisedtoggle").addClass("dtoggle");
	    $("#raisedtoggle").removeClass("otoggle");
	    $("#ownedtoggle").addClass("otoggle");
	    $("#ownedtoggle").removeClass("dtoggle");
	    table2.destroy();
	    table2=$('#owntable').DataTable({
	    	scrollY:'180px',
			scrollX:false,
	        scrollCollapse: true,
	        paging: false,
	        "dom":'<"addDefectbutton">fti',
	        responsive: true
	    });
	    $("div .addDefectbutton").html(addbuttonhead+"openAddDefectModal()"+addbuttonmid+addbuttontail);
	});
});


/*key isssues table*/
$(document).ready(function() {
	var table=$('#keyissues').DataTable({
    	scrollY:'180px',
		scrollX:false,
        scrollCollapse: true,
        paging: false,
        "dom":'<"addKeyIssuebutton">fti',
        responsive: true
    });
	 $("div .addKeyIssuebutton").html(addbuttonhead+"openAddKeyIssueModal()"+addbuttonmid+addbuttontail);
});

$(document).ready(function() {
	var table=$('#sitstatus').DataTable({
    	paging: false,
    	scrollY:'350px',
		scrollX:false,
        scrollCollapse: true,
    	"dom": '<"addTaskbutton">fti',
    	responsive: true
    });
	$("div.addTaskbutton").html(addbuttonhead+"openAddTaskModal()"+addbuttonmid+addbuttontail);
});


$(document).ready(function() {
	var table=$('#qastatus').DataTable({
    	paging: false,
    	scrollY:'350px',
		scrollX:false,
        scrollCollapse: true,
    	"dom": '<"addTaskbutton">fti',
    	responsive: true
    });
	$("div.addTaskbutton").html(addbuttonhead+"openAddTaskModal()"+addbuttonmid+addbuttontail);
});

$(document).ready(function() {
	var table=$('#batuatstatus').DataTable({
    	paging: false,
    	scrollY:'350px',
		scrollX:false,
        scrollCollapse: true,
    	"dom": '<"addTaskbutton">fti',
    	responsive: true
    });
	 $("div.addTaskbutton").html(addbuttonhead+"openAddTaskModal()"+addbuttonmid+addbuttontail);
});

