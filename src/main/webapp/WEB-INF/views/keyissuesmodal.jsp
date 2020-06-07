<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="modal fade" id="keyissuesmodal" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="headcolor modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h5 class="modal-title" id="keyissuesmodallabel">Key Issues Details</h5>				
			</div>

			<div class="modal-body">
				<form method="POST" action="editKeyIssue" id="keyIssueForm">
				
					<input type="hidden" class="form-control" name="id" id="KeyIssueMongoidField"></input>
					
					
					<div class="form-group">
						<label for="releaseNameField">Release Name</label>
						<select name="releaseName" class="form-control"
							id="KeyIssueReleaseNameField">
							<option value="" disabled selected>Select Release Name</option>
							<option value="Q1FY18">Q1FY18</option>
							<option value="Q2FY18">Q2FY18</option>
							<option value="Q3FY18">Q3FY18</option>
							<option value="Q4FY18">Q4FY18</option>
						</select>
						
					</div>
					

					<div class="form-group">
						<label for="issueIDField">Issue ID</label>
						<input class="form-control"	name="issueID" id="issueIDField" placeholder="Enter Key Issue ID"></input>
					</div>

					<div class="form-group">
						<label for="issueDescField">Issue Description</label>
						<input class="form-control"	name="issueDesc" id="issueDescField" placeholder="Enter Key Issue Description"></input>
					</div>

					<div class="form-group">
						<label for="ownerField" >Owner</label>
						<input class="form-control" id="ownerField" name="owner" placeholder="Enter Owner of the Issue"></input>
					</div>

					<div class="form-group">
						<label for="statusField">Status</label>
						<select  class="form-control"	id="statusField" name="status">
							<option value="" disabled selected>Select Status of issue</option>
							<option value="Open">Open</option>
							<option value="Information">Information</option>
							<option value="Work in progress">Work in progress</option>
							<option value="Closed">Closed</option>
						</select>
					</div>

					<div class="form-group">
						<label for="impactField">Impact</label>
						<input class="form-control" id="impactField" name="impact" placeholder="Select Impact of issue"></input>
					</div>

					<div class="form-group">
						<label for="eTAField">ETA</label>
						<input type="date" class="form-control" id="eTADummy"></input>
						<input type="hidden" class="form-control" name="eTA" id="eTAField" placeholder="Enyter ETA for the Issue"></input>
						
					</div>

					<div class="form-group">
						<label for="categoryField" >Category</label>
						<input class="form-control"	id="categoryField" name="category" placeholder="Enter Category for the issue"></input>
					</div>

					<div class="form-group">
						<label for="isOpenField">IS Open</label>
						<select  class="form-control" name="isOpen" id="isOpenField">
						    <option value="" disabled selected>Is Issue Open</option>
							<option value="YES">YES</option>
							<option value="NO">NO</option>							
						</select>
					</div>
					
				    <input type="hidden"  class="form-control" id="createdByField" name="createdBy" ></input>
					
					<input type="hidden"  class="form-control" id="updatedByField" name="updatedBy"></input>
					
					<input type="hidden"  class="form-control" id="createdDateField" name="createdDate" value="Fri Mar 30 2012 05:30:00 GMT+0530 (India Standard Time)"></input>
					
					<input type="hidden"  class="form-control" id="updatedDateField" name="updatedDate" value="Fri Mar 30 2012 05:30:00 GMT+0530 (India Standard Time)"></input>

				</form>
			</div>

			<div class="modal-footer">
				<button type="button" class="pull-left btn btn-danger" id="deletekeyIssue">Delete</button>
				<button type="button" class="btn btn-success" id="addkeyIssue">Create</button>
				<button type="button" class="btn btn-primary" id="updatekeyIssue">Update</button>
				<button type="button" class="btn btn-secondary">Cancel</button>
			</div>
		</div>
	</div>
</div>