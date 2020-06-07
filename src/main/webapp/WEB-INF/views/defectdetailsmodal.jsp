<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="modal fade" id="defectdetailsmodal" tabindex="-1"
	role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="headcolor modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h5 class="modal-title" id="defectdetailsmodallabel">Defect
					Details</h5>
			</div>

			<div class="modal-body">
			
			
				<form method="POST" action="editDefect" id="defectdetailsform">
					
					<input type="hidden" name="id" class="form-control"
							id="DefectMongoidField"></input>
							
					<div class="form-group">
						<label for="defectIdField">Defect ID</label>
						<input name="defectID" class="form-control"
							id="defectIdField" placeholder="Ented Defect ID"></input>
					</div>

					<div class="form-group">
						<label for="releaseNameField">Release Name</label>
						<select name="releaseName" class="form-control"
							id="defectReleaseNameField">
							<option value="" disabled selected>Ented Release Name</option>
							<option value="Q1FY18">Q1FY18</option>
							<option value="Q2FY18">Q2FY18</option>
							<option value="Q3FY18">Q3FY18</option>
							<option value="Q4FY18">Q4FY18</option>
						</select>
						
					</div>

					<div class="form-group">
						<label for="defectStatusField" >Defect Status</label>
						<select name="defectStatus" class="form-control"
							id="defectStatusField">
							<option value="" disabled selected>Select Defect Status</option>
							<option value="Open">Open</option>
							<option value="Work in progress">Work in progress</option>
							<option value="Closed">Closed</option>
							<option value="Submitted">Submitted</option>
						</select>
					</div>


					<div class="form-group">
						<label for="defectCategoryField">Defect Category</label>
						<select name="defectCategory" class="form-control"
							id="defectCategoryField">
							<option value="" disabled selected>Select Defect Category</option>
							<option value="Owned">Owned</option>
							<option value="Raised">Raised</option>
						</select>
					</div>


					<div class="form-group">
						<label for="commentsField" >Comments</label>
						<input name="comments" class="form-control"
							id="commentsField" placeholder="comments"></input>
					</div>
					
					<input type="hidden" name="defectOpenDate" class="form-control" value="Fri Mar 30 2012 05:30:00 GMT+0530 (India Standard Time)"
							id="defectOpenDateField"></input>
					

					
					<input type="hidden"  name="defectUpdateDate" class="form-control" value="Fri Mar 30 2012 05:30:00 GMT+0530 (India Standard Time)"
							id="defectUpdateDateField"></input>

				</form>

			</div>

			<div class="modal-footer">
				<button type="button" class="pull-left btn btn-danger" data-dismiss="modal" id="deletedefect">Delete</button>
				<button type="button" class="btn btn-success" id="adddefect">Create</button>
				<button type="button" class="btn btn-primary" id="updatedefect">Update</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
			</div>
		</div>
	</div>
</div>