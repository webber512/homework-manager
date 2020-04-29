<div id="container-fluid">
	<%@ include file="/WEB-INF/layouts/navbar.jsp"%>
	<div class="row container-fluid">
		<div class="col-sm-12">
			<br />
			<h2>${pageAction}</h2>
			<%@ include file="/WEB-INF/layouts/message.jsp"%>


			<form:form method="post" id="newAssignmentForm"
				modelAttribute="command"
				action="${pageContext.request.contextPath}/assignment">
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
					<form:hidden class="form-control" path="id" />

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
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary" id="submitForm">Save
					Assignment</button>
			</form:form>
		</div>
	</div>
</div>

<script>window.addEventListener("DOMContentLoaded", (event) => {
	let submitBtn = document.getElementById("submitForm")
	submitBtn.addEventListener("click", (event) => {
		event.preventDefault();
		let form = document.getElementById("newAssignmentForm"); 
		form.submit();
	});
});</script>

<%@ include file="/WEB-INF/layouts/footer.jsp"%>