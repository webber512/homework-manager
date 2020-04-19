<%@ include file="/WEB-INF/layouts/include.jsp"%>
<br />
<div class="table-responsive">
	<table class="table" id="allAssignmentTable">
		<thead>
			<tr>
				<th>Completed</th>
				<th>Date Completed</th>
				<th>Name</th>
				<th>Class</th>
				<th>Type</th>
				<th>Due Date</th>
				<th>Description</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="assignment" items="${allAssignmentList}">
				<tr>
					<td>${assignment.completed}</td>
					<td>${assignment.completedDate}</td>
					<td><span
						style="width: 15px; height: 15px; margin: auto; display: inline-block; border: 1px solid gray; vertical-align: middle; border-radius: 2px; background:${assignment.classColor}"></span>&nbsp;&nbsp;${assignment.name}</td>
					<td>${assignment.className}</td>
					<td>${assignment.type}</td>
					<td>${assignment.dueDate}</td>
					<td>${assignment.description}</td>
					<td><c:if test="${not assignment.completed}">
							<a href="/assignment/done/${assignment.id}"><i
								class="far fa-check-square"></i>&nbsp; Mark Complete</a>
						</c:if> <c:if test="${assignment.completed}">
							<a href="/assignment/undo/${assignment.id}"><i
								class="far fa-square"></i>&nbsp; Mark To-Do</a>
						</c:if></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<script>
	$(document).ready(function() {
		$('#allAssignmentTable').DataTable();
	});
</script>