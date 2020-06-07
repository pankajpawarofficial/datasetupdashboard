var defectDetailsData;
var keyIssuesDetailsData;
var taskDetailsData;
var mappedDefectObject;
var mappedKeyIssueObject;
var mappedtaskObject;

function generateInputDate(date){
	var d2=new Date(date);
	var day = ("0" + d2.getDate()).slice(-2);
	var month = ("0" + (d2.getMonth() + 1)).slice(-2);
	return d2.getFullYear()+"-"+(month)+"-"+(day) ;
}

function openDefectModal(defectId){
	for (index in defectDetailsData) {
		if (defectDetailsData[index].defectID === defectId) {
			mappedDefectObject=defectDetailsData[index];
			break;		    
		}
	}
	
	$("#DefectMongoidField").val(mappedDefectObject.id);
	$("#defectCategoryField").val(mappedDefectObject.defectCategory);
	$("#defectIdField").val(mappedDefectObject.defectID);
	$('#defectStatusField').val(mappedDefectObject.defectStatus).change();
	$("#commentsField").val(mappedDefectObject.comments);
	$("#defectOpenDateField").val(mappedDefectObject.defectOpenDate);
	$("#defectUpdateDateField").val(mappedDefectObject.defectUpdateDate);
	$("#defectReleaseNameField").val(mappedDefectObject.releaseName).change();
	$('#defectdetailsmodal').modal('show');
}



function openAddDefectModal(){
	
	
	$("#DefectMongoidField").val(null);
	$("#defectCategoryField").val(null);
	$("#defectIdField").val(null);
	$('#defectStatusField').val(null);
	$("#commentsField").val(null);
	$("#defectReleaseNameField").val(null);

	$('#defectdetailsmodal').modal('show');
}

function  openAddKeyIssueModal(){
	$("#KeyIssueMongoidField").val(null);
	$("#KeyIssueReleaseNameField").val(null);
	$("#issueIDField").val(null);
	$("#issueDescField").val(null);
	$("#ownerField").val(null);
	$('#statusField').val(null);
	$("#impactField").val(null);
	$("#eTADummy").val(null);
	$("#categoryField").val(null);
	$("#isOpenField").val(null);


	$('#keyissuesmodal').modal('show');	
}

function  openAddTaskModal(){
	
	$("#taskPhaseField").val(null);
	$("#taskDescriptionField").val(null);
	$("#TaskcategoryField").val(null);
	$("#configCreateValidateField").val(null);
	$("#configResponseField").val(null);
	$('#estimateField').val(null);
	$("#itemCreateValidateField").val(null);
	$("#npiOrderabilityField").val(null);
	$("#offerDataInSBPField").val(null);
	$("#offerModelingField").val(null);
	$("#offerNameScopeField").val(null);
	$("#priceProcessValidateField").val(null);
	$("#taskReleaseNameField").val(null);
	$("#taskIDField").val(null);
	$("#taskProgramField").val(null);
	$("#plannedETADummy").val(null);
	$("#actualETADummy").val(null);
	
	
	$('#taskdetailsmodal').modal('show');	
}

function openKeyIssueModal(KeyIssueID){
	console.log(String(KeyIssueID));

	for (var index in keyIssuesDetailsData) {
		if (keyIssuesDetailsData[index].issueID === KeyIssueID) {
			console.log(keyIssuesDetailsData[index]); 
			mappedKeyIssueObject=keyIssuesDetailsData[index];
			break;		    
		}
	}
	
	$("#KeyIssueMongoidField").val(mappedKeyIssueObject.id);
	$("#KeyIssueReleaseNameField").val(mappedKeyIssueObject.releaseName);
	$("#issueIDField").val(mappedKeyIssueObject.issueID);
	$("#issueDescField").val(mappedKeyIssueObject.issueDesc);
	$("#ownerField").val(mappedKeyIssueObject.owner);
	$('#statusField').val(mappedKeyIssueObject.status).change();
	$("#impactField").val(mappedKeyIssueObject.impact);
	$("#eTADummy").val(generateInputDate(mappedKeyIssueObject.eTA));
	$("#categoryField").val(mappedKeyIssueObject.category);
	$("#isOpenField").val(mappedKeyIssueObject.isOpen).change();
	$("#createdByField").val(mappedKeyIssueObject.createdBy);
	$("#updatedByField").val(mappedKeyIssueObject.updatedBy);
	$("#createdDateField").val(mappedKeyIssueObject.createdDate);
	$("#updatedDateField").val(mappedKeyIssueObject.updatedDate);

	$('#keyissuesmodal').modal('show');
}

function openTaskModal(taskDetailsID){
	
	for (var index in taskDetailsData) {
		if (taskDetailsData[index].taskID === taskDetailsID) {
			console.log(taskDetailsData[index].taskID); 
			mappedtaskObject=taskDetailsData[index];
			break;		    
		}
	}

	$("#idField").val(mappedtaskObject.id);
	$("#taskPhaseField").val(mappedtaskObject.taskPhase);
	$("#taskDescriptionField").val(mappedtaskObject.taskDescription);
	$("#TaskcategoryField").val(mappedtaskObject.category).change();
	$("#configCreateValidateField").val(mappedtaskObject.configCreateValidate).change();
	$("#configResponseField").val(mappedtaskObject.configResponse).change();
	$('#estimateField').val(mappedtaskObject.estimate).change();
	$("#itemCreateValidateField").val(mappedtaskObject.itemCreateValidate).change();
	$("#npiOrderabilityField").val(mappedtaskObject.npiOrderability).change();
	$("#offerDataInSBPField").val(mappedtaskObject.offerDataInSBP).change();
	$("#offerModelingField").val(mappedtaskObject.offerModeling).change();
	$("#offerNameScopeField").val(mappedtaskObject.offerNameScope);
	$("#priceProcessValidateField").val(mappedtaskObject.priceProcessValidate).change();
	$("#taskReleaseNameField").val(mappedtaskObject.releaseName).change();
	$("#taskIDField").val(mappedtaskObject.taskID);
	$("#taskProgramField").val(mappedtaskObject.taskProgram);
	$("#plannedETADummy").val(generateInputDate(mappedtaskObject.plannedETA));
	$("#actualETADummy").val(generateInputDate(mappedtaskObject.actualETA));
	$("#taskRaisedDateDummy").val(generateInputDate(mappedtaskObject.taskRaisedDate));
	$("#requestupdatedDateField").val(mappedtaskObject.updatedDate);
	$("#requestRaisedDateField").val(mappedtaskObject.requestRaisedDate);
	$("#requestupdatedByField").val(mappedtaskObject.updatedBy);
	$("#requestRaisedByField").val(mappedtaskObject.requestRaisedBy);
	$('#taskdetailsmodal').modal('show');
}

$(document).ready(function(){

	var releaseName=$("#quarter").val();
	var arrayOfObjects;

	//Ajax Data Request
	$.ajax({
		type: "POST",
		contentType : "application/json",
		dataType : 'json',
		url: "defectDetailsData",
		data: JSON.stringify(releaseName),
		success: function(response){
			defectDetailsData=response;	
			console.log(response);
		},
		error: function(e){
			alert('Error: ' + e);
		}
	});

	$.ajax({
		type: "POST",
		contentType : "application/json",
		dataType : 'json',
		url: "keyIssuesDetailsData",
		data: JSON.stringify(releaseName),
		success: function(response){
			keyIssuesDetailsData=response;
			console.log(response);
		},
		error: function(e){
			alert('Error: ' + e);
		}
	});

	$.ajax({
		type: "POST",
		contentType : "application/json",
		dataType : 'json',
		url: "taskDetailsData",
		data: JSON.stringify(releaseName),
		success: function(response){
			taskDetailsData=response;
			console.log(response);
		},
		error: function(e){
			alert('Error: ' + e);
		}
	});



	//Defect Operations
	$('#adddefect').click(function(){
		
		/*$('#defectOpenDateField').val(Date());
		$('#defectUpdateDate').val(Date());*/
		$('#defectdetailsform').attr('action', 'addDefect');
		
		$('#defectdetailsform').submit();
	})

	$('#updatedefect').click(function(){
		$('#defectdetailsform').attr('action', 'editDefect');
		$('#defectdetailsform').submit();

	})

	$('#deletedefect').click(function(){
		$('#defectdetailsform').attr('action', 'deleteDefect');
		$('#defectdetailsform').submit();
	})

	

	//Key Issue Operations
	
	$('#addkeyIssue').click(function(){
		$("#eTAField").val(new Date($( "#eTADummy" ).val()));
		$('#keyIssueForm').attr('action', 'addKeyIssue');
		$('#keyIssueForm').submit();

	})
	
	$('#updatekeyIssue').click(function(){
		$("#eTAField").val(new Date($( "#eTADummy" ).val()));
		$('#keyIssueForm').attr('action', 'editKeyIssue');
		$('#keyIssueForm').submit();

	})

	$('#deletekeyIssue').click(function(){
		$("#eTAField").val(new Date($( "#eTADummy" ).val()));
		$('#keyIssueForm').attr('action', 'deleteKeyIssue');
		$('#keyIssueForm').submit();
	})


	//Task Details Operations
	
	$('#addTaskDetails').click(function(){
		$("#taskRaisedDateField").val(new Date($( "#taskRaisedDateDummy" ).val()));
		$("#plannedETAField").val(new Date($( "#plannedETADummy" ).val()));
		$("#actualETAField").val(new Date($( "#actualETADummy" ).val()));
		$('#taskDetailsForm').attr('action', 'addTask');
		$('#taskDetailsForm').submit();
	})
	
	$('#updateTaskDetails').click(function(){
		$("#taskRaisedDateField").val(new Date($( "#taskRaisedDateDummy" ).val()));
		$("#plannedETAField").val(new Date($( "#plannedETADummy" ).val()));
		$("#actualETAField").val(new Date($( "#actualETADummy" ).val()));
		$('#taskDetailsForm').attr('action', 'editTask');
		$('#taskDetailsForm').submit();
	})


	$('#deleteTaskDetails').click(function(){
		$("#taskRaisedDateField").val(new Date($( "#taskRaisedDateDummy" ).val()));
		$("#plannedETAField").val(new Date($( "#plannedETADummy" ).val()));
		$("#actualETAField").val(new Date($( "#actualETADummy" ).val()));
		$('#taskDetailsForm').attr('action', 'deleteTask');
		$('#taskDetailsForm').submit();
	})
})
