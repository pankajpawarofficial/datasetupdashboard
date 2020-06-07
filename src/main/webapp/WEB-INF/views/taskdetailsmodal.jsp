<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="modal fade" id="taskdetailsmodal" tabindex="-1"
	role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="headcolor modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h5 class="modal-title" id="taskdetailsmodallabel">Task Details</h5>
				
			</div>

			<div class="modal-body">
				<form method="post"  id="taskDetailsForm">


					<input type="hidden" name="id" class="form-control" id="idField"></input>

					<div class="form-group">
						<label for="releaseNameField">Release Name</label>
						<select name="releaseName" class="form-control"
							id="taskReleaseNameField">
							<option value="" disabled selected>Select Release Name</option>
							<option value="Q1FY18">Q1FY18</option>
							<option value="Q2FY18">Q2FY18</option>
							<option value="Q3FY18">Q3FY18</option>
							<option value="Q4FY18">Q4FY18</option>
						</select>
					</div>

					<div class="form-group">
						<label for="categoryField">Category</label>
						<select name="category" class="form-control" id="TaskcategoryField">
							<option value="" disabled selected>Select Task Category</option>
							<option value="SIT">SIT</option>
							<option value="QA">QA</option>
							<option value="BAT/UAT">BAT/UAT</option>
						</select>
					</div>


					<div class="form-group">
						<label for="taskIDField">Task ID</label>
						<input name="taskID" class="form-control" id="taskIDField" placeholder="Enter Task ID"></input>
					</div>

					<div class="form-group">
						<label for="taskProgramField">Task Program</label>
						<input name="taskProgram" class="form-control"
							id="taskProgramField" placeholder="Enter Task Program"></input>
					</div>

					<div class="form-group">
						<label for="taskPhaseField">Task Phase</label>
						<input name="taskPhase" class="form-control"
							id="taskPhaseField" placeholder="Enter Task Phase"></input>
					</div>

					<div class="form-group">
						<label for="taskDescriptionField">Task Description</label>
						<input name="taskDescription" class="form-control"
							id="taskDescriptionField" placeholder="Enter Task Description"></input>
					</div>


					<div class="form-group">
						<label for="offerNameScopeField">Offer Name Scope</label>
						<input name="offerNameScope" class="form-control"
							id="offerNameScopeField" placeholder="Enter Offer Name Scope"></input>
					</div>

					<div class="form-group">
						<label for="taskRaisedDateField">Task Raised Date</label>
						<input  type="date" class="form-control"
							id="taskRaisedDateDummy" placeholder="Enter Task Raised Date"></input>
						<input  type="hidden" name="taskRaisedDate"
							id="taskRaisedDateField"></input>
					</div>

					<div class="form-group">
						<label for="itemCreateValidateField">Item Create/Validate</label>
						<select name="itemCreateValidate" class="form-control" id="itemCreateValidateField">
						    <option value="" disabled selected>Select Item Create/Validate Status</option>
							<option value="Open">Open</option>
							<option value="Done">Done</option>
							<option value="NR">NR</option>
							<option value="WIP Planned ETA Crossed">WIP Planned ETA
								Crossed</option>
							<option value="WIP Planned ETA Not Crossed">WIP Planned
								ETA Not Crossed</option>
						</select>

					</div>
					<div class="form-group">
						<label for="priceProcessValidateField">Price Process Validate</label>
						<select name="priceProcessValidate" class="form-control" id="priceProcessValidateField">
						    <option value="" disabled selected>Select Price Process Validate Status</option>
							<option value="Open">Open</option>
							<option value="Done">Done</option>
							<option value="NR">NR</option>
							<option value="WIP Planned ETA Crossed">WIP Planned ETA
								Crossed</option>
							<option value="WIP Planned ETA Not Crossed">WIP Planned
								ETA Not Crossed</option>
						</select>

					</div>
				
					<div class="form-group">
						<label for="npiOrderabilityField">Npi Orderability</label>
						<select name="npiOrderability"
							class="form-control" id="npiOrderabilityField">
							<option value="" disabled selected>Select Npi Orderabilit Status</option>
							<option value="Open">Open</option>
							<option value="Done">Done</option>
							<option value="NR">NR</option>
							<option value="WIP Planned ETA Crossed">WIP Planned ETA
								Crossed</option>
							<option value="WIP Planned ETA Not Crossed">WIP Planned
								ETA Not Crossed</option>
						</select>

					</div>
					
					<div class="form-group">
						<label for="configCreateValidateField">Config Create Validate</label>
						<select name="configCreateValidate" class="form-control" id="configCreateValidateField">
						<option value="" disabled selected>Select Config Create Validate Status</option>
							<option value="Open">Open</option>
							<option value="Done">Done</option>
							<option value="NR">NR</option>
							<option value="WIP Planned ETA Crossed">WIP Planned ETA
								Crossed</option>
							<option value="WIP Planned ETA Not Crossed">WIP Planned
								ETA Not Crossed</option>
						</select>

					</div>
					
					<div class="form-group">
						<label for="configResponseField">Config Response</label>
						<select name="configResponse" 
							class="form-control" id="configResponseField">
							<option value="" disabled selected>Select Config Response Status</option>
							<option value="Open">Open</option>
							<option value="Done">Done</option>
							<option value="NR">NR</option>
							<option value="WIP Planned ETA Crossed">WIP Planned ETA
								Crossed</option>
							<option value="WIP Planned ETA Not Crossed">WIP Planned
								ETA Not Crossed</option>
						</select>

					</div>
					
					<div class="form-group">
						<label for="estimateField">Estimate </label>
						<select name="estimate" class="form-control"  id="estimateField">
						<option value="" disabled selected>Select Estimate Status</option>
							<option value="Open">Open</option>
							<option value="Done">Done</option>
							<option value="NR">NR</option>
							<option value="WIP Planned ETA Crossed">WIP Planned ETA
								Crossed</option>
							<option value="WIP Planned ETA Not Crossed">WIP Planned
								ETA Not Crossed</option>
						</select>

					</div>





					<div class="form-group">
						<label for="offerModelingField">Offer Modeling </label>
						<select name="offerModeling" class="form-control" id="offerModelingField">
						<option value="" disabled selected>Select Offer Modeling Status</option>
							<option value="Open">Open</option>
							<option value="Done">Done</option>
							<option value="NR">NR</option>
							<option value="WIP Planned ETA Crossed">WIP Planned ETA
								Crossed</option>
							<option value="WIP Planned ETA Not Crossed">WIP Planned
								ETA Not Crossed</option>
						</select>

					</div>
					
					<div class="form-group">
						<label for="offerDataInSBPField">Offer Data In SBP </label>
						<select name="offerDataInSBP" class="form-control" id="offerDataInSBPField">
						<option value="" disabled selected>Select Offer Data In SBP Status</option>
							<option value="Open">Open</option>
							<option value="Done">Done</option>
							<option value="NR">NR</option>
							<option value="WIP Planned ETA Crossed">WIP Planned ETA
								Crossed</option>
							<option value="WIP Planned ETA Not Crossed">WIP Planned
								ETA Not Crossed</option>
						</select>

					</div>

					<div class="form-group">
						<label for="plannedETAField">Planned ETA</label>
						<input  type="date" class="form-control" id="plannedETADummy" placeholder="Enter Planned ETA"/>
						<input  type="hidden" name="plannedETA"  id="plannedETAField"/>
					</div>

					<div class="form-group">
						<label for="actualETAField">Actual ETA</label>
						<input  type="date"  class="form-control" id="actualETADummy" placeholder="Enter Actual ETA"/>
						<input  type="hidden" name="actualETA"   id="actualETAField" />
					</div>
		
		
					<input type="hidden" name="requestRaisedBy" class="form-control" id="requestRaisedByField"></input>
					
					<input type="hidden" name="updatedBy" class="form-control" id="requestupdatedByField"></input>
					
					<input type="hidden"  name="requestRaisedDate"  id="requestRaisedDateField" value="Fri Mar 30 2012 05:30:00 GMT+0530 (India Standard Time)"></input>
					
					<input type="hidden"  name="updatedDate" id="requestupdatedDateField" value="Fri Mar 30 2012 05:30:00 GMT+0530 (India Standard Time)"></input>

					
				</form>
			</div>

			<div class="modal-footer">
				<button type="button" class="pull-left btn btn-danger"
					data-dismiss="modal" id="deleteTaskDetails">Delete</button>
				<button type="button" class="btn btn-success" id="addTaskDetails">Create</button>
				<button type="button" class="btn btn-primary" id="updateTaskDetails">Update</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal" >Cancel</button>
			</div>
		</div>
	</div>
</div>
