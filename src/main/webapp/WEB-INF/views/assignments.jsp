
<div id="container-fluid">
	<%@ include file="/WEB-INF/layouts/navbar.jsp"%>
	<div class="row container-fluid">

		<div class="col-sm-12">
			<br />

			<h3>Add a new Assignment</h3>
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
							<small id="dueDateHelp">When is the assignment due?</small>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<label for="description">Description</label>
							<form:input class="form-control" path="description"
								type="textarea"></form:input>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6">
							<button class="btn btn-danger mt-3" type="button" id="goBack">
								Cancel</button>
							<button class="btn btn-primary mt-3" type="button"
								id="submitForm">Add Class</button>
						</div>
					</div>
				</div>
			</form:form>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/layouts/footer.jsp"%>


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