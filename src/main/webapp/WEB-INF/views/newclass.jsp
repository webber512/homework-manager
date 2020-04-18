
<div id="container-fluid">
	<%@ include file="/WEB-INF/layouts/navbar.jsp"%>
	<div class="row container-fluid">
		<div class="col-sm-2">
			<br />
			<h3>All Classes</h3>
			<nav class="navbar bg-light">
				<ul class="navbar-nav">

					<c:forEach var="classs" items="${classList}">
						<li class="nav-item"><a class="nav-link" href="#">${classs.name}</a></li>
					</c:forEach>

				</ul>
			</nav>
			<br>
		</div>
		<div class="col-sm-10">
			<br />

			<h3>Add a new Class</h3>
			<form:form method="post" id="newClassForm" modelAttribute="command"
				action="${pageContext.request.contextPath}/class/new">
				<div class="form-group">
					<div class="row">
						<div class="col-md-6">
							<label for="code">Class Code</label>
							<form:input type="text" class="form-control" path="code"></form:input>
						</div>
						<div class="col-md-6">
							<label for="color">Building Color</label>
							<form:input path="color" type="color" class="form-control"
								value="#d8dcd3"></form:input>
						</div>
					</div>
					<label for="name">Course Name</label>
					<form:input type="text" class="form-control" path="name"></form:input>

					<label for="professor">Professor</label>
					<form:input class="form-control" path="professor"></form:input>

					<button class="btn btn-danger mt-3" type="button" id="goBack">
						Cancel</button>
					<button class="btn btn-primary mt-3" type="button" id="submitForm">
						Add Class</button>
				</div>
			</form:form>
		</div>
	</div>
</div>

<script>
window.addEventListener("DOMContentLoaded", (event) => {
			let submitBtn = document.getElementById("submitForm")
			submitBtn.addEventListener("click", (event) => {
				event.preventDefault();
				let form = document.getElementById("newClassForm"); 
				form.submit();
			});
		});
	</script>