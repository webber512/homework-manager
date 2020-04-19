<%@ include file="/WEB-INF/layouts/head.jsp"%>
<div id="container-fluid">
	<%@ include file="/WEB-INF/layouts/navbar.jsp"%>
	<div class="row container-fluid">
		<div class="col-sm-3">
			<br />
			<h2>Class List</h2>
			<nav class="navbar bg-light">
				<ul class="navbar-nav">
					<c:forEach var="classs" items="${classList}">
						<li class="nav-item"><a class="nav-link" href="#"><span
								style="width: 15px; height: 15px; margin: auto; display: inline-block; border: 1px solid gray; vertical-align: middle; border-radius: 2px; background:${classs.color}"></span>&nbsp;&nbsp;${classs.name}
								<span class="badge badge-primary">${classs.numberOfAssignments}</span></a></li>
					</c:forEach>
				</ul>
			</nav>
		</div>
		<div class="col-sm-9">
			<br />
			<h2>Assignments</h2>
			<nav>
				<div class="nav nav-tabs" id="nav-tab" role="tablist">
					<a class="nav-item nav-link active" id="nav-home-tab"
						data-toggle="tab" href="#nav-home" role="tab"
						aria-controls="nav-home" aria-selected="true">Current
						</a> <a class="nav-item nav-link" id="nav-profile-tab"
						data-toggle="tab" href="#nav-profile" role="tab"
						aria-controls="nav-profile" aria-selected="false">Calendar
						</a><a class="nav-item nav-link" id="nav-all-tab"
						data-toggle="tab" href="#nav-all" role="tab"
						aria-controls="nav-all" aria-selected="false">All</a>
				</div>
			</nav>
			<div class="tab-content" id="nav-tabContent">
				<div class="tab-pane fade show active" id="nav-home" role="tabpanel"
					aria-labelledby="nav-home-tab">
					<div class="row">
						<div class="col-sm-12">
							<%@ include file="/WEB-INF/views/currentassignments.jsp"%>
						</div>
					</div>
				</div>
				<div class="tab-pane fade" id="nav-profile" role="tabpanel"
					aria-labelledby="nav-profile-tab">Calendar View</div>
				<div class="tab-pane fade" id="nav-all" role="tabpanel"
					aria-labelledby="nav-all-tab">
					<div class="row">
						<div class="col-sm-12">
							<%@ include file="/WEB-INF/views/allassignments.jsp"%>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

	<div class="row container-fluid">
		<div class="col-sm-3">
			<br />
			<h3>Statistics</h3>
			<p>Number of open assignments: ${numberOfOpenAssignments}</p>
			<p>Number of completed assignments:
				${numberOfCompletedAssignments}</p>
			<p>Number of total assignments: ${numberOfAssignments}</p>
			<p>Progress: ${progress}%</p>
			<div class="progress">
				<div class="progress-bar progress-bar-striped progress-bar-animated"
					role="progressbar" aria-valuenow="${numberOfCompletedAssignments}"
					aria-valuemin="0" aria-valuemax="${numberOfAssignments}"
					style="width: ${progress}%"></div>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-lg"
		role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Add an
					Assignment</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="row container-fluid">
					<div class="col-sm-12">
						<form:form method="post" id="newAssignmentForm"
							modelAttribute="command"
							action="${pageContext.request.contextPath}/assignment/new">
							<div class="form-group">
								<div class="row">
									<div class="col-md-6">
										<label for="code">Class</label>
										<form:select class="form-control" path="classId">
											<option value="0" selected>Choose a class..</option>
											<c:forEach var="classs" items="${classList}">
												<option value="${classs.id}">${classs.name}</option>
											</c:forEach>
										</form:select>
										<small id="classIdHelp" class="form-text text-muted">Select
											the class the assignment is for.</small>
									</div>
									<div class="col-md-6">
										<label for="color">Assignment Name</label>
										<form:input path="name" type="text" class="form-control"></form:input>
										<small id="colorHelp" class="form-text text-muted">What
											is the assignment called?</small>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-6">
										<label for="type">Assignment Type</label>
										<form:select class="form-control" path="type">
											<option value="Homework" selected>Homework</option>
											<option value="Project">Project</option>
											<option value="Test">Test</option>
											<option value="Quiz">Quiz</option>
											<option value="Lab">Homework</option>
										</form:select>
										<small id="typeHelp" class="form-text text-muted">What
											type of assignment is this?</small>
									</div>
									<div class="col-sm-6">
										<label for="dueDate">Due Date</label>
										<form:input class="form-control" type="date" path="dueDate"></form:input>
										<small id="dueDateHelp" class="form-text text-muted">When
											is the assignment due?</small>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-12">
										<label for="description">Description</label>
										<form:textarea class="form-control" path="description"
											type="textarea"></form:textarea>
										<small id="descriptionHelp" class="form-text text-muted">You
											can bold text with by surrounding it with **, or italicize by
											surrounding it with __. This feature is <b>coming soon</b>.
										</small>
									</div>
								</div>
							</div>
						</form:form>
					</div>
				</div>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary" id="submitForm">Add
					Assignment</button>
			</div>
		</div>
	</div>
</div>

<script>
window.addEventListener("DOMContentLoaded", (event) => {
			let submitBtn = document.getElementById("submitForm")
			submitBtn.addEventListener("click", (event) => {
				event.preventDefault();
				let form = document.getElementById("newAssignmentForm"); 
				form.submit();
			});
		});
	</script>
<%@ include file="/WEB-INF/layouts/footer.jsp"%>