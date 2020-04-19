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
			<h2>Open Assignments</h2>
			<nav>
				<div class="nav nav-tabs" id="nav-tab" role="tablist">
					<a class="nav-item nav-link active" id="nav-home-tab"
						data-toggle="tab" href="#nav-home" role="tab"
						aria-controls="nav-home" aria-selected="true">List View</a> <a
						class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab"
						href="#nav-profile" role="tab" aria-controls="nav-profile"
						aria-selected="false">Calendar View</a>
				</div>
			</nav>
			<div class="tab-content" id="nav-tabContent">
				<div class="tab-pane fade show active" id="nav-home" role="tabpanel"
					aria-labelledby="nav-home-tab">
					<div class="row">
						<div class="col-sm-12">
							<table class="table">
								<thead>
									<tr>
										<th>Name</th>
										<th>Class</th>
										<th>Type</th>
										<th>Due Date</th>
										<th>Description</th>
										<th>Actions</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="assignment" items="${assignmentList}">
										<tr>
											<td><span
												style="width: 15px; height: 15px; margin: auto; display: inline-block; border: 1px solid gray; vertical-align: middle; border-radius: 2px; background:${assignment.classColor}"></span>&nbsp;&nbsp;${assignment.name}</td>
											<td>${assignment.className}</td>
											<td>${assignment.type}</td>
											<td>${assignment.dueDate}</td>
											<td>${assignment.description}</td>
											<td><i class="far fa-square"></i></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="tab-pane fade" id="nav-profile" role="tabpanel"
					aria-labelledby="nav-profile-tab">Calendar View</div>
			</div>
		</div>
	</div>

	<div class="row container-fluid">
		<div class="col-sm-3">
			<br />
			<h3>Statistics</h3>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/layouts/footer.jsp"%>