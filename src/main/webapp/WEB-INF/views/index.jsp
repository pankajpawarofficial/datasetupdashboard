<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<!DOCTYPE html>
<html>
<head>

<c:url var="home" value="/" scope="request" />

<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Dashboard</title>

<spring:url value="/resources/css" var="css" />
<spring:url value="/resources/js" var="js" />

<!--CSS-->
<link rel="stylesheet" href="${css}/style.css">


<!--Jquery Libraries-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!--Bootstrap-->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>

<!--Graph libraries-->
<script type="text/javascript"
	src="//cdnjs.cloudflare.com/ajax/libs/d3/3.4.11/d3.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.13/c3.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.13/c3.css"
	rel="stylesheet" type="text/css">

<!-- Datatable -->
<script src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>


<link rel="stylesheet"
	href="https://cdn.datatables.net/responsive/2.1.1/css/responsive.dataTables.min.css">

<script
	src="https://cdn.datatables.net/responsive/2.1.1/js/dataTables.responsive.js"></script>

<!-- datatable bootstrap-->
<link rel="stylesheet" href="${css}/dataTables.bootstrap.css">
<link rel="stylesheet" href="${css}/dataTables.bootstrap.min.css">

<!-- <link rel="stylesheet"	href="//cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css"> -->
<!-- <link rel="stylesheet" href="css/dataTables.bootstrap4.css">
<link rel="stylesheet" href="css/dataTables.bootstrap4.min.css"> -->


<script src="${js}/dataTables.bootstrap.js"></script>
<script src="${js}/dataTables.bootstrap.min.js"></script>

<script type="text/javascript" src="${js}/script.js"></script>
<script type="text/javascript" src="${js}/forms.js"></script>


<!-- <script src="js/dataTables.bootstrap4.js"></script>
<script src="js/dataTables.bootstrap4.min.js"></script> -->

</head>
<body>


	<div class="custompanel">
		<div class="container-fluid" id="custompanelhead">
			<h4>Data Setup Dashboard</h4>
		</div>
		<div class="container-fluid custompanelbody">


			<div class="row container-fluid">
				<div class="col-xs-12 col-sm-2">
					<select id="quarter" onchange="getoption('${home}');"
						class="form-control">
						<c:forEach var="quarter" items="${quartersList}">
							<option value='${quarter}'>${quarter}</option>
						</c:forEach>
					</select>
				</div>
				<div class="col-xs-12 col-sm-8">
					<div class="inlinebanner"></div>
				</div>
				<div class="col-xs-12 col-sm-2">
					<span>Update on 8/2/2017 08:00 PM</span>
				</div>
			</div>
			<br>

			<div style="text-align: center">
				<div class="togglediv">

					<div class="otoggle" id="timetoggle">
						<h6>
							Overall<br>Timeline
						</h6>
					</div>
					<div class="floatleft dtoggle" id="spacetoggle">
						<h6>
							Data Setup<br>Timeline
						</h6>
					</div>

				</div>
			</div>

			<br>
			<div>
				<div class="progresscontainer" id="timeline1">
					<ul class="progresslist">
						<c:forEach var="npiTimelineDate" items="${DMtimelineList}">
							<li><c:if test='${npiTimelineDate.crossed}'>
									<c:set value="fdate" var="tdatevariable"></c:set>
									<c:set value="fhead" var="theadvariable"></c:set>
								</c:if> <c:if test='${!(npiTimelineDate.crossed)}'>
									<c:set value="edate" var="tdatevariable"></c:set>
									<c:set value="ehead" var="theadvariable"></c:set>
								</c:if>

								<div class="${tdatevariable}">${npiTimelineDate.date}</div>
								<div class="${theadvariable}">${npiTimelineDate.timelineHead}</div>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<br> <br>
			<div>
				<div class="col-xs-12 col-sm-12 col-md-7">
					<div class="panel panel-info">
						<div class="panel-heading">Status Summary</div>
						<div class="donutdiv panel-body">
							<div id="SITChart"></div>
							<div id="QAChart"></div>
							<div id="BUChart"></div>
						</div>
					</div>
				</div>

				<div class="col-xs-12 col-sm-12 col-md-5">
					<div class="panel panel-info">
						<div class="panel-heading">Defects</div>
						<div class="panel-body donutdiv">

							<div>
								<div class="togglediv">
									<div class="otoggle" id="raisedtoggle">
										<h6>Raised</h6>
									</div>
									<div class=" floatleft dtoggle" id="ownedtoggle">
										<h6>Owned</h6>
									</div>
								</div>
							</div>
							<br>
							<div id="raiseddiv">

								<table class="table table-bordered" id="raisetable">
									<thead class="headcolor">
										<tr>
											<th data-priority="1">Defect#</th>
											<th data-priority="2">Status</th>
											<th data-priority="4">Comments</th>
											<th data-priority="3">Action</th>
										</tr>
									</thead>

									<tbody>
										<c:forEach var="categoryStatusBean"
											items="${raisedDefectList}">
											<tr>
												<td>${categoryStatusBean.defectID}</td>
												<td>${categoryStatusBean.defectStatus}</td>
												<td>${categoryStatusBean.comments}</td>
												<td><button
														class="detailsButton btn btn-warning btn-sm"
														onclick='openDefectModal("${categoryStatusBean.defectID}")'>View</button></td>
											</tr>
										</c:forEach>
									</tbody>
									<tfoot>
										<tr>
											<th><span style="visibility: hidden">footer</span></th>
											<th></th>
											<th></th>
											<th></th>
										</tr>
									</tfoot>
								</table>
							</div>

							<div id="owneddiv">
								<table id="owntable" class="table table-bordered">
									<thead class="headcolor">
										<tr>
											<th data-priority="1">Defect#</th>
											<th data-priority="2">Status</th>
											<th data-priority="4">Comments</th>
											<th data-priority="3">Action</th>
										</tr>
									</thead>
									<tbody>

										<c:forEach var="categoryStatusBean" items="${ownedDefectList}">
											<tr>
												<td>${categoryStatusBean.defectID}</td>
												<td>${categoryStatusBean.defectStatus}</td>
												<td>${categoryStatusBean.comments}</td>
												<td><button
														class="detailsButton btn btn-warning btn-sm"
														onclick='openDefectModal("${categoryStatusBean.defectID}")'>View</button></td>
											</tr>
										</c:forEach>
									</tbody>
									<tfoot>
										<tr>
											<th><span style="visibility: hidden">footer</span></th>
											<th></th>
											<th></th>
											<th></th>
										</tr>
									</tfoot>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			<br> <br>


			<div class="panel panel-info ">
				<div class="panel-heading">Key Issues</div>

				<div class="panel-body">
					<div>
						<table class="table table-bordered" id="keyissues">
							<thead class="headcolor">
								<tr>
									<th>Owner</th>
									<th>Description</th>
									<th>Status</th>
									<th>ETA</th>
									<th>Type</th>
									<th>Actions</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th><span style="visibility: hidden">footer</span></th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
								</tr>
							</tfoot>
							<tbody>

								<c:forEach var="keyIssuesBean" items="${keyIssueList}">
									<tr>
										<td>${keyIssuesBean.owner}</td>
										<td>${keyIssuesBean.issueDesc}</td>
										<td>${keyIssuesBean.status}</td>
										<td>${keyIssuesBean.eTA}</td>
										<td>${keyIssuesBean.category}</td>
										<td><button class="detailsButton btn btn-warning btn-sm"
												onclick='openKeyIssueModal("${keyIssuesBean.issueID}")'>View</button></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>



			<div class="panel panel-info ">
				<div class="panel-heading">SIT Status</div>

				<div class="panel-body">
					<div>
						<div class="icondetails">
							<span class='glyphicon glyphicon-exclamation-sign orange'></span>&nbsp;Open&nbsp;&nbsp;&nbsp;<span
								class='glyphicon glyphicon-ok-sign green'></span>&nbsp;Done&nbsp;&nbsp;&nbsp;<span
								class='greycircle'></span>&nbsp;NR&nbsp;&nbsp;&nbsp;<span
								class='blackcircle'></span>&nbsp;WIP Planned ETA
							Crossed&nbsp;&nbsp;&nbsp;<span class='yellowcircle'></span>&nbsp;WIP
							Planned ETA Not Crossed&nbsp;
						</div>
						<table class="table table-bordered" id="sitstatus">
							<thead class="headcolor">
								<tr>
									<th data-priority="1">Sr#</th>
									<th>Program with Task</th>
									<th>Offer name-Scope</th>
									<th>Request Raised By</th>
									<th>Request Raised Date</th>
									<th data-priority="3">Item Create/Validate</th>
									<th data-priority="4">Price Process/Validate</th>
									<th data-priority="5">NPI Orderabililty</th>
									<th data-priority="6">Config Create/Validate</th>
									<th data-priority="7">Config Response</th>
									<th data-priority="8">Estimate</th>
									<th data-priority="9">Offer Modeling</th>
									<th data-priority="10">OfferData in SBP</th>
									<th>Planned ETA</th>
									<th>Actual ETA</th>
									<th data-priority="2">Actions</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="categoryStatusBean"
									items="${SitCategoryStatusList}">
									<tr>
										<td>${categoryStatusBean.taskID}</td>
										<td>${categoryStatusBean.taskProgram}</td>
										<td>${categoryStatusBean.offerNameScope}</td>
										<td>${categoryStatusBean.requestRaisedBy}</td>
										<td>${categoryStatusBean.requestRaisedDate}</td>
										<td><c:choose>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.itemCreateValidate) =='open'}">
													<c:set value="glyphicon glyphicon-exclamation-sign orange"
														var="itemCreateValidate"></c:set>

												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.itemCreateValidate) =='done'}">
													<c:set value="glyphicon glyphicon-ok-sign green"
														var="itemCreateValidate"></c:set>

												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.itemCreateValidate) =='nr'}">
													<c:set value="greycircle" var="itemCreateValidate"></c:set>
												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.itemCreateValidate) =='wip planned eta crossed'}">
													<c:set value="blackcircle" var="itemCreateValidate"></c:set>
												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.itemCreateValidate) =='wip planned eta not crossed'}">
													<c:set value="yellowcircle" var="itemCreateValidate"></c:set>
												</c:when>
											</c:choose> <span style="display: none">${categoryStatusBean.itemCreateValidate}</span><span
											class="${itemCreateValidate}"></span></td>

										<td><c:choose>
												<c:when
													test="${(fn:toLowerCase(categoryStatusBean.priceProcessValidate)) =='open'}">
													<c:set value="glyphicon glyphicon-exclamation-sign orange"
														var="priceProcessValidate"></c:set>
												</c:when>
												<c:when
													test="${(fn:toLowerCase(categoryStatusBean.priceProcessValidate)) =='done'}">
													<c:set value="glyphicon glyphicon-ok-sign green"
														var="priceProcessValidate"></c:set>

												</c:when>
												<c:when
													test="${(fn:toLowerCase(categoryStatusBean.priceProcessValidate)) =='nr'}">
													<c:set value="greycircle" var="priceProcessValidate"></c:set>
												</c:when>
												<c:when
													test="${(fn:toLowerCase(categoryStatusBean.priceProcessValidate)) =='wip planned eta crossed'}">
													<c:set value="blackcircle" var="priceProcessValidate"></c:set>
												</c:when>
												<c:when
													test="${(fn:toLowerCase(categoryStatusBean.priceProcessValidate)) =='wip planned eta not crossed'}">
													<c:set value="yellowcircle" var="priceProcessValidate"></c:set>
												</c:when>
											</c:choose> <span style="display: none">${categoryStatusBean.priceProcessValidate}</span><span
											class="${priceProcessValidate}"></span></td>

										<td><c:choose>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.npiOrderability) =='open'}">
													<c:set value="glyphicon glyphicon-exclamation-sign orange"
														var="nPIOrderability"></c:set>
												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.npiOrderability) =='done'}">
													<c:set value="glyphicon glyphicon-ok-sign green"
														var="nPIOrderability"></c:set>

												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.npiOrderability) =='nr'}">
													<c:set value="greycircle" var="nPIOrderability"></c:set>
												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.npiOrderability) =='wip planned eta crossed'}">
													<c:set value="blackcircle" var="nPIOrderability"></c:set>
												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.npiOrderability) =='wip planned eta not crossed'}">
													<c:set value="yellowcircle" var="nPIOrderability"></c:set>
												</c:when>
											</c:choose> <span style="display: none">${categoryStatusBean.npiOrderability}</span><span
											class="${nPIOrderability}"></span></td>

										<td><c:choose>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.configCreateValidate) =='open'}">
													<c:set value="glyphicon glyphicon-exclamation-sign orange"
														var="configCreateValidate"></c:set>
												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.configCreateValidate) =='done'}">
													<c:set value="glyphicon glyphicon-ok-sign green"
														var="configCreateValidate"></c:set>

												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.configCreateValidate) =='nr'}">
													<c:set value="greycircle" var="configCreateValidate"></c:set>
												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.configCreateValidate) =='wip planned eta crossed'}">
													<c:set value="blackcircle" var="configCreateValidate"></c:set>
												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.configCreateValidate) =='wip planned eta not crossed'}">
													<c:set value="yellowcircle" var="configCreateValidate"></c:set>
												</c:when>
											</c:choose> <span style="display: none">${categoryStatusBean.configCreateValidate}</span><span
											class="${configCreateValidate}"></span></td>

										<td><c:choose>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.configResponse) =='open'}">
													<c:set value="glyphicon glyphicon-exclamation-sign orange"
														var="configResponse"></c:set>
												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.configResponse) =='done'}">
													<c:set value="glyphicon glyphicon-ok-sign green"
														var="configResponse"></c:set>

												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.configResponse) =='nr'}">
													<c:set value="greycircle" var="configResponse"></c:set>
												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.configResponse) =='wip planned eta crossed'}">
													<c:set value="blackcircle" var="configResponse"></c:set>
												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.configResponse) =='wip planned eta not crossed'}">
													<c:set value="yellowcircle" var="configResponse"></c:set>
												</c:when>
											</c:choose> <span style="display: none">${categoryStatusBean.configResponse}</span><span
											class="${configResponse}"></span></td>

										<td><c:choose>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.estimate) =='open'}">
													<c:set value="glyphicon glyphicon-exclamation-sign orange"
														var="estimate"></c:set>
												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.estimate) =='done'}">
													<c:set value="glyphicon glyphicon-ok-sign green"
														var="estimate"></c:set>

												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.estimate) =='nr'}">
													<c:set value="greycircle" var="estimate"></c:set>
												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.estimate) =='wip planned eta crossed'}">
													<c:set value="blackcircle" var="estimate"></c:set>
												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.estimate) =='wip planned eta not crossed'}">
													<c:set value="yellowcircle" var="estimate"></c:set>
												</c:when>
											</c:choose> <span style="display: none">${categoryStatusBean.estimate}</span><span
											class="${estimate}"></span></td>



										<td><c:choose>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.offerModeling) =='open'}">
													<c:set value="glyphicon glyphicon-exclamation-sign orange"
														var="offerModeling"></c:set>
												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.offerModeling) =='done'}">
													<c:set value="glyphicon glyphicon-ok-sign green"
														var="offerModeling"></c:set>

												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.offerModeling) =='nr'}">
													<c:set value="greycircle" var="offerModeling"></c:set>
												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.offerModeling) =='wip planned eta crossed'}">
													<c:set value="blackcircle" var="offerModeling"></c:set>
												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.offerModeling) =='wip planned eta not crossed'}">
													<c:set value="yellowcircle" var="offerModeling"></c:set>
												</c:when>
											</c:choose> <span style="display: none">${categoryStatusBean.offerModeling}</span><span
											class="${offerModeling}"></span></td>

										<td><c:choose>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.offerDataInSBP) =='open'}">
													<c:set value="glyphicon glyphicon-exclamation-sign orange"
														var="offerDatainSBP"></c:set>
												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.offerDataInSBP) =='done'}">
													<c:set value="glyphicon glyphicon-ok-sign green"
														var="offerDatainSBP"></c:set>

												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.offerDataInSBP) =='nr'}">
													<c:set value="greycircle" var="offerDatainSBP"></c:set>
												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.offerDataInSBP) =='wip planned eta crossed'}">
													<c:set value="blackcircle" var="offerDatainSBP"></c:set>
												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.offerDataInSBP) =='wip planned eta not crossed'}">
													<c:set value="yellowcircle" var="offerDatainSBP"></c:set>
												</c:when>
											</c:choose> <span style="display: none">${categoryStatusBean.offerDataInSBP}</span><span
											class="${offerDatainSBP}"></span></td>

										<td>${categoryStatusBean.plannedETA}</td>
										<td>${categoryStatusBean.actualETA}</td>
										<td><button class="detailsButton btn btn-warning btn-sm"
												onclick='openTaskModal("${categoryStatusBean.taskID}")'>View</button></td>
									</tr>
								</c:forEach>
							</tbody>
							<tfoot>
								<tr>
									<th><span style="visibility: hidden">footer</span></th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
								</tr>
							</tfoot>
						</table>
					</div>
				</div>
			</div>


			<div class="panel panel-info ">
				<div class="panel-heading">QA Status</div>

				<div class="panel-body">
					<div>
						<div class="icondetails">
							<span class='glyphicon glyphicon-exclamation-sign orange'></span>&nbsp;Open&nbsp;&nbsp;&nbsp;<span
								class='glyphicon glyphicon-ok-sign green'></span>&nbsp;Done&nbsp;&nbsp;&nbsp;<span
								class='greycircle'></span>&nbsp;NR&nbsp;&nbsp;&nbsp;<span
								class='blackcircle'></span>&nbsp;WIP Planned ETA
							Crossed&nbsp;&nbsp;&nbsp;<span class='yellowcircle'></span>&nbsp;WIP
							Planned ETA Not Crossed&nbsp;
						</div>
						<table class="table table-bordered" id="qastatus">
							<thead class="headcolor">
								<tr>
									<th data-priority="1">Sr#</th>
									<th>Program with Task</th>
									<th>Offer name-Scope</th>
									<th>Request Raised By</th>
									<th>Request Raised Date</th>
									<th data-priority="3">Item Create/Validate</th>
									<th data-priority="4">Price Process/Validate</th>
									<th data-priority="5">NPI Orderabililty</th>
									<th data-priority="6">Config Create/Validate</th>
									<th data-priority="7">Config Response</th>
									<th data-priority="8">Estimate</th>
									<th data-priority="9">Offer Modeling</th>
									<th data-priority="10">OfferData in SBP</th>
									<th>Planned ETA</th>
									<th>Actual ETA</th>
									<th data-priority="2">Actions</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="categoryStatusBean"
									items="${QaCategoryStatusList}">
									<tr>
										<td>${categoryStatusBean.taskID}</td>
										<td>${categoryStatusBean.taskProgram}</td>
										<td>${categoryStatusBean.offerNameScope}</td>
										<td>${categoryStatusBean.requestRaisedBy}</td>
										<td>${categoryStatusBean.requestRaisedDate}</td>
										<td><c:choose>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.itemCreateValidate) =='open'}">
													<c:set value="glyphicon glyphicon-exclamation-sign orange"
														var="itemCreateValidate"></c:set>

												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.itemCreateValidate) =='done'}">
													<c:set value="glyphicon glyphicon-ok-sign green"
														var="itemCreateValidate"></c:set>

												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.itemCreateValidate) =='nr'}">
													<c:set value="greycircle" var="itemCreateValidate"></c:set>
												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.itemCreateValidate) =='wip planned eta crossed'}">
													<c:set value="blackcircle" var="itemCreateValidate"></c:set>
												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.itemCreateValidate) =='wip planned eta not crossed'}">
													<c:set value="yellowcircle" var="itemCreateValidate"></c:set>
												</c:when>
											</c:choose> <span style="display: none">${categoryStatusBean.itemCreateValidate}</span><span
											class="${itemCreateValidate}"></span></td>

										<td><c:choose>
												<c:when
													test="${(fn:toLowerCase(categoryStatusBean.priceProcessValidate)) =='open'}">
													<c:set value="glyphicon glyphicon-exclamation-sign orange"
														var="priceProcessValidate"></c:set>
												</c:when>
												<c:when
													test="${(fn:toLowerCase(categoryStatusBean.priceProcessValidate)) =='done'}">
													<c:set value="glyphicon glyphicon-ok-sign green"
														var="priceProcessValidate"></c:set>

												</c:when>
												<c:when
													test="${(fn:toLowerCase(categoryStatusBean.priceProcessValidate)) =='nr'}">
													<c:set value="greycircle" var="priceProcessValidate"></c:set>
												</c:when>
												<c:when
													test="${(fn:toLowerCase(categoryStatusBean.priceProcessValidate)) =='wip planned eta crossed'}">
													<c:set value="blackcircle" var="priceProcessValidate"></c:set>
												</c:when>
												<c:when
													test="${(fn:toLowerCase(categoryStatusBean.priceProcessValidate)) =='wip planned eta not crossed'}">
													<c:set value="yellowcircle" var="priceProcessValidate"></c:set>
												</c:when>
											</c:choose> <span style="display: none">${categoryStatusBean.priceProcessValidate}</span><span
											class="${priceProcessValidate}"></span></td>

										<td><c:choose>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.npiOrderability) =='open'}">
													<c:set value="glyphicon glyphicon-exclamation-sign orange"
														var="nPIOrderability"></c:set>
												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.npiOrderability) =='done'}">
													<c:set value="glyphicon glyphicon-ok-sign green"
														var="nPIOrderability"></c:set>

												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.npiOrderability) =='nr'}">
													<c:set value="greycircle" var="nPIOrderability"></c:set>
												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.npiOrderability) =='wip planned eta crossed'}">
													<c:set value="blackcircle" var="nPIOrderability"></c:set>
												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.npiOrderability) =='wip planned eta not crossed'}">
													<c:set value="yellowcircle" var="nPIOrderability"></c:set>
												</c:when>
											</c:choose> <span style="display: none">${categoryStatusBean.npiOrderability}</span><span
											class="${nPIOrderability}"></span></td>

										<td><c:choose>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.configCreateValidate) =='open'}">
													<c:set value="glyphicon glyphicon-exclamation-sign orange"
														var="configCreateValidate"></c:set>
												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.configCreateValidate) =='done'}">
													<c:set value="glyphicon glyphicon-ok-sign green"
														var="configCreateValidate"></c:set>

												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.configCreateValidate) =='nr'}">
													<c:set value="greycircle" var="configCreateValidate"></c:set>
												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.configCreateValidate) =='wip planned eta crossed'}">
													<c:set value="blackcircle" var="configCreateValidate"></c:set>
												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.configCreateValidate) =='wip planned eta not crossed'}">
													<c:set value="yellowcircle" var="configCreateValidate"></c:set>
												</c:when>
											</c:choose> <span style="display: none">${categoryStatusBean.configCreateValidate}</span><span
											class="${configCreateValidate}"></span></td>

										<td><c:choose>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.configResponse) =='open'}">
													<c:set value="glyphicon glyphicon-exclamation-sign orange"
														var="configResponse"></c:set>
												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.configResponse) =='done'}">
													<c:set value="glyphicon glyphicon-ok-sign green"
														var="configResponse"></c:set>

												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.configResponse) =='nr'}">
													<c:set value="greycircle" var="configResponse"></c:set>
												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.configResponse) =='wip planned eta crossed'}">
													<c:set value="blackcircle" var="configResponse"></c:set>
												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.configResponse) =='wip planned eta not crossed'}">
													<c:set value="yellowcircle" var="configResponse"></c:set>
												</c:when>
											</c:choose> <span style="display: none">${categoryStatusBean.configResponse}</span><span
											class="${configResponse}"></span></td>

										<td><c:choose>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.estimate) =='open'}">
													<c:set value="glyphicon glyphicon-exclamation-sign orange"
														var="estimate"></c:set>
												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.estimate) =='done'}">
													<c:set value="glyphicon glyphicon-ok-sign green"
														var="estimate"></c:set>

												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.estimate) =='nr'}">
													<c:set value="greycircle" var="estimate"></c:set>
												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.estimate) =='wip planned eta crossed'}">
													<c:set value="blackcircle" var="estimate"></c:set>
												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.estimate) =='wip planned eta not crossed'}">
													<c:set value="yellowcircle" var="estimate"></c:set>
												</c:when>
											</c:choose> <span style="display: none">${categoryStatusBean.estimate}</span><span
											class="${estimate}"></span></td>



										<td><c:choose>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.offerModeling) =='open'}">
													<c:set value="glyphicon glyphicon-exclamation-sign orange"
														var="offerModeling"></c:set>
												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.offerModeling) =='done'}">
													<c:set value="glyphicon glyphicon-ok-sign green"
														var="offerModeling"></c:set>

												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.offerModeling) =='nr'}">
													<c:set value="greycircle" var="offerModeling"></c:set>
												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.offerModeling) =='wip planned eta crossed'}">
													<c:set value="blackcircle" var="offerModeling"></c:set>
												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.offerModeling) =='wip planned eta not crossed'}">
													<c:set value="yellowcircle" var="offerModeling"></c:set>
												</c:when>
											</c:choose> <span style="display: none">${categoryStatusBean.offerModeling}</span><span
											class="${offerModeling}"></span></td>

										<td><c:choose>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.offerDataInSBP) =='open'}">
													<c:set value="glyphicon glyphicon-exclamation-sign orange"
														var="offerDatainSBP"></c:set>
												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.offerDataInSBP) =='done'}">
													<c:set value="glyphicon glyphicon-ok-sign green"
														var="offerDatainSBP"></c:set>

												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.offerDataInSBP) =='nr'}">
													<c:set value="greycircle" var="offerDatainSBP"></c:set>
												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.offerDataInSBP) =='wip planned eta crossed'}">
													<c:set value="blackcircle" var="offerDatainSBP"></c:set>
												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.offerDataInSBP) =='wip planned eta not crossed'}">
													<c:set value="yellowcircle" var="offerDatainSBP"></c:set>
												</c:when>
											</c:choose> <span style="display: none">${categoryStatusBean.offerDataInSBP}</span><span
											class="${offerDatainSBP}"></span></td>

										<td>${categoryStatusBean.plannedETA}</td>
										<td>${categoryStatusBean.actualETA}</td>
										<td><button class="detailsButton btn btn-warning btn-sm"
												onclick='openTaskModal("${categoryStatusBean.taskID}")'>View</button></td>
									</tr>
								</c:forEach>
							</tbody>
							<tfoot>
								<tr>
									<th><span style="visibility: hidden">footer</span></th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
								</tr>
							</tfoot>
						</table>
					</div>
				</div>
			</div>



			<div class="panel panel-info ">
				<div class="panel-heading">BAT/UAT Status</div>

				<div class="panel-body">
					<div>
						<div class="icondetails">
							<span class='glyphicon glyphicon-exclamation-sign orange'></span>&nbsp;Open&nbsp;&nbsp;&nbsp;<span
								class='glyphicon glyphicon-ok-sign green'></span>&nbsp;Done&nbsp;&nbsp;&nbsp;<span
								class='greycircle'></span>&nbsp;NR&nbsp;&nbsp;&nbsp;<span
								class='blackcircle'></span>&nbsp;WIP Planned ETA
							Crossed&nbsp;&nbsp;&nbsp;<span class='yellowcircle'></span>&nbsp;WIP
							Planned ETA Not Crossed&nbsp;
						</div>
						<table class="table table-bordered" id="batuatstatus">
							<thead class="headcolor">
								<tr>
									<th data-priority="1">Sr#</th>
									<th>Program with Task</th>
									<th>Offer name-Scope</th>
									<th>Request Raised By</th>
									<th>Request Raised Date</th>
									<th data-priority="3">Item Create/Validate</th>
									<th data-priority="4">Price Process/Validate</th>
									<th data-priority="5">NPI Orderabililty</th>
									<th data-priority="6">Config Create/Validate</th>
									<th data-priority="7">Config Response</th>
									<th data-priority="8">Estimate</th>
									<th data-priority="9">Offer Modeling</th>
									<th data-priority="10">OfferData in SBP</th>
									<th>Planned ETA</th>
									<th>Actual ETA</th>
									<th data-priority="2">Actions</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="categoryStatusBean"
									items="${BatuatCategoryStatusList}">
									<tr>
										<td>${categoryStatusBean.taskID}</td>
										<td>${categoryStatusBean.taskProgram}</td>
										<td>${categoryStatusBean.offerNameScope}</td>
										<td>${categoryStatusBean.requestRaisedBy}</td>
										<td>${categoryStatusBean.requestRaisedDate}</td>
										<td><c:choose>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.itemCreateValidate) =='open'}">
													<c:set value="glyphicon glyphicon-exclamation-sign orange"
														var="itemCreateValidate"></c:set>

												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.itemCreateValidate) =='done'}">
													<c:set value="glyphicon glyphicon-ok-sign green"
														var="itemCreateValidate"></c:set>

												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.itemCreateValidate) =='nr'}">
													<c:set value="greycircle" var="itemCreateValidate"></c:set>
												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.itemCreateValidate) =='wip planned eta crossed'}">
													<c:set value="blackcircle" var="itemCreateValidate"></c:set>
												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.itemCreateValidate) =='wip planned eta not crossed'}">
													<c:set value="yellowcircle" var="itemCreateValidate"></c:set>
												</c:when>
											</c:choose> <span style="display: none">${categoryStatusBean.itemCreateValidate}</span><span
											class="${itemCreateValidate}"></span></td>

										<td><c:choose>
												<c:when
													test="${(fn:toLowerCase(categoryStatusBean.priceProcessValidate)) =='open'}">
													<c:set value="glyphicon glyphicon-exclamation-sign orange"
														var="priceProcessValidate"></c:set>
												</c:when>
												<c:when
													test="${(fn:toLowerCase(categoryStatusBean.priceProcessValidate)) =='done'}">
													<c:set value="glyphicon glyphicon-ok-sign green"
														var="priceProcessValidate"></c:set>

												</c:when>
												<c:when
													test="${(fn:toLowerCase(categoryStatusBean.priceProcessValidate)) =='nr'}">
													<c:set value="greycircle" var="priceProcessValidate"></c:set>
												</c:when>
												<c:when
													test="${(fn:toLowerCase(categoryStatusBean.priceProcessValidate)) =='wip planned eta crossed'}">
													<c:set value="blackcircle" var="priceProcessValidate"></c:set>
												</c:when>
												<c:when
													test="${(fn:toLowerCase(categoryStatusBean.priceProcessValidate)) =='wip planned eta not crossed'}">
													<c:set value="yellowcircle" var="priceProcessValidate"></c:set>
												</c:when>
											</c:choose> <span style="display: none">${categoryStatusBean.priceProcessValidate}</span><span
											class="${priceProcessValidate}"></span></td>

										<td><c:choose>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.npiOrderability) =='open'}">
													<c:set value="glyphicon glyphicon-exclamation-sign orange"
														var="nPIOrderability"></c:set>
												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.npiOrderability) =='done'}">
													<c:set value="glyphicon glyphicon-ok-sign green"
														var="nPIOrderability"></c:set>

												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.npiOrderability) =='nr'}">
													<c:set value="greycircle" var="nPIOrderability"></c:set>
												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.npiOrderability) =='wip planned eta crossed'}">
													<c:set value="blackcircle" var="nPIOrderability"></c:set>
												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.npiOrderability) =='wip planned eta not crossed'}">
													<c:set value="yellowcircle" var="nPIOrderability"></c:set>
												</c:when>
											</c:choose> <span style="display: none">${categoryStatusBean.npiOrderability}</span><span
											class="${nPIOrderability}"></span></td>

										<td><c:choose>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.configCreateValidate) =='open'}">
													<c:set value="glyphicon glyphicon-exclamation-sign orange"
														var="configCreateValidate"></c:set>
												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.configCreateValidate) =='done'}">
													<c:set value="glyphicon glyphicon-ok-sign green"
														var="configCreateValidate"></c:set>

												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.configCreateValidate) =='nr'}">
													<c:set value="greycircle" var="configCreateValidate"></c:set>
												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.configCreateValidate) =='wip planned eta crossed'}">
													<c:set value="blackcircle" var="configCreateValidate"></c:set>
												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.configCreateValidate) =='wip planned eta not crossed'}">
													<c:set value="yellowcircle" var="configCreateValidate"></c:set>
												</c:when>
											</c:choose> <span style="display: none">${categoryStatusBean.configCreateValidate}</span><span
											class="${configCreateValidate}"></span></td>

										<td><c:choose>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.configResponse) =='open'}">
													<c:set value="glyphicon glyphicon-exclamation-sign orange"
														var="configResponse"></c:set>
												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.configResponse) =='done'}">
													<c:set value="glyphicon glyphicon-ok-sign green"
														var="configResponse"></c:set>

												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.configResponse) =='nr'}">
													<c:set value="greycircle" var="configResponse"></c:set>
												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.configResponse) =='wip planned eta crossed'}">
													<c:set value="blackcircle" var="configResponse"></c:set>
												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.configResponse) =='wip planned eta not crossed'}">
													<c:set value="yellowcircle" var="configResponse"></c:set>
												</c:when>
											</c:choose> <span style="display: none">${categoryStatusBean.configResponse}</span><span
											class="${configResponse}"></span></td>

										<td><c:choose>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.estimate) =='open'}">
													<c:set value="glyphicon glyphicon-exclamation-sign orange"
														var="estimate"></c:set>
												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.estimate) =='done'}">
													<c:set value="glyphicon glyphicon-ok-sign green"
														var="estimate"></c:set>

												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.estimate) =='nr'}">
													<c:set value="greycircle" var="estimate"></c:set>
												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.estimate) =='wip planned eta crossed'}">
													<c:set value="blackcircle" var="estimate"></c:set>
												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.estimate) =='wip planned eta not crossed'}">
													<c:set value="yellowcircle" var="estimate"></c:set>
												</c:when>
											</c:choose> <span style="display: none">${categoryStatusBean.estimate}</span><span
											class="${estimate}"></span></td>



										<td><c:choose>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.offerModeling) =='open'}">
													<c:set value="glyphicon glyphicon-exclamation-sign orange"
														var="offerModeling"></c:set>
												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.offerModeling) =='done'}">
													<c:set value="glyphicon glyphicon-ok-sign green"
														var="offerModeling"></c:set>

												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.offerModeling) =='nr'}">
													<c:set value="greycircle" var="offerModeling"></c:set>
												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.offerModeling) =='wip planned eta crossed'}">
													<c:set value="blackcircle" var="offerModeling"></c:set>
												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.offerModeling) =='wip planned eta not crossed'}">
													<c:set value="yellowcircle" var="offerModeling"></c:set>
												</c:when>
											</c:choose> <span style="display: none">${categoryStatusBean.offerModeling}</span><span
											class="${offerModeling}"></span></td>

										<td><c:choose>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.offerDataInSBP) =='open'}">
													<c:set value="glyphicon glyphicon-exclamation-sign orange"
														var="offerDatainSBP"></c:set>
												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.offerDataInSBP) =='done'}">
													<c:set value="glyphicon glyphicon-ok-sign green"
														var="offerDatainSBP"></c:set>

												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.offerDataInSBP) =='nr'}">
													<c:set value="greycircle" var="offerDatainSBP"></c:set>
												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.offerDataInSBP) =='wip planned eta crossed'}">
													<c:set value="blackcircle" var="offerDatainSBP"></c:set>
												</c:when>
												<c:when
													test="${fn:toLowerCase(categoryStatusBean.offerDataInSBP) =='wip planned eta not crossed'}">
													<c:set value="yellowcircle" var="offerDatainSBP"></c:set>
												</c:when>
											</c:choose> <span style="display: none">${categoryStatusBean.offerDataInSBP}</span><span
											class="${offerDatainSBP}"></span></td>

										<td>${categoryStatusBean.plannedETA}</td>
										<td>${categoryStatusBean.actualETA}</td>
										<td><button class="detailsButton btn btn-warning btn-sm"
												onclick='openTaskModal("${categoryStatusBean.taskID}")'>View</button></td>
									</tr>
								</c:forEach>
							</tbody>
							<tfoot>
								<tr>
									<th><span style="visibility: hidden">footer</span></th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
								</tr>
							</tfoot>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>




	<%@ include file="defectdetailsmodal.jsp"%>
	<%@ include file="keyissuesmodal.jsp"%>
	<%@ include file="taskdetailsmodal.jsp"%>

	<script type="text/javascript" src="${js}/chart.js"></script>
	<script type="text/javascript" src="${js}/table.js"></script>

</body>
</html>