<form:form method="post" id="newClassForm" modelAttribute="command"
	action="${pageContext.request.contextPath}/class/new">
	<div class="form-group">
		<div class="row">
			<div class="col-md-6">
				<label for="code">Class Code</label>
				<form:input type="text" class="form-control" path="code"></form:input>
				<small id="codeHelp" class="form-text text-muted">Enter a
					course code, like CSC-100. This helps represent your class for
					assignments.</small>
			</div>
			<div class="col-md-6">
				<label for="color">Class Color</label>
				<form:input path="color" type="color" class="form-control"
					value="#d8dcd3"></form:input>
				<small id="colorHelp" class="form-text text-muted">Pick a
					color. This will be used to color code assignment deadlines for
					each class.</small>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-12">
				<label for="name">Course Name</label>
				<form:input type="text" class="form-control" path="name"></form:input>
				<small id="nameHelp" class="form-text text-muted">Enter the
					name of the class. This is used to help keep track of the class.</small> <label
					for="professor">Professor</label>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-6">
				<form:input class="form-control" path="professor"></form:input>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-6">
				<button class="btn btn-danger mt-3" type="button" id="goBack">
					Cancel</button>
				<button class="btn btn-primary mt-3" type="button" id="submitForm">Add
					Class</button>
			</div>
		</div>
	</div>
</form:form>