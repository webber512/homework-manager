<%@ include file="/WEB-INF/layouts/include.jsp"%>
<br />
<div class="table-responsive">
	<table class="table" id="classAssignments">
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
			<c:forEach var="assignment" items="${assignmentList}">
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
							<a href="/assignment?action=complete&id=${assignment.id}"><i
								class="far fa-square"></i>&nbsp;&nbsp;&nbsp;</a>
						</c:if> <c:if test="${assignment.completed}">
							<a href="/assignment?action=uncomplete&id=${assignment.id}"><i
								class="far fa-check-square"></i>&nbsp;&nbsp;&nbsp;</a>
						</c:if><a href="/assignment?action=edit&id=${assignment.id}"><i
							class="fas fa-pencil-alt"></i></a>&nbsp;&nbsp;&nbsp;<a
						href="/assignment?action=delete&id=${assignment.id}"><i
							class="fas fa-trash"></i></a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<script>
	$(document).ready(function() {
		$('#classAssignments').DataTable();
	});
</script>